return {
	armassistdrone = {
		maxacc = 0.07,
		blocking = false,
		maxdec = 0.4275,
		energycost = 1,
		metalcost = 1,
		builddistance = 100,
		builder = true,
		buildpic = "ARMASSISTDRONE.DDS",
		buildtime = 500,
		cancapture = true,
		canfly = true,
		canmove = true,
		collide = true,
		cruisealtitude = 100,
		explodeas = "smallexplosiongeneric-builder",
		footprintx = 1,
		footprintz = 1,
		hoverattack = false,
		idleautoheal = 5,
		idletime = 1800,
		mass = 5000,
		health = 335,
		maxslope = 10,
		speed = 210.0,
		maxwaterdepth = 0,
		objectname = "Units/scavboss/ARMASSISTDRONE.s3o",
		script = "Units/ARMCA.cob",
		seismicsignature = 0,
		selfdestructas = "smallExplosionGenericSelfd-builder",
		sightdistance = 200,
		terraformspeed = 225,
		turninplaceanglelimit = 360,
		turnrate = 740,
		workertime = 100*Spring.GetModOptions().assistdronesbuildpowermultiplier,
		buildoptions = {
			"armsolar",
			"armadvsol",
			"armwin",
			"armgeo",
			"armmstor",
			"armestor",
			"armmex",
			"armamex",
			"armmakr",
			"armlab",
			"armvp",
			"armap",
			"armeyes",
			"armrad",
			"armdrag",
			"armllt",
			"armrl",
			"armdl",
			"armtide",
			"armuwms",
			"armuwes",
			"armfmkr",
			"armsy",
			"armfdrag",
			"armtl",
			"armfrt",
			"armfrad",
			-- Experimental:
			"armhp",
			"armfhp",
		},
		customparams = {
			unitgroup = 'builder',
			model_author = "FireStorm, Flaka",
			normaltex = "unittextures/Arm_normal.dds",
			subfolder = "ArmAircraft",
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
