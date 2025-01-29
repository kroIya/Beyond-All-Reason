if not gadgetHandler:IsSyncedCode() then
	return
end

local stages = {
    stage1_A = false,
    stage1_B = false,
    stage1_C = false,
    stage1_D = false,
    stage1_E = false,
    stage1_F = false,
    stage1_G = false,
    stage2_A = false,
    stage2_B = false,
    stage2_B2 = false,
    stage2_C = false,
    stage2_D = false,
    stage2_E = false,
    stage3_A = false,
    stage3_B = false,
    stage3_B2 = false,
    stage3_C = false,
    stage3_D = false,
    stage3_D2 = false,
    stage3_E = false,
    stage3_E2 = false,
    stage4_A = false,
    stage4_B = false,
    stage4_C = false,
    stage4_D = false,
    stage5_A = false,
    stage5_B = false,
    stage5_C = false,
    stage5_D = false,
    stage5_E = false,
}


local triggers = {
-- never meant to be
}

local soundfiles = {
    sound1_A = {name = "sounds/tutorial/TM0_VoiceLines/TM0_1-A.mp3", len = 480},
    sound1_B = {name = "sounds/tutorial/TM0_VoiceLines/TM0_1-B.mp3", len = 270},
    sound1_C = {name = "sounds/tutorial/TM0_VoiceLines/TM0_1-C.mp3", len = 180},
    sound1_D = {name = "sounds/tutorial/TM0_VoiceLines/TM0_1-D.mp3", len = 210},
    sound1_E = {name = "sounds/tutorial/TM0_VoiceLines/TM0_1-E.mp3", len = 240},
    sound1_F = {name = "sounds/tutorial/TM0_VoiceLines/TM0_1-F.mp3", len = 210},
    sound1_G = {name = "sounds/tutorial/TM0_VoiceLines/TM0_1-G.mp3", len = 270},
    sound2_A = {name = "sounds/tutorial/TM0_VoiceLines/TM0_2-A.mp3", len = 180},
    sound2_B = {name = "sounds/tutorial/TM0_VoiceLines/TM0_2-B.mp3", len = 120},
    sound2_B2 = {name = "sounds/tutorial/TM0_VoiceLines/TM0_2-B2.mp3", len = 120},
    sound2_C = {name = "sounds/tutorial/TM0_VoiceLines/TM0_2-C.mp3", len = 300},
    sound2_D = {name = "sounds/tutorial/TM0_VoiceLines/TM0_2-D.mp3", len = 180},
    sound2_E = {name = "sounds/tutorial/TM0_VoiceLines/TM0_2-E.mp3", len = 360},
    sound3_A = {name = "sounds/tutorial/TM0_VoiceLines/TM0_3-A.mp3", len = 240},
    sound3_B = {name = "sounds/tutorial/TM0_VoiceLines/TM0_3-B.mp3", len = 180},
    sound3_B2 = {name = "sounds/tutorial/TM0_VoiceLines/TM0_3-B2.mp3", len = 180},
    sound3_C = {name = "sounds/tutorial/TM0_VoiceLines/TM0_3-C.mp3", len = 120},
    sound3_D = {name = "sounds/tutorial/TM0_VoiceLines/TM0_3-D.mp3", len = 360},
    sound3_E = {name = "sounds/tutorial/TM0_VoiceLines/TM0_3-E.mp3", len = 150},
    sound4_A = {name = "sounds/tutorial/TM0_VoiceLines/TM0_4-A.mp3", len = 150},
    sound4_B = {name = "sounds/tutorial/TM0_VoiceLines/TM0_4-B.mp3", len = 210},
    sound4_C = {name = "sounds/tutorial/TM0_VoiceLines/TM0_4-C.mp3", len = 180},
    sound4_D = {name = "sounds/tutorial/TM0_VoiceLines/TM0_4-D.mp3", len = 240},
    sound5_A = {name = "sounds/tutorial/TM0_VoiceLines/TM0_5-A.mp3", len = 360},
    sound5_B = {name = "sounds/tutorial/TM0_VoiceLines/TM0_5-B.mp3", len = 210},
    sound5_C = {name = "sounds/tutorial/TM0_VoiceLines/TM0_5-C.mp3", len = 240},
    sound5_D = {name = "sounds/tutorial/TM0_VoiceLines/TM0_5-D.mp3", len = 360},
    sound5_E = {name = "sounds/tutorial/TM0_VoiceLines/TM0_5-E.mp3", len = 720},
}

local currentObjective
local scenarioHint
local stageDelayTarget
local voiceQueue = {}
local voicePlayingDelay
local camHeight
local camHeightNew
local selectedUnits = {}
local groupNumber = 0
local delayDollyActivation
local dollyDuration

--flags
local respawnGrunts
local deadGruntCounter = 0
local deadActuatorGrunts = 0
local deadGauntletEnemies = 0
local enableReinforcements
local autogroupPassed
local deadAegisEnemies = 0

local unitIDs = {}

