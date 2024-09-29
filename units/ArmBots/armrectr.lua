return {
	armrectr = {
		maxacc = 0.23,
		maxdec = 0.8625,
		energycost = 1400,
		metalcost = 130,
		builddistance = 96,
		builder = true,
		buildpic = "ARMRECTR.DDS",
		buildtime = 2800,
		canassist = false,
		canmove = true,
		canresurrect = true,
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "24 32 24",
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
		objectname = "Units/ARMRECTR.s3o",
		radardistance = 50,
		script = "Units/ARMRECTR.cob",
		seismicsignature = 0,
		selfdestructas = "smallbuilderSelfd",
		sightdistance = 430,
		stealth = true,
		terraformspeed = 1000,
		turninplace = true,
		turninplaceanglelimit = 90,
		turninplacespeedlimit = 1.716,
		turnrate = 1290.29993,
		upright = true,
		workertime = 200,
		customparams = {
			unitgroup = 'builder',
			model_author = "Kaiser",
			normaltex = "unittextures/Arm_normal.dds",
			subfolder = "armbots",
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0.0 -5.0193 1.03799438477",
				collisionvolumescales = "20.0 11.0 10.0759887695",
				collisionvolumetype = "Box",
				damage = 764,
				featuredead = "HEAP",
				footprintx = 2,
				footprintz = 2,
				height = 20,
				metal = 72,
				object = "Units/armrectr_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "35.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 344,
				footprintx = 2,
				footprintz = 2,
				height = 4,
				metal = 36,
				object = "Units/arm2X2D.s3o",
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
				[1] = "necrok1",
			},
			select = {
				[1] = "necrsel1",
			},
		},
	},
}
