if not gadgetHandler:IsSyncedCode() then
	return
end

local stages = {
    stage1_A = false,
    stage1_B = false,
    stage1_C = false,
    stage2_A = false,
    stage2_B = false,
    stage2_C = false,
    stage2_D = false,
    stage2_E = false,
    stage2_F = false,
    stage2_F2 = false,
    stage2_G = false,
    stage3_A = false,
    stage3_B = false,
    stage3_C = false,
    stage3_D = false,
    stage3_E = false,
    stage3_F = false,
    stage4_A = false,
    stage4_A2 = false,
    stage4_B = false,
    stage4_C = false,
    stage4_C2 = false,
    stage4_E = false,
    stage5_A = false,
    stage5_B = false,
    stage5_C = false,
}

local triggers = {
-- never meant to be
}

local soundfiles = { --length in frames, 30fps
    sound1_A = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_1-A.mp3", len = 90}, -- “The first research station is past these canyons commander.”
    sound1_B = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_1-B.mp3", len = 90}, -- “What the, is that a radar tower on the clifftop?” 
    sound1_C = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_1-C.mp3", len = 180}, -- “Enemy Falcons incoming! There are nettles on the ground! Careful! Land the Skyhook before they target the Commander!” 
    sound2_A = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_2-A.mp3", len = 150}, -- “NO! The commander's skyhook was shot down. Damnit!"  
    sound2_A2 = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_2-A2.mp3", len = 330}, -- “Wait, his chassis is reconnecting! He should have died in the transport! Commander if you can hear me, we can’t circle back to you, there’s too much anti-air. You will need to get past the canyon onto higher ground.” 
    sound2_B = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_2-B.mp3", len = 180}, -- “Commander you survived somehow, but your chassis is heavily damaged. We need to move to avoid patrols!”
    sound2_B2 = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_2-B2.mp3", len = 210}, -- “Multiple internal components offline.  Allocating Nanites to begin repair efforts and bringing radar online now"
    sound2_C = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_2-C.mp3", len = 210}, -- “Your nanites start auto-repairing one minute after they were damaged. They're continuing reconstruction now.”
    sound2_D = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_2-D.mp3", len = 180}, -- “Patrol showing on Radar. They know your location commander! We have to kill our way through them!”
    sound2_D2 = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_2-D2.mp3", len = 330}, -- “This ambush is illogical, Commander.  Jammers were already in place, along with prepared Anti-Air! Enborelde is covered in canyons, how did they know what route we would take?”
    sound2_E = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_2-E.mp3", len = 360}, -- “That pawn left a wreck, reclaim it with your commander! We need to collect as much metal as possible. After you've reclaimed the wreck, check for nearby rocks that could also be reclaimed for more metal.”
    sound2_F = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_2-F.mp3", len = 390}, -- “If we can get some energy, we should be able to repair more of your commander's internals. We can pull energy from plants and crystals in the landscape. See if you can reclaim more energy from nearby biomass.”
    sound2_G = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_2-G.mp3", len = 270}, -- “Perfect, you've collected enough, I'm rebooting your resource generation.  Your chassis now slowly generates metal and energy. Let’s press on commander”
    sound3_A = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_3-A.mp3", len = 240}, --  “Commander, we’re trying to bring support from the East. But there’s still Anti-Air in place, we need to get rid of those chainsaws on the cliff”
    sound3_B = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_3-B.mp3", len = 360}, --  “There’s plasma artillery on the high ground, we might be able to use that to destroy the chainsaws and remove the AA. But you need to hide next to the cliff commander, so the terrain blocks the gauntlet's shots.”
    sound3_C = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_3-C.mp3", len = 390}, -- “Perfect there's an energy storage over here and you will need surplus energy to use other commander systems. We need to make sure we don't destroy it, I'm setting your weapons to hold-fire.    Now use your capture module on the storage so we can use it."
    sound3_D = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_3-D.mp3", len = 360}, -- “The gauntlet is ahead commander. Activate your cloaking module so it can't see you. You will burn through your energy quickly while moving, so be as direct as possible and capture the plasma artillery.”
    sound3_D2 = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_3-D2.mp3", len = 450}, -- "Coms are jammed, I'm searching my local data vaults, but Enborelde has limited resources and strategic value compared to the Line Worlds. Only humans would be illogical enough to force conflict here."
    sound3_E = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_3-E.mp3", len = 390}, -- “Our gauntlet will kill the LLT Sentries below, but the chainsaw is out of Line of Sight and your commander's radar systems.  I'm guessing they have a radar somewhere nearby to spot for the gauntlet, see if you can find and capture it."
    sound3_F = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_3-F.mp3", len = 90}, -- “Chainsaw down commander.  We’ll drop off support ahead.”
    sound3_G = {name =  "sounds/tutorial/TM1_VoiceLines/T-M-1_3-G.mp3", len = 90},
    sound4_A = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_4-A.mp3", len = 330}, -- “Commander those are anti-swarm Centurion bots, they’re too strong to fight directly. I'm reallocating nanites and bringing your Disintegration Gun online, just don't burn up all your energy"
    sound4_A2 = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_4-A2.mp3", len = 270},
    sound4_B = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_4-B.mp3", len = 210}, -- “The transports dropped grunts and graverobbers here. The bots have taken some damage, so you'll need to repair them, before you keep moving.”
    sound4_C = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_4-C.mp3", len = 270}, -- “Commander, the graverobbers we unloaded can spend energy to resurrect unit and building wrecks. When we passed overhead it looked like there was more wreckage near you. As you move through the canyon keep an eye out look for anything else that can be resurrected" 
    sound4_C2 = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_4-C2.mp3", len = 210},
    sound4_D = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_4-D.mp3", len = 210}, -- “Commander, there’s a thug wreck over here we should resurrect. We can use it to help break defensive positions.” 
    sound4_E = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_4-E.mp3", len = 270}, -- “Commander, we can’t contest their fighters with the AA from the chainsaws on the ground. You’ll have to destroy them to allow for ex filtration.”
    sound4_F = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_4-F.mp3", len = 240}, -- “These must be some of the wrecks the pilot saw. If we can resurrect the solar collector it will help provide constant energy.” 
    sound4_G = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_4-G.mp3", len = 300}, -- needs transcript
    sound4_H = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_4-H.mp3", len = 180}, -- “Per their duty, they fell holding the canyon. Let's help them up commander, and let them claim their retribution." 
    sound5_A = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_5-A.mp3", len = 90}, -- “First Chainsaw down Commander, two more to go.”
    sound5_A1 = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_5-A1.mp3", len = 300}, -- “Commander, we should capture or destroy these windmills and solar generators.  If we can limit their energy generation, we can reduce the effectiveness of their beam weapons!”
    sound5_B = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_5-B.mp3", len = 150}, -- “Second Chainsaw down Commander, just one more remaining, and then we're out of here.”
    sound5_B1 = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_5-B1.mp3", len = 240}, -- “This is an entire fortified outpost, not just a collection of scouts. How long have they been here? How were they not detected!?”
    sound5_C = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_5-C.mp3", len = 180}, -- “All chainsaws destroyed.  It’s time to get out of here Commander! Signaling transports around now.”
    sound5_D = {name = "sounds/tutorial/TM1_VoiceLines/T-M-1_5-D.mp3", len = 180}, -- “This cowardly ambush has claimed more than I would have calculated. Feels very human of them”
}

local currentObjective
local scenarioHint
local CMD_SETTARGET = 34923 --doesn't work?
local voiceDelayTarget
local stageDelayTarget
local voiceQueue = {}
local voicePlayingDelay

-- flags
local loreDump2_D2Played
local loreDump3_D2Played
local loreDump4_GPlayed
local thugFound
local solarFound
local defendersFound
local energyFound
local ambushFound
local loreDump5_B1Played
local tickPatrolStarted