local units = { --rotation is bs and the one dumped by luarules is meaningless; s0 e1 n2 w3
    component1 = {name = 'commandercomponent', x = 810, y = 179, z = 4463, rot = 0 , teamID = 5, neutral = true},
    component2 = {name = 'commandercomponent', x = 760, y = 177, z = 2713, rot = 0 , teamID = 4, neutral = true},
    component3 = {name = 'commandercomponent', x = 2898, y = 177, z = 3086, rot = 0 , teamID = 4, neutral = true},
    component4 = {name = 'commandercomponent', x = 4305, y = 175, z = 2077, rot = 0 , teamID = 5, neutral = true},
    initialgrunt1 = {name = 'corak', x = 3158, y = 168, z = 4815, rot = 2 , teamID = 0, neutral = false},
    initialgrunt2 = {name = 'corak', x = 3235, y = 168, z = 4773, rot = 2 , teamID = 0, neutral = false},
    initialgrunt3 = {name = 'corak', x = 3228, y = 170, z = 4837, rot = 2 , teamID = 0, neutral = false},
    initialgrunt4 = {name = 'corak', x = 3143, y = 168, z = 4877, rot = 2 , teamID = 0, neutral = false},
    initialgrunt5 = {name = 'corak', x = 3300, y = 168, z = 4797, rot = 2 , teamID = 0, neutral = false},
    persecutorprop1 = {name = 'cortoast', x = 2759, y = 345, z = 5022, rot = 2 , teamID = 2, neutral = false, queue = {{cmdID = CMD.FIRE_STATE, state = 0}}},
    persecutorprop2 = {name = 'cortoast', x = 2582, y = 345, z = 4945, rot = 2 , teamID = 2, neutral = false, queue = {{cmdID = CMD.FIRE_STATE, state = 0}}},
    vision1_F = {name = 'coreyes', x = 2350, y = 177, z = 4500, rot = 2 , teamID = 0, neutral = true},
    skirmishgrunt1 = {name = 'corak', x = 2296, y = 177, z = 4183, rot = 2053 , teamID = 3, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 2300, py = 175, pz = 4444}}}},
    skirmishgrunt2 = {name = 'corak', x = 2330, y = 175, z = 4188, rot = -1281 , teamID = 3, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 2300, py = 175, pz = 4444}}}},
    skirmishgrunt3 = {name = 'corak', x = 2366, y = 175, z = 4192, rot = -3640 , teamID = 3, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 2300, py = 175, pz = 4444}}}},
    skirmishgrunt4 = {name = 'corak', x = 2431, y = 175, z = 4218, rot = -6999 , teamID = 3, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 2300, py = 175, pz = 4444}}}},
    skirmishgrunt5 = {name = 'corak', x = 2398, y = 177, z = 4208, rot = -5595 , teamID = 3, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 2300, py = 175, pz = 4444}}}},
    skirmishgrunt6 = {name = 'corak', x = 2122, y = 172, z = 4629, rot = 21637 , teamID = 4, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 2300, py = 175, pz = 4444}}}},
    skirmishgrunt7 = {name = 'corak', x = 2196, y = 177, z = 4674, rot = 28126 , teamID = 4, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 2300, py = 175, pz = 4444}}}},
    skirmishgrunt8 = {name = 'corak', x = 2228, y = 181, z = 4698, rot = 25567 , teamID = 4, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 2300, py = 175, pz = 4444}}}},
    skirmishgrunt9 = {name = 'corak', x = 2163, y = 174, z = 4651, rot = 31265 , teamID = 4, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 2300, py = 175, pz = 4444}}}},
    skirmishgrunt10 = {name = 'corak', x = 2263, y = 195, z = 4718, rot = 23466 , teamID = 4, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 2300, py = 175, pz = 4444}}}},
    nuke1 = {name = 'nuketest', x = 32, y = 372, z = 3506, rot = 2 , teamID = 2, neutral = false},
    threegrunt1 = {name = 'corak', x = 1408, y = 175, z = 4167, rot = 1 , teamID = 0, neutral = false},
    threegrunt2 = {name = 'corak', x = 1492, y = 175, z = 4095, rot = 1 , teamID = 0, neutral = false},
    threegrunt3 = {name = 'corak', x = 1324, y = 160, z = 4236, rot = 1 , teamID = 0, neutral = false},
    actuatorgrunt1 = {name = 'corak', x = 824, y = 173, z = 4532, rot = 9545 , teamID = 5, neutral = false, queue = {{cmdID = CMD.MOVE_STATE, state = 0}}},
    actuatorgrunt2 = {name = 'corak', x = 879, y = 177, z = 4436, rot = 12929 , teamID = 5, neutral = false, queue = {{cmdID = CMD.MOVE_STATE, state = 0}}},
    actuatorreinforcement1 = {name = 'corak', x = 135, y = 345, z = 4652, rot = 2 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 653, py = 175, pz = 4190}}}},
    actuatorreinforcement2 = {name = 'corak', x = 213, y = 344, z = 4708, rot = 2 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 703, py = 174, pz = 4215}}}},
    actuatorreinforcement3 = {name = 'corak', x = 293, y = 342, z = 4765, rot = 2 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 801, py = 175, pz = 4274}}}},
    actuatorreinforcement4 = {name = 'corak', x = 378, y = 339, z = 4822, rot = 2 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 749, py = 175, pz = 4251}}}},
    actuatorreinforcement5 = {name = 'corak', x = 458, y = 339, z = 4876, rot = 2 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 844, py = 175, pz = 4305}}}},
    actuatorreinforcement6 = {name = 'corgator', x = 186, y = 345, z = 4795, rot = 2 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 654, py = 172, pz = 4301}}}},
    actuatorreinforcement7 = {name = 'corgator', x = 326, y = 345, z = 4860, rot = 2 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 739, py = 175, pz = 4362}}}},
    actuatorreinforcement8 = {name = 'corgator', x = 266, y = 345, z = 4830, rot = 2 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 690, py = 175, pz = 4332}}}},
    vision3_B2 = {name = 'coreyes', x = 1585, y = 158, z = 3618, rot = 2 , teamID = 0, neutral = true},
    bomber1 = {name = 'corhurc', x = 50, y = 300, z = 3600, rot = 1 , teamID = 2, neutral = false, queue = {{cmdID = CMD.ATTACK, position = {px = 1600, py = 150, pz = 3600}}}},
    bomber2 = {name = 'corhurc', x = 50, y = 300, z = 3700, rot = 1 , teamID = 2, neutral = false, queue = {{cmdID = CMD.ATTACK, position = {px = 1600, py = 150, pz = 3600}}}},
    bomber3 = {name = 'corhurc', x = 50, y = 300, z = 3800, rot = 1 , teamID = 2, neutral = false, queue = {{cmdID = CMD.ATTACK, position = {px = 1600, py = 150, pz = 3600}}}},
    bomber4 = {name = 'corhurc', x = 50, y = 300, z = 3900, rot = 1 , teamID = 2, neutral = false, queue = {{cmdID = CMD.ATTACK, position = {px = 1600, py = 150, pz = 3600}}}},
    bomber5 = {name = 'corhurc', x = 50, y = 300, z = 4000, rot = 1 , teamID = 2, neutral = false, queue = {{cmdID = CMD.ATTACK, position = {px = 1600, py = 150, pz = 3600}}}},
    gauntletenemy1 = {name = 'corfav', x = 669, y = 171, z = 2796, rot = 5556 , teamID = 4, neutral = false},
    gauntletenemy2 = {name = 'corfav', x = 778, y = 179, z = 2764, rot = 1696 , teamID = 4, neutral = false},
    gauntletenemy3 = {name = 'corfav', x = 724, y = 175, z = 2783, rot = 3302 , teamID = 4, neutral = false},
    gauntletenemy4 = {name = 'corfav', x = 822, y = 177, z = 2744, rot = 7152 , teamID = 4, neutral = false},
    gauntletenemy5 = {name = 'corak', x = 738, y = 176, z = 2838, rot = 3216 , teamID = 4, neutral = false},
    gauntletenemy6 = {name = 'corak', x = 846, y = 177, z = 2801, rot = 3243 , teamID = 4, neutral = false},
    gauntletenemy7 = {name = 'corak', x = 893, y = 173, z = 2787, rot = 2497 , teamID = 4, neutral = false},
    gauntletenemy8 = {name = 'corak', x = 683, y = 174, z = 2853, rot = 1791 , teamID = 4, neutral = false},
    gauntletenemy9 = {name = 'corak', x = 794, y = 180, z = 2824, rot = 2050 , teamID = 4, neutral = false},
    corlab = {name = 'corlab', x = 897, y = 175, z = 2305, rot = 0 , teamID = 1, neutral = false},
    corvp = {name = 'corvp', x = 578, y = 181, z = 2291, rot = 0 , teamID = 1, neutral = false},
    corhlt = {name = 'corhlt', x = 743, y = 174, z = 2223, rot = 0 , teamID = 1, neutral = false},
    reinforcementgrunt1 = {name = 'corak', x = 862, y = 175, z = 2386, rot = 0 , teamID = 0, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 938, py = 172, pz = 2528}}}},
    reinforcementgrunt2 = {name = 'corak', x = 937, y = 175, z = 2385, rot = 0 , teamID = 0, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 898, py = 172, pz = 2528}}}},
    reinforcementincisor = {name = 'corgator', x = 586, y = 182, z = 2369, rot = 0 , teamID = 0, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 918, py = 172, pz = 2628}}}},
    rover1 = {name = 'corfav', x = 490, y = 207, z = 2398, rot = 0 , teamID = 0, neutral = false},
    rover2 = {name = 'corfav', x = 593, y = 180, z = 2400, rot = 0 , teamID = 0, neutral = false},
    rover3 = {name = 'corfav', x = 626, y = 176, z = 2405, rot = 0 , teamID = 0, neutral = false},
    rover4 = {name = 'corfav', x = 524, y = 201, z = 2404, rot = 0 , teamID = 0, neutral = false},
    rover5 = {name = 'corfav', x = 557, y = 191, z = 2399, rot = 0 , teamID = 0, neutral = false},
    minegrunt1 = {name = 'corak', x = 1924, y = 173, z = 2872, rot = 0 , teamID = 3, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 1624, py = 173, pz = 2872}}}},
    minegrunt2 = {name = 'corak', x = 1924, y = 175, z = 2904, rot = 0 , teamID = 3, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 1624, py = 173, pz = 2904}}}},
    minegrunt3 = {name = 'corak', x = 1924, y = 175, z = 2936, rot = 0 , teamID = 3, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 1624, py = 173, pz = 2936}}}},
    minegrunt4 = {name = 'corak', x = 1924, y = 175, z = 2968, rot = 0 , teamID = 3, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 1624, py = 173, pz = 2968}}}},
    minegrunt5 = {name = 'corak', x = 1924, y = 175, z = 3000, rot = 0 , teamID = 3, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 1624, py = 173, pz = 3000}}}},
    minegrunt6 = {name = 'corak', x = 1924, y = 174, z = 3032, rot = 0 , teamID = 3, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 1624, py = 173, pz = 3032}}}},
    minegrunt7 = {name = 'corak', x = 1924, y = 175, z = 3064, rot = 0 , teamID = 3, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 1624, py = 173, pz = 3064}}}},
    minegrunt8 = {name = 'corak', x = 1924, y = 175, z = 3096, rot = 0 , teamID = 3, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 1624, py = 173, pz = 3096}}}},
    minegrunt9 = {name = 'corak', x = 1924, y = 175, z = 3128, rot = 0 , teamID = 3, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 1624, py = 173, pz = 3128}}}},
    vision4_A = {name = 'coreyes', x = 1888, y = 175, z = 3000, rot = 2 , teamID = 0, neutral = true},
    aegisenemy1 = {name = 'corak', x = 2870, y = 173, z = 2888, rot = 3 , teamID = 4, neutral = false},
    aegisenemy2 = {name = 'corak', x = 2828, y = 177, z = 3019, rot = 3 , teamID = 4, neutral = false},
    aegisenemy3 = {name = 'corak', x = 2847, y = 172, z = 2954, rot = 3 , teamID = 4, neutral = false},
    aegisenemy4 = {name = 'corak', x = 2970, y = 171, z = 3227, rot = 3 , teamID = 4, neutral = false},
    aegisenemy5 = {name = 'corak', x = 2919, y = 175, z = 3186, rot = 3 , teamID = 4, neutral = false},
    aegisenemy6 = {name = 'corak', x = 2869, y = 177, z = 3143, rot = 3 , teamID = 4, neutral = false},
    aegisenemy7 = {name = 'corgarp', x = 2838, y = 179, z = 3079, rot = 3 , teamID = 4, neutral = false},
    aegisenemy8 = {name = 'cormist', x = 2905, y = 173, z = 2982, rot = 3 , teamID = 4, neutral = false},
    aegisenemy9 = {name = 'cormist', x = 2967, y = 173, z = 3132, rot = 3 , teamID = 4, neutral = false},
    aegisenemy10 = {name = 'corwolv', x = 2965, y = 173, z = 3044, rot = 3 , teamID = 4, neutral = false},
    repaircon1 = {name = 'corck', x = 3184, y = 179, z = 3241, rot = 30309 , teamID = 0, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 2905, py = 175, pz = 3096}}}},
    repaircon2 = {name = 'corck', x = 3257, y = 181, z = 3263, rot = 1856 , teamID = 0, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 2817, py = 179, pz = 3081}}}},
    repaircon3 = {name = 'corck', x = 3277, y = 179, z = 3185, rot = 5268 , teamID = 0, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 2901, py = 174, pz = 3023}}}},
    repaircon4 = {name = 'corck', x = 3203, y = 179, z = 3283, rot = 391 , teamID = 0, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 2851, py = 179, pz = 3133}}}},
    repaircon5 = {name = 'corck', x = 3221, y = 179, z = 3207, rot = -2832 , teamID = 0, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 2822, py = 177, pz = 3022}}}},
    repaircon6 = {name = 'corck', x = 3296, y = 183, z = 3226, rot = 8609 , teamID = 0, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 2853, py = 178, pz = 3052}}}},
    airDropTrans1 = {name = 'corseah', x = 4695, y = 371, z = 3268, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 4098, py = 175, pz = 2715}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 4098, py = 175, pz = 2715}}, {cmdID = CMD.MOVE, position = {px = 5100, py = 173, pz = 2715}}}},
    airDropTrans2 = {name = 'corseah', x = 4614, y = 373, z = 3347, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 4098, py = 175, pz = 2715}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 3998, py = 175, pz = 2815}}, {cmdID = CMD.MOVE, position = {px = 5100, py = 173, pz = 2815}}}},
    airDropTrans3 = {name = 'corseah', x = 4769, y = 372, z = 3351, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 4098, py = 175, pz = 2715}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 4198, py = 175, pz = 2815}}, {cmdID = CMD.MOVE, position = {px = 5100, py = 173, pz = 2815}}}},
    airDropTrans4 = {name = 'corseah', x = 4618, y = 376, z = 3469, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 4098, py = 175, pz = 2715}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 3998, py = 175, pz = 2915}}, {cmdID = CMD.MOVE, position = {px = 5100, py = 173, pz = 2915}}}},
    airDropTrans5 = {name = 'corseah', x = 4746, y = 368, z = 3474, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 4098, py = 175, pz = 2715}}, {cmdID = CMD.UNLOAD_UNITS, position = {px = 4198, py = 175, pz = 2915}}, {cmdID = CMD.MOVE, position = {px = 5100, py = 173, pz = 2915}}}},  
    airDropPounder1 = {name = 'corlevlr', x = 4695, y = 351, z = 3268, rot = 0 , teamID = 0, neutral = false},
    airDropPounder2 = {name = 'corlevlr', x = 4614, y = 353, z = 3347, rot = 0 , teamID = 0, neutral = false},
    airDropPounder3 = {name = 'corlevlr', x = 4769, y = 352, z = 3351, rot = 0 , teamID = 0, neutral = false},
    airDropHalberd1 = {name = 'corhal', x = 4618, y = 356, z = 3469, rot = 0 , teamID = 0, neutral = false},
    airDropHalberd2 = {name = 'corhal', x = 4746, y = 358, z = 3474, rot = 0 , teamID = 0, neutral = false},
    vision5_C = {name = 'coreyes', x = 4289, y = 174, z = 2290, rot = 2 , teamID = 0, neutral = true},
    nuke2 = {name = 'nuketest', x = 1296, y = 177, z = 1087, rot = 2 , teamID = 2, neutral = false},    
    nuke3 = {name = 'nuketest', x = 396, y = 177, z = 500, rot = 2 , teamID = 2, neutral = false},
    nuke4 = {name = 'nuketest', x = 1355, y = 200, z = 176, rot = 2 , teamID = 2, neutral = false},
    nuke5 = {name = 'nuketest', x = 2615, y = 55, z = 1527, rot = 2 , teamID = 2, neutral = false},
    endTrans1 = {name = 'corseah', x = 5084, y = 339, z = 1282, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 2763, py = 175, pz = 3112}}}},
    endTrans2 = {name = 'corseah', x = 5086, y = 332, z = 1409, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 793, py = 175, pz = 2826}}}},
    endTrans3 = {name = 'corseah', x = 5085, y = 345, z = 1545, rot = 0 , teamID = 1, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 804, py = 175, pz = 4451}}}},
    corcom = {name = 'corcom', x = 4177, y = 177, z = 766, rot = 0 , teamID = 0, neutral = false},
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

