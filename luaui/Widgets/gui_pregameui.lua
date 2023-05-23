function widget:GetInfo()
	return {
		name = "Pregame UI",
		desc = "",
		author = "Floris",
		date = "July 2021",
		license = "GNU GPL, v2 or later",
		layer = -3,
		enabled = true
	}
end

local fontfile = "fonts/" .. Spring.GetConfigString("bar_font2", "Exo2-SemiBold.otf")
local vsx, vsy = Spring.GetViewGeometry()
local fontfileScale = (0.5 + (vsx * vsy / 6200000))
local fontfileSize = 50
local fontfileOutlineSize = 10
local fontfileOutlineStrength = 1.4
local font = gl.LoadFont(fontfile, fontfileSize * fontfileScale, fontfileOutlineSize * fontfileScale, fontfileOutlineStrength)

local uiScale = (0.7 + (vsx * vsy / 6500000))
local myPlayerID = Spring.GetMyPlayerID()
local _, _, mySpec, myTeamID = Spring.GetPlayerInfo(myPlayerID, false)
local ffaMode = Spring.GetModOptions().ffa_mode
local isReplay = Spring.IsReplay()

local readyButtonColor = {0.05, 0.28, 0}
local unreadyButtonColor = {0.28, 0.05, 0}
local subButtonColor = {0.08, 0.22, 0}
local unsubButtonColor = {0.22, 0.08, 0}

local readied = false	-- send readystate (in widget:GameSetup)
local pressedReady	-- pressed button
local startPointChosen = false

local NETMSG_STARTPLAYING = 4 -- see BaseNetProtocol.h, packetID sent during the 3.2.1 countdown
local SYSTEM_ID = -1 -- see LuaUnsyncedRead::GetPlayerTraffic, playerID to get hosts traffic from
local gameStarting = false
local timer = 0
local timer2 = 0
local auto_ready_timer = 120
local auto_ready = true

local buttonPosX = 0.8
local buttonPosY = 0.76
local buttonX = math.floor(vsx * buttonPosX)
local buttonY = math.floor(vsy * buttonPosY)

local orgbuttonH = 40
local orgbuttonW = 115

local buttonW = math.floor(orgbuttonW * uiScale / 2) * 2
local buttonH = math.floor(orgbuttonH * uiScale / 2) * 2

local buttonList, buttonHoverList
local buttonText = ''
local buttonDrawn = false
local lockText = ''
local locked = false

local RectRound, UiElement, UiButton, elementPadding, uiPadding

local enableSubbing = false
local eligibleAsSub = false
local offeredAsSub = false
--local allowUnready = false	-- not enabled cause unreadying doesnt work, have to do workaroud
local ShowReadied = true

local numPlayers = Spring.Utilities.GetPlayerCount()

local shapeOpacity = 0.6
local unitshapes = {}
local teamStartPositions = {}
local teamList = Spring.GetTeamList()

local uiElementRect = {0,0,0,0}
local uiLockRect = {0,0,0,0}
local buttonRect = {0,0,0,0}
local lockRect = {0,0,0,0}
local blinkButton = false

local function createButton()
	local color = { 0.15, 0.15, 0.15 }
	if not mySpec then
		color = readied and unreadyButtonColor or readyButtonColor
	elseif eligibleAsSub then
		color = offeredAsSub and unsubButtonColor or subButtonColor
	end
	uiElementRect = { buttonX - (buttonW / 2) - uiPadding, buttonY - (buttonH / 2) - uiPadding, buttonX + (buttonW / 2) + uiPadding, buttonY + (buttonH / 2) + uiPadding }
	buttonRect = { buttonX - (buttonW / 2), buttonY - (buttonH / 2), buttonX + (buttonW / 2), buttonY + (buttonH / 2) }

	gl.DeleteList(buttonList)
	buttonList = gl.CreateList(function()
		UiElement(uiElementRect[1], uiElementRect[2], uiElementRect[3], uiElementRect[4], 1, 1, 1, 1, 1, 1, 1, 1)
		UiButton(buttonRect[1], buttonRect[2], buttonRect[3], buttonRect[4], 1, 1, 1, 1, 1, 1, 1, 1, nil, { color[1]*0.55, color[2]*0.55, color[3]*0.55, 1 }, { color[1], color[2], color[3], 1 })
	end)
	gl.DeleteList(buttonHoverList)
	buttonHoverList = gl.CreateList(function()
		UiElement(uiElementRect[1], uiElementRect[2], uiElementRect[3], uiElementRect[4], 1, 1, 1, 1, 1, 1, 1, 1)
		UiButton(buttonRect[1], buttonRect[2], buttonRect[3], buttonRect[4], 1, 1, 1, 1, 1, 1, 1, 1, nil, { color[1]*0.85, color[2]*0.85, color[3]*0.85, 1 }, { color[1]*1.5, color[2]*1.5, color[3]*1.5, 1 })
	end)