local rezSafeguard
local cutsceneFigsAlly = {}
local cutsceneFigsEnemy = {}

local unitIDs = {}

local units = { --rotation is bs and the one dumped by luarules is meaningless; s0 e1 n2 w3
    initialtrans = {name = "corseah", x = 7800, y = 500, z = 1700, rot = 3 , neutral = false, teamID = 0, queue = {{cmdID = CMD.MOVE, position = {px = 7400, py = 300, pz = 2300}},{cmdID = CMD.MOVE, position = {px = 7300, py = 300, pz = 3500}},{cmdID = CMD.MOVE, position = {px = 6900, py = 300, pz = 3300}},{cmdID = CMD.MOVE, position = {px = 6700, py = 38, pz = 2900}}}},
    cutscenevaliant1 = {name = "corveng", x = 7800, y = 500, z = 2000, rot = 3 , neutral = false, teamID = 1, queue = {{cmdID = CMD.FIGHT, position = {px = 6500, py = 200, pz = 3800}}, {cmdID = CMD.FIGHT, position = {px = 5300, py = 200, pz = 3800}}}},
    cutscenevaliant2 = {name = "corveng", x = 8000, y = 500, z = 2300, rot = 3 , neutral = false, teamID = 1, queue = {{cmdID = CMD.FIGHT, position = {px = 6700, py = 200, pz = 3800}}, {cmdID = CMD.FIGHT, position = {px = 5300, py = 200, pz = 2800}}}},
    cutscenevaliant3 = {name = "corveng", x = 8100, y = 500, z = 2200, rot = 3 , neutral = false, teamID = 1, queue = {{cmdID = CMD.FIGHT, position = {px = 6800, py = 200, pz = 3800}}, {cmdID = CMD.FIGHT, position = {px = 5300, py = 200, pz = 1800}}}},
    cutscenevaliant4 = {name = "corveng", x = 8250, y = 500, z = 2200, rot = 3 , neutral = false, teamID = 1, queue = {{cmdID = CMD.FIGHT, position = {px = 7000, py = 200, pz = 3800}}, {cmdID = CMD.FIGHT, position = {px = 5300, py = 200, pz = 3800}}}},
    cutscenevaliant5 = {name = "corveng", x = 8050, y = 500, z = 2100, rot = 3 , neutral = false, teamID = 1, queue = {{cmdID = CMD.FIGHT, position = {px = 7300, py = 200, pz = 3800}}, {cmdID = CMD.FIGHT, position = {px = 5300, py = 200, pz = 2800}}}},
    cutscenevaliant6 = {name = "corveng", x = 8150, y = 500, z = 2100, rot = 3 , neutral = false, teamID = 1, queue = {{cmdID = CMD.FIGHT, position = {px = 6700, py = 200, pz = 3800}}, {cmdID = CMD.FIGHT, position = {px = 5300, py = 200, pz = 1800}}}},
    cutscenevaliant7 = {name = "corveng", x = 7800, y = 500, z = 1600, rot = 3 , neutral = false, teamID = 1, queue = {{cmdID = CMD.FIGHT, position = {px = 6800, py = 200, pz = 3800}}, {cmdID = CMD.FIGHT, position = {px = 5300, py = 200, pz = 3800}}}},
    cutscenevaliant8 = {name = "corveng", x = 7900, y = 500, z = 1800, rot = 3 , neutral = false, teamID = 1, queue = {{cmdID = CMD.FIGHT, position = {px = 7000, py = 200, pz = 3800}}, {cmdID = CMD.FIGHT, position = {px = 5300, py = 200, pz = 2800}}}},
    cutscenevaliant9 = {name = "corveng", x = 7700, y = 500, z = 1650, rot = 3 , neutral = false, teamID = 1, queue = {{cmdID = CMD.FIGHT, position = {px = 7300, py = 200, pz = 3800}}, {cmdID = CMD.FIGHT, position = {px = 5300, py = 200, pz = 1800}}}},
    cutscenevaliant10 = {name = "corveng", x = 8000, y = 500, z = 1900, rot = 3 , neutral = false, teamID = 1, queue = {{cmdID = CMD.FIGHT, position = {px = 6500, py = 200, pz = 3800}}, {cmdID = CMD.FIGHT, position = {px = 5300, py = 200, pz = 3800}}}},
    cutscenevaliant11 = {name = "corveng", x = 8150, y = 500, z = 1600, rot = 3 , neutral = false, teamID = 1, queue = {{cmdID = CMD.FIGHT, position = {px = 6700, py = 200, pz = 3800}}, {cmdID = CMD.FIGHT, position = {px = 5300, py = 200, pz = 2800}}}},
    cutscenevaliant12 = {name = "corveng", x = 7650, y = 500, z = 2200, rot = 3 , neutral = false, teamID = 1, queue = {{cmdID = CMD.FIGHT, position = {px = 6800, py = 200, pz = 3800}}, {cmdID = CMD.FIGHT, position = {px = 5300, py = 200, pz = 1800}}}},
    cutscenevaliant13 = {name = "corveng", x = 8150, y = 500, z = 1700, rot = 3 , neutral = false, teamID = 1, queue = {{cmdID = CMD.FIGHT, position = {px = 7000, py = 200, pz = 3800}}, {cmdID = CMD.FIGHT, position = {px = 5300, py = 200, pz = 3800}}}},
    cutscenefalcon1 =  {name = "armfig", x = 6000, y = 500, z = 2900, rot = 1 , neutral = false, teamID = 2, queue = {{cmdID = CMD.FIRE_STATE, state = 0}, {cmdID = CMD.MOVE, position = {px = 8100, py = 200, pz = 2900}}}},
    cutscenefalcon2 =  {name = "armfig", x = 6100, y = 500, z = 3000, rot = 1 , neutral = false, teamID = 2, queue = {{cmdID = CMD.FIRE_STATE, state = 0}, {cmdID = CMD.MOVE, position = {px = 8100, py = 200, pz = 3000}}}},
    cutscenefalcon3 =  {name = "armfig", x = 6000, y = 500, z = 3100, rot = 1 , neutral = false, teamID = 2, queue = {{cmdID = CMD.FIRE_STATE, state = 0}, {cmdID = CMD.MOVE, position = {px = 8100, py = 200, pz = 3100}}}},
    cutscenefalcon4 =  {name = "armfig", x = 6100, y = 500, z = 3200, rot = 1 , neutral = false, teamID = 2, queue = {{cmdID = CMD.FIRE_STATE, state = 0}, {cmdID = CMD.MOVE, position = {px = 8100, py = 200, pz = 3200}}}},
    cutscenefalcon5 =  {name = "armfig", x = 6000, y = 500, z = 3300, rot = 1 , neutral = false, teamID = 2, queue = {{cmdID = CMD.FIRE_STATE, state = 0}, {cmdID = CMD.MOVE, position = {px = 8100, py = 200, pz = 3300}}}},
    cutscenefalcon6 =  {name = "armfig", x = 6100, y = 500, z = 3400, rot = 1 , neutral = false, teamID = 2, queue = {{cmdID = CMD.FIRE_STATE, state = 0}, {cmdID = CMD.MOVE, position = {px = 8100, py = 200, pz = 3400}}}},
    cutscenefalcon7 =  {name = "armfig", x = 6000, y = 500, z = 3500, rot = 1 , neutral = false, teamID = 2, queue = {{cmdID = CMD.FIRE_STATE, state = 0}, {cmdID = CMD.MOVE, position = {px = 8100, py = 200, pz = 3500}}}},
    cutscenefalcon8 =  {name = "armfig", x = 6100, y = 500, z = 3600, rot = 1 , neutral = false, teamID = 2, queue = {{cmdID = CMD.FIRE_STATE, state = 0}, {cmdID = CMD.MOVE, position = {px = 8100, py = 200, pz = 3600}}}},
    cutscenefalcon9 =  {name = "armfig", x = 6000, y = 500, z = 3700, rot = 1 , neutral = false, teamID = 2, queue = {{cmdID = CMD.FIRE_STATE, state = 0}, {cmdID = CMD.MOVE, position = {px = 8100, py = 200, pz = 3700}}}},
    cutscenefalcon10 =  {name = "armfig", x = 6100, y = 500, z = 3800, rot = 1 , neutral = false, teamID = 2, queue = {{cmdID = CMD.FIRE_STATE, state = 0}, {cmdID = CMD.MOVE, position = {px = 8100, py = 200, pz = 3800}}}},
    nettle1 = {name = "armrl", x = 6400, y = 420, z = 3150, rot = 16384 , neutral = false, teamID = 2},
    nettle2 = {name = "armferret", x = 6500, y = 420, z = 3300, rot = 16384 , neutral = false, teamID = 2},
    brokencom = {name = "corcombroken", x = 6700, y = 38, z = 2900, rot = 16384 , neutral = false, teamID = 0},
    earlytick1 = {name = "armflea", x = 5800, y = 40, z = 1700, rot = 16384 , neutral = false, teamID = 2, queue = {{cmdID = CMD.FIGHT, position = {px = 5850, py = 40, pz = 2400}}}},
    earlytick2 = {name = "armflea", x = 5900, y = 40, z = 1700, rot = 16384 , neutral = false, teamID = 2, queue = {{cmdID = CMD.FIGHT, position = {px = 5850, py = 40, pz = 2400}}}},
    earlypawn = {name = "armpw", x = 5850, y = 40, z = 1700, rot = 16384 , neutral = false, teamID = 2, queue = {{cmdID = CMD.FIGHT, position = {px = 5850, py = 40, pz = 2400}}}},
    stage2falcon1 = {name = 'armfig', x = 4534, y = 400, z = 3007, rot = 2 , teamID = 2, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 8188, py = 400, pz = 135}}}},
    stage2falcon2 = {name = 'armfig', x = 4692, y = 400, z = 2965, rot = 2 , teamID = 2, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 8188, py = 400, pz = 235}}}},
    stage2falcon3 = {name = 'armfig', x = 4635, y = 400, z = 3038, rot = 2 , teamID = 2, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 8188, py = 400, pz = 335}}}},
    stage2falcon4 = {name = 'armfig', x = 4543, y = 400, z = 2907, rot = 2 , teamID = 2, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 8188, py = 400, pz = 435}}}},
    stage2falcon5 = {name = 'armfig', x = 4857, y = 400, z = 3169, rot = 2 , teamID = 2, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 8188, py = 400, pz = 535}}}},
    stage2falcon6 = {name = 'armfig', x = 4707, y = 400, z = 3169, rot = 2 , teamID = 2, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 8188, py = 400, pz = 335}}}},
    stage2falcon7 = {name = 'armfig', x = 4707, y = 400, z = 3069, rot = 2 , teamID = 2, neutral = false, queue = {{cmdID = CMD.MOVE, position = {px = 8188, py = 400, pz = 235}}}},
    stage3fink1 = {name = "corfink", x = 8000, y = 550, z = 800, rot = 16384 , neutral = false, teamID = 1, queue = {{cmdID = CMD.MOVE, position = {px = 6200, py = 450, pz = 1000}},{cmdID = CMD.MOVE, position = {px = 5307, py = 200, pz = 200}}}},
    stage3fink2 = {name = "corfink", x = 7950, y = 550, z = 830, rot = 16384 , neutral = false, teamID = 1, queue = {{cmdID = CMD.MOVE, position = {px = 5500, py = 450, pz = 1030}},{cmdID = CMD.MOVE, position = {px = 5350, py = 200, pz = 972}},{cmdID = CMD.MOVE, position = {px = 4530, py = 200, pz = 1370}}}},
    stage3fink3 = {name = "corfink", x = 7900, y = 550, z = 860, rot = 16384 , neutral = false, teamID = 1, queue = {{cmdID = CMD.MOVE, position = {px = 5000, py = 450, pz = 1060}}}},
    stage3fink4 = {name = "corfink", x = 7950, y = 550, z = 890, rot = 16384 , neutral = false, teamID = 1, queue = {{cmdID = CMD.MOVE, position = {px = 5550, py = 450, pz = 1090}}}},
    stage3fink5 = {name = "corfink", x = 8000, y = 550, z = 920, rot = 16384 , neutral = false, teamID = 1, queue = {{cmdID = CMD.MOVE, position = {px = 5600, py = 450, pz = 1120}}}},
    stage3chainsaw = {name = "armcir", x = 5711, y = 411, z = 1310, rot = 16384 , neutral = false, teamID = 2, queue = {{cmdID = CMD.FIRE_STATE, state = 0},{cmdID = CMD.ATTACK, target = unitIDs.stage3fink5}}},
    stage3radar = {name = "armrad", x = 4128, y = 333, z = 1696, rot = 0 , neutral = false, teamID = 2},
    gauntlet = {name = "armguard", x = 4704, y = 214, z = 1104, rot = 0 , teamID = 2, neutral = false},
    stage3trans1 = {name = "corvalk", x = 8000, y = 550, z = 800, rot = 16384 , neutral = false, teamID = 1, queue = {{cmdID = CMD.MOVE, position = {px = 6550, py = 175, pz = 950}}}},
    stage3trans2 = {name = "corvalk", x = 7950, y = 550, z = 830, rot = 16384 , neutral = false, teamID = 1, queue = {{cmdID = CMD.MOVE, position = {px = 6600, py = 175, pz = 950}}}},
    stage3trans3 = {name = "corvalk", x = 7900, y = 550, z = 860, rot = 16384 , neutral = false, teamID = 1, queue = {{cmdID = CMD.MOVE, position = {px = 6650, py = 175, pz = 950}}}},
    stage3trans4 = {name = "corvalk", x = 7950, y = 550, z = 890, rot = 16384 , neutral = false, teamID = 1, queue = {{cmdID = CMD.MOVE, position = {px = 6700, py = 175, pz = 950}}}},
    stage3trans5 = {name = "corvalk", x = 8000, y = 550, z = 920, rot = 16384 , neutral = false, teamID = 1, queue = {{cmdID = CMD.MOVE, position = {px = 6750, py = 175, pz = 950}}}},
    estorage = {name = "armuwadves", x = 5552, y = 212, z = 448, rot = 0 , teamID = 2, neutral = false},
    centpatrol1 = {name = "armwar", x = 3100, y = 40, z = 2100, rot = 0 , teamID = 2, neutral = false, queue = {{cmdID = CMD.MOVE_STATE, state = 2},{cmdID = CMD.PATROL, position = {px = 3350, py = 36, pz = 2250}}}},
    centpatrol2 = {name = "armwar", x = 3070, y = 40, z = 2200, rot = 0 , teamID = 2, neutral = false, queue = {{cmdID = CMD.MOVE_STATE, state = 2},{cmdID = CMD.PATROL, position = {px = 3320, py = 36, pz = 2350}}}},
    centpatrol3 = {name = "armwar", x = 3040, y = 40, z = 2300, rot = 0 , teamID = 2, neutral = false, queue = {{cmdID = CMD.MOVE_STATE, state = 2},{cmdID = CMD.PATROL, position = {px = 3290, py = 36, pz = 2450}}}},
    stage4grunt1 = {name = "corak", x = 8000, y = 540, z = 800, rot = 0 , teamID = 1, neutral = false},
    stage4grunt2 = {name = "corak", x = 7950, y = 540, z = 830, rot = 0 , teamID = 1, neutral = false},
    stage4grunt3 = {name = "corak", x = 7900, y = 540, z = 860, rot = 0 , teamID = 1, neutral = false},
    stage4rez1 = {name = "cornecro", x = 7950, y = 540, z = 890, rot = 0 , teamID = 1, neutral = false},
    stage4rez2 = {name = "cornecro", x = 8000, y = 540, z = 920, rot = 0 , teamID = 1, neutral = false},
    stage4falcon1 = {name = 'armfig', x = 986, y = 500, z = 552, rot = 1 , teamID = 2, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 8188, py = 500, pz = 552}}}},
    stage4falcon2 = {name = 'armfig', x = 1098, y = 500, z = 563, rot = 1 , teamID = 2, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 8188, py = 500, pz = 563}}}},
    stage4falcon3 = {name = 'armfig', x = 1023, y = 500, z = 626, rot = 1 , teamID = 2, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 8188, py = 500, pz = 626}}}},
    stage4falcon4 = {name = 'armfig', x = 925, y = 500, z = 631, rot = 1 , teamID = 2, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 8188, py = 500, pz = 631}}}},
    stage4falcon5 = {name = 'armfig', x = 1111, y = 500, z = 657, rot = 1 , teamID = 2, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 8188, py = 500, pz = 705}}}},
    stage4falcon6 = {name = 'armfig', x = 1006, y = 500, z = 705, rot = 1 , teamID = 2, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 8188, py = 500, pz = 742}}}},
    stage4falcon7 = {name = 'armfig', x = 899, y = 500, z = 742, rot = 1 , teamID = 2, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 8188, py = 500, pz = 742}}}},
    stage4falcon8 = {name = 'armfig', x = 1085, y = 500, z = 752, rot = 1 , teamID = 2, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 8188, py = 500, pz = 752}}}},
    stage4falcon9 = {name = 'armfig', x = 987, y = 500, z = 808, rot = 1 , teamID = 2, neutral = false, queue = {{cmdID = CMD.FIGHT, position = {px = 8188, py = 500, pz = 808}}}},
    stage5chainsaw1 = {name = "armcir", x = 1972, y = 159, z = 2984, rot = 16384 , neutral = false, teamID = 2},
    stage5chainsaw2 = {name = "armcir", x = 2604, y = 166, z = 3699, rot = 16384 , neutral = false, teamID = 2},
    stage5chainsaw3 = {name = "armcir", x = 3700, y = 200, z = 3920, rot = 16384 , neutral = false, teamID = 2},
    safeguardrez1 = {name = "armrectr", x = 100, y = 40, z = 500, rot = 16384 , neutral = false, teamID = 2},
    safeguardrez2 = {name = "armrectr", x = 100, y = 40, z = 800, rot = 16384 , neutral = false, teamID = 2},
    safeguardrez3 = {name = "armrectr", x = 4000, y = 200, z = 3700, rot = 16384 , neutral = false, teamID = 2},
    safeguardrez4 = {name = "armrectr", x = 4000, y = 200, z = 3900, rot = 16384 , neutral = false, teamID = 2},
    finaltrans = {name = "corseah", x = 7800, y = 500, z = 3500, rot = 3 , neutral = false, teamID = 1},
    patroltick1 = {name = "armflea", x = 8100, y = 45, z = 3800, rot = 16384 , neutral = false, teamID = 2, queue = {{cmdID = CMD.FIGHT, position = {px = 5600, py = 36, pz = 2100}}, {cmdID = CMD.FIGHT, position = {px = 7500, py = 36, pz = 700}}, {cmdID = CMD.FIGHT, position = {px = 5700, py = 40, pz = 800}}, {cmdID = CMD.FIGHT, position = {px = 4300, py = 43, pz = 2300}}, {cmdID = CMD.FIGHT, position = {px = 4300, py = 43, pz = 2300}}, {cmdID = CMD.FIGHT, position = {px = 2900, py = 39, pz = 2200}}, {cmdID = CMD.FIGHT, position = {px = 3700, py = 208, pz = 400}}, {cmdID = CMD.FIGHT, position = {px = 1300, py = 117, pz = 1500}}}},
    patroltick2 = {name = "armflea", x = 8100, y = 45, z = 3830, rot = 16384 , neutral = false, teamID = 2, queue = {{cmdID = CMD.FIGHT, position = {px = 5600, py = 36, pz = 2100}}, {cmdID = CMD.FIGHT, position = {px = 7500, py = 36, pz = 700}}, {cmdID = CMD.FIGHT, position = {px = 5700, py = 40, pz = 800}}, {cmdID = CMD.FIGHT, position = {px = 4300, py = 43, pz = 2300}}, {cmdID = CMD.FIGHT, position = {px = 4300, py = 43, pz = 2300}}, {cmdID = CMD.FIGHT, position = {px = 2900, py = 39, pz = 2200}}, {cmdID = CMD.FIGHT, position = {px = 3700, py = 208, pz = 400}}, {cmdID = CMD.FIGHT, position = {px = 1300, py = 117, pz = 1500}}}},
    patroltick3 = {name = "armflea", x = 8070, y = 45, z = 3800, rot = 16384 , neutral = false, teamID = 2, queue = {{cmdID = CMD.FIGHT, position = {px = 5600, py = 36, pz = 2100}}, {cmdID = CMD.FIGHT, position = {px = 7500, py = 36, pz = 700}}, {cmdID = CMD.FIGHT, position = {px = 5700, py = 40, pz = 800}}, {cmdID = CMD.FIGHT, position = {px = 4300, py = 43, pz = 2300}}, {cmdID = CMD.FIGHT, position = {px = 4300, py = 43, pz = 2300}}, {cmdID = CMD.FIGHT, position = {px = 2900, py = 39, pz = 2200}}, {cmdID = CMD.FIGHT, position = {px = 3700, py = 208, pz = 400}}, {cmdID = CMD.FIGHT, position = {px = 1300, py = 117, pz = 1500}}}},
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

