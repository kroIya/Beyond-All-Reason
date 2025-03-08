function gadget:GetInfo()
	return {
		name	= "AI infer unit location",
		desc	= "Provides brief los for ai so they know what they're shot by",
		author	= "kroIya",
		date	= "March 2025",
		license = "GNU GPL, v2 or later",
		layer	= 100,
		enabled = true,
	}
end

if not gadgetHandler:IsSyncedCode() then
	return
end

local aiTeams = {}
local revealedUnits = {}
local revealDelay = 90 --frames

local function getAiTeams()
    local gaiaID = Spring.GetGaiaTeamID()
    local allTeams = Spring.GetTeamList()
    for _, teamID in pairs(allTeams) do
        if teamID ~= gaiaID then
            local _, _, _, isAiTeam, _, allyTeam = Spring.GetTeamInfo(teamID)
            if isAiTeam then
                aiTeams[teamID] = allyTeam
            end
        end
    end
end

function gadget:Initialize()
    getAiTeams()
    if next(aiTeams) == nil then gadgetHandler:RemoveGadget(self) end
end

function gadget:UnitDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponDefID, projectileID, attackerID, attackerDefID, attackerTeam)
    if aiTeams[unitTeam] and attackerID then
        local frame = Spring.GetGameFrame()
        Spring.SetUnitLosState(attackerID, aiTeams[unitTeam], 1) --LOS_INLOS = 1
        Spring.SetUnitLosMask(attackerID, aiTeams[unitTeam], 1) --SetUnitLosState insufficient, gets reset the next frame
        revealedUnits[attackerID] = {
            allyteam = aiTeams[unitTeam],
            delay = frame + revealDelay
        }
    end
end

function gadget:GameFrame(frameNum)
    if frameNum>0 and frameNum%30 == 0 then
        for unitID, revealParams in pairs(revealedUnits) do
            if frameNum > revealParams.delay then
                Spring.SetUnitLosMask(unitID, revealParams.allyteam, 0)
                revealedUnits[unitID] = nil
            end
        end
    end
end
