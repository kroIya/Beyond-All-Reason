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
    sound3_D = {name = "sounds/tutorial/TM3_VoiceLines/TM3_3-D.mp3", len = 180},
    sound3_E = {name = "sounds/tutorial/TM3_VoiceLines/TM3_3-E.mp3", len = 210},
    sound3_E2 = {name = "sounds/tutorial/TM3_VoiceLines/TM3_3-E2.mp3", len = 90},
    sound3_F = {name = "sounds/tutorial/TM3_VoiceLines/TM3_3-F.mp3", len = 180},
    sound3_G = {name = "sounds/tutorial/TM3_VoiceLines/TM3_3-G.mp3", len = 330},
    sound4_A = {name = "sounds/tutorial/TM3_VoiceLines/TM3_4-A.mp3", len = 180},
    sound4_B = {name = "sounds/tutorial/TM3_VoiceLines/TM3_4-B.mp3", len = 180},
    sound4_C = {name = "sounds/tutorial/TM3_VoiceLines/TM3_4-C.mp3", len = 180},
    sound4_D = {name = "sounds/tutorial/TM3_VoiceLines/TM3_4-D.mp3", len = 120},
    sound4_E = {name = "sounds/tutorial/TM3_VoiceLines/TM3_4-E.mp3", len = 150},
    sound4_F = {name = "sounds/tutorial/TM3_VoiceLines/TM3_4-F.mp3", len = 90},
    sound4_G = {name = "sounds/tutorial/TM3_VoiceLines/TM3_4-G.mp3", len = 150},
    sound4_H = {name = "sounds/tutorial/TM3_VoiceLines/TM3_4-H.mp3", len = 30},
    sound4_I = {name = "sounds/tutorial/TM3_VoiceLines/TM3_4-I.mp3", len = 90},
    sound4_J = {name = "sounds/tutorial/TM3_VoiceLines/TM3_4-J.mp3", len = 150},
    sound4_K = {name = "sounds/tutorial/TM3_VoiceLines/TM3_4-K.mp3", len = 210},
    sound4_L = {name = "sounds/tutorial/TM3_VoiceLines/TM3_4-L.mp3", len = 30},
    sound4_M = {name = "sounds/tutorial/TM3_VoiceLines/TM3_4-M.mp3", len = 150},
    sound5_A = {name = "sounds/tutorial/TM3_VoiceLines/TM3_5-A.mp3", len = 180},
    sound5_B = {name = "sounds/tutorial/TM3_VoiceLines/TM3_5-B.mp3", len = 210},
}

local currentObjective
local scenarioHint
local voiceDelayTarget
local stageDelayTarget
local voiceQueue = {}
local voicePlayingDelay
local delayDollyActivation
local dollyDuration
local timer

--flags
local smallMexSeen
local twilightFound
local lakeMexFound
local ai1active
local blitzFound
local slopeFound
local highgroundFound
local richMexFound
local richMexBuilt
local researchStationApproached
local disableCommander
local pincersDead = 0

local unitIDs = {}

