return {
	corhunt = {
		acceleration = 0.22,
		blocking = false,
		maxdec = 0.0375,
		energycost = 6900,
		metalcost = 130,
		buildpic = "CORHUNT.DDS",
		buildtime = 9500,
		canfly = true,
		canmove = true,
		cansubmerge = true,
		category = "",
		collide = false,
		cruisealtitude = 190,
		explodeas = "mediumexplosiongeneric",
		footprintx = 3,
		footprintz = 3,
		idleautoheal = 5,
		idletime = 1800,
		maxacc = 0.1425,
		maxaileron = 0.01377,
		maxbank = 0.8,
		health = 730,
		maxelevator = 0.01002,
		maxpitch = 0.625,
		maxrudder = 0.00552,
		maxslope = 10,
		speed = 324.3,
		maxwaterdepth = 255,
		objectname = "Units/CORHUNT.s3o",
		radardistance = 2200,
		script = "Units/CORHUNT.cob",
		seismicsignature = 0,
		selfdestructas = "mediumExplosionGenericSelfd",
		sightdistance = 1130,
		sonardistance = 900,
		speedtofront = 0.07,
		turnradius = 64,
		turnrate = 680,
		usesmoothmesh = true,
		wingangle = 0.06252,
		wingdrag = 0.11,
		customparams = {
			unitgroup = 'util',
			model_author = "Beherith",
			normaltex = "unittextures/cor_normal.dds",
			subfolder = "corseaplanes",
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
				[1] = "airdeathceg2",
				[2] = "airdeathceg3",
				[3] = "airdeathceg4",
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
				[1] = "vtolcrmv",
			},
			select = {
				[1] = "seasonr2",
			},
		},
	},
}
