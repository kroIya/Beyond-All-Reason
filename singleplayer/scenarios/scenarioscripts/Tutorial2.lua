if not gadgetHandler:IsSyncedCode() then
	return
end

local stages = {
    stage1_A = false,
    stage1_B = false,
    stage1_B2 = false,
    stage1_C = false,
    stage1_D = false,
    stage1_D2 = false,
    stage1_E = false,
    stage1_F = false,
    stage1_G = false,
    stage1_H = false,
    stage1_I = false,
    stage2_A = false,
    stage2_B = false,
    stage2_C = false,
    stage2_D = false,
    stage2_E = false,
    stage2_F = false,
    stage2_G = false,
    stage2_H = false,
    stage2_I = false,
    stage3_A = false,
}

local triggers = {
-- never meant to be
}

local soundfiles = { --length in frames, 30fps
    sound1_A = {name = "sounds/tutorial/TM2_VoiceLines/TM2_1-A.mp3", len = 120},
    sound1_A1 = {name = "sounds/tutorial/TM2_VoiceLines/TM2_1-A1.mp3", len = 120},
    sound1_B = {name = "sounds/tutorial/TM2_VoiceLines/TM2_1-B.mp3", len = 150},
    sound1_B2 = {name = "sounds/tutorial/TM2_VoiceLines/TM2_1-B2.mp3", len = 300},
    sound1_B3 = {name = "sounds/tutorial/TM2_VoiceLines/TM2_1-B3.mp3", len = 180},
    sound1_C = {name = "sounds/tutorial/TM2_VoiceLines/TM2_1-C.mp3", len = 420},
    sound1_D = {name = "sounds/tutorial/TM2_VoiceLines/TM2_1-D.mp3", len = 240},
    sound1_D2 = {name = "sounds/tutorial/TM2_VoiceLines/TM2_1-D2.mp3", len = 210},
    sound1_E = {name = "sounds/tutorial/TM2_VoiceLines/TM2_1-E.mp3", len = 90},
    sound1_E2 = {name = "sounds/tutorial/TM2_VoiceLines/TM2_1-E2.mp3", len = 390},
    sound1_F = {name = "sounds/tutorial/TM2_VoiceLines/TM2_1-F.mp3", len = 240},
    sound1_G2 = {name = "sounds/tutorial/TM2_VoiceLines/TM2_1-G2.mp3", len = 210},
    sound1_G3 = {name = "sounds/tutorial/TM2_VoiceLines/TM2_1-G3.mp3", len = 330},
    sound1_G4 = {name = "sounds/tutorial/TM2_VoiceLines/TM2_1-G4.mp3", len = 600},
    sound1_H = {name = "sounds/tutorial/TM2_VoiceLines/TM2_1-H.mp3", len = 210},
    sound1_I = {name = "sounds/tutorial/TM2_VoiceLines/TM2_1-I.mp3", len = 150},
    sound2_A = {name = "sounds/tutorial/TM2_VoiceLines/TM2_2-A.mp3", len = 210},
    sound2_A2 = {name = "sounds/tutorial/TM2_VoiceLines/TM2_2-A2.mp3", len = 270},
    sound2_A3 = {name = "sounds/tutorial/TM2_VoiceLines/TM2_2-A3.mp3", len = 90},
    sound2_B = {name = "sounds/tutorial/TM2_VoiceLines/TM2_2-B.mp3", len = 300},
    sound2_C = {name = "sounds/tutorial/TM2_VoiceLines/TM2_2-C.mp3", len = 390},
    sound2_D = {name = "sounds/tutorial/TM2_VoiceLines/TM2_2-D.mp3", len = 420},
    sound2_E = {name = "sounds/tutorial/TM2_VoiceLines/TM2_2-E.mp3", len = 420},
    sound2_F = {name = "sounds/tutorial/TM2_VoiceLines/TM2_2-F.mp3", len = 330},
    sound2_G = {name = "sounds/tutorial/TM2_VoiceLines/TM2_2-G.mp3", len = 360},
    sound2_H = {name = "sounds/tutorial/TM2_VoiceLines/TM2_2-H.mp3", len = 480},
    sound2_I = {name = "sounds/tutorial/TM2_VoiceLines/TM2_2-I.mp3", len = 330},
    sound2_3 = {name = "sounds/tutorial/TM2_VoiceLines/TM2_2-3.mp3", len = 180},
    sound3_A = {name = "sounds/tutorial/TM2_VoiceLines/TM2_3-A.mp3", len = 420},
    sound3_B = {name = "sounds/tutorial/TM2_VoiceLines/TM2_3-B.mp3", len = 300},
    sound3_C = {name = "sounds/tutorial/TM2_VoiceLines/TM2_3-C.mp3", len = 300},
    sound3_D = {name = "sounds/tutorial/TM2_VoiceLines/TM2_3-D.mp3", len = 240},
    sound3_H = {name = "sounds/tutorial/TM2_VoiceLines/TM2_3-H.mp3", len = 300},
    sound4_A = {name = "sounds/tutorial/TM2_VoiceLines/TM2_4-A.mp3", len = 120},
    sound4_A2 = {name = "sounds/tutorial/TM2_VoiceLines/TM2_4-A2.mp3", len = 210},
    sound4_B = {name = "sounds/tutorial/TM2_VoiceLines/TM2_4-B.mp3", len = 180},
    sound4_B2 = {name = "sounds/tutorial/TM2_VoiceLines/TM2_4-B2.mp3", len = 120},
    sound4_C = {name = "sounds/tutorial/TM2_VoiceLines/TM2_4-C.mp3", len = 360},
    sound4_D = {name = "sounds/tutorial/TM2_VoiceLines/TM2_4-D.mp3", len = 240},
    sound4_E = {name = "sounds/tutorial/TM2_VoiceLines/TM2_4-E.mp3", len = 570},
    sound4_G = {name = "sounds/tutorial/TM2_VoiceLines/TM2_4-G.mp3", len = 780},
}

