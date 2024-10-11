return {
	corthovr = {
		buildangle = 16384,
		buildpic = "CORTHOVR.DDS",
		buildtime = 19600,
		canmove = true,
		cantbetransported = true,
		collisionvolumeoffsets = "0 -17 -2",
		collisionvolumescales = "60 60 80",
		collisionvolumetype = "CylZ",
		corpse = "DEAD",
		energycost = 8000,
		explodeas = "largeexplosiongeneric",
		footprintx = 4,
		footprintz = 4,
		health = 5600,
		idleautoheal = 5,
		idletime = 1800,
		maxacc = 0.03101,
		maxdec = 0.03101,
		metalcost = 700,
		minwaterdepth = 12,
		movementclass = "HHOVER4",
		nochasecategory = "ALL",
		objectname = "Units/CORTHOVR.s3o",
		releaseheld = true,
		script = "Units/CORTHOVR.cob",
		seismicsignature = 0,
		selfdestructas = "largeExplosionGenericSelfd",
		sightdistance = 325,
		speed = 55.2,
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
			normaltex = "unittextures/cor_normal.dds",
			subfolder = "CorHovercraft",
		},
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "2.68968200684 -3.21411132802e-05 0.200881958008",
				collisionvolumescales = "72.0837402344 61.3697357178 89.0081481934",
				collisionvolumetype = "Box",
				damage = 3012,
				footprintx = 4,
				footprintz = 4,
				height = 20,
				metal = 423,
				object = "Units/corthovr_dead.s3o",
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
				[1] = "hovlgok2",
			},
			select = {
				[1] = "hovlgsl2",
			},
		},
	},
}