local units = { --rotation is bs and the one dumped by luarules is meaningless; s0 e1 n2 w3
    researchstation = {name = 'mission_command_tower', x = 6955, y = 11, z = 2040, rot = 0 , teamID = 5, neutral = true},
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
    porctrans1 = {name = 'corseah', x = 1718, y = 531, z = 7925, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 2276, py = 200, pz = 4704}}, {cmdID = CMD.MOVE, position = {px = 4836, py = 200, pz = 4539}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 6882, py = 144, pz = 4453}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
    porctrans2 = {name = 'corseah', x = 1782, y = 533, z = 7925, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 2276, py = 200, pz = 4704}}, {cmdID = CMD.MOVE, position = {px = 4836, py = 200, pz = 4539}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 7043, py = 165, pz = 5104}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
    porctrans3 = {name = 'corseah', x = 1846, y = 536, z = 7925, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 2276, py = 200, pz = 4704}}, {cmdID = CMD.MOVE, position = {px = 4836, py = 200, pz = 4539}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 7200, py = 198, pz = 5800}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
    porctrans4 = {name = 'corseah', x = 1718, y = 544, z = 7989, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 2276, py = 200, pz = 4704}}, {cmdID = CMD.MOVE, position = {px = 4836, py = 200, pz = 4539}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 7028, py = 145, pz = 4775}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
    porctrans5 = {name = 'corseah', x = 1782, y = 543, z = 7989, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 2276, py = 200, pz = 4704}}, {cmdID = CMD.MOVE, position = {px = 4836, py = 200, pz = 4539}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 7156, py = 206, pz = 5450}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
    porctrans6 = {name = 'corseah', x = 1846, y = 545, z = 7989, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 2276, py = 200, pz = 4704}}, {cmdID = CMD.MOVE, position = {px = 4836, py = 200, pz = 4539}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 7240, py = 144, pz = 6167}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
    porcllt1 = {name = 'corllt', x = 1718, y = 500, z = 7925, rot = 0 , teamID = 0, neutral = false},
    porcllt2 = {name = 'corllt', x = 1782, y = 500, z = 7925, rot = 0 , teamID = 0, neutral = false},
    porcllt3 = {name = 'corllt', x = 1846, y = 500, z = 7925, rot = 0 , teamID = 0, neutral = false},
    porchllt1 = {name = 'corhllt', x = 1718, y = 500, z = 7989, rot = 0 , teamID = 0, neutral = false},
    porchllt2 = {name = 'corhllt', x = 1782, y = 500, z = 7989, rot = 0 , teamID = 0, neutral = false},
    porchllt3 = {name = 'corhllt', x = 1846, y = 500, z = 7989, rot = 0 , teamID = 0, neutral = false},
    impulsetrans1 = {name = 'corvalk', x = 5093, y = 346, z = 105, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 5686, py = 23, pz = 1112}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 5686, py = 23, pz = 1112}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
    impulsetrans2 = {name = 'corvalk', x = 5272, y = 324, z = 105, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 5586, py = 23, pz = 1212}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 5586, py = 23, pz = 1212}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
    impulsetrans3 = {name = 'corvalk', x = 4929, y = 346, z = 102, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 5786, py = 23, pz = 1212}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 5786, py = 23, pz = 1212}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
    impulsetrans4 = {name = 'corvalk', x = 5427, y = 324, z = 94, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 5686, py = 23, pz = 1312}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 5686, py = 23, pz = 1312}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
    impulsepounder1 = {name = 'corlevlr', x = 5093, y = 300, z = 105, rot = 0 , teamID = 0, neutral = false},
    impulsepounder2 = {name = 'corlevlr', x = 5272, y = 300, z = 105, rot = 0 , teamID = 0, neutral = false},
    impulsepounder3 = {name = 'corlevlr', x = 4929, y = 300, z = 102, rot = 0 , teamID = 0, neutral = false},
    impulsepounder4 = {name = 'corlevlr', x = 5427, y = 300, z = 94, rot = 0 , teamID = 0, neutral = false},
    cameracon1 = {name = 'corca', x = 6149, y = 369, z = 209, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = 0-UnitDefNames["coreyes"].id, position = {px = 9343, py = 4, pz = 363}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
    cameracon2 = {name = 'corca', x = 6197, y = 358, z = 209, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = 0-UnitDefNames["coreyes"].id, position = {px = 8472, py = 13, pz = 1331}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
    pincer1 = {name = 'armpincer', x = 9450, y = 23, z = 44, rot = 0 , teamID = 2, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 6819, py = 25, pz = 2046}}}},
    pincer2 = {name = 'armpincer', x = 9554, y = 24, z = 46, rot = 0 , teamID = 2, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 6819, py = 25, pz = 2046}}}},
    pincer3 = {name = 'armpincer', x = 9346, y = 19, z = 40, rot = 0 , teamID = 2, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 6819, py = 25, pz = 2046}}}},
    pincer4 = {name = 'armpincer', x = 9638, y = 23, z = 53, rot = 0 , teamID = 2, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 6819, py = 25, pz = 2046}}}},
    minetrans1 = {name = 'corseah', x = 7130, y = 200, z = 87, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 6475, py = 20, pz = 1543}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 6475, py = 20, pz = 1543}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
    minetrans2 = {name = 'corseah', x = 7232, y = 200, z = 87, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 6375, py = 20, pz = 1543}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 6375, py = 20, pz = 1543}}, {cmdID = CMD.MOVE, position = {px = 328, py = 1300, pz = 8000}}}},
    minelayer1 = {name = 'cormlv', x = 7130, y = 180, z = 87, rot = 0 , teamID = 0, neutral = false},
    minelayer2 = {name = 'cormlv', x = 7232, y = 180, z = 87, rot = 0 , teamID = 0, neutral = false},
    airscout1 = {name = 'armpeep', x = 11275, y = 673, z = 3964, rot = 0 , teamID = 2, neutral = false, queue = {{cmdID = CMD.PATROL, position = {px = 6600, py = 200, pz = 2000}}}},
    airscout2 = {name = 'armpeep', x = 11479, y = 674, z = 3821, rot = 0 , teamID = 2, neutral = false, queue = {{cmdID = CMD.PATROL, position = {px = 6600, py = 200, pz = 2000}}}},
    airscout3 = {name = 'armpeep', x = 11910, y = 595, z = 3597, rot = 0 , teamID = 2, neutral = false, queue = {{cmdID = CMD.PATROL, position = {px = 6600, py = 200, pz = 2000}}}},
    webber1 = {name = 'armspid', x = 12453, y = 493, z = 3167, rot = 0 , teamID = 2, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 8600, py = 20, pz = 1550}}, {cmdID = CMD.FIGHT, position = {px = 6800, py = 25, pz = 2000}}}},
    webber2 = {name = 'armspid', x = 12494, y = 493, z = 3166, rot = 0 , teamID = 2, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 8600, py = 20, pz = 1550}}, {cmdID = CMD.FIGHT, position = {px = 6800, py = 25, pz = 2000}}}},
    webber3 = {name = 'armspid', x = 12534, y = 493, z = 3171, rot = 0 , teamID = 2, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 8600, py = 20, pz = 1550}}, {cmdID = CMD.FIGHT, position = {px = 6800, py = 25, pz = 2000}}}},
    webber4 = {name = 'armspid', x = 12459, y = 493, z = 3206, rot = 0 , teamID = 2, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 8600, py = 20, pz = 1550}}, {cmdID = CMD.FIGHT, position = {px = 6800, py = 25, pz = 2000}}}},
    webber5 = {name = 'armspid', x = 12500, y = 493, z = 3206, rot = 0 , teamID = 2, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 8600, py = 20, pz = 1550}}, {cmdID = CMD.FIGHT, position = {px = 6800, py = 25, pz = 2000}}}},
    turtle1 = {name = 'armcroc', x = 10422, y = 45, z = 4328, rot = 0 , teamID = 2, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 6650, py = 35, pz = 2450}}}},
    turtle2 = {name = 'armcroc', x = 10470, y = 53, z = 4328, rot = 0 , teamID = 2, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 6650, py = 35, pz = 2450}}}},
    finaltrans = {name = 'corseah', x = 155, y = 200, z = 1040, rot = 1 , teamID = 1, neutral = false},
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