end

local function createLockButton()
	local color = { 0.15, 0.15, 0.15 }
	color = readied and unreadyButtonColor or readyButtonColor

	uiLockRect = { buttonX - (buttonW / 2) - uiPadding, buttonY - (buttonH / 2) - uiPadding, buttonX + (buttonW / 2) + uiPadding, buttonY + (buttonH / 2) + uiPadding }
	lockRect = { buttonX - (buttonW / 2), buttonY - (buttonH / 2), buttonX + (buttonW / 2), buttonY + (buttonH / 2) }

	gl.DeleteList(lock_buttonList)
	lock_buttonList = gl.CreateList(function()
		UiElement(uiLockRect[1], uiLockRect[2], uiLockRect[3], uiLockRect[4], 1, 1, 1, 1, 1, 1, 1, 1)
		UiButton(lockRect[1], lockRect[2], lockRect[3], lockRect[4], 1, 1, 1, 1, 1, 1, 1, 1, nil, { color[1]*0.55, color[2]*0.55, color[3]*0.55, 1 }, { color[1], color[2], color[3], 1 })
	end)
	gl.DeleteList(lock_buttonHoverList)
	lock_buttonHoverList = gl.CreateList(function()
		UiElement(uiLockRect[1], uiLockRect[2], uiLockRect[3], uiLockRect[4], 1, 1, 1, 1, 1, 1, 1, 1)
		UiButton(lockRect[1], lockRect[2], lockRect[3], lockRect[4], 1, 1, 1, 1, 1, 1, 1, 1, nil, { color[1]*0.85, color[2]*0.85, color[3]*0.85, 1 }, { color[1]*1.5, color[2]*1.5, color[3]*1.5, 1 })
	end)
end

function widget:ViewResize(viewSizeX, viewSizeY)
	if mySpec then
		if not offeredAsSub then
			buttonText = Spring.I18N('ui.substitutePlayers.offer')
		else
			buttonText = Spring.I18N('ui.substitutePlayers.withdraw')
		end
	else
		if readied then
			buttonText = Spring.I18N('ui.initialSpawn.readied')
		else
			buttonText = Spring.I18N('ui.initialSpawn.ready')
		end
	end


	if locked then
		lockText = Spring.I18N('ui.initialSpawn.unlock')
	else
		lockText = Spring.I18N('ui.initialSpawn.lock')
	end

	vsx, vsy = Spring.GetViewGeometry()
	uiScale = (0.75 + (vsx * vsy / 6000000))
	buttonX = math.floor(vsx * buttonPosX)
	buttonY = math.floor(vsy * buttonPosY)
	orgbuttonW = font:GetTextWidth('       '..buttonText) * 24
	buttonW = math.floor(orgbuttonW * uiScale / 2) * 2
	buttonH = math.floor(orgbuttonH * uiScale / 2) * 2

	local newFontfileScale = (0.5 + (vsx * vsy / 5700000))
	if fontfileScale ~= newFontfileScale then
		fontfileScale = newFontfileScale
		gl.DeleteFont(font)
		font = gl.LoadFont(fontfile, fontfileSize * fontfileScale, fontfileOutlineSize * fontfileScale, fontfileOutlineStrength)
	end

	UiElement = WG.FlowUI.Draw.Element
	UiButton = WG.FlowUI.Draw.Button
	RectRound = WG.FlowUI.Draw.RectRound
	elementPadding = WG.FlowUI.elementPadding
	uiPadding = math.floor(elementPadding * 4.5)

	createButton()

	buttonY = buttonY - buttonH - uiPadding*2
	orgbuttonW = font:GetTextWidth('       '..lockText) * 24
	buttonW = math.floor(orgbuttonW * uiScale / 2) * 2
	createLockButton()
	--orgbuttonW = font:GetTextWidth('       '..buttonText) * 24
	--buttonW = math.floor(orgbuttonW * uiScale / 2) * 2
	--buttonY = buttonY + buttonH + uiPadding*2
