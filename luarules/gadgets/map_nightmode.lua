function gadget:GetInfo()
	return {
		name = "Map NightMode",
		desc = "Responsible for tuning lighting for night mode lighting ",
		author = "Beherith",
		date = "2022.12.16",
		license = "GNU GPL, v2 or later",
		layer = -100,
		enabled = false,
	}
end

-- ok how will this work, needs some thought and docs
-- A widget (or user command) needs to 'request' a nightlight
-- This nightlight should always be prepped from the true lighting (e.g. initial_atmosphere_lighting)
-- TODO LIST
	-- Maybe fuck with shadowdensity?
	-- Needs a callin for widgets on sunchange!
	
-- Effects needing fixing:
	-- Map edge extension
	-- Map Grass	

-- Configuration options:
	-- Definition of a nightmode is:
		--Nightfactor RGBA
		--nightsun azimuth altitude
			-- since sun is always best behind, this is non trivial
			-- Azimuth - defined in radians, and will rotate to the opposite direction of current sun X
			-- altitude - defined as a ratio of nightheight/Dayheight (original) 

	-- Single triggers
	-- Periodic changes to nightmode should be defined as:
		-- Nightfactor rgba tuple
		-- azimuth -- how much to rotate the sun around, in radians
		-- altitude  -- how much to increase/decrease sun height relative to original sun height
		-- dayDuration - how long the day is, in integer seconds
		-- nightDuration -- how long the night is, in seconds
		-- transitionDuration -- how long each transition takes
		-- Repeats: X times
		-- Fromtime : nil for now 
	-- NO CONFLICTING CONFIGS ALLOWED YET! 
		-- cant have periodic + single being active at the same time!


local currentMapname = Game.mapName:lower()
local mapList = VFS.DirList("luarules/configs/Atmosphereconfigs/", "*.lua")

--Spring.Echo("[Map NightMode] Current map: "..currentMapname)
local mapFileName = ''	-- (Include at bottom of this file)
for i = 1,#mapList+1 do
	if i == #mapList+1 then
		Spring.Echo("[Map NightMode] No map config found. Turning off the gadget")
	end
	if string.find(currentMapname, mapFileName) then
		mapFileName = string.sub(mapList[i], 36, string.len(mapList[i])-4):lower()
		Spring.Echo("[Map NightMode] Success! Map names match!: " ..mapFileName)
		break
	end
end