local function getMetal(teamID)
    local metal, _, _, _, _, _, _, _ = Spring.GetTeamResources(0, "metal")
    return metal
end

local function get1000Energy(teamID)
    local energy, _, _, _, _, _, _, _ = Spring.GetTeamResources(0, "energy")
    if energy >= 1000 then
    return true
    end
    return false
end

local function playVoiceline(soundfile, volume, length)
    if not voicePlayingDelay then
        Spring.PlaySoundFile(soundfile, volume)
        voicePlayingDelay = Spring.GetGameFrame() + length + 30
    else
        table.insert(voiceQueue, {soundfile, volume, length})
    end
end

--set units to hold position
function gadget:MetaUnitAdded(unitID, unitDefID, teamID)
    if teamID == 0 then
        Spring.GiveOrderToUnit(unitID, CMD.MOVE_STATE, 0, CMD.OPT_SHIFT)
    end
end

function gadget:UnitCreated(unitID, unitDefID, unitTeam, builderID)
    --stage 4_C
    if stages.stage4_C then
    if unitID and builderID and getNameFromID(builderID) == "cornecro" and getNameFromID(unitID) == "corak" then
    setStage("stage4_C2")
    playVoiceline(soundfiles.sound4_C2.name, 1, soundfiles.sound4_C2.len)
    currentObjective = "Continue moving through the canyon to escape."
    scenarioHint = "Destroyed units will leave wrecks unless the killing blow deals excessive damage."
    updateStageUI()
    updateObjectiveUI()
    giveScenarioHint()
    end
    end