--I can't get this to work
--[[local function dollyCam(curve, duration)
    Spring.SendLuaUIMsg("SaveCamera")
    Spring.SetConfigString("CamModeName", "dolly")
    Spring.SetDollyCameraCurve(3, curve, { 0, 0, 0, 0, .5, 1, 1, 1, 1 })
    Spring.RunDollyCamera(duration)
end]]

--set units to hold position
function gadget:MetaUnitAdded(unitID, unitDefID, teamID)
    if teamID == 0 then
        Spring.GiveOrderToUnit(unitID, CMD.MOVE_STATE, {0}, CMD.OPT_SHIFT)
    end
end

function gadget:RecvLuaMsg(msg, playerID)

    if msg:find("camHeight|") then
    if not camHeight then
        camHeight = tonumber(msg:sub(11))
    else
        camHeightNew = tonumber(msg:sub(11))
    end
    end

    if msg:find("SelectedUnit|") then
        local digitNum = msg:sub(14, 14)
        local i = tonumber(msg:sub(15, 14+digitNum))
        selectedUnits[i] = tonumber(msg:sub(15+digitNum))
    end

    if msg:find("GroupCount|") then
        groupNumber = tonumber(msg:sub(12))
    end

    if msg:find("AutogroupCheckPassed") then
        autogroupPassed = true
    end