local currentObjective
local scenarioHint
local voiceDelayTarget
local stageDelayTarget
local voiceQueue = {}
local voicePlayingDelay

-- flags
local deadRockets = 0
local lltDestroyedCounter = 0
local radarPosFound
local teamKillPawnsFound
local defendedMexFound
local bansheesFound
local fourMexBuilt
local expExplained
local stage2_FFound
local unreclaimedRocksFound
local blitzFound
local reinforcementsFound
local stage2Complete
local baseShowcase
local asolarFound
local stoutsFound
local backdoorFound
local baseFound
local clawFound
local convertersFound
local wallFound
local interferenceFound
local wrecksFound

local initialllts = {}

local unitIDs = {}

local units = { --rotation is bs and the one dumped by luarules is meaningless; s0 e1 n2 w3
    initialtrans = {name = "corseah", x = 166, y = 1500, z = 6911, rot = 3 , neutral = false, teamID = 1, queue = {{cmdID = CMD.MOVE, position = {px = 100, py = 1000, pz = 8100}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 750, py = 1000, pz = 8000}}, {cmdID = CMD.MOVE, position = {px = 50, py = 1400, pz = 8100}}}},
    corcom = {name = "corcom", x = 166, y = 1460, z = 6911, rot = 3 , neutral = false, teamID = 0},
    auxtrans1 = {name = "corvalk", x = 266, y = 1500, z = 7200, rot = 3 , neutral = false, teamID = 1, queue = {{cmdID = CMD.MOVE, position = {px = 100, py = 1000, pz = 8100}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 850, py = 1000, pz = 8000}}, {cmdID = CMD.MOVE, position = {px = 50, py = 1400, pz = 8100}}}},
    auxtrans2 = {name = "corvalk", x = 166, y = 1500, z = 7150, rot = 3 , neutral = false, teamID = 1, queue = {{cmdID = CMD.MOVE, position = {px = 100, py = 1000, pz = 8100}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 610, py = 1000, pz = 8000}}, {cmdID = CMD.MOVE, position = {px = 50, py = 1400, pz = 8100}}}},
    auxtrans3 = {name = "corvalk", x = 66, y = 1500, z = 7100, rot = 3 , neutral = false, teamID = 1, queue = {{cmdID = CMD.MOVE, position = {px = 100, py = 1000, pz = 8100}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 750, py = 1000, pz = 8100}}, {cmdID = CMD.MOVE, position = {px = 50, py = 1400, pz = 8100}}}},
    auxtrans4 = {name = "corvalk", x = 166, y = 1500, z = 7050, rot = 3 , neutral = false, teamID = 1, queue = {{cmdID = CMD.MOVE, position = {px = 100, py = 1000, pz = 8100}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 750, py = 1000, pz = 7900}}, {cmdID = CMD.MOVE, position = {px = 50, py = 1400, pz = 8100}}}},
    initialgrunt = {name = "corak", x = 166, y = 1460, z = 7050, rot = 3 , neutral = false, teamID = 0},
    initialrocket1 = {name = "corstorm", x = 66, y = 1460, z = 7100, rot = 3 , neutral = false, teamID = 0},
    initialrocket2 = {name = "corstorm", x = 166, y = 1460, z = 7150, rot = 3 , neutral = false, teamID = 0},
    initialrocket3 = {name = "corstorm", x = 266, y = 1460, z = 7200, rot = 3 , neutral = false, teamID = 0},
    extratrans1 = {name = "corvalk", x = 266, y = 1500, z = 7200, rot = 3 , neutral = false, teamID = 1, queue = {{cmdID = CMD.MOVE, position = {px = 850, py = 1000, pz = 8000}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 850, py = 1000, pz = 8000}}, {cmdID = CMD.MOVE, position = {px = 50, py = 1400, pz = 8100}}}},
    extratrans2 = {name = "corvalk", x = 166, y = 1500, z = 7150, rot = 3 , neutral = false, teamID = 1, queue = {{cmdID = CMD.MOVE, position = {px = 610, py = 1000, pz = 8000}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 610, py = 1000, pz = 8000}}, {cmdID = CMD.MOVE, position = {px = 50, py = 1400, pz = 8100}}}},
    extratrans3 = {name = "corvalk", x = 66, y = 1500, z = 7100, rot = 3 , neutral = false, teamID = 1, queue = {{cmdID = CMD.MOVE, position = {px = 750, py = 1000, pz = 8100}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 750, py = 1000, pz = 8100}}, {cmdID = CMD.MOVE, position = {px = 50, py = 1400, pz = 8100}}}},
    extratrans4 = {name = "corvalk", x = 166, y = 1500, z = 7050, rot = 3 , neutral = false, teamID = 1, queue = {{cmdID = CMD.MOVE, position = {px = 750, py = 1000, pz = 7900}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 750, py = 1000, pz = 7900}}, {cmdID = CMD.MOVE, position = {px = 50, py = 1400, pz = 8100}}}},
    extrarocket1 = {name = "corstorm", x = 66, y = 1460, z = 7100, rot = 3 , neutral = false, teamID = 0},
    extrarocket2 = {name = "corstorm", x = 166, y = 1460, z = 7150, rot = 3 , neutral = false, teamID = 0},
    extrarocket3 = {name = "corstorm", x = 266, y = 1460, z = 7200, rot = 3 , neutral = false, teamID = 0},
    extragrunt = {name = "corak", x = 166, y = 1460, z = 7050, rot = 3 , neutral = false, teamID = 0},
    initialllt1 = {name = 'armllt', x = 291, y = 941, z = 7433, rot = 0 , teamID = 2, neutral = false},
    initialllt2 = {name = 'armllt', x = 711, y = 944, z = 7393, rot = 0 , teamID = 2, neutral = false},
    initialllt3 = {name = 'armllt', x = 1051, y = 942, z = 7524, rot = 0 , teamID = 2, neutral = false},
    initialllt4 = {name = 'armllt', x = 1222, y = 963, z = 7597, rot = 0 , teamID = 2, neutral = false},
    initialllt5 = {name = 'armllt', x = 1180, y = 954, z = 7332, rot = 0 , teamID = 2, neutral = false},
    containBanshee1 = {name = 'armkam', x = 3874, y = 2000, z = 6432, rot = 1 , teamID = 2, neutral = false, queue = {{cmdID = CMD.PATROL, position = {px = 2050, py = 2000, pz = 6432}}}},
    containBanshee2 = {name = 'armkam', x = 3874, y = 2000, z = 6632, rot = 1 , teamID = 2, neutral = false, queue = {{cmdID = CMD.PATROL, position = {px = 2100, py = 2000, pz = 6632}}}},
    containBanshee3 = {name = 'armkam', x = 4074, y = 2000, z = 6532, rot = 1 , teamID = 2, neutral = false, queue = {{cmdID = CMD.PATROL, position = {px = 2100, py = 2000, pz = 6532}}}},
    containBanshee4 = {name = 'armkam', x = 3974, y = 2000, z = 6432, rot = 1 , teamID = 2, neutral = false, queue = {{cmdID = CMD.PATROL, position = {px = 2100, py = 2000, pz = 6432}}}},
    stage2_IBeamer = {name = "armbeamer", x = 1291, y = 1311, z = 5996, rot = 0 , teamID = 2, neutral = false},
    stage2_3vision = {name = 'coreyes', x = 3032, y = 2240, z = 1788, rot = 2 , teamID = 1, neutral = true},
    stage3_AThug = {name = 'corthud', x = 177, y = 1671, z = 6199, rot = 0 , teamID = 0, neutral = false},
    stage3_AGrunt1 = {name = 'corak', x = 73, y = 1685, z = 6232, rot = 0 , teamID = 0, neutral = false},
    stage3_AGrunt2 = {name = 'corak', x = 273, y = 1685, z = 6282, rot = 0 , teamID = 0, neutral = false},
    stage3_ACon = {name = 'corck', x = 140, y = 1672, z = 6312, rot = 3709 , teamID = 0, neutral = false},
    stage3_ARez1 = {name = 'cornecro', x = 42, y = 1676, z = 6392, rot = 0 , teamID = 0, neutral = false},
    stage3_ARez2 = {name = 'cornecro', x = 102, y = 1676, z = 6392, rot = 0 , teamID = 0, neutral = false},
    stage3Banshee1 = {name = 'armkam', x = 1250, y = 2000, z = 3650, rot = 1 , teamID = 2, neutral = false, queue = {{cmdID = CMD.PATROL, position = {px = 1700, py = 2000, pz = 4500}}}},
    stage3Banshee2 = {name = 'armkam', x = 1250, y = 2000, z = 3750, rot = 1 , teamID = 2, neutral = false, queue = {{cmdID = CMD.PATROL, position = {px = 1600, py = 2000, pz = 4450}}}},
    stage3Banshee3 = {name = 'armkam', x = 1350, y = 2000, z = 3750, rot = 1 , teamID = 2, neutral = false, queue = {{cmdID = CMD.PATROL, position = {px = 1650, py = 2000, pz = 4350}}}},
    stage3Banshee4 = {name = 'armkam', x = 1250, y = 2000, z = 3850, rot = 1 , teamID = 2, neutral = false, queue = {{cmdID = CMD.PATROL, position = {px = 1700, py = 2000, pz = 4400}}}},
    stage3Banshee5 = {name = 'armkam', x = 1350, y = 2000, z = 3950, rot = 1 , teamID = 2, neutral = false, queue = {{cmdID = CMD.PATROL, position = {px = 1650, py = 2000, pz = 4400}}}},
    stage3Banshee6 = {name = 'armkam', x = 1250, y = 2000, z = 3550, rot = 1 , teamID = 2, neutral = false, queue = {{cmdID = CMD.PATROL, position = {px = 1500, py = 2000, pz = 4450}}}},
    enemylab = {name = 'armlab', x = 3100, y = 2241, z = 1600, rot = 0 , teamID = 2, neutral = false}
}

