return {
	armca = {
		maxacc = 0.07,
		blocking = false,
		maxdec = 0.4275,
		energycost = 3000,
		metalcost = 110,
		builddistance = 136,
		builder = true,
		buildpic = "ARMCA.DDS",
		buildtime = 7960,
		canfly = true,
		canmove = true,
		collide = true,
		cruisealtitude = 70,
		energystorage = 25,
		energymake = 5,
		explodeas = "smallexplosiongeneric-builder",
		footprintx = 2,
		footprintz = 2,
		hoverattack = true,
		idleautoheal = 5,
		idletime = 1800,
		health = 156,
		maxslope = 10,
		speed = 208.2,
		maxwaterdepth = 0,
		objectname = "Units/ARMCA.s3o",
		script = "Units/ARMCA.cob",
		seismicsignature = 0,
		selfdestructas = "smallExplosionGenericSelfd-builder",
		sightdistance = 390,
		terraformspeed = 225,
		turninplaceanglelimit = 360,
		turnrate = 240,
		workertime = 60,
		buildoptions = {
			[1] = "armsolar",
			[2] = "armadvsol",
			[3] = "armwin",
			[4] = "armgeo",
			[5] = "armmstor",
			[6] = "armestor",
			[7] = "armmex",
			[8] = "armamex",
			[9] = "armmakr",
			[10] = "armasp",
			[11] = "armaap",
			[12] = "armlab",
			[13] = "armvp",
			[14] = "armap",
			[15] = "armhp",
			[16] = "armnanotc",
			[17] = "armeyes",
			[18] = "armrad",
			[19] = "armdrag",
			[20] = "armclaw",
			[21] = "armllt",
			[22] = "armbeamer",
			[23] = "armhlt",
			[24] = "armguard",
			[25] = "armrl",
			[26] = "armferret",
			[27] = "armcir",
			[28] = "armdl",
			[29] = "armjamt",
			[30] = "armjuno",
			[31] = "armsy",
			[32] = "armuwgeo",
			[33] = "armfasp",
		},
		customparams = {
			unitgroup = 'builder',
			model_author = "FireStorm, Flaka",
			normaltex = "unittextures/Arm_normal.dds",
			subfolder = "armaircraft",
		},
		sfxtypes = {
			crashexplosiongenerators = {
				[1] = "crashing-small",
				[2] = "crashing-small",
				[3] = "crashing-small2",
				[4] = "crashing-small3",
				[5] = "crashing-small3",
			},
			pieceexplosiongenerators = {
				[1] = "airdeathceg3-builder",
				[2] = "airdeathceg2-builder",
			},
		},
		sounds = {
			build = "nanlath1",
			canceldestruct = "cancel2",
			repair = "repair1",
			underattack = "warning1",
			working = "reclaim1",
			cant = {
				[1] = "cantdo4",
			},
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			ok = {
				[1] = "vtolarmv",
			},
			select = {
				[1] = "vtolarac",
			},
		},
	},
}