end

function gadget:UnitDestroyed(unitID, unitDefID)
    
    --respawn dead grunts
    if respawnGrunts then
    for i = 1, 5 do
    if unitID and unitID == unitIDs["initialgrunt"..tostring(i)] then
        local x, y, z = Spring.GetUnitPosition(unitID)
        spawnUnit(units["initialgrunt"..tostring(i)], "initialgrunt"..tostring(i))
        Spring.GiveOrderToUnit(unitIDs["initialgrunt"..tostring(i)], CMD.MOVE, {x, y, z}, {})
    end
    end
    end

    --stage1_F
    if stages.stage1_F then
    if unitID == unitIDs.skirmishgrunt1 or unitID == unitIDs.skirmishgrunt2 or unitID == unitIDs.skirmishgrunt3 or unitID == unitIDs.skirmishgrunt4 or unitID == unitIDs.skirmishgrunt5 or unitID == unitIDs.skirmishgrunt6 or unitID == unitIDs.skirmishgrunt7 or unitID == unitIDs.skirmishgrunt8 or unitID == unitIDs.skirmishgrunt9 or unitID == unitIDs.skirmishgrunt10 then
    deadGruntCounter = deadGruntCounter + 1
    if deadGruntCounter == 10 then
    setStage("stage1_G")
    playVoiceline(soundfiles.sound1_G.name, 1, soundfiles.sound1_G.len)
    currentObjective = "Place your grunts behind each small wall segment in the gap just to the north. \nThis can easily be done with line drag."
    scenarioHint = "Distribute commands by using Line Drag. \nTo spread your grunts, select them, hold “right click” and drag a line. \nThe units will spread to equally distant points along the line."
    updateStageUI()
    updateObjectiveUI()
    giveScenarioHint()
    Spring.DestroyUnit(unitIDs.vision1_F, false, true)
    Spring.MarkerAddPoint(2256, 177, 4144)
    Spring.MarkerAddPoint(2320, 177, 4144)
    Spring.MarkerAddPoint(2384, 177, 4144)
    Spring.MarkerAddPoint(2448, 177, 4144)
    Spring.MarkerAddPoint(2512, 177, 4144)
    end
    end
    end

    --2_B voiceline
    if stages.stage2_B or stages.stage2_B2 then
    if unitID == unitIDs.nuke1 then
    playVoiceline(soundfiles.sound2_B.name, 1, soundfiles.sound2_B.len)
    end
    end

    --stage2_D
    if stages.stage2_D then
    if unitID == unitIDs.actuatorgrunt1 or unitID == unitIDs.actuatorgrunt2 then
    deadActuatorGrunts = deadActuatorGrunts + 1
    if deadActuatorGrunts == 2 then
    Spring.SendCommands("togglelos")
    Spring.SetDollyCameraCurve(3, {780.579651,740.087708,4240.3584,1,986.20343,582.756775,4458.72754,1,821.357666,521.41449,4807.66162,1,501.263458,705.304077,5024.17871,1,165.320999,445.317993,4944.28809,1}, {0, 0, 0, 0, .5, 1, 1, 1, 1})
    setStage("stage2_E")
    Spring.TransferUnit(unitIDs.component1, 0, false)
    playVoiceline(soundfiles.sound2_E.name, 1, soundfiles.sound2_E.len)
    spawnUnitTable({
        "actuatorreinforcement1",
        "actuatorreinforcement2",
        "actuatorreinforcement3",
        "actuatorreinforcement4",
        "actuatorreinforcement5",
        "actuatorreinforcement6",
        "actuatorreinforcement7",
        "actuatorreinforcement8",
    })
    Spring.SendCommands("clearmapmarks")
    Spring.SetConfigString("CamModeName", "dolly")
    Spring.SetDollyCameraLookUnit(unitIDs.actuatorreinforcement1)
    dollyDuration = 20000
    delayDollyActivation = Spring.GetGameFrame()
    currentObjective = "Collect your reinforcements."
    updateStageUI()
    updateObjectiveUI()
    end
    end
    end

    --3_B2 bombers
    if unitIDs.vision3_B2 and unitID == unitIDs.vision3_B2 then
        unitIDs.vision3_B2 = nil
        Spring.DestroyUnit(unitIDs.bomber1, false, true)
        Spring.DestroyUnit(unitIDs.bomber2, false, true)
        Spring.DestroyUnit(unitIDs.bomber3, false, true)
        Spring.DestroyUnit(unitIDs.bomber4, false, true)
        Spring.DestroyUnit(unitIDs.bomber5, false, true)
        Spring.SendCommands("togglelos")
        Spring.SendLuaUIMsg("RestoreCamera")
    end

    --stage3_C
    if stages.stage3_C then
    if unitID == unitIDs.gauntletenemy1 or unitID == unitIDs.gauntletenemy2 or unitID == unitIDs.gauntletenemy3 or unitID == unitIDs.gauntletenemy4 or unitID == unitIDs.gauntletenemy5 or unitID == unitIDs.gauntletenemy6 or unitID == unitIDs.gauntletenemy7 or unitID == unitIDs.gauntletenemy8 or unitID == unitIDs.gauntletenemy9 then
    deadGauntletEnemies = deadGauntletEnemies + 1
    if deadGauntletEnemies == 9 then
    setStage("stage3_D")
    Spring.TransferUnit(unitIDs.component2, 0, false)
    playVoiceline(soundfiles.sound3_D.name, 1, soundfiles.sound3_D.len)
    spawnUnitTable({
        "corlab",
        "corvp",
        "corhlt",
        "reinforcementgrunt1",
        "reinforcementgrunt2",
        "reinforcementincisor",
    })
    respawnGrunts = false
    enableReinforcements = Spring.GetGameFrame()
    Spring.SendCommands("clearmapmarks")
    currentObjective = "Create an auto group for your grunts by selecting a grunt and using “Alt + 1”."
    scenarioHint = "Autogroup your reinforcements using “Alt + 0-9”. \nAll units of the same type will automatically be added to that control group. \nRemove a unit type from an auto group using “ALT + ` ”"
    updateStageUI()
    updateObjectiveUI()
    giveScenarioHint()
    end
    end
    end

    --stage4_A
    if stages.stage4_A then
    if getNameFromID(unitID) == "cormine1" then
    Spring.SendCommands("setspeed 1")
    setStage("stage4_B")
    playVoiceline(soundfiles.sound4_B.name, 1, soundfiles.sound4_B.len)
    currentObjective = "Clear the mines by attacking the ground."
    scenarioHint = "The attack command can target units or the terrain (Hotkey “A”). \nUse “A” + “Right Click Drag” to line drag and systematically kill all of the mines."
    Spring.MarkerAddPoint(1560, 177, 2872)
    Spring.MarkerAddPoint(1560, 177, 2904)
    Spring.MarkerAddPoint(1560, 177, 2936)
    Spring.MarkerAddPoint(1560, 177, 2968)
    Spring.MarkerAddPoint(1560, 177, 3000)
    Spring.MarkerAddPoint(1560, 177, 3032)
    Spring.MarkerAddPoint(1560, 177, 3064)
    Spring.MarkerAddPoint(1560, 177, 3096)
    Spring.MarkerAddPoint(1560, 177, 3128)
    updateStageUI()
    updateObjectiveUI()
    giveScenarioHint()
    end
    end

    --stage4_B
    if stages.stage4_B then
    if getNameFromID(unitID) == "cormine1" then
    local npcUnits = Spring.GetTeamUnits(2)
    local mineCount = 0
    for _, npcUnitID in pairs(npcUnits) do
        if getNameFromID(npcUnitID) == "cormine1" then
        mineCount = mineCount + 1
        end
    end
    if mineCount < 4 then
    setStage("stage4_C")
    for _, npcUnitID in pairs(npcUnits) do
        if getNameFromID(npcUnitID) == "cormine1" then
            Spring.DestroyUnit(npcUnitID, false, true)
        end
    end
    Spring.DestroyUnit(unitIDs.vision4_A, false, true)
    spawnUnitTable({
        "aegisenemy1",
        "aegisenemy2",
        "aegisenemy3",
        "aegisenemy4",
        "aegisenemy5",
        "aegisenemy6",
        "aegisenemy7",
        "aegisenemy8",
        "aegisenemy9",
        "aegisenemy10",
    })
    playVoiceline(soundfiles.sound4_C.name, 1, soundfiles.sound4_C.len)
    Spring.SendCommands("clearmapmarks")
    Spring.MarkerAddPoint(2950, 173, 3000, "Next component")
    currentObjective = "Secure the next component."
    updateStageUI()
    updateObjectiveUI()
    end
    end
    end

    --stage4_C
    if stages.stage4_C then
    if unitID == unitIDs.aegisenemy1 or unitID == unitIDs.aegisenemy2 or unitID == unitIDs.aegisenemy3 or unitID == unitIDs.aegisenemy4 or unitID == unitIDs.aegisenemy5 or unitID == unitIDs.aegisenemy6 or unitID == unitIDs.aegisenemy7 or unitID == unitIDs.aegisenemy8 or unitID == unitIDs.aegisenemy9 or unitID == unitIDs.aegisenemy10 then
    deadAegisEnemies = deadAegisEnemies + 1
    if deadAegisEnemies == 10 then
    spawnUnitTable({
        "repaircon1",
        "repaircon2",
        "repaircon3",
        "repaircon4",
        "repaircon5",
        "repaircon6",
    })
    setStage("stage4_D")
    Spring.TransferUnit(unitIDs.component3, 0, false)
    playVoiceline(soundfiles.sound4_D.name, 1, soundfiles.sound4_D.len)
    Spring.SendCommands("clearmapmarks")
    currentObjective = "Repair all your units."
    scenarioHint = "The construction bots can repair your units (Hotkey “R”). \nYou can area Repair by pressing “R” and left-click dragging a circle."
    updateStageUI()
    updateObjectiveUI()
    giveScenarioHint()
    end
    end
    end