local function setStage(stage)
    for name, _ in pairs(stages) do
        if stages[name] == true then
        stages[name] = false
        end
    end
    stages[stage] = true
end

local function getCurrentStage()
    for name, stage in pairs(stages) do
        if stage == true then
            return name
        end
    end
    return "none"
end

local function getNameFromID(unitID)
    local unitDefID = Spring.GetUnitDefID(unitID)
    if unitDefID then
        return UnitDefs[unitDefID].name
    end
end

local function updateStageUI() Spring.SendLuaUIMsg("currentStage|"..getCurrentStage()) end
local function updateObjectiveUI() if currentObjective then Spring.SendLuaUIMsg("currentObjective|"..currentObjective) end end
local function giveScenarioHint() if scenarioHint then Spring.SendLuaUIMsg("scenarioHint|"..scenarioHint) end end
local function moveCamera(x, z) Spring.SendLuaUIMsg("SetCameraPos|"..tostring(x)..tostring(z)) end

local function spawnUnit(unit, name) --shamelessly stolen yet again, thanks wilkubyk
    local unitID = Spring.CreateUnit(unit.name, unit.x, unit.y, unit.z, unit.rot, unit.teamID)
    if unit.queue then
    for i = 1, #unit.queue do
        local order = unit.queue[i]
        local orderparams
        if order.position then
        orderparams = {order.position["px"], order.position["py"], order.position["pz"]}
        end
        if order.state then
        orderparams = {order.state}
        end
        if order.target then
        orderparams = {order.target}
        end
        Spring.GiveOrderToUnit(unitID, order.cmdID, orderparams or 0, CMD.OPT_SHIFT)
    end
    end
    unitIDs[name] = unitID
    Spring.Echo(unitIDs[name].." created")