local function enableAI2()
    Spring.Echo("AI2 activated")
end

local function startTimer(duration)
    timer = Spring.GetGameFrame() + duration
    Spring.SendLuaUIMsg("StartTimer|"..math.floor(duration/30))
end

--set units to hold position
function gadget:MetaUnitAdded(unitID, unitDefID, teamID)
    if teamID == 0 then
        Spring.GiveOrderToUnit(unitID, CMD.MOVE_STATE, {0}, CMD.OPT_SHIFT)
    end
end

function gadget:UnitDestroyed(unitID, unitDefID)

    --pincer raid
    if unitID == unitIDs.pincer1 or unitID == unitIDs.pincer2 or unitID == unitIDs.pincer3 or unitID == unitIDs.pincer4 then
    pincersDead = pincersDead + 1
    if pincersDead == 4 then
    pincersDead = 0
    playVoiceline(soundfiles.sound4_G.name, 1, soundfiles.sound4_G.len)
    spawnUnitTable({
        "minetrans1",
        "minetrans2",
        "minelayer1",
        "minelayer2",
    })
    Spring.UnitAttach(unitIDs.minetrans1, unitIDs.minelayer1, 0)
    Spring.UnitAttach(unitIDs.minetrans2, unitIDs.minelayer2, 0)
    scenarioHint = "Minelayers build cloaked mines which automatically detonate on approaching enemies."
    giveScenarioHint()
    end
    end
end

