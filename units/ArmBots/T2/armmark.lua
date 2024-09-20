return {
	armmark = {
		maxacc = 0.05175,
		activatewhenbuilt = true,
		maxdec = 0.0621,
		energycost = 1250,
		metalcost = 100,
		buildpic = "ARMMARK.DDS",
		buildtime = 3800,
		canattack = false,
		canmove = true,
		category = "",
		collisionvolumeoffsets = "0 0 -1",
		collisionvolumescales = "26 24 16",
		collisionvolumetype = "box",
		corpse = "dead",
		explodeas = "smallexplosiongeneric",
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 1800,
		health = 355,
		maxslope = 16,
		speed = 40.5,
		maxwaterdepth = 0,
		movementclass = "BOT3",
		movestate = 0,
		objectname = "Units/ARMMARK.s3o",
		onoffable = false,
		radardistance = 2200,
		script = "Units/ARMMARK.cob",
		seismicsignature = 0,
		selfdestructas = "smallExplosionGenericSelfd",
		sightdistance = 900,
		sonardistance = 0,
		turninplace = true,
		turninplaceanglelimit = 90,
		turninplacespeedlimit = 0.891,
		turnrate = 580.75,
		customparams = {
			unitgroup = 'util',
			model_author = "FireStorm",
			normaltex = "unittextures/Arm_normal.dds",
			subfolder = "armbots/t2",
			techlevel = 2,
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "-2.9700012207 0.0 2.42810058594",
				collisionvolumescales = "23.0599975586 13.375 26.6004943848",
				collisionvolumetype = "Box",
				damage = 280,
				featuredead = "HEAP",
				footprintx = 2,
				footprintz = 2,
				height = 20,
				metal = 76,
				object = "Units/armmark_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "35.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 256,
				footprintx = 2,
				footprintz = 2,
				height = 4,
				metal = 38,
				object = "Units/arm2X2A.s3o",
				reclaimable = true,
				resurrectable = 0,
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:radarpulse_t2",
			},
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
				[1] = "kbarmmov",
			},
			select = {
				[1] = "akradsel",
			},
		},
	},
}