end

local function spawnUnitTable(unitTable)
    for i = 1, #unitTable do
        local name = unitTable[i]
        spawnUnit(units[name], name)
    end
end

local function playVoiceline(soundfile, volume, length)
    if not voicePlayingDelay then
        Spring.PlaySoundFile(soundfile, volume)
        voicePlayingDelay = Spring.GetGameFrame() + length + 30
    else
        table.insert(voiceQueue, {soundfile, volume, length})
    end
end

local function enableAI()
    spawnUnit(units.enemylab, "enemylab")
    Spring.TransferUnit(unitIDs.enemylab, 3, true)
end

--set units to hold position
function gadget:MetaUnitAdded(unitID, unitDefID, teamID)
    if teamID == 0 then
        Spring.GiveOrderToUnit(unitID, CMD.MOVE_STATE, {0}, CMD.OPT_SHIFT)
    end
end

function gadget:UnitCreated(unitID, unitDefID, unitTeam, builderID)
    if getNameFromID(unitID) == "corck" then
        unitIDs.firstCon = unitID
    end
end

function gadget:UnitFinished(unitID, unitDefID, unitTeam)

    --stage 1_C
    if stages.stage1_C then
    if getNameFromID(unitID) == "cormex" then
    local playerUnits = Spring.GetTeamUnits(0)
    local playerMex = 0
    for _, uID in pairs(playerUnits) do
        if getNameFromID(uID) == "cormex" then
        playerMex = playerMex + 1
        end
    end
    if playerMex >= 2 then
    Spring.SendCommands("clearmapmarks")
    setStage("stage1_D")
    currentObjective = "Build 2 Solar Collectors"
    scenarioHint = "Solar Collectors generate a reliable and constant 20 energy a second. \nPress “Z -> X” to place a solar collector. \nSolar Collectors will defensively close when attacked, halting energy production."
    updateObjectiveUI()
    updateStageUI()
    playVoiceline(soundfiles.sound1_D.name, 1, soundfiles.sound1_D.len)
    giveScenarioHint()
    end
    end
    end

    --stage1_D
    if stages.stage1_D then
    if getNameFromID(unitID) == "corsolar" then
    local playerUnits = Spring.GetTeamUnits(0)
    local playerSolar = 0
    for _, uID in pairs(playerUnits) do
        if getNameFromID(uID) == "corsolar" then
            playerSolar = playerSolar + 1
        end
    end
    if playerSolar >= 2 then
    setStage("stage1_D2")
    currentObjective = "Construct a Bot Lab. "
    scenarioHint = "Construct a bot lab with the hotkeys “V” -> “Z”. \nYou can rotate a building before placing it using “[“ or “]”"
    updateObjectiveUI()
    updateStageUI()
    playVoiceline(soundfiles.sound1_D2.name, 1, soundfiles.sound1_D2.len)
    giveScenarioHint()
    end
    end
    end

    --stage1_D2    
    if stages.stage1_D2 then
    if getNameFromID(unitID) == "corlab" then
    setStage("stage1_E")
    currentObjective = "Produce a Construction Bot. \n“Left click” queues a unit. \n“Right click” removes a queued unit."
    scenarioHint = "Select the bot lab and queue a Construction Bot.  \nConstructors have expanded build options, and can reclaim, repair, and provide build power. "
    updateObjectiveUI()
    updateStageUI()
    playVoiceline(soundfiles.sound1_E.name, 1, soundfiles.sound1_E.len)
    giveScenarioHint()
    end
    end

    --stage1_E2
    if stages.stage1_E2 then
    if getNameFromID(unitID) == "corck" then
    setStage("stage1_F")
    currentObjective = "Create a graverobber (rezbot) from your botlab."
    scenarioHint = "Create a graverobber (rezbot) by selecting your lab and using the hotkey “X”."
    updateObjectiveUI()
    updateStageUI()
    playVoiceline(soundfiles.sound1_F.name, 1, soundfiles.sound1_F.len)
    giveScenarioHint()
    end
    end

    --stage1_F
    if stages.stage1_F then
    if getNameFromID(unitID) == "cornecro" then
    setStage("stage1_G2")
    currentObjective = "Build 2 Additional Solar Collectors. \nYour BotCon can assist your commander to build faster.\nReclaim nearby biomass with your graverobber."
    scenarioHint = "Units production will only progress if there is enough metal and energy. \nIf either runs out, build progress will stall."
    updateObjectiveUI()
    updateStageUI()
    playVoiceline(soundfiles.sound1_G2.name, 1, soundfiles.sound1_G2.len)
    giveScenarioHint()
    end
    end

    --stage1_G2
    if stages.stage1_G2 then
    if getNameFromID(unitID) == "corsolar" then
    local playerUnits = Spring.GetTeamUnits(0)
    local playerSolar = 0
    for _, uID in pairs(playerUnits) do
        if getNameFromID(uID) == "corsolar" then
            playerSolar = playerSolar + 1
        end
    end
    if playerSolar >= 4 then
    setStage("stage1_G3")
    currentObjective = "Construct 2 energy converters"
    scenarioHint = "Build two energy converters (Hotkey “Z -> A”). \nIf energy is available, an energy converter fabricates 70 energy into 1 metal every second."
    updateObjectiveUI()
    updateStageUI()
    playVoiceline(soundfiles.sound1_G3.name, 1, soundfiles.sound1_G3.len)
    giveScenarioHint()
    end
    end
    end

    --stage1_G3
    if stages.stage1_G3 then
    if getNameFromID(unitID) == "cormakr" then
    local playerUnits = Spring.GetTeamUnits(0)
    local playerConverter = 0
    for _, uID in pairs(playerUnits) do
        if getNameFromID(uID) == "cormakr" then
            playerConverter = playerConverter + 1
        end
    end
    if playerConverter >= 2 then
    setStage("stage1_G4")
    currentObjective = "Use your Commander and forces to ascend the mountain and locate CH-127."
    scenarioHint = "Resources produced above your maximum storage are wasted. \nBalance your energy, metal, and build power for a strong economy. "
    updateObjectiveUI()
    updateStageUI()
    playVoiceline(soundfiles.sound1_G4.name, 1, soundfiles.sound1_G4.len)
    giveScenarioHint()
    end
    end
    end

    --stage1_G4
    if stages.stage1_G4 then
    if getNameFromID(unitID) == "cormex" then
    local playerUnits = Spring.GetTeamUnits(0)
    local playerMex = 0
    for _, uID in pairs(playerUnits) do
        if getNameFromID(uID) == "cormex" then
        playerMex = playerMex + 1
        end
    end
    if playerMex >= 3 then
    setStage("stage2_A")
    scenarioHint = "The Guard, a Cortex Light Laser Tower (LLT) is simple defensive tower that is strong against raiding units. \nHotkey “X” -> “Z”"
    currentObjective = "Construct a Guard LLT to defend the node."
    updateObjectiveUI()
    updateStageUI()
    playVoiceline(soundfiles.sound2_A.name, 1, soundfiles.sound2_A.len)
    giveScenarioHint()
    end
    end
    end

    --stage2_A
    if stages.stage2_A then
    if getNameFromID(unitID) == "corllt" then
    setStage("stage2_A2")
    scenarioHint = "Dargon’s Teeth Hotkey “C” -> “C”. After selecting a building blueprint, \nyou can arrange structures in a line by holding “Shift” + Line dragging your mouse.”"
    currentObjective = "Build 8 Dragon’s Teeth Segments "
    updateObjectiveUI()
    updateStageUI()
    playVoiceline(soundfiles.sound2_A2.name, 1, soundfiles.sound2_A2.len)
    giveScenarioHint()
    end
    end

    --stage2_A2
    if stages.stage2_A2 then
    Spring.Echo(getNameFromID(unitID))
    if getNameFromID(unitID) == "cordrag" then
    Spring.Echo("cordrag built")
    local playerUnits = Spring.GetTeamUnits(0)
    local playerWall = 0
    for _, uID in pairs(playerUnits) do
        if getNameFromID(uID) == "cordrag" then
            playerWall = playerWall + 1
            Spring.Echo(playerWall.." added")
        end
    end
    Spring.Echo(playerWall.." total")
    if playerWall >= 8 then
    playVoiceline(soundfiles.sound2_A3.name, 1, soundfiles.sound2_A3.len)
    setStage("stage2_A3")
    currentObjective = "Secure the low ground and then ascend the mountain."
    updateObjectiveUI()
    updateStageUI()
    end
    end
    end


    --stageless triggers
    if not fourMexBuilt then
    if getNameFromID(unitID) == "cormex" then
    local playerUnits = Spring.GetTeamUnits(0)
    local playerMex = 0
    for _, uID in pairs(playerUnits) do
        if getNameFromID(uID) == "cormex" then
        playerMex = playerMex + 1
        end
    end
    if playerMex >= 4 then
    fourMexBuilt = true
    scenarioHint = "“Shift + Left Click” will add 5 of the selected unit type. \n“Control + Left Click” will add 20 of the selected unit type.\n”Control + Shift + Left Click” will add 100 of the unit type."
    updateObjectiveUI()
    updateStageUI()
    playVoiceline(soundfiles.sound2_B.name, 1, soundfiles.sound2_B.len)
    giveScenarioHint()
    end
    end
    end