end

function widget:GameSetup(state, ready, playerStates)

	-- sends a "I arrived" message
	if Spring.GetGameRulesParam("player_" .. Spring.GetMyPlayerID() .. "_joined") == nil then
		Spring.SendLuaRulesMsg("joined_game") 
	end

	-- check when the 3.2.1 countdown starts
	if not gameStarting and ((Spring.GetPlayerTraffic(SYSTEM_ID, NETMSG_STARTPLAYING) or 0) > 0) then
		gameStarting = true		-- ugly but effective (can also detect by parsing state string)
	end

	-- if we can't choose startpositions, no need for ready button etc
	if Game.startPosType ~= 2 or ffaMode then
		return true, true
	end

	-- set my readyState to true if ffa
	if ffaMode and (not readied or not ready) then
		readied = true
		return true, true
	end

	-- starts game after a specified amount of time after all players have joined
	if Spring.GetGameRulesParam("all_players_joined") == 1 and not gameStarting and auto_ready then
		auto_ready_timer = auto_ready_timer - Spring.GetLastUpdateSeconds()
	end
	if auto_ready_timer <=0 and auto_ready == true then
		return true, true
	end

	ready = true
	local playerList = Spring.GetPlayerList()
	for _, playerID in pairs(playerList) do
		local is_player_ready = Spring.GetGameRulesParam("player_" .. playerID .. "_readyState")
		--Spring.Echo(playerID,is_player_ready)
		if is_player_ready == 0 or is_player_ready == 4 then
			ready = false
		end
	end

	return true, ready

	--[[
	if not ready and pressedReady then	-- check if we just readied
		ready = true
	elseif ready and not pressedReady then 	-- check if we just reconnected/dropped
		ready = false
	end

	pressedReady = playerStates[Spring.GetMyPlayerID()] == 'ready'
	local prevReadied = readied
	readied = pressedReady
	if readied ~= prevReadied then
		widget:ViewResize(vsx, vsy)
	end
	--Spring.Echo(ready, pressedReady, os.clock(), Spring.Debug.TableEcho(playerStates)) --, Spring.Debug.TableEcho(playerStates)
	return true, ready
	]]--
end

function widget:MousePress(sx, sy)
	if buttonDrawn then

		-- pressing ready element
		if sx > uiElementRect[1] and sx < uiElementRect[3] and sy > uiElementRect[2] and sy < uiElementRect[4] then
			-- pressing ready button
			if sx > buttonRect[1] and sx < buttonRect[3] and sy > buttonRect[2] and sy < buttonRect[4] then

				-- ready
				if not mySpec then
					if not readied then
						if startPointChosen then
							pressedReady = true
							readied = true
							Spring.SendLuaRulesMsg("ready_to_start_game") 
						else
							Spring.Echo(Spring.I18N('ui.initialSpawn.choosePoint'))
						end
					--else
						--readied = false
						--pressedReady = false
						--Spring.SendLuaRulesMsg( ) -- if it doesnt work, try implementing this
					end

				-- substitute
				elseif eligibleAsSub then
					offeredAsSub = not offeredAsSub
					if offeredAsSub then
						Spring.Echo(Spring.I18N('ui.substitutePlayers.substitutionMessage'))
					else
						Spring.Echo(Spring.I18N('ui.substitutePlayers.offerWithdrawn'))
					end
					Spring.SendLuaRulesMsg(offeredAsSub and '\144' or '\145')
				end

				widget:ViewResize(vsx, vsy)
			end
			return true
		end

		-- pressing lock element
		-- if ready
		if readied then
			if sx > uiLockRect[1] and sx < uiLockRect[3] and sy > uiLockRect[2] and sy < uiLockRect[4] then
				-- pressing lock button
				if sx > lockRect[1] and sx < lockRect[3] and sy > lockRect[2] and sy < lockRect[4] then
					-- lock
					if locked then
						locked = false
						Spring.SendLuaRulesMsg("unlocking_in_place") 
					else
						locked = true
						Spring.SendLuaRulesMsg("locking_in_place") 
					end

					widget:ViewResize(vsx, vsy)
				
				end
			return true
			end
		end

	end