end

function gadget:UnitTaken(unitID, unitDefID, oldTeam, newTeam)

    --stage 3_C
    if stages.stage3_C then
    if unitID == unitIDs.estorage and newTeam == 0 then
    setStage("stage3_D")
    Spring.AddTeamResource(0, "energy", 40000)
    currentObjective = "Capture the Gauntlet."
    scenarioHint = "Press K to cloak your commander. \nCloaking drains 100 energy/second while standing still, and 1000 energy/second while moving. \nIf an enemy unit gets too close, you will be revealed. "
    updateStageUI()
    updateObjectiveUI()
    giveScenarioHint()
    playVoiceline(soundfiles.sound3_D.name, 1, soundfiles.sound3_D.len)
    end
    end

    --stage 3_D
    if stages.stage3_D then
    if unitID == unitIDs.gauntlet and newTeam == 0 then
    setStage("stage3_E")
    currentObjective = "Capture the radar to allow the gauntlet to destroy the chainsaw."
    scenarioHint = "Capture the nearby radar. \nKeep your weapons in hold-fire mode so that you don’t kill it. \nYou no longer need to cloak your commander.  "
    updateStageUI()
    updateObjectiveUI()
    giveScenarioHint()
    playVoiceline(soundfiles.sound3_E.name, 1, soundfiles.sound3_E.len)
    end
    end

    --chainsaw capture check
    if unitIDs.stage5chainsaw1 and unitIDs.stage5chainsaw2 and unitIDs.stage5chainsaw3 then
    if unitID == unitIDs.stage5chainsaw1 or unitID == unitIDs.stage5chainsaw2 or unitID == unitIDs.stage5chainsaw3 then
        local x, y, z = Spring.GetUnitPosition(unitID)
        Spring.DestroyUnit(unitID, false, true)
        Spring.CreateUnit("armcir", x, y, z, 0, 0)
    end
    end