end

function gadget:GameFrame(frameNum) --fires off every frame
    Spring.Echo(getCurrentStage())
    local n = frameNum

    if n<1 then
        -- cutscene
        Spring.SendCommands("hideinterface")
        playVoiceline(soundfiles.sound1_A.name, 1, soundfiles.sound1_A.len)
        currentObjective = "Watch the cutscene"
        Spring.SetConfigString("CamModeName", "dolly")
        Spring.SetDollyCameraLookCurve(3, {652.809082, 200, 653.620544, 1, 1043.59399, 200, 1185.33862, 1, 1396.10645, 200, 1757.04626, 1, 1778.974, 200, 2320.35278, 1, 2158.16748, 200, 2857.34155, 1}, {0, 0, 0, 0, .5, 1, 1, 1, 1})
        Spring.SetDollyCameraCurve(3, {652.809082, 1200, 653.620544, 1, 1043.59399, 1200, 1185.33862, 1, 1396.10645, 1200, 1757.04626, 1, 1778.974, 1200, 2320.35278, 1, 2158.16748, 1200, 2857.34155, 1}, { 0, 0, 0, 0, .5, 1, 1, 1, 1 })
        setStage("stage1_A")
        updateStageUI()
        updateObjectiveUI()
    end

    if n == 10 then
        Spring.RunDollyCamera(19000)
    end

    if n == 60 then
        Spring.SendCommands("togglelos")
    end

    if n==soundfiles.sound1_A.len + 60 then
        --initial load 
        Spring.SendCommands("togglelos")
        Spring.SendCommands("hideinterface")
        Spring.SendLuaUIMsg("RestoreDefaultCamera")
        playVoiceline(soundfiles.sound1_B.name, 1, soundfiles.sound1_B.len)
        setStage("stage1_B")
        scenarioHint = "Based on previously successful AIs, \nyour personal assistant will act as your tutor as you battle the other cadets."
        updateStageUI()
        updateObjectiveUI()
        giveScenarioHint()
        stageDelayTarget = Spring.GetGameFrame() + soundfiles.sound1_B.len + 30
    end

    if n>0 and n%30 == 0 then
        updateStageUI()
        updateObjectiveUI()
    
        --stage1_B
        if stages.stage1_B then
        if Spring.GetGameFrame() > stageDelayTarget then
        stageDelayTarget = nil
        setStage("stage1_C")
        scenarioHint = "Camera zoom using “Mousewheel” \nCamera rotate by holding “Alt + Edge Panning” \nCamera tilt by holding “Control + Mouse Wheel”"
        currentObjective = "Zoom on your starting army."
        playVoiceline(soundfiles.sound1_C.name, 1, soundfiles.sound1_C.len)
        spawnUnitTable({
            "initialgrunt1",
            "initialgrunt2",
            "initialgrunt3",
            "initialgrunt4",
            "initialgrunt5",
            "persecutorprop1",
            "persecutorprop2",
            "component1",
            "component2",
            "component3",
            "component4",
        })
        respawnGrunts = true
        Spring.SetUnitNoSelect(unitIDs.component1, true)
        Spring.SetUnitNoSelect(unitIDs.component2, true)
        Spring.SetUnitNoSelect(unitIDs.component3, true)
        Spring.SetUnitNoSelect(unitIDs.component4, true)
        updateStageUI()
        updateObjectiveUI()
        giveScenarioHint()
        Spring.SendLuaUIMsg("GetCameraHeight")
        end
        end

        --stage1_C
        if stages.stage1_C then
        Spring.SendLuaUIMsg("GetCameraHeight")
        if camHeightNew and camHeight and camHeightNew + 100 < camHeight then
        setStage("stage1_D")
        playVoiceline(soundfiles.sound1_D.name, 1, soundfiles.sound1_D.len)
        scenarioHint = "Select individual units by left clicking. \nSelect a group of units by left clicking and dragging a box around the units, \nor holding shift and clicking on each unit individually. "
        currentObjective = "Select your five grunts."
        Spring.MarkerAddPoint(3198, 168, 4795, "Grunt Vanguard")
        updateStageUI()
        updateObjectiveUI()
        giveScenarioHint()
        end
        end

        --stage1_D
        if stages.stage1_D then
        Spring.SendLuaUIMsg("GetSelectedUnits")
        if selectedUnits and #selectedUnits == 5 then
            local gruntsSelected = true
            for _, unitID in pairs(selectedUnits) do
            if getNameFromID(unitID) ~= "corak" then
                gruntsSelected = false
            end
            end
            if gruntsSelected then
            setStage("stage1_E")
            playVoiceline(soundfiles.sound1_E.name, 1, soundfiles.sound1_E.len)
            scenarioHint = "Right click to move your selected units."
            currentObjective = "Move to the ping location."
            Spring.SendCommands("clearmapmarks")
            Spring.MarkerAddPoint(2700, 175, 4500, "Move here")
            updateStageUI()
            updateObjectiveUI()
            giveScenarioHint()
            end
        end
        end

        --stage1_E
        if stages.stage1_E then
        local markReached = Spring.GetUnitsInCylinder(2700, 4500, 100, 0)
        if markReached and #markReached > 0 then
        Spring.SendCommands("clearmapmarks")
        setStage("stage1_F")
        playVoiceline(soundfiles.sound1_F.name, 1, soundfiles.sound1_F.len)
        scenarioHint = "Your Grunts, like most units in BAR, will automatically fire at enemies that are in range."
        currentObjective = "Move your grunts and defeat the distracted foes."
        --Spring.MarkerAddPoint(2350, 177, 4500, "Battling Cadet Grunts")
        moveCamera(2350, 4500)
        spawnUnitTable({
            "vision1_F",
            "skirmishgrunt1",
            "skirmishgrunt2",
            "skirmishgrunt3",
            "skirmishgrunt4",
            "skirmishgrunt5",
            "skirmishgrunt6",
            "skirmishgrunt7",
            "skirmishgrunt8",
            "skirmishgrunt9",
            "skirmishgrunt10",
        })
        Spring.SetUnitNoDraw(unitIDs.vision1_F, true)
        Spring.SetUnitNoSelect(unitIDs.vision1_F, true)
        Spring.SetUnitNoMinimap(unitIDs.vision1_F, true)
        updateStageUI()
        updateObjectiveUI()
        giveScenarioHint()
        end
        end

        --stage1_G
        if stages.stage1_G then
        local wallcheck1 = Spring.GetUnitsInCylinder(2256, 4144, 50, 0)
        local wallcheck2 = Spring.GetUnitsInCylinder(2320, 4144, 50, 0)
        local wallcheck3 = Spring.GetUnitsInCylinder(2384, 4144, 50, 0)
        local wallcheck4 = Spring.GetUnitsInCylinder(2448, 4144, 50, 0)
        local wallcheck5 = Spring.GetUnitsInCylinder(2512, 4144, 50, 0)
        if wallcheck1 and wallcheck2 and wallcheck3 and wallcheck4 and wallcheck5 and #wallcheck1>0 and #wallcheck2>0 and #wallcheck3>0 and #wallcheck4>0 and #wallcheck5>0 then
        Spring.SendCommands("clearmapmarks")
        setStage("stage2_A")
        playVoiceline(soundfiles.sound2_A.name, 1, soundfiles.sound2_A.len)
        scenarioHint = "Press “F5” to find the most recent ping."
        currentObjective = "Find the first component."
        Spring.MarkerAddPoint(800, 179, 4455, "Component Detected")
        updateStageUI()
        updateObjectiveUI()
        giveScenarioHint()
        end
        end

        --stage2_A
        if stages.stage2_A then
        local nukeCheck = Spring.GetUnitsInCylinder(1700, 4200, 400, 0)
        if nukeCheck and #nukeCheck>0 then
        setStage("stage2_B")
        spawnUnit(units.nuke1, "nuke1")
        updateStageUI()
        updateObjectiveUI()
        end
        end

        --stage2_B
        if stages.stage2_B then
        local threeGruntsCheck = Spring.GetUnitsInCylinder(1600, 4400, 300, 0)
        if threeGruntsCheck and #threeGruntsCheck>0 then
        local playerUnits = Spring.GetTeamUnits(0)
        for _, unitID in pairs(playerUnits) do
            Spring.GiveOrderToUnit(unitID, CMD.STOP, {}, {})
        end
        setStage("stage2_B2")
        playVoiceline(soundfiles.sound2_B2.name, 1, soundfiles.sound2_B2.len)
        scenarioHint = "Select all units of the same kind map wide using Ctrl + W”\nSelect all units of the same kind on screen by double clicking on a unit."
        spawnUnitTable({
            "threegrunt1",
            "threegrunt2",
            "threegrunt3",
            "actuatorgrunt1",
            "actuatorgrunt2",
        })
        updateStageUI()
        updateObjectiveUI()
        giveScenarioHint()
        end
        end

        --stage2_B2
        if stages.stage2_B2 then
        local ticksFoundCheck = Spring.GetUnitsInCylinder(1067, 4825, 600, 0)
        if ticksFoundCheck and #ticksFoundCheck>0 then
        setStage("stage2_C")
        playVoiceline(soundfiles.sound2_C.name, 1, soundfiles.sound2_C.len)
        scenarioHint = "Use the Fight Command (Hotkey “F”) to make your units attack from their maximum range. \nTo line drag fight command, Press “F” and drag while holding right click."
        updateStageUI()
        updateObjectiveUI()
        giveScenarioHint()
        end
        end

        --stage2_C
        if stages.stage2_C then
        local actuatorFoundCheck = Spring.GetUnitsInCylinder(810, 4455, 400, 0)
        if actuatorFoundCheck and #actuatorFoundCheck>0 then
        setStage("stage2_D")
        playVoiceline(soundfiles.sound2_D.name, 1, soundfiles.sound2_D.len)
        updateStageUI()
        updateObjectiveUI()
        end
        end

        --stage2_E
        if stages.stage2_E then
        local actuatorReinforcementsArrived = Spring.GetUnitsInRectangle(585, 4140, 870, 5500, 1)
        if actuatorReinforcementsArrived and #actuatorReinforcementsArrived == 8 then
        Spring.SendLuaUIMsg("RestoreCamera")
        Spring.SendCommands("togglelos")
        setStage("stage3_A")
        playVoiceline(soundfiles.sound3_A.name, 1, soundfiles.sound3_A.len)
        scenarioHint = "Assign units to control groups with Ctrl + 0-9”.\nSelect the assigned control group with “0-9”."
        currentObjective = "Group your grunts using Ctrl + 1”\nGroup your Incisors using Ctrl + 2”"
        Spring.TransferUnit(unitIDs.actuatorreinforcement1, 0, true)
        Spring.TransferUnit(unitIDs.actuatorreinforcement2, 0, true)
        Spring.TransferUnit(unitIDs.actuatorreinforcement3, 0, true)
        Spring.TransferUnit(unitIDs.actuatorreinforcement4, 0, true)
        Spring.TransferUnit(unitIDs.actuatorreinforcement5, 0, true)
        Spring.TransferUnit(unitIDs.actuatorreinforcement6, 0, true)
        Spring.TransferUnit(unitIDs.actuatorreinforcement7, 0, true)
        Spring.TransferUnit(unitIDs.actuatorreinforcement8, 0, true)
        updateStageUI()
        updateObjectiveUI()
        giveScenarioHint()
        end
        end
        
        --stage3_A
        if stages.stage3_A then
        Spring.SendLuaUIMsg("GetGroupCount")
        if groupNumber > 1 then
        setStage("stage3_B")
        playVoiceline(soundfiles.sound3_B.name, 1, soundfiles.sound3_B.len)
        currentObjective = "Secure the next component to the North."
        Spring.MarkerAddPoint(824, 179, 2772, "Component Detected")
        updateStageUI()
        updateObjectiveUI()
        end
        end

        --stage3_B
        if stages.stage3_B then
        local bomberCheck = Spring.GetUnitsInRectangle(600, 3600, 1350, 4000, 0)
        if bomberCheck and #bomberCheck > 0 then
        local playerUnits = Spring.GetTeamUnits(0)
        for _, unitID in pairs(playerUnits) do
            Spring.GiveOrderToUnit(unitID, CMD.STOP, {}, {})
        end
        setStage("stage3_B2")
        playVoiceline(soundfiles.sound3_B2.name, 1, soundfiles.sound3_B2.len)
        spawnUnitTable({
            "vision3_B2",
            "bomber1",
            "bomber2",
            "bomber3",
            "bomber4",
            "bomber5",
            "gauntletenemy1",
            "gauntletenemy2",
            "gauntletenemy3",
            "gauntletenemy4",
            "gauntletenemy5",
            "gauntletenemy6",
            "gauntletenemy7",
            "gauntletenemy8",
            "gauntletenemy9",
        })
        Spring.SetUnitAlwaysVisible(unitIDs.bomber1, true)
        Spring.SetUnitAlwaysVisible(unitIDs.bomber2, true)
        Spring.SetUnitAlwaysVisible(unitIDs.bomber3, true)
        Spring.SetUnitAlwaysVisible(unitIDs.bomber4, true)
        Spring.SetUnitAlwaysVisible(unitIDs.bomber1, true)
        Spring.SendCommands("togglelos")
        Spring.SetConfigString("CamModeName", "dolly")
        Spring.SetDollyCameraLookUnit(unitIDs.bomber3)
        Spring.SetDollyCameraCurve(3, {54.6311951,1500,3820.88599,1,472.321899,1500,3827.3208,1,878.540894,1500,3834.54907,1,1228.28748,1500,3829.73096,1,1585.10681,1500,3829.73096,1}, { 0, 0, 0, 0, .5, 1, 1, 1, 1 })
        delayDollyActivation = Spring.GetGameFrame()
        dollyDuration = 14000
        Spring.SetUnitNoDraw(unitIDs.vision3_B2, true)
        Spring.SetUnitNoSelect(unitIDs.vision3_B2, true)
        Spring.SetUnitNoMinimap(unitIDs.vision3_B2, true)
        end
        end

        --stage3_B2
        if stages.stage3_B2 then
        local proximityCheck = Spring.GetUnitsInRectangle(570, 3000, 3300, 3400, 0)
        if proximityCheck and #proximityCheck > 0 then
        setStage("stage3_C")
        playVoiceline(soundfiles.sound3_C.name, 1, soundfiles.sound3_C.len)
        updateStageUI()
        updateObjectiveUI()
        end
        end

        --stage3_D
        if stages.stage3_D then
        Spring.SendLuaUIMsg("CheckAutoGroups|"..tostring(Spring.GetUnitDefID(unitIDs.initialgrunt1)))
        if autogroupPassed then
        setStage("stage3_E")
        playVoiceline(soundfiles.sound3_E.name, 1, soundfiles.sound3_E.len)
        spawnUnitTable({
            "rover1",
            "rover2",
            "rover3",
            "rover4",
            "rover5",
        })
        scenarioHint = "The patrol (Hotkey “H”) command makes units continuously move between two points, \nstopping and attacking enemies that come in range.."
        currentObjective = "Have your rascals patrol (Hotkey “H”) between the two secured components."
        updateStageUI()
        updateObjectiveUI()
        giveScenarioHint()
        end
        end

        --stage3_E
        if stages.stage3_E then
        local roversPatrolling
        for i = 1, 5 do
            local rovercommands = Spring.GetUnitCommands(unitIDs["rover"..tostring(i)], 1)
            if rovercommands and #rovercommands>0 then
                if rovercommands[1].id == 16 then -- 16 is patrol id
                roversPatrolling = true
                end
            end
        end
        if roversPatrolling == true then
            setStage("stage3_E2")
            currentObjective = "Continue ahead."
            updateStageUI()
            updateObjectiveUI()
        end
        end

        --stage3_E2
        if stages.stage3_E2 then
        local minesFound = Spring.GetUnitsInRectangle(1332, 2600, 1500, 3370, 0)
        if minesFound and #minesFound > 0 then
        local nearbyPlayerUnits = Spring.GetUnitsInRectangle(1135, 2600, 1500, 3370, 0)
        for _, nearbyID in pairs(nearbyPlayerUnits) do
            Spring.GiveOrderToUnit(nearbyID, CMD.STOP, {}, {})
        end
        moveCamera(1888, 3000)
        Spring.SendCommands("setspeed 0.7")
        setStage("stage4_A")
        playVoiceline(soundfiles.sound4_A.name, 1, soundfiles.sound4_A.len)
        currentObjective = "Find the next component."
        spawnUnitTable({
            "minegrunt1",
            "minegrunt2",
            "minegrunt3",
            "minegrunt4",
            "minegrunt5",
            "minegrunt6",
            "minegrunt7",
            "minegrunt8",
            "minegrunt9",
            "vision4_A"
        })
        Spring.SetUnitNoDraw(unitIDs.vision4_A, true)
        Spring.SetUnitNoSelect(unitIDs.vision4_A, true)
        Spring.SetUnitNoMinimap(unitIDs.vision4_A, true)
        updateStageUI()
        updateObjectiveUI()
        end
        end

        --stage4_D
        if stages.stage4_D then
        local playerUnits = Spring.GetTeamUnits(0)
        local unitDamaged = false
        for _, playerUnitID in pairs(playerUnits) do
            local unitHP, unitMaxHP = Spring.GetUnitHealth(playerUnitID)
            if unitHP/unitMaxHP < 0.95 then
            unitDamaged = true
            end
        end
        if not unitDamaged then
        setStage("stage5_A")
        playVoiceline(soundfiles.sound5_A.name, 1, soundfiles.sound5_A.len)
        scenarioHint = "Queue: You can queue commands by holding “Shift” while issuing the command. \nRepeat: You can have a unit repeat commands by enabling repeat (Hotkey “T”). \nYou can repeat area repair, to keep your army full health, for example."
        currentObjective = "Secure the final component"
        Spring.MarkerAddPoint(4291, 179, 2117, "Final Component Detected")
        updateStageUI()
        updateObjectiveUI()
        giveScenarioHint()
        end
        end

        --stage5_A
        if stages.stage5_A then
        local airDropCheck = Spring.GetUnitsInRectangle(3427, 2236, 4000, 3200, 0)
        if airDropCheck and #airDropCheck>0 then
        setStage("stage5_B")
        spawnUnitTable({
            "airDropTrans1",
            "airDropTrans2",
            "airDropTrans3",
            "airDropTrans4",
            "airDropTrans5",
            "airDropPounder1",
            "airDropPounder2",
            "airDropPounder3",
            "airDropHalberd1",
            "airDropHalberd2",
        })
        Spring.UnitAttach(unitIDs.airDropTrans1, unitIDs.airDropPounder1, 0)
        Spring.UnitAttach(unitIDs.airDropTrans2, unitIDs.airDropPounder2, 0)
        Spring.UnitAttach(unitIDs.airDropTrans3, unitIDs.airDropPounder3, 0)
        Spring.UnitAttach(unitIDs.airDropTrans4, unitIDs.airDropHalberd1, 0)
        Spring.UnitAttach(unitIDs.airDropTrans5, unitIDs.airDropHalberd2, 0)
        playVoiceline(soundfiles.sound5_B.name, 1, soundfiles.sound5_B.len)
        updateStageUI()
        updateObjectiveUI()
        end
        end

        --despawn airdrop
        local transToClear = Spring.GetUnitsInRectangle(5000, 2500, 5110, 3000, 1)
        if transToClear and #transToClear > 0 then
        for _, transID in pairs(transToClear) do
            Spring.DestroyUnit(transID, false, true)
        end
        end

        --stage5_B
        if stages.stage5_B then
        local lastArmyFound = Spring.GetUnitsInCylinder(4483, 2314, 950, 0)
        if lastArmyFound and #lastArmyFound>0 then
        setStage("stage5_C")
        playVoiceline(soundfiles.sound5_C.name, 1, soundfiles.sound5_C.len)
        spawnUnit(units.vision5_C, "vision5_C")
        Spring.SetUnitNoDraw(unitIDs.vision5_C, true)
        Spring.SetUnitNoSelect(unitIDs.vision5_C, true)
        Spring.SetUnitNoMinimap(unitIDs.vision5_C, true)
        Spring.SendCommands("clearmapmarks")
        Spring.MarkerAddPoint(4297, 174, 2234, "ACLT - Warden")
        scenarioHint = "Use Set Target (Hotkey “S”) to target a specific enemy unit. \nYour units will attack normally, but prioritize the target when it enters their range."
        updateStageUI()
        updateObjectiveUI()
        giveScenarioHint()
        end
        end

        --stage5_C
        if stages.stage5_C then
        local team5Alive = Spring.GetTeamUnits(5)
        if not team5Alive or #team5Alive<3 then
        setStage("stage5_D")
        Spring.TransferUnit(unitIDs.component4, 0, false)
        playVoiceline(soundfiles.sound5_D.name, 1, soundfiles.sound5_D.len)
        Spring.DestroyUnit(unitIDs.vision5_C, false, true)
        spawnUnitTable({
            "nuke2",
            "nuke3",
            "nuke4",
            "nuke5",
            "endTrans1",
            "endTrans2",
            "endTrans3",
        })
        Spring.SendCommands("togglelos")
        Spring.SetConfigString("CamModeName", "dolly")
        Spring.SetDollyCameraLookUnit(unitIDs.endTrans2)
        Spring.SetDollyCameraCurve(3, {4657.92578,740.087708,1144.73999,1,4710.54541,582.756775,2903.33569,1,2335.37817,521.41449,4133.87549,1,587.421997,705.304077,1576.39758,1,1812.88477,445.317993,314.002441,1}, { 0, 0, 0, 0, .5, 1, 1, 1, 1 })
        delayDollyActivation = Spring.GetGameFrame()
        dollyDuration = 12000
        stageDelayTarget = Spring.GetGameFrame() + soundfiles.sound5_D.len + 30
        updateStageUI()
        updateObjectiveUI()
        end
        end

        --stage5_D
        if stages.stage5_D then
        if stageDelayTarget and stageDelayTarget - Spring.GetGameFrame() == 30 then
        Spring.SendLuaUIMsg("FadeToBlack")
        end
        if stageDelayTarget and Spring.GetGameFrame() > stageDelayTarget then
        spawnUnit(units.corcom, "corcom")
        Spring.SetConfigString("CamModeName", "dolly")
        Spring.SetDollyCameraLookUnit(unitIDs.corcom)
        Spring.SetDollyCameraCurve(3, {4338.11133,1500,611.961975,1,4490.69629,1200,1260.7605,1,3578.91675,900,1344.70227,1,3851.46362,600,247.828491,1,4524.74561,300,790.576538,1}, { 0, 0, 0, 0, .5, 1, 1, 1, 1 })
        delayDollyActivation = Spring.GetGameFrame()
        dollyDuration = 25000
        setStage("gameover")
        stageDelayTarget = Spring.GetGameFrame() + soundfiles.sound5_E.len + 30
        playVoiceline(soundfiles.sound5_E.name, 1, soundfiles.sound5_E.len)
        end
        end

        --gameover
        if stages.gameover then
        if stageDelayTarget and stageDelayTarget - Spring.GetGameFrame() - soundfiles.sound5_E.len - 30 == 0 then
            Spring.SendCommands("hideinterface")
        end
        if stageDelayTarget and Spring.GetGameFrame() > stageDelayTarget then
        stageDelayTarget = nil
        Spring.SendLuaUIMsg("RestoreCamera")
        Spring.SendCommands("hideinterface")
        Spring.GameOver({0})
        end
        end
    end

    --repeated reinforcements
    if enableReinforcements and n>0 and (n - enableReinforcements)%900 == 0 and n - enableReinforcements ~= 0 then
        spawnUnitTable({
            "reinforcementgrunt1",
            "reinforcementgrunt2",
            "reinforcementincisor"
        })
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