return {
	corprinter = {
		maxacc = 0.02547,
		autoheal = 5,
		maxdec = 0.05093,
		energycost = 4700,
		metalcost = 330,
		buildpic = "CORPRINTER.DDS",
		buildtime = 10200,
		builddistance = 200,
		builder = true,
		canmove = true,
		category = "",
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "36 36 54",
		collisionvolumetype = "Box",
		corpse = "DEAD",
		energymake = 25,
		energystorage = 50,
		explodeas = "mediumexplosiongeneric",
		footprintx = 3,
		footprintz = 3,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		health = 5125,
		speed = 49.5,
		maxwaterdepth = 0,
		movementclass = "MTANK3",
		nochasecategory = "NOTLAND VTOL",
		objectname = "Units/CORPRINTER.s3o",
		script = "Units/CORPRINTER.cob",
		seismicsignature = 0,
		selfdestructas = "mediumExplosionGenericSelfd",
		sightdistance = 430,
		terraformspeed = 1250,
		trackoffset = 8,
		trackstrength = 8,
		tracktype = "corwidetracks",
		trackwidth = 31,
		turninplace = true,
		turninplaceanglelimit = 90,
		turninplacespeedlimit = 1.287,
		turnrate = 363,
		workertime = 200,
		buildoptions = {
			[1] = "cormex",
			[2] = "corsolar",
			[3] = "corrad",
			[4] = "corfort",
		},
		customparams = {
			unitgroup = 'buildert2',
			model_author = "MASHUP, Itanthias, name inspired by Themitri",
			normaltex = "unittextures/cor_normal.dds",
			paralyzemultiplier = 0.1,
			subfolder = "corvehicles/t2",
			techlevel = 2,
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0 0 0",
				collisionvolumescales = "36 36 54",
				collisionvolumetype = "Box",
				damage = 450,
				featuredead = "HEAP",
				footprintx = 3,
				footprintz = 3,
				height = 20,
				metal = 138,
				object = "Units/CORPRINTER_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "48.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 350,
				footprintx = 3,
				footprintz = 3,
				height = 4,
				metal = 55,
				object = "Units/cor3X3B.s3o",
				reclaimable = true,
				resurrectable = 0,
			},
		},
		sfxtypes = {
			pieceexplosiongenerators = {
				[1] = "deathceg2",
				[2] = "deathceg3",
				[3] = "deathceg4",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
			underattack = "warning1",
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
				[1] = "tcormove",
			},
			select = {
				[1] = "tcorsel",
			},
		},
	},
}
