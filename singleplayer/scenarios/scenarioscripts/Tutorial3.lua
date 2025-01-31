if not gadgetHandler:IsSyncedCode() then
	return
end

local stages = {}

local triggers = {
-- never meant to be
}

local soundfiles = { --length in frames, 30fps
    sound1_A = {name = "sounds/tutorial/TM3_VoiceLines/TM3_1-A.mp3", len = 240},
    sound1_B = {name = "sounds/tutorial/TM3_VoiceLines/TM3_1-B.mp3", len = 240},
    sound1_C = {name = "sounds/tutorial/TM3_VoiceLines/TM3_1-C.mp3", len = 270},
    sound1_D = {name = "sounds/tutorial/TM3_VoiceLines/TM3_1-D.mp3", len = 210},
    sound1_E = {name = "sounds/tutorial/TM3_VoiceLines/TM3_1-E.mp3", len = 210},
    sound1_F = {name = "sounds/tutorial/TM3_VoiceLines/TM3_1-F.mp3", len = 150},
    sound2_A = {name = "sounds/tutorial/TM3_VoiceLines/TM3_2-A.mp3", len = 210},
    sound2_B = {name = "sounds/tutorial/TM3_VoiceLines/TM3_2-B.mp3", len = 150},
    sound2_C = {name = "sounds/tutorial/TM3_VoiceLines/TM3_2-C.mp3", len = 270},
    sound2_D = {name = "sounds/tutorial/TM3_VoiceLines/TM3_2-D.mp3", len = 120},
    sound2_E = {name = "sounds/tutorial/TM3_VoiceLines/TM3_2-E.mp3", len = 150},
    sound3_A = {name = "sounds/tutorial/TM3_VoiceLines/TM3_3-A.mp3", len = 180},
    sound3_B = {name = "sounds/tutorial/TM3_VoiceLines/TM3_3-B.mp3", len = 120},
    sound3_C = {name = "sounds/tutorial/TM3_VoiceLines/TM3_3-C.mp3", len = 210},
}

local currentObjective
local scenarioHint
local voiceDelayTarget
local stageDelayTarget
local voiceQueue = {}
local voicePlayingDelay
local delayDollyActivation
local dollyDuration
local miscCounter = 0

--flags
local smallMexSeen
local twilightFound
local lakeMexFound
local ai1active
local blitzFound
local slopeFound

local unitIDs = {}