function gadget:AllowCommand(unitID, unitDefID, unitTeam, cmdID, cmdParams, cmdOptions, cmdTag, synced)
    if disableCommander then
    if getNameFromID(unitID) == "corcom" then return false end
    end
    return true
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
    if getNameFromID(unitID) == "cormex" or getNameFromID(unitID) == "corexp" then
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

    --transfer beholders
    if unitTeam == 1 and getNameFromID(unitID) == "coreyes" then
    Spring.TransferUnit(unitID, 0, true)
    end
end

function gadget:UnitLoaded(unitID, unitDefID, unitTeam, transportID, transportTeam)

    --stage 5_A
    if stages.stage5_A then
    if unitID == unitIDs.corcom then
    setStage("stage5_B")
    playVoiceline(soundfiles.sound5_B.name, 1, soundfiles.sound5_B.len)
    stageDelayTarget = Spring.GetGameFrame() + soundfiles.sound5_B.len + 30
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
    "researchstation",
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

        --stage3_A
        if stages.stage3_A then
        local researchStationEnteredCheck = Spring.GetUnitsInCylinder(6900, 2035, 400, 0)
        if researchStationEnteredCheck and #researchStationEnteredCheck>0 then
        setStage("stage3_G")
        playVoiceline(soundfiles.sound3_G.name, 1, soundfiles.sound3_G.len)
        currentObjective = "Bring your commander to the research station once you’re ready to defend against the Armada forces."
        updateStageUI()
        updateObjectiveUI()
        end
        end

        --stage3_G
        if stages.stage3_G then
        local researchStationComEnteredCheck = Spring.GetUnitsInCylinder(6900, 2035, 200, 0)
        if researchStationComEnteredCheck and #researchStationComEnteredCheck>0 then
        for _, unitID in pairs(researchStationComEnteredCheck) do
            if getNameFromID(unitID) == "corcom" then
            setStage("stage4_A")
            Spring.GiveOrderToUnit(unitID, CMD.RECLAIM, unitIDs.researchstation, {})
            disableCommander = true
            enableAI2()
            startTimer(27000)
            playVoiceline(soundfiles.sound4_A.name, 1, soundfiles.sound4_A.len)
            currentObjective = "Defend for 15 minutes"
            updateStageUI()
            updateObjectiveUI()
            end
        end
        end
        end

        --stage5_B
        if stages.stage5_B then
        if stageDelayTarget and Spring.GetGameFrame() >= stageDelayTarget then
        setStage("gameover")
        Spring.GameOver({0})
        stageDelayTarget = nil
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
        local lakeMexFoundCheck = Spring.GetUnitsInRectangle(2733, 0, 4458, 1865, 0)
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
            if x > 5235 and z < 7600 and z > 3900 and ((x2 - x1)*(z - z1) - (z2 - z1)*(x - x1)) > 0 then --math to find out if a point is to one side of a line between two known points
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

        if not highgroundFound then
        local highgroundFoundCheck = Spring.GetUnitsInRectangle(7227, 6576, 7700, 7600, 0)
        if highgroundFoundCheck and #highgroundFoundCheck>0 then
        playVoiceline(soundfiles.sound3_D.name, 1, soundfiles.sound3_D.len)
        moveCamera(8000, 7000)
        Spring.MarkerAddPoint(9200, 28, 7000, "Enemy Base")
        highgroundFound = true
        end
        end

        if not richMexFound then
        local richMexFoundCheck = Spring.GetUnitsInRectangle(6400, 4400, 7000, 6300, 0)
        if richMexFoundCheck and #richMexFoundCheck>0 then
        playVoiceline(soundfiles.sound3_E.name, 1, soundfiles.sound3_E.len)
        scenarioHint = "Prepare to defend this line once the Armada forces are aware of your position."
        Spring.MarkerAddPoint(6740, 145, 4611, "High Value Mex")
        Spring.MarkerAddPoint(6666, 155, 4896, "High Value Mex")
        Spring.MarkerAddPoint(6782, 188, 5312, "High Value Mex")
        Spring.MarkerAddPoint(6782, 190, 5666, "High Value Mex")
        Spring.MarkerAddPoint(6782, 200, 6000, "High Value Mex")
        giveScenarioHint()
        richMexFound = true
        end
        end

        if not richMexBuilt then
        local richMexBuiltCheck = Spring.GetUnitsInRectangle(6400, 4400, 7000, 6300, 0)
        if richMexBuiltCheck then
        local mexCount = 0
        for _, unitID in pairs(richMexBuiltCheck) do
            if getNameFromID(unitID) == "cormex" or getNameFromID(unitID) == "corexp" then
            mexCount = mexCount + 1
            end
        end
        if mexCount > 4 then
        playVoiceline(soundfiles.sound3_E2.name, 1, soundfiles.sound3_E2.len)
        spawnUnitTable({
            "porctrans1",
            "porctrans2",
            "porctrans3",
            "porctrans4",
            "porctrans5",
            "porctrans6",
            "porcllt1",
            "porcllt2",
            "porcllt3",
            "porchllt1",
            "porchllt2",
            "porchllt3",
        })
        Spring.UnitAttach(unitIDs.porctrans1, unitIDs.porcllt1, 0)
        Spring.UnitAttach(unitIDs.porctrans2, unitIDs.porcllt2, 0)
        Spring.UnitAttach(unitIDs.porctrans3, unitIDs.porcllt3, 0)
        Spring.UnitAttach(unitIDs.porctrans4, unitIDs.porchllt1, 0)
        Spring.UnitAttach(unitIDs.porctrans5, unitIDs.porchllt2, 0)
        Spring.UnitAttach(unitIDs.porctrans6, unitIDs.porchllt3, 0)
        richMexBuilt = true
        end
        end
        end

        if not researchStationApproached then
        local researchStationApproachedCheck = Spring.GetUnitsInCylinder(6522, 1985, 1400, 0)
        if researchStationApproachedCheck and #researchStationApproachedCheck>0 then
        playVoiceline(soundfiles.sound3_F.name, 1, soundfiles.sound3_F.len)
        scenarioHint = "Weapons with impulse will slowdown or knockback, depending on the mass of the target."
        spawnUnitTable({
            "impulsetrans1",
            "impulsetrans2",
            "impulsetrans3",
            "impulsetrans4",
            "impulsepounder1",
            "impulsepounder2",
            "impulsepounder3",
            "impulsepounder4",
        })
        Spring.UnitAttach(unitIDs.impulsetrans1, unitIDs.impulsepounder1, 0)
        Spring.UnitAttach(unitIDs.impulsetrans2, unitIDs.impulsepounder2, 0)
        Spring.UnitAttach(unitIDs.impulsetrans3, unitIDs.impulsepounder3, 0)
        Spring.UnitAttach(unitIDs.impulsetrans4, unitIDs.impulsepounder4, 0)
        giveScenarioHint()
        moveCamera(5200, "0500")
        researchStationApproached = true
        end
        end


        --delete allied air
        local airToClearCheck = Spring.GetUnitsInRectangle(0, 7900, 1000, 8200, 1)
        if airToClearCheck and #airToClearCheck > 0 then
        for _, airID in pairs(airToClearCheck) do
            if airID ~= unitIDs.initialtrans or not stages.stage1_A then
            Spring.DestroyUnit(airID, false, true)
            end
        end
        end

    end

    --timed defence section
    if timer then
        local currentTime = Spring.GetGameFrame()
        local function remainingTime(targetTime) return timer - currentTime == targetTime end

        --stage4_A
        if remainingTime(14.8 * 60 * 30) then
        setStage("stage4_B")
        playVoiceline(soundfiles.sound4_B.name, 1, soundfiles.sound4_B.len)
        spawnUnitTable({
            "cameracon1",
            "cameracon2",
        })
        scenarioHint = "Beholders are cameras that cloak for 15 energy/second."
        giveScenarioHint()
        updateStageUI()
        updateObjectiveUI()
        end

        --stage4_B
        if remainingTime(14 * 60 * 30) then
        setStage("stage4_C")
        playVoiceline(soundfiles.sound4_C.name, 1, soundfiles.sound4_C.len)
        scenarioHint = "Border build by queuing a building and holding Ctrl+Alt+Shift while mousing over an existing structure."
        giveScenarioHint()
        updateStageUI()
        end

        --stage4_C
        if remainingTime(13 * 60 * 30) then
        setStage("stage4_D")
        playVoiceline(soundfiles.sound4_D.name, 1, soundfiles.sound4_D.len)
        scenarioHint = "Press “Ctrl + T” to toggle the Map overview"
        giveScenarioHint()
        updateStageUI()
        end

        --stage4_D
        if remainingTime(12 * 60 * 30) then
        setStage("stage4_E")
        playVoiceline(soundfiles.sound4_E.name, 1, soundfiles.sound4_E.len)
        scenarioHint = "You can alter existing queues (Commands Connect with “Shift”):\n”Shift + Spacebar”: Adds Command to front of Queue\n”N”: Skips to next command in queue\n”Ctrl + N”: Removes last command in queue."
        giveScenarioHint()
        updateStageUI()
        end

        --stage4_E
        if remainingTime(11 * 60 * 30) then
        setStage("stage4_F")
        playVoiceline(soundfiles.sound4_F.name, 1, soundfiles.sound4_F.len)
        spawnUnitTable({
            "pincer1",
            "pincer2",
            "pincer3",
            "pincer4",
        })
        moveCamera(9336, "0357")
        scenarioHint = "Amphibious units like Pincers can traverse steeper slopes, and travel water to attack unprotected locations."
        giveScenarioHint()
        updateStageUI()
        end

        --stage4_F
        if remainingTime(10 * 60 * 30) then
        setStage("stage4_H")
        playVoiceline(soundfiles.sound4_H.name, 1, soundfiles.sound4_H.len)
        updateStageUI()
        end

        --stage4_H
        if remainingTime(9 * 60 * 30) then
        setStage("stage4_I")
        playVoiceline(soundfiles.sound4_I.name, 1, soundfiles.sound4_I.len)
        spawnUnitTable({
            "airscout1",
            "airscout2",
            "airscout3",
        })
        scenarioHint = "Unlike their bot anti-air counterparts, lashers can dumbfire their missile at ground targets."
        giveScenarioHint()
        updateStageUI()
        end

        --stage4_I
        if remainingTime(8 * 60 * 30) then
        setStage("stage4_J")
        playVoiceline(soundfiles.sound4_J.name, 1, soundfiles.sound4_J.len)
        spawnUnitTable({
            "webber1",
            "webber2",
            "webber3",
            "webber4",
            "webber5",
        })
        scenarioHint = "Energy storages are a great way to minimize the effects of lower wind speeds to smooth out your economy."
        giveScenarioHint()
        updateStageUI()
        end

        --stage4_J
        if remainingTime(7 * 60 * 30) then
        setStage("stage4_K")
        playVoiceline(soundfiles.sound4_K.name, 1, soundfiles.sound4_K.len)
        scenarioHint = "All-Terrain units like Webbers can navigate all ground."
        giveScenarioHint()
        updateStageUI()
        end
        
        --stage4_K
        if remainingTime(5 * 60 * 30) then
        setStage("stage4_L")
        playVoiceline(soundfiles.sound4_L.name, 1, soundfiles.sound4_L.len)
        updateStageUI()
        end

        --stage4_L
        if remainingTime(4 * 60 * 30) then
        spawnUnitTable({
            "turtle1",
            "turtle2",
        })
        end
        if remainingTime(3 * 60 * 30) then
        setStage("stage4_M")
        playVoiceline(soundfiles.sound4_M.name, 1, soundfiles.sound4_M.len)
        updateStageUI()
        end

        --stage4_M
        if remainingTime(0) then
        disableCommander = false
        setStage("stage5_A")
        playVoiceline(soundfiles.sound5_A.name, 1, soundfiles.sound5_A.len)
        scenarioHint = "You can select all units with Hotkey “Control + E” to issue orders to all units under your control."
        currentObjective = "Escape to the rally point with as many units as possible."
        Spring.MarkerAddPoint(5300, 24, 300, "Escape Point")
        spawnUnit(units.finaltrans, "finaltrans")
        Spring.GiveOrderToUnit(unitIDs.finaltrans, CMD.LOAD_UNITS, unitIDs.corcom, CMD.OPT_SHIFT)
        Spring.GiveOrderToUnit(unitIDs.finaltrans, CMD.MOVE, {5300, 200, 300}, CMD.OPT_SHIFT)
        Spring.GiveOrderToUnit(unitIDs.corcom, CMD.STOP, {}, {})
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