end

function widget:MouseRelease(sx, sy)
	return false
end

local function checkStartPointChosen()
	if not mySpec then
		local x, y, z = Spring.GetTeamStartPosition(myTeamID)
		if x ~= nil and x > 0 and z ~= nil and z > 0 then
			startPointChosen = true
		end
	end
end

function widget:LanguageChanged()
	widget:ViewResize()
end

function widget:GameFrame(gf)
	widgetHandler:RemoveWidget()
end

function widget:Initialize()
	if Spring.GetGameFrame() > 0 or isReplay then
		widgetHandler:RemoveWidget()
		return
	end

	if mySpec and enableSubbing then
		if numPlayers <= 4 or isReplay or ffaMode then
			eligibleAsSub = false
		else
			eligibleAsSub = true
			-- TODO: ...check if you're eligible at all for any of the players
			--local customtable = select(11, Spring.GetPlayerInfo(myPlayerID))
			--if type(customtable) == 'table' then
			--	local tsMu = customtable.skill
			--	local tsSigma = customtable.skilluncertainty
			--end
		end
	end

	widget:ViewResize(vsx, vsy)
	checkStartPointChosen()
end

function widget:DrawScreen()
	if not startPointChosen then
		checkStartPointChosen()
	end

	if WG['guishader'] then
		WG['guishader'].RemoveRect('pregameui')
	end

	buttonDrawn = false

	-- display autoready timer
	if Spring.GetGameRulesParam("all_players_joined") == 1 and not gameStarting and auto_ready then
		local colorString = auto_ready_timer % 0.75 <= 0.375 and "\255\233\233\233" or "\255\255\255\255"
		local text = colorString .. Spring.I18N('ui.initialSpawn.startCountdown', { time = math.max(1, math.floor(auto_ready_timer)) })
		font:Begin()
		font:Print(text, vsx * 0.5, vsy * 0.67, 18.5 * uiScale, "co")
		font:End()
	end

	if gameStarting then
		timer = timer + Spring.GetLastUpdateSeconds()
		local colorString = timer % 0.75 <= 0.375 and "\255\233\233\233" or "\255\255\255\255"
		local text = colorString .. Spring.I18N('ui.initialSpawn.startCountdown', { time = math.max(1, 3 - math.floor(timer)) })
		font:Begin()
		font:Print(text, vsx * 0.5, vsy * 0.67, 18.5 * uiScale, "co")
		font:End()

	elseif ((not readied or ShowReadied) or (mySpec and eligibleAsSub)) and buttonList and Game.startPosType == 2 then

		local playerList = Spring.GetPlayerList()
		local numPlayers = #playerList
		local numPlayersReady = 0
		if numPlayers > 3 then
			for _, playerID in pairs(playerList) do
				local readystate = Spring.GetGameRulesParam("player_" .. tostring(playerID) .. "_readyState")
				if readystate == -1 or readystate == 1 or readystate == 2 then
					numPlayersReady = numPlayersReady + 1
				end
			end
			blinkButton = (numPlayers / numPlayersReady > 0.75)
		end

		buttonDrawn = true
		if WG['guishader'] then
			WG['guishader'].InsertRect(
				uiElementRect[1],
				uiElementRect[2],
				uiElementRect[3],
				uiElementRect[4],
				'pregameui'
			)
		end

		-- draw ready button and text
		local x, y = Spring.GetMouseState()
		local colorString
		if x > buttonRect[1] and x < buttonRect[3] and y > buttonRect[2] and y < buttonRect[4] then
			gl.CallList(buttonHoverList)
			colorString = "\255\210\210\210"
		else
			gl.CallList(buttonList)
			timer2 = timer2 + Spring.GetLastUpdateSeconds()
			if mySpec then
				colorString = offeredAsSub and "\255\255\255\225" or "\255\222\222\222"
			else
				colorString = os.clock() % 0.75 <= 0.375 and "\255\255\255\255" or "\255\222\222\222"
			end
			if blinkButton and os.clock() % 0.75 <= 0.375 then
				local mult = 1.33
				UiButton(buttonRect[1], buttonRect[2], buttonRect[3], buttonRect[4], 1, 1, 1, 1, 1, 1, 1, 1, nil, { readyButtonColor[1]*0.55*mult, readyButtonColor[2]*0.55*mult, readyButtonColor[3]*0.55*mult, 1 }, { readyButtonColor[1]*mult, readyButtonColor[2]*mult, readyButtonColor[3]*mult, 1 })
			end
		end
		font:Begin()
		font:Print(colorString .. buttonText, buttonRect[1]+((buttonRect[3]-buttonRect[1])/2), (buttonRect[2]+((buttonRect[4]-buttonRect[2])/2)) - (buttonH * 0.16), 24 * uiScale, "co")
		font:End()

		-- draw lock button and text
		if readied then
			local x, y = Spring.GetMouseState()
			local colorString
			if x > lockRect[1] and x < lockRect[3] and y > lockRect[2] and y < lockRect[4] then
				gl.CallList(lock_buttonHoverList)
				colorString = "\255\210\210\210"
			else
				gl.CallList(lock_buttonList)
				timer2 = timer2 + Spring.GetLastUpdateSeconds()
				colorString = os.clock() % 0.75 <= 0.375 and "\255\255\255\255" or "\255\222\222\222"
				if blinkButton and os.clock() % 0.75 <= 0.375 then
					local mult = 1.33
					UiButton(lockRect[1], lockRect[2], lockRect[3], lockRect[4], 1, 1, 1, 1, 1, 1, 1, 1, nil, { readyButtonColor[1]*0.55*mult, readyButtonColor[2]*0.55*mult, readyButtonColor[3]*0.55*mult, 1 }, { readyButtonColor[1]*mult, readyButtonColor[2]*mult, readyButtonColor[3]*mult, 1 })
				end
			end
			font:Begin()
			font:Print(colorString .. lockText, lockRect[1]+((lockRect[3]-lockRect[1])/2), (lockRect[2]+((lockRect[4]-lockRect[2])/2)) - (buttonH * 0.16), 24 * uiScale, "co")
			font:End()
		end
		
		gl.Color(1, 1, 1, 1)
	end
