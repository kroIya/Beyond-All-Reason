return {
	corfast = {
		maxacc = 0.23,
		maxdec = 1.725,
		energycost = 3800,
		metalcost = 210,
		builddistance = 136,
		builder = true,
		buildpic = "CORFAST.DDS",
		buildtime = 6500,
		canmove = true,
		category = "",
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "22 47 19",
		collisionvolumetype = "Box",
		corpse = "DEAD",
		energymake = 15,
		energystorage = 100,
		explodeas = "smallbuilder",
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 1800,
		health = 830,
		maxslope = 17,
		speed = 90.0,
		maxwaterdepth = 22,
		movementclass = "BOT3",
		objectname = "Units/CORFAST.s3o",
		script = "Units/CORFAST.cob",
		seismicsignature = 0,
		selfdestructas = "smallbuilderSelfd",
		sightdistance = 520,
		terraformspeed = 750,
		turninplace = true,
		turninplaceanglelimit = 90,
		turninplacespeedlimit = 1.98,
		turnrate = 1391.5,
		upright = true,
		workertime = 125,
		buildoptions = {
			[1] = "corsolar",
			[2] = "cormex",
			[3] = "corlab",
			[4] = "cornanotc",
			[5] = "coreyes",
			[6] = "corshroud",
			[7] = "corfort",
			[8] = "corarad",
			[9] = "cormine2",
			[10] = "cordl",
			[11] = "corhllt",
			[12] = "cortoast",
			[13] = "cormadsam",
			[14] = "corflak",
			[15] = "corck",
			[16] = "corak",
			[17] = "corcrash",
			[18] = "cormando",
			[19] = "corpyro",
			[20] = "coramph",
			[21] = "corcs",
			[22] = "corroy",
			[23] = "cortermite",
		},
		customparams = {
			unitgroup = 'buildert2',
			model_author = "Beherith",
			normaltex = "unittextures/cor_normal.dds",
			subfolder = "corbots/t2",
			techlevel = 2,
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "2.70434570313 -0.526537158203 -1.280418396",
				collisionvolumescales = "37.4086914063 20.6713256836 39.1832122803",
				collisionvolumetype = "Box",
				damage = 600,
				featuredead = "HEAP",
				footprintx = 2,
				footprintz = 2,
				height = 20,
				metal = 125,
				object = "Units/corfast_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "35.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 500,
				footprintx = 2,
				footprintz = 2,
				height = 4,
				metal = 50,
				object = "Units/cor2X2D.s3o",
				reclaimable = true,
				resurrectable = 0,
			},
		},
		sfxtypes = {
			pieceexplosiongenerators = {
				[1] = "deathceg2-builder",
				[2] = "deathceg3-builder",
				[3] = "deathceg4-builder",
			},
		},
		sounds = {
			build = "nanlath2",
			canceldestruct = "cancel2",
			capture = "capture2",
			repair = "repair2",
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
				[1] = "kbcormov",
			},
			select = {
				[1] = "kbcorsel",
			},
		},
	},
}