if not gadgetHandler:IsSyncedCode() then
	--[[
		Spring.SetSunLighting({ groundAmbientColor = { transitionred * gar, transitiongreen * gag, transitionblue * gab } })
		Spring.SetSunLighting({ unitAmbientColor = { transitionred * uar, transitiongreen * uag, transitionblue * uab } })
		Spring.SetSunLighting({ groundDiffuseColor = { transitionred * gdr, transitiongreen * gdg, transitionblue * gdb } })
		Spring.SetSunLighting({ unitDiffuseColor = { transitionred * udr, transitiongreen * udg, transitionblue * udb } })
		Spring.SetSunLighting({ groundSpecularColor = { transitionred * gsr, transitiongreen * gsg, transitionblue * gsb } })
		Spring.SetSunLighting({ unitSpecularColor = { transitionred * usr, transitiongreen * usg, transitionblue * usb } })

		Spring.SetAtmosphere({ skyColor = { transitionred * skycr, transitiongreen * skycg, transitionblue * skycb } })
		Spring.SetAtmosphere({ sunColor = { transitionred * suncr, transitiongreen * suncg, transitionblue * suncb } })
		Spring.SetAtmosphere({ cloudColor = { transitionred * clocr, transitiongreen * clocg, transitionblue * clocb } })
		Spring.SetAtmosphere({ fogColor = { transitionred * fogcr, transitiongreen * fogcg, transitionblue * fogcb } })

		Spring.SetSunLighting({ groundShadowDensity = transition * shadowdensity, modelShadowDensity = transition * shadowdensity })
	]]--
	

	local function tablecopy(t)
		local copy = {}
		for key, value in pairs(t) do
			if type(value) == "table" then
				copy[key] = tablecopy(value)
			else
				copy[key] = value
			end
		end
		return copy
	end


	local function GetLightingAndAtmosphere()  -- returns a table of the common parameters
		local res =  {
			lighting = {
				groundAmbientColor =  {gl.GetSun("ambient")},
				groundDiffuseColor =  {gl.GetSun("diffuse")},
				groundSpecularColor =  {gl.GetSun("specular")},
				
				unitAmbientColor =  {gl.GetSun("ambient","unit")},
				unitDiffuseColor =  {gl.GetSun("diffuse","unit")},
				unitSpecularColor =  {gl.GetSun("specular","unit")},
				
				groundShadowDensity = gl.GetSun("shadowDensity"),
				modelShadowDensity = gl.GetSun("shadowDensity","unit"),
			},
			atmosphere = {
				skyColor = {gl.GetAtmosphere("skyColor")},
				sunColor = {gl.GetAtmosphere("sunColor")},
				cloudColor = {gl.GetAtmosphere("cloudColor")},
				fogColor = {gl.GetAtmosphere("fogColor")},
				fogColor = {gl.GetAtmosphere("fogColor")},
				fogStart = gl.GetAtmosphere("fogStart"),
				fogEnd = gl.GetAtmosphere("fogEnd"),
			},
			sunDir = {gl.GetSun("pos")},
		}
		--Spring.Echo("GetLightingAndAtmosphere")
		--Spring.Debug.TableEcho(res)
		return res
	end
	
	local function SetLightingAndAtmosphere(lightandatmos)
		if lightandatmos.atmosphere then Spring.SetAtmosphere(lightandatmos.atmosphere) end
		if lightandatmos.lighting then Spring.SetSunLighting(lightandatmos.lighting) end
		if lightandatmos.sunDir then Spring.SetSunDirection(lightandatmos.sunDir[1], lightandatmos.sunDir[2], lightandatmos.sunDir[3] ) end
	end
	
	local atmosphere_lighting = {"atmosphere","lighting"}
	local atan2 = math.atan2
	local diag = math.diag
	local mix = math.mix
	local sin = math.sin
	local cos = math.cos
	
	-- Mix everything specified in A into B, if not specified in B, then replace with A
	-- If target is not specified, target is B
	-- Returns aworldrot in radians where if sun is to the right (x>0)
	-- aworldrot is 0 when sun points to x=0 z=1
	-- aworldrot increases to +pi as sun moves counterclockwise right
	-- aworldrot decreases to -pi as sun moves clockwise left
	-- 	-2.36 -2.68 -3.14 2.68 2.36
	--	-2.03 -2.36 -3.14 2.36 2.03
	--	-1.57 -1.57 -0.00 1.57 1.57   Z
	--	-1.11 -0.79 -0.00 0.79 1.11
	--	-0.79 -0.46 -0.00 0.46 0.79 
	--				  X
	
	local function SunDirToAzimuthHeight(sunDir)
		local alength = 1.0 / diag(sunDir[1], sunDir[2], sunDir[3])
		local aworldrot = atan2(sunDir[1]*alength, sunDir[3]*alength) --https://en.wikipedia.org/wiki/Atan2
		local aheight =   atan2(sunDir[2]*alength, diag(sunDir[1]*alength, sunDir[3]*alength))
		return aworldrot, aheight
	end
	
	local function SunAzimuthHeightToDir(azimuth, height, result)
		if result == nil then result = {0,1,0} end 
		result[1] = sin(azimuth) * cos(height) 
		result[2] = sin(height) 
		result[3] = cos(azimuth) * cos(height)
		return result
	end
	
	local function MixLightingAndAtmosphere(a, b, mixfactor, target)
		if target == nil then target = b end
		for _,k in ipairs(atmosphere_lighting) do 
			if a[k] and b[k] then
				local aa = a[k]
				local bb = b[k] 
				for ka, va in pairs(aa) do
					if bb[ka] == nil then target[ka] = aa[ka] 
					else
						if type(va) == 'table' then 
							for i=1,#va do 
								--Spring.Echo(k, ka, i, aa[ka][i],bb[ka][i], mixfactor )
								target[k][ka][i] = mix(aa[ka][i], bb[ka][i], mixfactor) 
							end
						else
							target[k][ka] = mix(aa[ka], bb[ka], mixfactor) 
						end
					end
				end
			end
		end
		if a['sunDir'] and b['sunDir'] then 
			local asun = a['sunDir'] 
			local bsun = b['sunDir'] 
			
			local aworldrot, aheight  = SunDirToAzimuthHeight(a['sunDir'] )
			local bworldrot, bheight  = SunDirToAzimuthHeight(b['sunDir'] )			
			--Spring.Echo(("Arot = %.2f, Brot = %.2f"):format(aworldrot, bworldrot))

			-- if close to 180 degrees, then rotate clockwise
			if (aworldrot - bworldrot) > math.pi - 0.01 then
				bworldrot = bworldrot + 2 * math.pi
			end
			
			if (bworldrot - aworldrot) > math.pi - 0.01 then
				bworldrot = bworldrot - 2 * math.pi
			end
			
			local targetrot = mix(aworldrot, bworldrot, mixfactor)
			local targetheight = mix(aheight, bheight, mixfactor)
			
			SunAzimuthHeightToDir(targetrot, targetheight, target['sunDir'])
			--Spring.Echo("sunDir", mixfactor, "targetrot",targetrot, "targetheight", targetheight, aworldrot ,  bworldrot)
		end
	end
	
	local initial_atmosphere_lighting = GetLightingAndAtmosphere()
	
	local initlight
	local endlight
	local mixedlight
	
	local function GetNightLight(fromlight, nightfactor, azimuth, altitude)
		if fromlight == nil then 
			fromlight = tablecopy(initial_atmosphere_lighting)
		end 
		local endlight = tablecopy(fromlight)
		for _,atmlight in ipairs(atmosphere_lighting) do
			for k2, v2 in pairs(endlight[atmlight]) do
				if string.find(k2, "Color", nil, true) then 
					local unitmod = 0
					if string.find(k2, "unit", nil, true) then unitmod = 0.66 end 
					for i =1, #v2 do 
						endlight[atmlight][k2][i] = endlight[atmlight][k2][i] * math.mix(nightfactor[i], 1.0, unitmod)
					end
				end
			end
		end
		
		-- New sun height is weighted factor of old sun height
		endlight.sunDir[2] = fromlight.sunDir[2] * altitude
		
		local fromazimuth, fromheight = SunDirToAzimuthHeight(fromlight.sunDir)
		-- if the original sun is to the right, then we need to turn it left
		Spring.Echo("Setting azimuth from", fromazimuth)
		local toazimuth = 0
		if fromazimuth > 0 then
			toazimuth = fromazimuth + azimuth
			if toazimuth > math.pi then toazimuth = toazimuth - 2 * math.pi end 
		else -- turn it right
			toazimuth = fromazimuth - azimuth
			if toazimuth < -1 * math.pi then toazimuth = toazimuth + 2 * math.pi end 
		end
		SunAzimuthHeightToDir(toazimuth, fromheight * altitude, endlight.sunDir)
		return endlight
	end
	

	local nightModeConfig = {
		{
			nightFactor = {0.3, 0.3, 0.45, 1.0},
			azimuth = 1.5,
			altitude = 0.5,
			dayDuration = 10,
			nightDuration = 10, 
			transitionDuration = 25, 
			repeats = 1000, 
			startTime = 50, 
			endLight = nil, -- this will be filled in on initialize!
			period = nil, -- init: nightConf.dayDuration + nightConf.nightDuration + 2 * nightConf.transitionDuration
		}
	}

	
	local function SetNightMode(cmd, line, words, playerID)
		Spring.Echo("SetNightMode",cmd, line, words, playerID)
	end

	function gadget:GameFrame(n)
		for i, nc in ipairs(nightModeConfig) do 
			local currentseconds = n / 30 - nc.startTime

			-- see if this light can still have an effct
			if currentseconds < nc.repeats * (nc.period) then 
				--calculate phase:
				local phase = math.fmod(currentseconds, nc.period)
				if phase < nc.dayDuration then 
					-- still day, dont do shit
				elseif phase > nc.dayDuration + nc.transitionDuration and 
					   phase <  nc.dayDuration + nc.transitionDuration + nc.nightDuration then
					-- still night, dont do shit
				else
					-- we are in transition
					if nc.mixedlight == nil then nc.mixedlight = tablecopy(nc.endLight) end 
					
					local transitionfactor = 0 
					if phase <= nc.dayDuration + nc.transitionDuration then -- moving to night
						mixfac = math.smoothstep(nc.dayDuration,nc.dayDuration + nc.transitionDuration,phase);
					else
						mixfac = 1.0 - math.smoothstep(nc.dayDuration + nc.transitionDuration + nc.nightDuration, nc.period,phase);
					end
					--Spring.Echo(mixfac, nc.mixedlight, initial_atmosphere_lighting, nc.endLight)
					MixLightingAndAtmosphere(initial_atmosphere_lighting, nc.endLight, mixfac, nc.mixedlight)
					if nc.mixedlight == nil then return end
					SetLightingAndAtmosphere(nc.mixedlight)

				end
				
			end
		end
	
		if true then return end
		if initlight == nil then
			--Spring.Echo("Loaded Sun Conf for: " .. Game.mapName)
			initlight = GetLightingAndAtmosphere()
			endlight = GetLightingAndAtmosphere()
			mixedlight = GetLightingAndAtmosphere()
			endlight.sunDir[1] = -1 * endlight.sunDir[1] 
			--endlight.sunDir[2] = 0.3 * endlight.sunDir[2] 
			endlight.sunDir[3] = -1 * endlight.sunDir[3]
			local nightfactor = {0.3, 0.3, 0.45, 1.0}
			for _,k in ipairs(atmosphere_lighting) do
				for k2, v2 in pairs(endlight[k]) do
					if string.find(k2, "Color", nil, true) then 
						for i =1, #v2 do 
							endlight[k][k2][i] = endlight[k][k2][i] * nightfactor[i]
						end
					end
				end
			end
			--Spring.Echo("endlight =")
			--Spring.Debug.TableEcho(endlight)
		end
		local dt = 300
		local tstart = 60
		
		if n > tstart then 
			local tfloor = math.floor((n-tstart)/dt)
			local mixfac = ((n-tstart) % dt) / dt
			--mixfac = math.smoothstep(0,1,mixfac);
			--Spring.Echo(n,mixfac)
			if tfloor % 2 ==0 then 
				MixLightingAndAtmosphere(initlight, endlight, mixfac, mixedlight)
			else
				MixLightingAndAtmosphere(endlight, initlight, mixfac, mixedlight)
			end
			SetLightingAndAtmosphere(mixedlight)
			--Spring.Debug.TableEcho(mixedlight)
		end
		
	end
	
	local nightmodecommand = "nightmode"
	function gadget:TextCommand(msg)
		if string.sub(msg, 1, string.len(nightmodecommand)) == nightmodecommand then
			SetNightMode(
		end
	end

	function gadget:Initialize()
		initial_atmosphere_lighting = GetLightingAndAtmosphere()
		for i, nightConf in ipairs(nightModeConfig) do 
			nightConf.endLight = GetNightLight(initial_atmosphere_lighting, nightConf.nightFactor, nightConf.azimuth, nightConf.altitude)
			nightConf.period = nightConf.dayDuration + nightConf.nightDuration + 2 * nightConf.transitionDuration
		end
		gadgetHandler:AddSyncAction("GetLightingAndAtmosphere", GetLightingAndAtmosphere)
		gadgetHandler:AddSyncAction("SetLightingAndAtmosphere", SetLightingAndAtmosphere)
		gadgetHandler:AddSyncAction("MixLightingAndAtmosphere", MixLightingAndAtmosphere)
		
		gadgetHandler:AddChatAction("NightMode", NightMode)
		gadgetHandler:AddChatAction("MixLightingAndAtmosphere", MixLightingAndAtmosphere)
	end

	function gadget:Shutdown()
		gadgetHandler:RemoveSyncAction("SetLightingAndAtmosphere")
		gadgetHandler:RemoveSyncAction("GetLightingAndAtmosphere")
		gadgetHandler:RemoveSyncAction("MixLightingAndAtmosphere")
		SetLightingAndAtmosphere(initial_atmosphere_lighting)
	end
end


