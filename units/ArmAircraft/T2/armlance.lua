return {
	armlance = {
		buildpic = "ARMLANCE.DDS",
		buildtime = 15100,
		canfly = true,
		canmove = true,
		collide = true,
		cruisealtitude = 90,
		energycost = 8000,
		explodeas = "mediumExplosionGeneric",
		footprintx = 3,
		footprintz = 3,
		health = 1920,
		idleautoheal = 5,
		idletime = 1800,
		maxacc = 0.1325,
		maxaileron = 0.01384,
		maxbank = 0.8,
		maxdec = 0.075,
		maxelevator = 0.01009,
		maxpitch = 0.625,
		maxrudder = 0.00559,
		maxslope = 10,
		maxwaterdepth = 0,
		metalcost = 400,
		nochasecategory = "VTOL",
		objectname = "Units/ARMLANCE.s3o",
		radardistance = 800,
		script = "Units/ARMLANCE.cob",
		seismicsignature = 0,
		selfdestructas = "mediumExplosionGenericSelfd",
		sightdistance = 500,
		sonardistance = 800,
		speed = 285,
		speedtofront = 0.06417,
		turnradius = 64,
		usesmoothmesh = true,
		wingangle = 0.06259,
		wingdrag = 0.185,
		customparams = {
			model_author = "Flaka",
			normaltex = "unittextures/Arm_normal.dds",
			subfolder = "ArmAircraft/T2",
			techlevel = 2,
			unitgroup = "sub",
		},
		sfxtypes = {
			crashexplosiongenerators = {
				[1] = "crashing-small",
				[2] = "crashing-small",
				[3] = "crashing-small2",
				[4] = "crashing-small3",
				[5] = "crashing-small3",
			},
			pieceexplosiongenerators = {
				[1] = "airdeathceg3",
				[2] = "airdeathceg4",
				[3] = "airdeathceg2",
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
				[1] = "vtolarmv",
			},
			select = {
				[1] = "vtolarac",
			},
		},
		weapondefs = {
			armair_torpedo = {
				areaofeffect = 16,
				avoidfeature = false,
				avoidfriendly = false,
				burnblow = true,
				burst = 3,
				burstrate = 0.3,
				cegtag = "torpedotrail-small",
				collidefriendly = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				explosiongenerator = "custom:genericshellexplosion-large-uw",
				flighttime = 4,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				model = "cortorpedo.s3o",
				name = "Light homing torpedo launcher",
				noselfdamage = true,
				range = 650,
				reloadtime = 6,
				soundhit = "xplodep3",
				soundhitvolume = 3.5,
				soundhitwet = "splsmed",
				soundhitwetvolume = 14,
				soundstart = "bombrel",
				startvelocity = 35,
				tolerance = 2000,
				tracks = true,
				turnrate = 20000,
				turret = false,
				waterweapon = true,
				weaponacceleration = 35,
				weapontimer = 6,
				weapontype = "TorpedoLauncher",
				weaponvelocity = 200,
				customparams = {
					speceffect = "torpwaterpen",
					when = "ypos<0",
				},
				damage = {
					default = 375,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "NOTSHIP",
				def = "ARMAIR_TORPEDO",
				onlytargetcategory = "NOTHOVER",
			},
		},
	},
}
