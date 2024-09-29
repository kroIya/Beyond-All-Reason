return {
	armfast = {
		maxacc = 0.414,
		maxdec = 1.29375,
		energycost = 4600,
		metalcost = 190,
		buildpic = "ARMFAST.DDS",
		buildtime = 3960,
		canmove = true,
		collisionvolumeoffsets = "0 -2 1",
		collisionvolumescales = "25 37 11",
		collisionvolumetype = "box",
		corpse = "DEAD",
		explodeas = "tinyExplosionGeneric",
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 1800,
		health = 690,
		maxslope = 17,
		speed = 111.3,
		maxwaterdepth = 12,
		movementclass = "BOT3",
		nochasecategory = "VTOL",
		objectname = "Units/ARMFAST.s3o",
		script = "Units/ARMFAST.cob",
		seismicsignature = 0,
		selfdestructas = "tinyExplosionGenericSelfd",
		sightdistance = 351,
		turninplace = true,
		turninplaceanglelimit = 90,
		turninplacespeedlimit = 2.4486,
		turnrate = 1644.5,
		upright = true,
		customparams = {
			unitgroup = 'weapon',
			model_author = "FireStorm, PtaQ",
			normaltex = "unittextures/Arm_normal.dds",
			subfolder = "armbots/t2",
			techlevel = 2,
			weapon1turretx = 400,
			weapon1turrety = 500,
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "-2.49777984619 -2.74520318604 -3.11322021484",
				collisionvolumescales = "50.1881866455 6.02409362793 37.503112793",
				collisionvolumetype = "Box",
				damage = 500,
				featuredead = "HEAP",
				footprintx = 2,
				footprintz = 2,
				height = 20,
				metal = 105,
				object = "Units/armfast_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "35.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 300,
				footprintx = 2,
				footprintz = 2,
				height = 4,
				metal = 42,
				object = "Units/arm2X2E.s3o",
				reclaimable = true,
				resurrectable = 0,
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:barrelshot-tiny",
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
				[1] = "kbarmsel",
			},
		},
		weapondefs = {
			arm_fast = {
				areaofeffect = 16,
				avoidfeature = false,
				burst = 5,
				burstrate = 0.1,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				cylindertargeting = 1,
				edgeeffectiveness = 0.15,
				explosiongenerator = "custom:plasmahit-small",
				impulseboost = 0.123,
				impulsefactor = 0.123,
				intensity = 0.7,
				name = "Rapid-firing close-quarters g2g plasma guns",
				noselfdamage = true,
				range = 220,
				reloadtime = 0.5,
				rgbcolor = "1 0.95 0.4",
				size = 2.05,
				soundhitwet = "splshbig",
				soundstart = "fastemg",
				turret = true,
				weapontimer = 0.6,
				weapontype = "Cannon",
				weaponvelocity = 500,
				damage = {
					default = 12,
					vtol = 1,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "ARM_FAST",
				onlytargetcategory = "NOTSUB",
			},
		},
	},
}