local units = { --rotation is bs and the one dumped by luarules is meaningless; s0 e1 n2 w3
initialtrans = {name = 'corseah', x = 228, y = 800, z = 4577, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 307, py = 2000, pz = 7753}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 1800, py = 265, pz = 8000}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 7900}}}},
initialfig1 = {name = 'corveng', x = 342, y = 800, z = 4791, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 342, py = 1400, pz = 7914}}}},
initialfig2 = {name = 'corveng', x = 303, y = 800, z = 4869, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 303, py = 1400, pz = 7992}}}},
initialfig3 = {name = 'corveng', x = 270, y = 800, z = 4927, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 270, py = 1400, pz = 8050}}}},
initialfig4 = {name = 'corveng', x = 221, y = 800, z = 4970, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 221, py = 1400, pz = 8093}}}},
initialfig5 = {name = 'corveng', x = 192, y = 800, z = 4923, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 192, py = 1400, pz = 8046}}}},
initialfig6 = {name = 'corveng', x = 162, y = 800, z = 4851, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 162, py = 1400, pz = 7974}}}},
initialfig7 = {name = 'corveng', x = 147, y = 800, z = 4794, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 147, py = 1400, pz = 7917}}}},
initialscout1 = {name = 'corfink', x = 317, y = 800, z = 5050, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 317, py = 1400, pz = 8173}}}},
initialscout2 = {name = 'corfink', x = 150, y = 800, z = 5021, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 150, py = 1400, pz = 8144}}}},
corcom = {name = 'corcom', x = 228, y = 760, z = 4577, rot = 0 , teamID = 0, neutral = false},
alliedbase1 = {name = 'cormstor', x = 1136, y = 118, z = 7264, rot = 16384 , teamID = 1, neutral = false},
alliedbase2 = {name = 'corsolar', x = 984, y = 127, z = 7480, rot = 16384 , teamID = 1, neutral = false},
alliedbase3 = {name = 'corsolar', x = 904, y = 131, z = 7480, rot = 16384 , teamID = 1, neutral = false},
alliedbase4 = {name = 'corsolar', x = 728, y = 140, z = 7480, rot = 16384 , teamID = 1, neutral = false},
alliedbase5 = {name = 'corsolar', x = 648, y = 142, z = 7464, rot = 16384 , teamID = 1, neutral = false},
alliedbase6 = {name = 'corsolar', x = 568, y = 126, z = 7288, rot = 16384 , teamID = 1, neutral = false},
alliedbase7 = {name = 'corsolar', x = 552, y = 121, z = 7208, rot = 16384 , teamID = 1, neutral = false},
alliedbase8 = {name = 'corcv', x = 828, y = 116, z = 7250, rot = 8145 , teamID = 1, neutral = false},
alliedbase9 = {name = 'corcv', x = 942, y = 117, z = 7242, rot = -4120 , teamID = 1, neutral = false},
alliedbase10 = {name = 'cormex', x = 1152, y = 111, z = 6752, rot = 16384 , teamID = 1, neutral = false},
alliedbase11 = {name = 'cormex', x = 1536, y = 111, z = 6752, rot = 16384 , teamID = 1, neutral = false},
alliedbase12 = {name = 'corexp', x = 1328, y = 108, z = 6608, rot = 2 , teamID = 1, neutral = false},
alliedbase13 = {name = 'cordrag', x = 1280, y = 108, z = 6624, rot = 16384 , teamID = 1, neutral = true},
alliedbase14 = {name = 'cordrag', x = 1376, y = 108, z = 6624, rot = 16384 , teamID = 1, neutral = true},
alliedbase15 = {name = 'cordrag', x = 1376, y = 107, z = 6592, rot = 16384 , teamID = 1, neutral = true},
alliedbase16 = {name = 'cordrag', x = 1280, y = 107, z = 6592, rot = 16384 , teamID = 1, neutral = true},
alliedbase17 = {name = 'cordrag', x = 1280, y = 107, z = 6560, rot = 16384 , teamID = 1, neutral = true},
alliedbase18 = {name = 'cordrag', x = 1312, y = 107, z = 6560, rot = 16384 , teamID = 1, neutral = true},
alliedbase19 = {name = 'cordrag', x = 1344, y = 107, z = 6560, rot = 16384 , teamID = 1, neutral = true},
alliedbase20 = {name = 'cordrag', x = 1376, y = 107, z = 6560, rot = 16384 , teamID = 1, neutral = true},
alliedbase21 = {name = 'corllt', x = 1760, y = 114, z = 6768, rot = 2 , teamID = 1, neutral = false},
alliedbase22 = {name = 'cordrag', x = 1760, y = 113, z = 6736, rot = 16384 , teamID = 1, neutral = true},
alliedbase23 = {name = 'cordrag', x = 1792, y = 114, z = 6768, rot = 16384 , teamID = 1, neutral = true},
alliedbase24 = {name = 'cordrag', x = 1728, y = 114, z = 6768, rot = 16384 , teamID = 1, neutral = true},
alliedbase25 = {name = 'corllt', x = 848, y = 109, z = 6736, rot = 2 , teamID = 1, neutral = false},
alliedbase26 = {name = 'cordrag', x = 880, y = 109, z = 6736, rot = 16384 , teamID = 1, neutral = true},
alliedbase27 = {name = 'cordrag', x = 848, y = 108, z = 6704, rot = 16384 , teamID = 1, neutral = true},
alliedbase28 = {name = 'cordrag', x = 816, y = 108, z = 6736, rot = 16384 , teamID = 1, neutral = true},
alliedbase29 = {name = 'corllt', x = 576, y = 108, z = 6848, rot = 2 , teamID = 1, neutral = false},
alliedbase30 = {name = 'cordrag', x = 576, y = 107, z = 6816, rot = 16384 , teamID = 1, neutral = true},
alliedbase31 = {name = 'cordrag', x = 544, y = 108, z = 6848, rot = 16384 , teamID = 1, neutral = true},
alliedbase32 = {name = 'cordrag', x = 608, y = 108, z = 6848, rot = 16384 , teamID = 1, neutral = true},
alliedbase33 = {name = 'corvp', x = 864, y = 114, z = 7136, rot = 1 , teamID = 1, neutral = false},
alliedbase34 = {name = 'corfav', x = 711, y = 108, z = 6809, rot = -29062 , teamID = 1, neutral = false},
alliedbase35 = {name = 'corfav', x = 1643, y = 110, z = 6657, rot = 29409 , teamID = 1, neutral = false},
alliedbase36 = {name = 'corfav', x = 1172, y = 107, z = 6593, rot = -30959 , teamID = 1, neutral = false},
alliedbase37 = {name = 'corfav', x = 1551, y = 108, z = 6609, rot = 26806 , teamID = 1, neutral = false},
alliedbase38 = {name = 'corfav', x = 1068, y = 108, z = 6612, rot = -30289 , teamID = 1, neutral = false},
alliedbase39 = {name = 'corgator', x = 1131, y = 109, z = 6669, rot = 27947 , teamID = 1, neutral = false},
alliedbase40 = {name = 'corgator', x = 1571, y = 110, z = 6689, rot = 17732 , teamID = 1, neutral = false},
alliedbase41 = {name = 'corrl', x = 2536, y = 1180, z = 7160, rot = 16384 , teamID = 1, neutral = false},
alliedbase42 = {name = 'corrl', x = 2472, y = 1220, z = 7592, rot = 16384 , teamID = 1, neutral = false},
alliedbase43 = {name = 'corrl', x = 3160, y = 1275, z = 7672, rot = 16384 , teamID = 1, neutral = false},
alliedbase44 = {name = 'corrl', x = 2920, y = 688, z = 5640, rot = 16384 , teamID = 1, neutral = false},
alliedbase45 = {name = 'corrad', x = 3024, y = 741, z = 6416, rot = 16384 , teamID = 1, neutral = false},
alliedbase46 = {name = 'corrl', x = 2936, y = 1197, z = 7112, rot = 16384 , teamID = 1, neutral = false},
alliedbase47 = {name = 'corrad', x = 1328, y = 112, z = 6784, rot = 16384 , teamID = 1, neutral = false},
nanotrans1 = {name = 'corvalk', x = 273, y = 400, z = 6498, rot = 1 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 872, py = 113, pz = 7015}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 872, py = 113, pz = 7015}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
nanotrans2 = {name = 'corvalk', x = 351, y = 400, z = 6548, rot = 1 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 745, py = 113, pz = 7141}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 745, py = 113, pz = 7141}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
nanotrans3 = {name = 'corvalk', x = 278, y = 400, z = 6634, rot = 1 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 882, py = 116, pz = 7224}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 882, py = 116, pz = 7224}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
nano1 = {name = 'cornanotc', x = 273, y = 360, z = 6498, rot = 1 , teamID = 0, neutral = false},
nano2 = {name = 'cornanotc', x = 351, y = 360, z = 6548, rot = 1 , teamID = 0, neutral = false},
nano3 = {name = 'cornanotc', x = 278, y = 360, z = 6634, rot = 1 , teamID = 0, neutral = false},
ambushtwilight = {name = 'armamex', x = 586, y = 24, z = 1260, rot = 0 , teamID = 2, neutral = false},
ambushrover1 = {name = 'armfav', x = 92, y = 32, z = 660, rot = -29801 , teamID = 2, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 639, py = 24, pz = 1325}}}},
ambushrover2 = {name = 'armfav', x = 130, y = 27, z = 737, rot = 11211 , teamID = 2, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 639, py = 24, pz = 1325}}}},
ambushrover3 = {name = 'armfav', x = 140, y = 30, z = 694, rot = -25729 , teamID = 2, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 639, py = 24, pz = 1325}}}},
ambushrover4 = {name = 'armfav', x = 36, y = 26, z = 769, rot = -7395 , teamID = 2, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 639, py = 24, pz = 1325}}}},
ambushrover5 = {name = 'armfav', x = 89, y = 26, z = 767, rot = -1157 , teamID = 2, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 639, py = 24, pz = 1325}}}},
reclaimtrans = {name = 'corvalk', x = 1988, y = 476, z = 8120, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 1800, py = 265, pz = 8000}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 1800, py = 265, pz = 8000}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 7900}}}},
reclaimveh = {name = 'corcv', x = 1988, y = 436, z = 8120, rot = 0 , teamID = 0, neutral = false},
ambushblitz1 = {name = 'armflash', x = 4430, y = 67, z = 7463, rot = -28871 , teamID = 2, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 4826, py = 17, pz = 6296}}}},
ambushblitz2 = {name = 'armflash', x = 4554, y = 31, z = 7547, rot = 29029 , teamID = 2, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 4826, py = 17, pz = 6296}}}},
ambushblitz3 = {name = 'armflash', x = 4541, y = 29, z = 7377, rot = -31501 , teamID = 2, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 4826, py = 17, pz = 6296}}}},
ambushblitz4 = {name = 'armflash', x = 4573, y = 21, z = 7473, rot = 28003 , teamID = 2, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 4826, py = 17, pz = 6296}}}},
ambushblitz5 = {name = 'armflash', x = 4448, y = 55, z = 7376, rot = -26178 , teamID = 2, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 4826, py = 17, pz = 6296}}}},
ambushblitz6 = {name = 'armflash', x = 4500, y = 42, z = 7471, rot = 29074 , teamID = 2, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 4826, py = 17, pz = 6296}}}},
ambushblitz7 = {name = 'armflash', x = 4455, y = 65, z = 7551, rot = -29066 , teamID = 2, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 4826, py = 17, pz = 6296}}}},
shuri1 = {name = 'corbw', x = 3151, y = 1537, z = 8051, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 4826, py = 17, pz = 6296}}, {cmdID = CMD.FIGHT, position = {px = 4415, py = 17, pz = 7652}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
shuri2 = {name = 'corbw', x = 3183, y = 1548, z = 8051, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 4826, py = 17, pz = 6296}}, {cmdID = CMD.FIGHT, position = {px = 4415, py = 17, pz = 7652}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
shuri3 = {name = 'corbw', x = 3215, y = 1536, z = 8051, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 4826, py = 17, pz = 6296}}, {cmdID = CMD.FIGHT, position = {px = 4415, py = 17, pz = 7652}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
shuri4 = {name = 'corbw', x = 3247, y = 1568, z = 8051, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 4826, py = 17, pz = 6296}}, {cmdID = CMD.FIGHT, position = {px = 4415, py = 17, pz = 7652}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
shuri5 = {name = 'corbw', x = 3151, y = 1596, z = 8083, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 4826, py = 17, pz = 6296}}, {cmdID = CMD.FIGHT, position = {px = 4415, py = 17, pz = 7652}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
shuri6 = {name = 'corbw', x = 3183, y = 1603, z = 8083, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 4826, py = 17, pz = 6296}}, {cmdID = CMD.FIGHT, position = {px = 4415, py = 17, pz = 7652}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
shuri7 = {name = 'corbw', x = 3215, y = 1585, z = 8083, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 4826, py = 17, pz = 6296}}, {cmdID = CMD.FIGHT, position = {px = 4415, py = 17, pz = 7652}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
shuri8 = {name = 'corbw', x = 3247, y = 1610, z = 8083, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 4826, py = 17, pz = 6296}}, {cmdID = CMD.FIGHT, position = {px = 4415, py = 17, pz = 7652}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
shuri9 = {name = 'corbw', x = 3151, y = 1667, z = 8115, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 4826, py = 17, pz = 6296}}, {cmdID = CMD.FIGHT, position = {px = 4415, py = 17, pz = 7652}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
shuri10 = {name = 'corbw', x = 3183, y = 1693, z = 8115, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 4826, py = 17, pz = 6296}}, {cmdID = CMD.FIGHT, position = {px = 4415, py = 17, pz = 7652}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
shuri11 = {name = 'corbw', x = 3215, y = 1691, z = 8115, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 4826, py = 17, pz = 6296}}, {cmdID = CMD.FIGHT, position = {px = 4415, py = 17, pz = 7652}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
shuri12 = {name = 'corbw', x = 3247, y = 1689, z = 8115, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 4826, py = 17, pz = 6296}}, {cmdID = CMD.FIGHT, position = {px = 4415, py = 17, pz = 7652}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
shuri13 = {name = 'corbw', x = 3151, y = 1688, z = 8147, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 4826, py = 17, pz = 6296}}, {cmdID = CMD.FIGHT, position = {px = 4415, py = 17, pz = 7652}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
shuri14 = {name = 'corbw', x = 3183, y = 1684, z = 8147, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 4826, py = 17, pz = 6296}}, {cmdID = CMD.FIGHT, position = {px = 4415, py = 17, pz = 7652}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
shuri15 = {name = 'corbw', x = 3215, y = 1682, z = 8147, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 4826, py = 17, pz = 6296}}, {cmdID = CMD.FIGHT, position = {px = 4415, py = 17, pz = 7652}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
shuri16 = {name = 'corbw', x = 3247, y = 1684, z = 8147, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 4826, py = 17, pz = 6296}}, {cmdID = CMD.FIGHT, position = {px = 4415, py = 17, pz = 7652}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
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

local function enableAI1()
    Spring.Echo("AI1 activated")
end

--set units to hold position
function gadget:MetaUnitAdded(unitID, unitDefID, teamID)
    if teamID == 0 then
        Spring.GiveOrderToUnit(unitID, CMD.MOVE_STATE, {0}, CMD.OPT_SHIFT)
    end
end

function gadget:UnitDestroyed(unitID, unitDefID)
end

function gadget:UnitFinished(unitID, unitDefID, unitTeam)

    --stage1_E
    if stages.stage1_E then
    if getNameFromID(unitID) == "corwin" then
    setStage("stage1_F")
    playVoiceline(soundfiles.sound1_F.name, 1, soundfiles.sound1_F.len)
    currentObjective = "Queue a 3x3 grid of Windmills."
    scenarioHint = "Select the windmill blueprint and hold “Shift + Alt” to queue a grid.\n”Shift+Alt+Z”: Increases blueprint spacing\n”Shift+Alt+x”: Decreases blueprint spacing"
    updateObjectiveUI()
    updateStageUI()
    giveScenarioHint()
    end
    end

    --stage2_F
    if stages.stage2_A then
    if getNameFromID(unitID) == "cormex" then
    local playerUnits = Spring.GetTeamUnits(0)
    local playerMex = 0
    for _, uID in pairs(playerUnits) do
        if getNameFromID(uID) == "cormex" or getNameFromID(uID) == "corexp" then
        playerMex = playerMex + 1
        end
    end
    if playerMex == 5 then
    setStage("stage2_C")
    local allyUnits = Spring.GetTeamUnits(1)
    for _, uID in pairs(allyUnits) do
        if getNameFromID(uID) == "corllt" then
        Spring.TransferUnit(uID, 0, true)
        end
    end
    spawnUnitTable({
        "reclaimtrans",
        "reclaimveh"
    })
    Spring.UnitAttach(unitIDs.reclaimtrans, unitIDs.reclaimveh, 0)
    playVoiceline(soundfiles.sound2_C.name, 1, soundfiles.sound2_C.len)
    moveCamera(1800, 8000)
    scenarioHint = "Reclaiming a living unit recovers 100% of the metal, but 0% of the energy. \nYou can area reclaim a specific unit via “E+Alt+Left Click Drag”, starting on the unit you want to reclaim."
    Spring.MarkerAddPoint(1695, 235, 7985, "Reclaimable LLTs")
    Spring.MarkerAddPoint(1882, 235, 7959, "Reclaimable LLTs")
    Spring.MarkerAddPoint(1791, 235, 8132, "Reclaimable LLTs")
    updateObjectiveUI()
    updateStageUI()
    giveScenarioHint()
    end
    end
    end
end

function gadget:UnitUnloaded(unitID, unitDefID, unitTeam, transportID, transportTeam)

    --stage1_A
    if stages.stage1_A then
    if unitID == unitIDs.corcom then
    Spring.SendCommands("hideinterface")
    setStage("stage1_B")
    currentObjective = "Head to the forward base."
    Spring.MarkerAddPoint(1330, 116, 6949, "Forward Base")
    updateObjectiveUI()
    updateStageUI()
    playVoiceline(soundfiles.sound1_B.name, 1, soundfiles.sound1_B.len)
    end
    end

    --stage1_D
    if stages.stage1_D then
    if getNameFromID(unitID) == "cornanotc" then
    setStage("stage1_E")
    playVoiceline(soundfiles.sound1_E.name, 1, soundfiles.sound1_E.len)
    for i=1, 47 do
        Spring.TransferUnit(unitIDs["alliedbase"..i], 0, false)
    end
    scenarioHint = "Wind turbines generate energy equal to the current wind speed every second, but wind speed fluctuates."
    currentObjective = "Build a windmill near your construction turrets."
    updateObjectiveUI()
    updateStageUI()
    giveScenarioHint()
    end
    end
end

function gadget:GameFrame(frameNum) --fires off every frame
    Spring.Echo(getCurrentStage())
    local n = frameNum

    if n<1 then

    --initial load
    setStage("stage1_A")
    playVoiceline(soundfiles.sound1_A.name, 1, soundfiles.sound1_A.len)
    spawnUnitTable({
    "initialtrans",
    "initialfig1",
    "initialfig2",
    "initialfig3",
    "initialfig4",
    "initialfig5",
    "initialfig6",
    "initialfig7",
    "initialscout1",
    "initialscout2",
    "corcom",
    })
    Spring.UnitAttach(unitIDs.initialtrans, unitIDs.corcom, 0)
    Spring.SendCommands("hideinterface")
    updateObjectiveUI()
    updateStageUI()
    end

    if n>0 and n%30 == 0 then
        updateStageUI()
        updateObjectiveUI()

        --stage1_B
        if stages.stage1_B then
        local baseRevealCheck = Spring.GetUnitsInRectangle(1134, 7406, 2200, 7800, 0)
        if baseRevealCheck and #baseRevealCheck > 0 then
        setStage("stage1_C")
        for i=1, 47 do
            spawnUnit(units["alliedbase"..i], "alliedbase"..i)
        end
        playVoiceline(soundfiles.sound1_C.name, 1, soundfiles.sound1_C.len)
        end
        end

        --stage1_C
        if stages.stage1_C then
        local leftSpawnCheck = Spring.GetUnitsInCylinder(1800, 8000, 600, 0)
        if not leftSpawnCheck or #leftSpawnCheck == 0 then
        setStage("stage1_D")
        playVoiceline(soundfiles.sound1_D.name, 1, soundfiles.sound1_D.len)
        spawnUnitTable({
            "nanotrans1",
            "nanotrans2",
            "nanotrans3",
            "nano1",
            "nano2",
            "nano3",
        })
        Spring.UnitAttach(unitIDs.nanotrans1, unitIDs.nano1, 0)
        Spring.UnitAttach(unitIDs.nanotrans2, unitIDs.nano2, 0)
        Spring.UnitAttach(unitIDs.nanotrans3, unitIDs.nano3, 0)
        scenarioHint = "Construction Turrets have extremely high build power, \nand automatically construct and repair units within their range."
        updateStageUI()
        updateObjectiveUI()
        giveScenarioHint()
        end
        end

        --stage1_F
        if stages.stage1_F then
        local playerUnits = Spring.GetTeamUnits(0)
        local windmillsQueuedPassed
        local invWindUdefID = 0-UnitDefNames["corwin"].id
        for _, unitID in pairs(playerUnits) do
            local windmillsQueued = 0
            local unitOrders = Spring.GetUnitCommands(unitID, 99)
            if unitOrders and #unitOrders>0 then
            for _, cmd in ipairs(unitOrders) do
                if cmd.id == invWindUdefID then
                windmillsQueued = windmillsQueued + 1
                end
            end
            if windmillsQueued == 9 then
            windmillsQueuedPassed = true
            end
            end
        end
        if windmillsQueuedPassed then
        setStage("stage2_A")
        playVoiceline(soundfiles.sound2_A.name, 1, soundfiles.sound2_A.len)
        scenarioHint = "Taking open mexes before converting energy is always more efficient. \nTo find mexes you can use the metal view (Hotkey ”F7”)"
        currentObjective = "Take 4 new mexes."
        Spring.MarkerAddPoint(1368, 33, 4285, "Open Mex")
        Spring.MarkerAddPoint(2156, 29, 4271, "Open Mex")
        Spring.MarkerAddPoint(568, 24, 1266, "Open Mex")
        Spring.MarkerAddPoint(2235, 24, 508, "Open Mex")
        updateStageUI()
        updateObjectiveUI()
        giveScenarioHint()
        end
        end

        --stage2_C or earlier into 3_A
        if not ai1active then
        local safeZoneLeftCheck1 = Spring.GetUnitsInRectangle(4333, 0, 5000, 2000, 0)
        local safeZoneLeftCheck2 = Spring.GetUnitsInRectangle(3600, 2000, 5000, 8100, 0)
        local playerMex = 0
        if stages.stage2_C then
        local playerUnits = Spring.GetTeamUnits(0)
        for _, uID in pairs(playerUnits) do
            if getNameFromID(uID) == "cormex" or getNameFromID(uID) == "corexp" then
            playerMex = playerMex + 1
            end
        end
        end
        if (playerMex and playerMex == 7) or (safeZoneLeftCheck1 and #safeZoneLeftCheck1>0) or (safeZoneLeftCheck2 and #safeZoneLeftCheck2>0) then
        enableAI1()
        setStage("stage3_A")
        playVoiceline(soundfiles.sound3_A.name, 1, soundfiles.sound3_A.len)
        scenarioHint = "Formation move (Hotkey: Control + Rightclick) will have all units move at the speed of the slowest unit."
        currentObjective = "Find and secure RS-KP981"
        updateStageUI()
        updateObjectiveUI()
        giveScenarioHint()
        ai1active = true
        end
        end

        

        --stageless triggers
        
        if not smallMexSeen then
        local smallMexCheck1 = Spring.GetUnitsInCylinder(1368, 4285, 500, 0)
        local smallMexCheck2 = Spring.GetUnitsInCylinder(2156, 4271, 500, 0)
        if (smallMexCheck1 and #smallMexCheck1 > 0) or (smallMexCheck2 and #smallMexCheck2 > 0) then
        playVoiceline(soundfiles.sound2_B.name, 1, soundfiles.sound2_B.len)
        scenarioHint = "Not all metal deposits have the same value. \nThe extracted amount per second is displayed on the node, but can also be seen at the bottom left when selecting a mex."
        smallMexSeen = true
        end
        end

        if not twilightFound then
        local twilightFoundCheck = Spring.GetUnitsInCylinder(586, 1260, 250, 0)
        if twilightFoundCheck and #twilightFoundCheck>0 then
        playVoiceline(soundfiles.sound2_D.name, 1, soundfiles.sound2_D.len)
        spawnUnitTable({
            "ambushtwilight",
            "ambushrover1",
            "ambushrover2",
            "ambushrover3",
            "ambushrover4",
            "ambushrover5",
        })
        moveCamera("0586", 1260)
        Spring.GiveOrderToUnit(unitIDs.ambushtwilight, CMD.SELFD, {0}, {})
        scenarioHint = "EMP weapons deal no structural damage, but will stun your unit if they deal damage equal to your HP."
        giveScenarioHint()
        twilightFound = true
        end
        end

        if not lakeMexFound then
        local lakeMexFoundCheck = Spring.GetUnitsInRectangle(2733, 0, 2458, 1865, 0)
        if lakeMexFoundCheck and #lakeMexFoundCheck>0 then
        playVoiceline(soundfiles.sound2_E.name, 1, soundfiles.sound2_E.len)
        moveCamera(3800, 1000)
        Spring.MarkerAddPoint(3909, -169, 532, "Underwater Mex")
        Spring.MarkerAddPoint(3763, -164, 1486, "Underwater Mex")
        scenarioHint = "Amphibious units can travel through water, as long as the slope isn’t too steep."
        giveScenarioHint()
        lakeMexFound = true
        end
        end

        if not blitzFound then
        local blitzFoundCheck = Spring.GetUnitsInRectangle(3940, 5867, 5400, 8100, 0)
        if blitzFoundCheck and #blitzFoundCheck>0 then
        spawnUnitTable({
            "ambushblitz1",
            "ambushblitz2",
            "ambushblitz3",
            "ambushblitz4",
            "ambushblitz5",
            "ambushblitz6",
            "ambushblitz7",
            "shuri1",
            "shuri2",
            "shuri3",
            "shuri4",
            "shuri5",
            "shuri6",
            "shuri7",
            "shuri8",
            "shuri9",
            "shuri10",
            "shuri11",
            "shuri12",
            "shuri13",
            "shuri14",
            "shuri15",
            "shuri16",
        })
        playVoiceline(soundfiles.sound3_C.name, 1, soundfiles.sound3_C.len)
        moveCamera(4500, 7000)
        scenarioHint = "Units can be continually EMPed, but require other units to deal damage."
        giveScenarioHint()
        blitzFound = true
        end
        end

        --I don't think this is a good idea, but let's roll with it.
        if not slopeFound then
        local x1, x2, z1, z2 = 5180, 6400, 5671, 3969
        local playerUnits = Spring.GetTeamUnits(0)
        local finalx, finalz
        for _, unitID in pairs(playerUnits) do
            local x, y, z = Spring.GetUnitPosition(unitID)
            if x > 5235 and z < 7600 and z > 3900 and ((x2 - x1)*(z - z1) - (z2 - z1)*(x - x1)) > 0 then
            finalx, finalz = math.floor(x), math.floor(z)
            end
        end
        if finalx and finalz then
        Spring.Echo(finalx.." "..finalz)
        moveCamera(finalx, finalz)
        playVoiceline(soundfiles.sound3_B.name, 1, soundfiles.sound3_B.len)
        scenarioHint = "Both uneven and sloped terrain can slow down units, especially vehicles."
        giveScenarioHint()
        slopeFound = true
        end
        end


        --delete starting air
        local airToClearCheck = Spring.GetUnitsInRectangle(0, 7900, 1000, 8200, 1)
        if airToClearCheck and #airToClearCheck > 0 then
        for _, airID in pairs(airToClearCheck) do
            if airID ~= unitIDs.initialtrans or not stages.stage1_A then
            Spring.DestroyUnit(airID, false, true)
            end
        end
        end

    end

    if delayDollyActivation and n > (delayDollyActivation + 10) then
        Spring.RunDollyCamera(dollyDuration)
        delayDollyActivation = nil
        dollyDuration = nil
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

end