end

function gadget:UnitUnloaded(unitID, unitDefID, unitTeam, transportID, transportTeam)
    --stage1_B
    if stages.stage1_B then
    if unitID == unitIDs.corcom then
    setStage("stage1_B2")
    currentObjective = "Destroy the 5 Light Laser Turrets (LLTs) so you can begin building your base. \nGrunt’s high line of sight can be used to spot."
    Spring.MarkerAddPoint(291, 941, 7433, "LLT")
    Spring.MarkerAddPoint(711, 944, 7393, "LLT")
    Spring.MarkerAddPoint(1051, 942, 7524, "LLT")
    updateObjectiveUI()
    updateStageUI()
    playVoiceline(soundfiles.sound1_B2.name, 1, soundfiles.sound1_B2.len)
    end
    end
end

function gadget:UnitExperience(unitID, unitDefID, unitTeam, experience, oldExperience)
    --Spring.Echo(unitID.." gained "..experience.." experience")
    --stage3_C
    if not expExplained and experience > 0.03 then
    local expExplainedCheck = Spring.GetUnitsInRectangle(0, 4500, 1000, 5500, 0)
    if expExplainedCheck and #expExplainedCheck > 0 then
    playVoiceline(soundfiles.sound3_C.name, 1, soundfiles.sound3_C.len)
    scenarioHint = "Units gain experience by damaging enemies. \nExperience grants additional HP and lowers weapon reload time."
    giveScenarioHint()
    expExplained = true
    local x, y, z = Spring.GetUnitPosition(unitID)
    Spring.MarkerAddPoint(x, y, z, "Veteran unit")
    end
    end
end

