return {
	armrock = {
		maxacc = 0.138,
		maxdec = 0.6486,
		energycost = 1000,
		metalcost = 120,
		buildpic = "ARMROCK.DDS",
		buildtime = 2010,
		canmove = true,
		collisionvolumeoffsets = "0 0 2",
		collisionvolumescales = "24 28 24",
		collisionvolumetype = "CylY",
		corpse = "DEAD",
		explodeas = "smallExplosionGeneric",
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 1800,
		health = 720,
		maxslope = 14,
		speed = 50.7,
		maxwaterdepth = 12,
		movementclass = "BOT3",
		movestate = 0,
		nochasecategory = "VTOL",
		objectname = "Units/ARMROCK.s3o",
		script = "Units/ARMROCK.cob",
		seismicsignature = 0,
		selfdestructas = "smallExplosionGenericSelfd",
		sightdistance = 338,
		turninplace = true,
		turninplaceanglelimit = 90,
		turninplacespeedlimit = 1.1484,
		turnrate = 1271.90002,
		upright = true,
		customparams = {
			unitgroup = 'weapon',
			model_author = "Kaiser",
			normaltex = "unittextures/Arm_normal.dds",
			subfolder = "armbots",
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0 0 0",
				collisionvolumescales = "29.8971862793 8.38395690918 32.6823883057",
				collisionvolumetype = "Box",
				damage = 490,
				featuredead = "HEAP",
				footprintx = 2,
				footprintz = 2,
				height = 40,
				metal = 63,
				object = "Units/armrock_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "35.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 295,
				footprintx = 2,
				footprintz = 2,
				height = 4,
				metal = 25,
				object = "Units/arm2X2B.s3o",
				reclaimable = true,
				resurrectable = 0,
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:rocketflare",
			},
			pieceexplosiongenerators = {
				[1] = "deathceg3",
				[2] = "deathceg2",
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
			arm_bot_rocket = {
				areaofeffect = 48,
				avoidfeature = false,
				cegtag = "missiletrailsmall-simple",
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				explosiongenerator = "custom:genericshellexplosion-small",
				firestarter = 70,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				metalpershot = 0,
				model = "cormissile2.s3o",
				name = "Medium g2g rocket launcher",
				noselfdamage = true,
				range = 475,
				reloadtime = 3.8,
				smoketrail = true,
				smokePeriod = 11,
				smoketime = 28,
				smokesize = 3.3,
				smokecolor = 1.0,
				smokeTrailCastShadow = false,
				castshadow = true, --projectile
				soundhit = "xplosml2",
				soundhitwet = "splshbig",
				soundstart = "rocklit1",
				startvelocity = 190,
				texture1 = "null",
				texture2 = "smoketraildark",
				turret = true,
				weaponacceleration = 120,
				weapontype = "MissileLauncher",
				weaponvelocity = 190,
				damage = {
					default = 157,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "ARM_BOT_ROCKET",
				onlytargetcategory = "NOTSUB",
			},
		},
	},
}
