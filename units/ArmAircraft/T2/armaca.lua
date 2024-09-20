return {
	armaca = {
		maxacc = 0.07,
		blocking = false,
		maxdec = 0.4275,
		energycost = 12000,
		metalcost = 340,
		builddistance = 136,
		builder = true,
		buildpic = "ARMACA.DDS",
		buildtime = 17750,
		canfly = true,
		canmove = true,
		category = "",
		collide = true,
		cruisealtitude = 80,
		energystorage = 50,
		energymake = 10,
		explodeas = "smallExplosionGeneric-builder",
		footprintx = 2,
		footprintz = 2,
		hoverattack = true,
		idleautoheal = 5,
		idletime = 1800,
		health = 200,
		maxslope = 10,
		speed = 192.0,
		maxwaterdepth = 0,
		objectname = "Units/ARMACA.s3o",
		radardistance = 50,
		script = "Units/ARMACA.cob",
		seismicsignature = 0,
		selfdestructas = "smallExplosionGenericSelfd-builder",
		sightdistance = 383.5,
		terraformspeed = 650,
		turninplaceanglelimit = 360,
		turnrate = 240,
		workertime = 100,
		buildoptions = {
			"armfus",
			"armafus",
			"armckfus",
			"armageo",
			"armuwageo",
			"armgmm",
			"armmoho",
			"armmmkr",
			"armuwadves",
			"armuwadvms",
			"armarad",
			"armveil",
			"armfort",
			"armasp",
			"armfasp",
			"armtarg",
			"armsd",
			"armgate",
			"armamb",
			"armpb",
			"armanni",
			"armflak",
			"armmercury",
			"armemp",
			"armamd",
			"armsilo",
			"armbrtha",
			"armvulc",
			"armdf",
			"armap",
			"armaap",
			"armplat",
			"armshltx",
		},
		customparams = {
			unitgroup = 'buildert2',
			model_author = "FireStorm",
			normaltex = "unittextures/Arm_normal.dds",
			subfolder = "armaircraft/t2",
			techlevel = 2,
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
				[2] = "airdeathceg4-builder",
				[3] = "airdeathceg2-builder",
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
