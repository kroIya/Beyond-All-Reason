return {
	legtriarius = {
		maxacc = 0.02757,
		activatewhenbuilt = true,
		maxdec = 0.02757,
		buildangle = 16384,
		energycost = 8000,
		metalcost = 920,
		buildpic = "legtriarius.DDS",
		buildtime = 11500,
		canmove = true,
		collisionvolumeoffsets = "0 -5 1",
		collisionvolumescales = "34 34 82",
		collisionvolumetype = "CylZ",
		corpse = "DEAD",
		explodeas = "mediumexplosiongeneric",
		floater = true,
		footprintx = 4,
		footprintz = 4,
		idleautoheal = 5,
		idletime = 1800,
		health = 4000,
		speed = 64,
		minwaterdepth = 12,
		movementclass = "BOAT4",
		movestate = 0,
		nochasecategory = "VTOL",
		objectname = "Units/legtriarius.s3o",
		script = "Units/legtriarius.cob",
		seismicsignature = 0,
		selfdestructas = "mediumexplosiongenericSelfd",
		sightdistance = 500,
		sonardistance = 400,
		turninplace = true,
		turninplaceanglelimit = 90,
		turnrate = 295,
		waterline = 0,
		customparams = {
			unitgroup = 'weaponsub',
			model_author = "Mr Bob",
			normaltex = "unittextures/cor_normal.dds",
			subfolder = "CorShips",
		},
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "0.0580749511719 -0.062504465332 -0.201034545898",
				collisionvolumescales = "33.2652587891 20.5109710693 79.4415893555",
				collisionvolumetype = "Box",
				damage = 3360,
				featuredead = "HEAP",
				footprintx = 5,
				footprintz = 5,
				height = 4,
				metal = 480,
				object = "Units/corroy_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 4032,
				footprintx = 2,
				footprintz = 2,
				height = 4,
				metal = 240,
				object = "Units/cor5X5D.s3o",
				reclaimable = true,
				resurrectable = 0,
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:barrelshot-medium",
				[2] = "custom:waterwake-small",
				[3] = "custom:bowsplash-small",
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
				[1] = "shcormov",
			},
			select = {
				[1] = "shcorsel",
			},
		},
		weapondefs = {
			plasma = {
				areaofeffect = 54,
				avoidfeature = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				explosiongenerator = "custom:genericshellexplosion-medium",
				gravityaffected = "true",
				impulseboost = 0.123,
				impulsefactor = 0.123,
				name = "Heavy long-range plasma cannon",
				noselfdamage = true,
				range = 720,
				reloadtime = 1.9,
				soundhit = "xplomed2",
				soundhitwet = "splshbig",
				soundstart = "cannon3",
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 330,
				damage = {
					default = 290,
					vtol = 60,
				},
			},
			depthcharge = {
				areaofeffect = 24,
				avoidfeature = false,
				avoidfriendly = false,
				burnblow = true,
				collidefriendly = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.9,
				explosiongenerator = "custom:genericshellexplosion-medium-uw",
				flighttime = 3,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				model = "cordepthcharge.s3o",
				name = "Depthcharge launcher",
				noselfdamage = true,
				predictboost = 0,
				range = 400,
				reloadtime = 2,
				soundhit = "xplodep2",
				soundstart = "torpedo1",
				startvelocity = 120,
				tolerance = 1000,
				tracks = true,
				turnrate = 6000,
				turret = true,
				waterweapon = true,
				weaponacceleration = 20,
				weapontimer = 3,
				weapontype = "TorpedoLauncher",
				weaponvelocity = 140,
				damage = {
					default = 225,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "plasma",
				onlytargetcategory = "SURFACE",
				fastautoretargeting = true,
			},
			[2] = {
				badtargetcategory = "NOTSUB",
				def = "DEPTHCHARGE",
				maindir = "0 -1 0",
				maxangledif = 179,
				onlytargetcategory = "CANBEUW UNDERWATER",
			},
		},
	},
}
