return {
	cornecro = {
		maxacc = 0.23,
		maxdec = 0.8625,
		energycost = 1400,
		metalcost = 130,
		builddistance = 96,
		builder = true,
		buildpic = "CORNECRO.DDS",
		buildtime = 2800,
		canassist = false,
		canmove = true,
		canresurrect = true,
		collisionvolumeoffsets = "0 -2 1",
		collisionvolumescales = "28 34 28",
		collisionvolumetype = "CylY",
		corpse = "DEAD",
		explodeas = "smallbuilder",
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 60,
		health = 220,
		maxslope = 14,
		speed = 78.0,
		maxwaterdepth = 22,
		movementclass = "BOT3",
		objectname = "Units/CORNECRO.s3o",
		radardistance = 50,
		script = "Units/CORNECRO.cob",
		seismicsignature = 0,
		selfdestructas = "smallbuilderSelfd",
		sightdistance = 430,
		stealth = true,
		terraformspeed = 1000,
		turninplace = true,
		turninplaceanglelimit = 90,
		turninplacespeedlimit = 1.716,
		turnrate = 1285.69995,
		upright = true,
		workertime = 200,
		customparams = {
			unitgroup = 'builder',
			model_author = "Beherith",
			normaltex = "unittextures/cor_normal.dds",
			subfolder = "corbots",
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0 -2 0",
				collisionvolumescales = "28 24 28",
				collisionvolumetype = "Box",
				damage = 794,
				featuredead = "HEAP",
				footprintx = 2,
				footprintz = 2,
				height = 20,
				metal = 72,
				object = "Units/cornecro_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "35.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 394,
				footprintx = 2,
				footprintz = 2,
				height = 4,
				metal = 26,
				object = "Units/cor2X2D.s3o",
				reclaimable = true,
				resurrectable = 0,
			},
		},
		sfxtypes = {
			pieceexplosiongenerators = {
				[1] = "deathceg3-builder",
				[2] = "deathceg2-builder",
				[3] = "deathceg2",
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
				[1] = "necrok2",
			},
			select = {
				[1] = "necrsel2",
			},
		},
	},
}
