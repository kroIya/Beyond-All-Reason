return {
	armthovr = {
		maxacc = 0.02983,
		maxdec = 0.02983,
		buildangle = 16384,
		energycost = 8300,
		metalcost = 700,
		buildpic = "ARMTHOVR.DDS",
		buildtime = 20350,
		canmove = true,
		cantbetransported = true,
		category = "",
		collisionvolumeoffsets = "-1 -1 -3",
		collisionvolumescales = "56 56 75",
		collisionvolumetype = "CylZ",
		corpse = "DEAD",
		explodeas = "hugeExplosionGeneric",
		footprintx = 4,
		footprintz = 4,
		idleautoheal = 5,
		idletime = 1800,
		health = 5700,
		speed = 53.1,
		minwaterdepth = 12,
		movementclass = "HHOVER4",
		nochasecategory = "ALL",
		objectname = "Units/ARMTHOVR.s3o",
		releaseheld = true,
		script = "Units/ARMTHOVR.cob",
		seismicsignature = 0,
		selfdestructas = "hugeExplosionGenericSelfd",
		sightdistance = 325,
		transportcapacity = 20,
		transportsize = 3,
		transportunloadmethod = 0,
		turninplace = true,
		turninplaceanglelimit = 90,
		turninplacespeedlimit = 1.2,
		turnrate = 370,
		waterline = 4,
		customparams = {
			model_author = "Beherith",
			normaltex = "unittextures/Arm_normal.dds",
			subfolder = "armhovercraft",
		},
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "-1 -1 -3",
				collisionvolumescales = "56 56 75",
				collisionvolumetype = "CylZ",
				damage = 3096,
				footprintx = 4,
				footprintz = 4,
				height = 20,
				metal = 432,
				object = "Units/armthovr_dead.s3o",
				reclaimable = true,
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:waterwake-small-hover",
				[2] = "custom:bowsplash-small-hover",
				[3] = "custom:hover-wake-large",
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
				[1] = "hovt1transok",
			},
			select = {
				[1] = "hovt1transsel",
			},
		},
	},
}