function gadget:UnitDestroyed(unitID, unitDefID)

    --stage1_B2
    if stages.stage1_B2 then
    if unitID == unitIDs.initialrocket1 or unitID == unitIDs.initialrocket2 or unitID == unitIDs.initialrocket3 then
    deadRockets = deadRockets + 1
    if deadRockets == 3 then
    playVoiceline(soundfiles.sound1_B3.name, 1, soundfiles.sound1_B3.len)
    deadRockets = 0
    spawnUnitTable({
        "extratrans1",
        "extratrans2",
        "extratrans3",
        "extratrans4",
        "extrarocket1",
        "extrarocket2",
        "extrarocket3",
        "extragrunt",
    })
    Spring.UnitAttach(unitIDs.extratrans1, unitIDs.extrarocket1, 0)
    Spring.UnitAttach(unitIDs.extratrans2, unitIDs.extrarocket2, 0)
    Spring.UnitAttach(unitIDs.extratrans3, unitIDs.extrarocket3, 0)
    Spring.UnitAttach(unitIDs.extratrans4, unitIDs.extragrunt, 0)
    end
    end
    for lltName, lltID in pairs(initialllts) do
        if unitID == lltID then
        lltDestroyedCounter = lltDestroyedCounter + 1
        end
    end
    if lltDestroyedCounter == 5 then
    Spring.SendCommands("clearmapmarks")
    Spring.MarkerAddPoint(509, 926, 7481, "Mex")
    Spring.MarkerAddPoint(854, 934, 7609, "Mex")
    setStage("stage1_C")
    currentObjective = "Build 2 Metal Extractors (mexes)"
    scenarioHint = "Metal Extractors (mexes) pull the value of the metal deposit every second. \nBuild them with your commander. \nHotkey is “Z”, you can also area mex (hotkey “Z -> Z”)."
    updateObjectiveUI()
    updateStageUI()
    giveScenarioHint()
    playVoiceline(soundfiles.sound1_C.name, 1, soundfiles.sound1_C.len)
    end
    end

    --stage3_H
    if stages.stage3_H then
    local aiUnits = Spring.GetTeamUnits(3)
    local baseAlive = false
    for _, aiUnitID in pairs(aiUnits) do
        local unitName = getNameFromID(aiUnitID)
        if unitName == "armlab" or unitName == "armsolar" or unitName == "armadvsol" then
        baseAlive = true
        end
    end
    if not baseAlive then
    setStage("stage4_B2")
    playVoiceline(soundfiles.sound4_B2.name, 1, soundfiles.sound4_B2.len)
    currentObjective = "Locate CH-127 and secure it’s data drive."
    updateObjectiveUI()
    updateStageUI()
    end
    end

    --stageless triggers
    if unitID == unitIDs.stage2_IBeamer then
    playVoiceline(soundfiles.sound2_I.name, 1, soundfiles.sound2_I.len)
    scenarioHint = "Wrecks can be reclaimed by any constructor or engineer, \nbut only graverobbers can spend energy to resurrect fallen units."
    giveScenarioHint()
    unitIDs.stage2_IBeamer = nil
    end

end