end

function gadget:UnitLoaded(unitID, unitDefID, unitTeam, transportID, transportTeam)
    --stage 5_C
    if unitID == unitIDs.corcom then
        Spring.GameOver({0})
    end
end

function gadget:UnitDestroyed(unitID, unitDefID)
    Spring.Echo(unitID.." destroyed")

    --stage 1_C
    if stages.stage1_C then
    if unitID == unitIDs.initialtrans then
    Spring.SendCommands("hideinterface")
    currentObjective = "Head towards the research station and escape through the canyon."
    scenarioHint = "Select your commander with left click, \nand issue a move command with right click."
    setStage("stage2_A")
    updateStageUI()
    updateObjectiveUI()
    giveScenarioHint()
    spawnUnit(units.brokencom, "brokencom")
    Spring.SetUnitHealth(unitIDs.brokencom, Spring.GetUnitHealth(unitIDs.brokencom)/2)
    playVoiceline(soundfiles.sound2_A.name, 1, soundfiles.sound2_A.len)
    voiceDelayTarget = Spring.GetGameFrame() + soundfiles.sound2_A.len + 30
    Spring.SendLuaUIMsg("blackout|")
    Spring.SendLuaUIMsg("RestoreSavedCamera")
    moveCamera(6700, 2900)
    for i = 1, #cutsceneFigsAlly do
        if not Spring.GetUnitIsDead(cutsceneFigsAlly[i]) then
            Spring.DestroyUnit(cutsceneFigsAlly[i], false, true)
        end
    end
    for i = 1, #cutsceneFigsEnemy do
        if not Spring.GetUnitIsDead(cutsceneFigsEnemy[i]) then
            Spring.DestroyUnit(cutsceneFigsEnemy[i], false, true)
        end
    end
    cutsceneFigsAlly = nil
    cutsceneFigsEnemy = nil
    end
    end

    --stage 2_D
    if stages.stage2_D then
    if unitID == unitIDs.earlypawn then
    currentObjective = "Reclaim 400 metal with your commander."
    scenarioHint = "Press “E” to reclaim with your commander. \nMetal is one of the two resources in the game. \nClick and hold ‘E’ to drag an area reclaim circle"
    updateStageUI()
    updateObjectiveUI()
    giveScenarioHint()
    setStage("stage2_E")
    playVoiceline(soundfiles.sound2_E.name, 1, soundfiles.sound2_E.len)
    local x, y, z = Spring.GetUnitPosition(unitID)
    Spring.Echo(unitID.."x: "..x.." z: "..z)
    moveCamera(math.floor(x), math.floor(z))
    end
    end

    --stage 3_E
    if stages.stage3_E then
    if unitID == unitIDs.stage3chainsaw then
    currentObjective = "Fight your way to the landing point."
    updateStageUI()
    updateObjectiveUI()
    setStage("stage3_F")
    Spring.GiveOrderToUnit(unitIDs.stage3trans1, CMD.MOVE, {3600, 200, 950}, {0})
    Spring.GiveOrderToUnit(unitIDs.stage3trans2, CMD.MOVE, {3620, 200, 940}, {0})
    Spring.GiveOrderToUnit(unitIDs.stage3trans3, CMD.MOVE, {3610, 200, 970}, {0})
    Spring.GiveOrderToUnit(unitIDs.stage3trans4, CMD.MOVE, {3590, 200, 920}, {0})
    Spring.GiveOrderToUnit(unitIDs.stage3trans5, CMD.MOVE, {3570, 200, 940}, {0})
    Spring.GiveOrderToUnit(unitIDs.stage3fink2, CMD.MOVE, {1700, 500, 1800}, {0})
    playVoiceline(soundfiles.sound3_F.name, 1, soundfiles.sound3_F.len)
    Spring.GiveOrderToUnit(unitIDs.corcom, CMD.FIRE_STATE, 2, {})
    end
    end

    --stage 4_A2 tick patrol
    if unitIDs.centpatrol3 and unitID == unitIDs.centpatrol3 then
    playVoiceline(soundfiles.sound3_G.name, 1, soundfiles.sound3_G.len)
    tickPatrolStarted = Spring.GetGameFrame()
    spawnUnit(units.patroltick1, "patroltick1")
    spawnUnit(units.patroltick2, "patroltick2")
    spawnUnit(units.patroltick3, "patroltick3")
    end

    --stage 4_E
    if stages.stage4_E then
    if not loreDump4_GPlayed then
    local baseFound = Spring.GetUnitsInCylinder(1150, 1850, 500, 0)
        if baseFound and #baseFound > 0 then
            playVoiceline(soundfiles.sound4_G.name, 1, soundfiles.sound4_G.len)
            loreDump4_GPlayed = true
        end
    end
    if unitID == unitIDs.stage5chainsaw1 or unitID == unitIDs.stage5chainsaw2 or unitID == unitIDs.stage5chainsaw3 then
    setStage("stage5_A")
    currentObjective = "1/3 Chainsaws destroyed."
    updateStageUI()
    updateObjectiveUI()
    playVoiceline(soundfiles.sound5_A.name, 1, soundfiles.sound5_A.len)
    return
    end
    end

    --stage 5_A
    if stages.stage5_A then
    if unitID == unitIDs.stage5chainsaw1 or unitID == unitIDs.stage5chainsaw2 or unitID == unitIDs.stage5chainsaw3 then
    setStage("stage5_B")
    currentObjective = "2/3 Chainsaws destroyed."
    updateStageUI()
    updateObjectiveUI()
    playVoiceline(soundfiles.sound5_B.name, 1, soundfiles.sound5_B.len)
    return
    end
    end

    --stage 5_B
    if stages.stage5_B then
    if unitID == unitIDs.stage5chainsaw1 or unitID == unitIDs.stage5chainsaw2 or unitID == unitIDs.stage5chainsaw3 then
    setStage("stage5_C")
    currentObjective = "3/3 Chainsaws destroyed."
    updateStageUI()
    updateObjectiveUI()
    playVoiceline(soundfiles.sound5_C.name, 1, soundfiles.sound5_C.len)
    --Spring.GameOver({0})
    for i = 1, 40 do
        local zcoord = math.random(3000, 4000)
        local newfig = Spring.CreateUnit("corveng", math.random(7800, 8100), 400, zcoord, 3, 1)
        Spring.GiveOrderToUnit(newfig, CMD.FIGHT, {100, 400, zcoord}, {})
    end
    for i = 1, 10 do
        local zcoord = math.random(3000, 4000)
        local newfig = Spring.CreateUnit("armfig", math.random(100, 400), 400, zcoord, 1, 2)
        Spring.GiveOrderToUnit(newfig, CMD.FIGHT, {8100, 400, zcoord}, {})
    end
    spawnUnit(units.finaltrans, "finaltrans")
    Spring.GiveOrderToUnit(unitIDs.finaltrans, CMD.LOAD_UNITS, unitIDs.corcom, CMD.OPT_SHIFT)
    Spring.GiveOrderToUnit(unitIDs.finaltrans, CMD.MOVE, {100, 400, 3500}, CMD.OPT_SHIFT)
    Spring.DestroyUnit(unitIDs.nettle1, false, true)
    Spring.DestroyUnit(unitIDs.nettle2, false, true)
    end
    end

    --rezbot safeguard
    if getNameFromID(unitID) == "cornecro" or getNameFromID(unitID) == "armrectr" then
    local rezLeft = -1 -- GetAllUnits seems to count the rez as alive at this point
    local unitsLeft = Spring.GetAllUnits()
    for _, leftID in pairs(unitsLeft) do
        if getNameFromID(leftID) == "cornecro" or getNameFromID(leftID) == "armrectr" then
            rezLeft = rezLeft + 1
        end
        Spring.Echo(rezLeft)
    end
    if rezLeft <= 0 then
        spawnUnitTable({
            "safeguardrez1",
            "safeguardrez2",
            "safeguardrez3",
            "safeguardrez4",
        })
        rezSafeguard = {unitIDs.safeguardrez1, unitIDs.safeguardrez2, unitIDs.safeguardrez3, unitIDs.safeguardrez4}
    end
    end