end

local function removeUnitShape(id)
	if unitshapes[id] then
		WG.StopDrawUnitShapeGL4(unitshapes[id])
		unitshapes[id] = nil
	end
end

local function addUnitShape(id, unitDefID, px, py, pz, rotationY, teamID, opacity)
	opacity = opacity or shapeOpacity
	if unitshapes[id] then
		removeUnitShape(id)
	end
	unitshapes[id] = WG.DrawUnitShapeGL4(unitDefID, px, py, pz, rotationY, opacity, teamID, nil, nil)
	return unitshapes[id]
end

function widget:DrawWorld()
	if not WG.StopDrawUnitShapeGL4 then return end

	-- draw pregamestart commander models at start positions
	local id
	for i = 1, #teamList do
		local teamID = teamList[i]
		local tsx, tsy, tsz = Spring.GetTeamStartPosition(teamID)
		if tsx and tsx > 0 then
			local startUnitDefID = Spring.GetTeamRulesParam(teamID, 'startUnit')
			if startUnitDefID then
				id = startUnitDefID..'_'..tsx..'_'..Spring.GetGroundHeight(tsx, tsz)..'_'..tsz
				if teamStartPositions[teamID] ~= id then
					removeUnitShape(teamStartPositions[teamID])
					teamStartPositions[teamID] = id
					addUnitShape(id, startUnitDefID, tsx, Spring.GetGroundHeight(tsx, tsz), tsz, 0, teamID, 1)
				end
			end
		end
	end
end

function widget:Shutdown()
	gl.DeleteList(buttonList)
	gl.DeleteList(buttonHoverList)
	gl.DeleteFont(font)
	if WG['guishader'] then
		WG['guishader'].RemoveRect('pregameui')
	end
	if WG.StopDrawUnitShapeGL4 then
		for id, _ in pairs(unitshapes) do
			removeUnitShape(id)
		end
	end
end