function gadget:GameFrame(frameNum) --fires off every frame
    Spring.Echo(getCurrentStage())
    local n = frameNum

    if n<1 then
        -- dolly cutscene
        Spring.SendCommands("hideinterface")
        playVoiceline(soundfiles.sound1_A.name, 1, soundfiles.sound1_A.len)
        currentObjective = "Watch the cutscene"
    end

    if n == 300 then
        --Initial load
        setStage("stage1_A1")
        Spring.SendCommands("hideinterface")
        currentObjective = "Find Research Station CH127 \nYour Commander must survive."
        updateStageUI()
        updateObjectiveUI()
        spawnUnitTable({
            "initialtrans",
            "corcom",
            "auxtrans1",
            "auxtrans2",
            "auxtrans3",
            "auxtrans4",
            "initialgrunt",
            "initialrocket1",
            "initialrocket2",
            "initialrocket3",
            "initialllt1",
            "initialllt2",
            "initialllt3",
            "initialllt4",
            "initialllt5",
            "stage2_IBeamer",
            "stage3Banshee1",
            "stage3Banshee2",
            "stage3Banshee3",
            "stage3Banshee4",
            "stage3Banshee5",
            "stage3Banshee6",
        })
        Spring.UnitAttach(unitIDs.initialtrans, unitIDs.corcom, 0)
        Spring.UnitAttach(unitIDs.auxtrans4, unitIDs.initialgrunt, 0)
        Spring.UnitAttach(unitIDs.auxtrans2, unitIDs.initialrocket2, 0)
        Spring.UnitAttach(unitIDs.auxtrans3, unitIDs.initialrocket1, 0)
        Spring.UnitAttach(unitIDs.auxtrans1, unitIDs.initialrocket3, 0)
        playVoiceline(soundfiles.sound1_A1.name, 1, soundfiles.sound1_A1.len)
        initialllts = {unitIDs.initialllt1, unitIDs.initialllt2, unitIDs.initialllt3, unitIDs.initialllt4, unitIDs.initialllt5}
    end

    if n>0 and n%30 == 0 then
    updateStageUI()
    updateObjectiveUI()

        --stage1_A
        if stages.stage1_A1 then
        local x, y, z = Spring.GetUnitPosition(unitIDs.initialtrans)
        if z >= 7800 then
        setStage("stage1_B")
        updateStageUI()
        playVoiceline(soundfiles.sound1_B.name, 1, soundfiles.sound1_B.len)
        end
        end

        --stage1_B2 trans clear
        if stages.stage1_B2 then
        local transToClear = Spring.GetUnitsInRectangle(0, 7500, 200, 8200, 1)
        if transToClear and #transToClear > 0 then
        for _, transID in pairs(transToClear) do
            Spring.DestroyUnit(transID, false, true)
        end
        end
        end

        --stage1_E
        if stages.stage1_E and unitIDs.firstCon then
        local _, _, _, _, conProgress = Spring.GetUnitHealth(unitIDs.firstCon)
        if conProgress > 0.24 then
        playVoiceline(soundfiles.sound1_E2.name, 1, soundfiles.sound1_E2.len)
        setStage("stage1_E2")
        currentObjective = "Boost your lab"
        scenarioHint = "Select your commander and either right-click the lab, or Guard (Hotkey “O”) the lab. \nMore build power lets you spend resources faster and lower production time."
        updateStageUI()
        updateObjectiveUI()
        giveScenarioHint()
        end
        end

        --[[stage1_E stall check
        if stages.stage1_E then
        local energy, _, _, _, _, _, _, _ = Spring.GetTeamResources(0, "energy")
        if energy <= 100 then
        playVoiceline(soundfiles.sound1_F.name, 1, soundfiles.sound1_F.len)
        scenarioHint = "Get more energy by reclaiming plants for free \nor constructing more Solar Collectors for 150 metal each."
        giveScenarioHint()
        end
        end]]

        --stage2_A3
        if not bansheesFound then
        local bansheesFoundCheck = Spring.GetUnitsInRectangle(2200, 6600, 3550, 6950, 0)
        if bansheesFoundCheck and #bansheesFoundCheck > 0 then
        bansheesFound = true
        playVoiceline(soundfiles.sound2_E.name, 1, soundfiles.sound2_E.len)
        setStage("stage2_E")
        spawnUnitTable({
            "containBanshee1",
            "containBanshee2",
            "containBanshee3",
            "containBanshee4",
        })
        currentObjective = "Find the enemy base at the top of the mountain."
        scenarioHint = "Units without dedicated anti-air weapons have lowered accuracy and damage while firing at air units with their ground weapons."
        updateStageUI()
        updateObjectiveUI()
        giveScenarioHint()
        end
        end

        --stage2_E into section 3
        if not stage2Complete then
        local enableAITrigger = Spring.GetUnitsInCylinder(440, 5440, 800, 0)
        if enableAITrigger and #enableAITrigger > 0 then
        enableAI()
        moveCamera(3032, 1788)
        stageDelayTarget = Spring.GetGameFrame() + soundfiles.sound2_3.len/10 + 2
        playVoiceline(soundfiles.sound2_3.name, 1, soundfiles.sound2_3.len/10)
        stage2Complete = true
        spawnUnit(units.stage2_3vision, "stage2_3vision")
        Spring.SendCommands("setspeed 0.1")
        Spring.SetUnitNoDraw(unitIDs.stage2_3vision, true)
        Spring.SetUnitNoSelect(unitIDs.stage2_3vision, true)
        Spring.SetUnitNoMinimap(unitIDs.stage2_3vision, true)
        baseShowcase = true
        end
        end

        --section 3 into section 4
        if not baseFound then
        local baseFoundCheck = Spring.GetUnitsInRectangle(1850, 3000, 3100, 3450, 0)
        if baseFoundCheck and #baseFoundCheck > 0 then
        setStage("stage3_H")
        playVoiceline(soundfiles.sound3_H.name, 1, soundfiles.sound3_H.len)
        currentObjective = "Destroy the enemy base"
        Spring.MarkerAddPoint(3143, 2244, 2064)
        updateStageUI()
        updateObjectiveUI()
        baseFound = true
        end
        end

        --stage4_B2
        if stages.stage4_B2 then
        local missionCompleteCheck = Spring.GetUnitsInRectangle(500, 1000, 1500, 1600, 0)
        if missionCompleteCheck and #missionCompleteCheck > 0 then
        setStage("gameover")
        playVoiceline(soundfiles.sound4_G.name, 1, soundfiles.sound4_G.len)
        stageDelayTarget = Spring.GetGameFrame() + soundfiles.sound4_G.len + 15
        end
        end

        --stage gameover
        if stages.gameover then
        if stageDelayTarget and Spring.GetGameFrame() > stageDelayTarget then
        stageDelayTarget = nil
        Spring.GameOver({0})
        end
        end

        --stageless triggers
        if not radarPosFound then
        local radarPosFoundCheck = Spring.GetUnitsInRectangle(1450, 6992, 2000, 8188, 0)
        if radarPosFoundCheck and #radarPosFoundCheck > 0 then
        playVoiceline(soundfiles.sound1_I.name, 1, soundfiles.sound1_I.len)
        Spring.MarkerAddPoint(1321, 1114, 7982, "Good radar position")
        scenarioHint = "The hotkey for a radar tower is “C” -> Z”. \nThese towers provide both Radar and good Line-of-Sight, but are blocked by terrain."
        giveScenarioHint()
        radarPosFound = true
        end
        end

        if not teamKillPawnsFound then
        local teamKillPawnsFoundCheck = Spring.GetUnitsInRectangle(2650, 8000, 2950, 8180, 0)
        if teamKillPawnsFoundCheck and #teamKillPawnsFoundCheck > 0 then
        moveCamera(2700, 8100)
        playVoiceline(soundfiles.sound2_C.name, 1, soundfiles.sound2_C.len)
        teamKillPawnsFound = true
        end
        end

        if not defendedMexFound then
        local defendedMexFoundCheck = Spring.GetUnitsInRectangle(3512, 7200, 4090, 7716, 0)
        if defendedMexFoundCheck and #defendedMexFoundCheck > 0 then
        playVoiceline(soundfiles.sound2_D.name, 1, soundfiles.sound2_D.len)
        scenarioHint = "You can automate spending by selecting “Repeat” on your bot lab (Hotkey “T”). \nThis will continuously produce the queued composition of units in the lab. "
        giveScenarioHint()
        defendedMexFound = true
        end
        end

        if not stage2_FFound then
        local stage2_FFoundCheck = Spring.GetUnitsInRectangle(1900, 6200, 3800, 6580, 0)
        if stage2_FFoundCheck and #stage2_FFoundCheck > 0 then
        Spring.MarkerAddPoint(2879, 1626, 5766)
        playVoiceline(soundfiles.sound2_F.name, 1, soundfiles.sound2_F.len)
        scenarioHint = "Height difference affects the range of Plasma Cannons. \nFiring downhill will increase range, firing uphill will decrease range."
        giveScenarioHint()
        stage2_FFound = true
        end
        end

        if not unreclaimedRocksFound then
        local unreclaimedRocksFoundCheck = Spring.GetUnitsInRectangle(3646, 5400, 4080, 5650, 0)
        if unreclaimedRocksFoundCheck and #unreclaimedRocksFoundCheck > 0 then
        playVoiceline(soundfiles.sound2_H.name, 1, soundfiles.sound2_H.len)
        scenarioHint = "You can select an next idle worker by pressing “Control + Tab”. \nIdle workers can reclaim nearby resources."
        giveScenarioHint()
        unreclaimedRocksFound = true
        end
        end

        if not blitzFound then
        local blitzFoundCheck = Spring.GetUnitsInCylinder(2040, 5800, 500, 0)
        if blitzFoundCheck and #blitzFoundCheck > 0 then
        playVoiceline(soundfiles.sound2_G.name, 1, soundfiles.sound2_G.len)
        scenarioHint = "Compared to bots, vehicles have a much harder time with rough terrain and slopes, \nin part because they cannot reverse. \nYou can see how terrain affects a unit’s movement by selecting the unit and pressing “F6”."
        giveScenarioHint()
        blitzFound = true
        end
        end

        if not reinforcementsFound then
        local reinforcementsFoundCheck = Spring.GetUnitsInRectangle(0, 5400, 400, 5600, 0)
        if reinforcementsFoundCheck and #reinforcementsFoundCheck > 0 then
        playVoiceline(soundfiles.sound3_A.name, 1, soundfiles.sound3_A.len)
        spawnUnitTable({
            "stage3_AThug",
            "stage3_AGrunt1",
            "stage3_AGrunt2",
            "stage3_ACon",
            "stage3_ARez1",
            "stage3_ARez2"
        })
        scenarioHint = "This is another high-ground location that provides excellent radar coverage."
        updateStageUI()
        giveScenarioHint()
        reinforcementsFound = true
        end
        end

        if not asolarFound then
        local asolarFoundCheck = Spring.GetUnitsInRectangle(0, 3400, 600, 4100, 0)
        if asolarFoundCheck and #asolarFoundCheck > 0 then
        playVoiceline(soundfiles.sound3_B.name, 1, soundfiles.sound3_B.len)
        scenarioHint = "Advanced Solars are more efficient energy production than Basic Solar per metal spent, \nbut they require a strong energy economy first. "
        updateStageUI()
        giveScenarioHint()
        asolarFound = true
        end
        end

        if not stoutsFound then
        local stoutsFoundCheck = Spring.GetUnitsInCylinder(2500, 4085, 500, 0)
        if stoutsFoundCheck and #stoutsFoundCheck > 0 then
        playVoiceline(soundfiles.sound3_D.name, 1, soundfiles.sound3_D.len)
        scenarioHint = "Multiple units attacking a target from different directions at the same time will deal bonus flanking damage. \nYou can quickly issue surround orders via line drag."
        giveScenarioHint()
        stoutsFound = true
        end
        end

        if not backdoorFound then
        local backdoorFoundCheck = Spring.GetUnitsInRectangle(3800, 3000, 4080, 3400, 0)
        if backdoorFoundCheck and #backdoorFoundCheck > 0 then
        playVoiceline(soundfiles.sound4_A.name, 1, soundfiles.sound4_A.len)
        backdoorFound = true
        end
        end

        if not clawFound then
        local clawFoundCheck = Spring.GetUnitsInCylinder(2669, 2350, 450, 0)
        if clawFoundCheck and #clawFoundCheck > 0 then
        playVoiceline(soundfiles.sound4_A2.name, 1, soundfiles.sound4_A2.len)
        scenarioHint = "Some buildings can close, this prevents them from firing, but provides damage resistance."
        Spring.MarkerAddPoint(2671, 2268, 2330)
        giveScenarioHint()
        clawFound = true
        end
        end

        if not convertersFound then
        local convertersFoundCheck = Spring.GetUnitsInRectangle(3100, 1000, 3750, 1600, 0)
        if convertersFoundCheck and #convertersFoundCheck > 0 then
        playVoiceline(soundfiles.sound4_B.name, 1, soundfiles.sound4_B.len)
        scenarioHint = "Buildings that contain large amounts of energy explode when destroyed, \nand groups of them can chain-react."
        giveScenarioHint()
        convertersFound = true
        end
        end

        if not wallFound then
        local wallFoundCheck = Spring.GetUnitsInRectangle(2000, 2300, 2200, 2600, 0)
        if wallFoundCheck and #wallFoundCheck > 0 then
        playVoiceline(soundfiles.sound4_C.name, 1, soundfiles.sound4_C.len)
        wallFound = true
        end
        end

        if not interferenceFound then
        local interferenceFoundCheck = Spring.GetUnitsInRectangle(1500, 1600, 1750, 3000, 0)
        if interferenceFoundCheck and #interferenceFoundCheck > 0 then
        playVoiceline(soundfiles.sound4_D.name, 1, soundfiles.sound4_D.len)
        interferenceFound = true
        end
        end

        
        if not wrecksFound then
        local wrecksFoundCheck = Spring.GetUnitsInCylinder(900, 2350, 500, 0)
        if wrecksFoundCheck and #wrecksFoundCheck > 0 then
        playVoiceline(soundfiles.sound4_E.name, 1, soundfiles.sound4_E.len)
        wrecksFound = true
        end
        end

    end

    -- voice queue player
    if voicePlayingDelay and n > voicePlayingDelay then
        voicePlayingDelay = nil
        for index, voiceline in pairs(voiceQueue) do
            if voiceline then
            local line, vol, len = voiceline[1], voiceline[2], voiceline[3]
            playVoiceline(line, vol, len)
            voiceQueue[index] = nil
            break
            end
        end
    end

    --base showcase end
    if baseShowcase and stageDelayTarget and Spring.GetGameFrame() > stageDelayTarget then
        Spring.DestroyUnit(unitIDs.stage2_3vision, false, true)
        Spring.SendCommands("setspeed 1")
        baseShowcase = false
        stageDelayTarget = nil
    end

end