end

function gadget:GameFrame(frameNum) --fires off every frame
    Spring.Echo(getCurrentStage())
    local n = frameNum
    if n<1 then
        --Initial load
        Spring.SendCommands("hideinterface")
        setStage("stage1_A")
        currentObjective = "Transport to destination"
        updateStageUI()
        updateObjectiveUI()
        --spawnUnit(units.initialtrans, "initialtrans")
        spawnUnitTable({
            "initialtrans",
            "cutscenevaliant1",
            "cutscenevaliant2",
            "cutscenevaliant3",
            "cutscenevaliant4",
            "cutscenevaliant5",
            "cutscenevaliant6",
            "cutscenevaliant7",
            "cutscenevaliant8",
            "cutscenevaliant9",
            "cutscenevaliant10",
            "cutscenevaliant11",
            "cutscenevaliant12",
            "cutscenevaliant13",
        })
        cutsceneFigsAlly = {unitIDs.cutscenevaliant1, unitIDs.cutscenevaliant2, unitIDs.cutscenevaliant3, unitIDs.cutscenevaliant4, unitIDs.cutscenevaliant5, unitIDs.cutscenevaliant6, unitIDs.cutscenevaliant7, unitIDs.cutscenevaliant8, unitIDs.cutscenevaliant9, unitIDs.cutscenevaliant10, unitIDs.cutscenevaliant11, unitIDs.cutscenevaliant12, unitIDs.cutscenevaliant13}
        playVoiceline(soundfiles.sound1_A.name, 1, soundfiles.sound1_A.len)
        Spring.SendLuaUIMsg("SaveCamera")
        Spring.SendLuaUIMsg("SelectUnit|"..unitIDs.initialtrans)
    end

    --sometimes looks at the sky?
    --[[if n == 2 then
        Spring.SetConfigString("CamModeName", "fps")
    end]]

    if n == 10 then
        Spring.SendCommands("track")
    end

    if n>0 and n%30 == 0 then
        updateStageUI()
        updateObjectiveUI()

        --stage 1_A
        if stages.stage1_A then
        local x, y, z = Spring.GetUnitPosition(unitIDs.initialtrans)
        if z >= 2300 then
        spawnUnit(units.nettle1, "nettle1")
        spawnUnit(units.nettle2, "nettle2")
        setStage("stage1_B")
        updateStageUI()
        playVoiceline(soundfiles.sound1_B.name, 1, soundfiles.sound1_B.len)
        end
        end

        --stage1_B
        if stages.stage1_B then
        local x, y, z = Spring.GetUnitPosition(unitIDs.initialtrans)
        if z >= 3300 then
        setStage("stage1_C")
        updateStageUI()
        spawnUnitTable({
            "cutscenefalcon1",
            "cutscenefalcon2",
            "cutscenefalcon3",
            "cutscenefalcon4",
            "cutscenefalcon5",
            "cutscenefalcon6",
            "cutscenefalcon7",
            "cutscenefalcon8",
            "cutscenefalcon9",
            "cutscenefalcon10",
        })
        cutsceneFigsEnemy = {unitIDs.cutscenefalcon1, unitIDs.cutscenefalcon2, unitIDs.cutscenefalcon3, unitIDs.cutscenefalcon4, unitIDs.cutscenefalcon5, unitIDs.cutscenefalcon6, unitIDs.cutscenefalcon7, unitIDs.cutscenefalcon8, unitIDs.cutscenefalcon9, unitIDs.cutscenefalcon10}
        playVoiceline(soundfiles.sound1_C.name, 1, soundfiles.sound1_C.len)
        for _, unitID in pairs(cutsceneFigsEnemy) do
            Spring.Echo(cutsceneFigsAlly)
            Spring.GiveOrderToUnit(unitID, CMD.ATTACK, cutsceneFigsAlly[math.random(1, 13)] or unitID, {CMD.OPT_META})
        end
        Spring.GiveOrderToUnit(unitIDs.nettle1, CMD.ATTACK, {unitIDs.initialtrans}, {})
        Spring.GiveOrderToUnit(unitIDs.nettle2, CMD.ATTACK, {unitIDs.initialtrans}, {})
        end
        end

        --stage 2_A
        if stages.stage2_A then
        --delayed voiceline
        if voiceDelayTarget then
        stageDelayTarget = voiceDelayTarget
        if Spring.GetGameFrame() >= voiceDelayTarget then
        playVoiceline(soundfiles.sound2_A2.name, 1, soundfiles.sound2_A2.len)
        voiceDelayTarget = nil
        end
        end
        --proper stage
        if stageDelayTarget then
        if Spring.GetGameFrame() >= stageDelayTarget then
        setStage("stage2_B")
        updateStageUI()
        updateObjectiveUI()
        playVoiceline(soundfiles.sound2_B.name, 1, soundfiles.sound2_B.len)
        voiceDelayTarget = Spring.GetGameFrame() + soundfiles.sound2_B.len + 30
        stageDelayTarget = nil
        end
        end
        end

        --stage 2_B
        if stages.stage2_B then
        --delayed voiceline
        if voiceDelayTarget and Spring.GetGameFrame() >= voiceDelayTarget then
        playVoiceline(soundfiles.sound2_B2.name, 1, soundfiles.sound2_B2.len)
        voiceDelayTarget = nil
        end
        --proper stage
        local x, y, z = Spring.GetUnitPosition(unitIDs.brokencom)
        if x < 6200 then
        currentObjective = "Explore the Canyon to find a way to escape"
        scenarioHint = "Your commander auto repairs, and is always selectable with the hotkey “Tab”"
        setStage("stage2_C")
        updateStageUI()
        updateObjectiveUI()
        giveScenarioHint()
        playVoiceline(soundfiles.sound2_C.name, 1, soundfiles.sound2_C.len)
        end
        end

        --stage 2_B
        if stages.stage2_C then
        local x, y, z = Spring.GetUnitPosition(unitIDs.brokencom)
        if z < 2400 then
        setStage("stage2_D")
        spawnUnitTable({
            "earlytick1",
            "earlytick2",
            "earlypawn"
        })
        scenarioHint = "All units automatically fire at enemies, while “Fire at Will” is enabled."
        updateStageUI()
        updateObjectiveUI()
        giveScenarioHint()
        playVoiceline(soundfiles.sound2_D.name, 1, soundfiles.sound2_D.len)
        end
        end

        --stage 2_E
        if stages.stage2_E then
        if getMetal(0) >=180 and not loreDump2_D2Played then
            playVoiceline(soundfiles.sound2_D2.name, 1, soundfiles.sound2_D2.len)
        loreDump2_D2Played = true
        spawnUnitTable({
            "stage2falcon1",
            "stage2falcon2",
            "stage2falcon3",
            "stage2falcon4",
            "stage2falcon5",
            "stage2falcon6",
            "stage2falcon7",
        })
        end
        if getMetal(0) >=400 then
        setStage("stage2_F")
        currentObjective = "Reclaim 1000 energy with your commander."
        scenarioHint = "Press ‘E’ to reclaim plants with your commander. \nEnergy is the other collectible resource in the game. \nHold and drag to area reclaim plants."
        updateStageUI()
        updateObjectiveUI()
        giveScenarioHint()
        playVoiceline(soundfiles.sound2_F.name, 1, soundfiles.sound2_F.len)
        end
        end

        --stage 2_F
        if stages.stage2_F then
        if get1000Energy(0) then
        setStage("stage2_F2")
        currentObjective = "Go further into the canyon"
        scenarioHint = "Your Commander now generates 25 energy and 2 metal / sec"
        local x, y, z = Spring.GetUnitPosition(unitIDs.brokencom)
        local rot = Spring.GetUnitHeading(unitIDs.brokencom)
        Spring.DestroyUnit(unitIDs.brokencom, false, true)
        local corcomID = Spring.CreateUnit("corcom", x, y, z, rot, 0)
        unitIDs["corcom"] = corcomID
        updateStageUI()
        updateObjectiveUI()
        giveScenarioHint()
        playVoiceline(soundfiles.sound2_G.name, 1, soundfiles.sound2_G.len)
        voiceDelayTarget = Spring.GetGameFrame() + soundfiles.sound2_G.len + 30
        end
        end

        --stage 2F_2
        if stages.stage2_F2 then
        if voiceDelayTarget and Spring.GetGameFrame() >= voiceDelayTarget then
        spawnUnitTable({
            "stage3fink1",
            "stage3fink2",
            "stage3fink3",
            "stage3fink4",
            "stage3fink5",
            "stage3chainsaw",
            "stage3radar",
            "gauntlet",
            "estorage",
            "centpatrol1",
            "centpatrol2",
            "centpatrol3"
        })
        voiceDelayTarget = nil
        setStage("stage2_G")
        updateStageUI()
        end
        end

        --stage 2_G
        if stages.stage2_G then
        local x, y, z = Spring.GetUnitPosition(unitIDs.stage3fink5)
        if x < 6500 then
        Spring.GiveOrderToUnit(unitIDs.stage3chainsaw, CMD.ATTACK, {unitIDs.stage3fink5}, CMD.OPT_SHIFT)
        Spring.GiveOrderToUnit(unitIDs.stage3chainsaw, CMD.ATTACK, {unitIDs.stage3fink4}, CMD.OPT_SHIFT)
        Spring.GiveOrderToUnit(unitIDs.stage3chainsaw, CMD.ATTACK, {unitIDs.stage3fink3}, CMD.OPT_SHIFT)
        setStage("stage3_A")
        updateStageUI()
        updateObjectiveUI()
        playVoiceline(soundfiles.sound3_A.name, 1, soundfiles.sound3_A.len)
        spawnUnitTable({
            "stage3trans1",
            "stage3trans2",
            "stage3trans3",
            "stage3trans4",
            "stage3trans5",
            "stage4grunt1",
            "stage4grunt2",
            "stage4grunt3",
            "stage4rez1",
            "stage4rez2"
        })
        Spring.UnitAttach(unitIDs.stage3trans1, unitIDs.stage4grunt1, 0)
        Spring.UnitAttach(unitIDs.stage3trans2, unitIDs.stage4grunt2, 0)
        Spring.UnitAttach(unitIDs.stage3trans3, unitIDs.stage4grunt3, 0)
        Spring.UnitAttach(unitIDs.stage3trans4, unitIDs.stage4rez1, 0)
        Spring.UnitAttach(unitIDs.stage3trans5, unitIDs.stage4rez2, 0)

        end
        end

        --stage 3_A
        if stages.stage3_A then
        local x, y, z = Spring.GetUnitPosition(unitIDs.corcom)
        if x < 6300 then
        Spring.SetUnitPosition(unitIDs.stage3fink2, 4246, 1562)
        currentObjective = "Find a different path out of the canyon."
        setStage("stage3_B")
        updateStageUI()
        updateObjectiveUI()
        playVoiceline(soundfiles.sound3_B.name, 1, soundfiles.sound3_B.len)
        moveCamera(4704, 1104)
        end
        end

        --stage 3_B
        if stages.stage3_B then
        local x, y, z = Spring.GetUnitPosition(unitIDs.corcom)
        if x < 5900 then
        Spring.GiveOrderToUnit(unitIDs.corcom, CMD.FIRE_STATE, {0}, {})
        setStage("stage3_C")
        currentObjective = "Capture the Energy storage"
        scenarioHint = "Your weapons are on hold fire. \nPress W to capture the energy storage. \nIt provides 40000 energy storage to use"
        updateStageUI()
        updateObjectiveUI()
        giveScenarioHint()
        playVoiceline(soundfiles.sound3_C.name, 1, soundfiles.sound3_C.len)
        end
        end

        --substage 3_D2
        if stages.stage3_D and not loreDump3_D2Played then
            local x, y, z = Spring.GetUnitPosition(unitIDs.corcom)
            if x < 5300 and z > 350 then
                playVoiceline(soundfiles.sound3_D2.name, 1, soundfiles.sound3_D2.len)
            loreDump3_D2Played = true
            end
        end

        --stage 3_F
        if stages.stage3_F then
        local x, y, z = Spring.GetUnitPosition(unitIDs.corcom)
        if x < 4150 then
        setStage("stage4_A")
        playVoiceline(soundfiles.sound4_A.name, 1, soundfiles.sound4_A.len)
        currentObjective = "Use your D-Gun to destroy a wall section."
        scenarioHint = "Press “D” to spent 500 energy to fire your disintegration gun. \nIt destroys ANY unit or building it touches, friend or foe."
        moveCamera(3935, 2138)
        updateStageUI()
        updateObjectiveUI()
        giveScenarioHint()
        end
        end

        --stage4_A
        if stages.stage4_A then
        local x, y, z = Spring.GetUnitPosition(unitIDs.corcom)
        if x < 3880 then
        setStage("stage4_A2")
        playVoiceline(soundfiles.sound4_A2.name, 1, soundfiles.sound4_A2.len)
        currentObjective = "Defeat the Centurions and meet with your reinforcements."
        local cx, cy, cz = Spring.GetUnitPosition(unitIDs.centpatrol1)
        moveCamera(math.floor(cx), math.floor(cz))
        updateStageUI()
        updateObjectiveUI()
        end
        end

        --stage 4_A2
        if stages.stage4_A2 then
        local x, y, z = Spring.GetUnitPosition(unitIDs.corcom)
        if x < 3300 and z < 1900 then
        setStage("stage4_B")
        playVoiceline(soundfiles.sound4_B.name, 1, soundfiles.sound4_B.len)
        currentObjective = "Repair the reinforcements"
        scenarioHint = "Press “R” to repair with your commander and Rezbots. \nYou can area Repair by holding and dragging a circle. \nNote: Repairing does not cost any resources."
        updateStageUI()
        updateObjectiveUI()
        giveScenarioHint()
        spawnUnitTable({
            "stage4falcon1",
            "stage4falcon2",
            "stage4falcon3",
            "stage4falcon4",
            "stage4falcon5",
            "stage4falcon6",
            "stage4falcon7",
            "stage4falcon8",
            "stage4falcon9",
        })
        Spring.UnitDetach(unitIDs.stage4grunt1)
        Spring.UnitDetach(unitIDs.stage4grunt2)
        Spring.UnitDetach(unitIDs.stage4grunt3)
        Spring.UnitDetach(unitIDs.stage4rez1)
        Spring.UnitDetach(unitIDs.stage4rez2)
        Spring.GiveOrderToUnit(unitIDs.stage3trans1, CMD.MOVE, {8000, 550, 800}, {})
        Spring.GiveOrderToUnit(unitIDs.stage3trans2, CMD.MOVE, {8000, 550, 800}, {})
        Spring.GiveOrderToUnit(unitIDs.stage3trans3, CMD.MOVE, {8000, 550, 800}, {})
        Spring.GiveOrderToUnit(unitIDs.stage3trans4, CMD.MOVE, {8000, 550, 800}, {})
        Spring.GiveOrderToUnit(unitIDs.stage3trans5, CMD.MOVE, {8000, 550, 800}, {})
        Spring.TransferUnit(unitIDs.stage4rez1, 0, true)
        Spring.TransferUnit(unitIDs.stage4rez2, 0, true)
        Spring.SetUnitHealth(unitIDs.stage4grunt1, Spring.GetUnitHealth(unitIDs.stage4grunt1)*0.3)
        Spring.SetUnitHealth(unitIDs.stage4grunt2, Spring.GetUnitHealth(unitIDs.stage4grunt2)*0.4)
        Spring.SetUnitHealth(unitIDs.stage4grunt3, Spring.GetUnitHealth(unitIDs.stage4grunt3)*0.6)
        end
        end

        --stage 4_B
        if stages.stage4_B then
        local grunt1hp, grunt1hpmax = Spring.GetUnitHealth(unitIDs.stage4grunt1)
        local grunt2hp, grunt2hpmax = Spring.GetUnitHealth(unitIDs.stage4grunt2)
        local grunt3hp, grunt3hpmax = Spring.GetUnitHealth(unitIDs.stage4grunt3)
        if grunt1hp == grunt1hpmax and grunt2hp == grunt2hpmax and grunt3hp == grunt3hpmax then
        playVoiceline(soundfiles.sound4_C.name, 1, soundfiles.sound4_C.len)
        setStage("stage4_C")
        currentObjective = "Use your graverobbers to resurrect the defeated grunt wreck north of you."
        scenarioHint = "Press “W” to resurrect wrecks with your Graverobbers. \nResurrecting a unit requires half the units energy cost (Yellow Number)."
        updateStageUI()
        updateObjectiveUI()
        giveScenarioHint()
        Spring.TransferUnit(unitIDs.stage4grunt1, 0, true)
        Spring.TransferUnit(unitIDs.stage4grunt2, 0, true)
        Spring.TransferUnit(unitIDs.stage4grunt3, 0, true)
        end
        end

        --stage 4_C2
        if stages.stage4_C2 then
        local rampFound = Spring.GetUnitsInCylinder(1900, 1100, 800, 0)
        if rampFound and #rampFound > 0 then
        setStage("stage4_E")
        currentObjective = "Find and destroy the 3 enemy chainsaws to escape."
        scenarioHint = "The area ahead is well defended, be careful."
        updateStageUI()
        updateObjectiveUI()
        giveScenarioHint()
        playVoiceline(soundfiles.sound4_E.name, 1, soundfiles.sound4_E.len)
        Spring.MarkerAddPoint(2250, 160, 3250, "Calculated Chainsaw position")
        spawnUnitTable({
            "stage5chainsaw1",
            "stage5chainsaw2",
            "stage5chainsaw3"
        })
        end
        end


        --stageless triggers
        if not thugFound then
        local thugFoundCheck = Spring.GetUnitsInRectangle(2100, 0, 2900, 300, 0)
        if thugFoundCheck and #thugFoundCheck > 0 then
        thugFound = true
        playVoiceline(soundfiles.sound4_D.name, 1, soundfiles.sound4_D.len)
        moveCamera(2537, "0141")
        scenarioHint = "Unlike the fast raiding grunts, thugs are light plasma bots capable of front lining while being repaired."
        giveScenarioHint()
        end
        end

        if not solarFound then
        local solarFoundCheck = Spring.GetUnitsInRectangle(1400, 0, 1600, 400, 0)
        if solarFoundCheck and #solarFoundCheck > 0 then
        solarFound = true
        playVoiceline(soundfiles.sound4_F.name, 1, soundfiles.sound4_F.len)
        moveCamera(1322, "0286")
        end
        end

        if not defendersFound then
        local defendersFoundCheck = Spring.GetUnitsInRectangle(0, 300, 500, 900, 0)
        if defendersFoundCheck and #defendersFoundCheck > 0 then
        defendersFound = true
        playVoiceline(soundfiles.sound4_H.name, 1, soundfiles.sound4_H.len)
        moveCamera("0125", "0600")
        end
        end

        if not energyFound then
        local energyFoundCheck = Spring.GetUnitsInCylinder(650, 1550, 100, 0)
        if energyFoundCheck and #energyFoundCheck > 0 then
        energyFound = true
        playVoiceline(soundfiles.sound5_A1.name, 1, soundfiles.sound5_A1.len)
        end
        end

        if not ambushFound then
        local ambushFoundCheck = Spring.GetUnitsInRectangle(1000, 3500, 1600, 4100, 0)
        if ambushFoundCheck and #ambushFoundCheck > 0 then
        ambushFound = true
        playVoiceline(soundfiles.sound5_D.name, 1, soundfiles.sound5_D.len)
        end
        end

        if not loreDump5_B1Played then
        local loreDump5_B1Check = Spring.GetUnitsInRectangle(300, 2200, 2100, 2500, 0)
        if loreDump5_B1Check and #loreDump5_B1Check > 0 then
        loreDump5_B1Played = true
        playVoiceline(soundfiles.sound5_B1.name, 1, soundfiles.sound5_B1.len)
        end
        end

        if rezSafeguard then
            for _, rezID in pairs(rezSafeguard) do
                if not Spring.GetUnitIsDead(rezID) and Spring.GetUnitTeam(rezID) == 2 then
                local x, y, z = Spring.GetUnitPosition(unitIDs.corcom)
                Spring.GiveOrderToUnit(rezID, CMD.MOVE, {x - 500 + math.random(1, 1000), y, z - 500 + math.random(1, 1000)}, {})
                end
            end
        end


        --enemy fig killbox
        local enemyUnits = Spring.GetTeamUnits(2)
        for _, unitID in pairs(enemyUnits) do
            if getNameFromID(unitID) == "armfig" then
                local x, y, z = Spring.GetUnitPosition(unitID)
                if x > 8100 and z < 1000 then
                Spring.DestroyUnit(unitID, false, true)
                end
            end
        end

    end

    --repeated tick patrols
    if tickPatrolStarted and n>0 and (n - tickPatrolStarted)%3600 == 0 and n - tickPatrolStarted ~= 0 then
    spawnUnit(units.patroltick1, "patroltick1")
    spawnUnit(units.patroltick2, "patroltick2")
    spawnUnit(units.patroltick3, "patroltick3")
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