return {
	armsfig2 = {
		airsightdistance = 950,
		blocking = false,
		buildpic = "ARMSFIG2.DDS",
		buildtime = 5500,
		canfly = true,
		canmove = true,
		cansubmerge = true,
		collide = false,
		cruisealtitude = 140,
		energycost = 4500,
		explodeas = "smallExplosionGenericAir",
		footprintx = 2,
		footprintz = 2,
		health = 220,
		maxacc = 0.2075,
		maxaileron = 0.01403,
		maxbank = 0.8,
		maxdec = 0.1,
		maxelevator = 0.01028,
		maxpitch = 0.625,
		maxrudder = 0.00578,
		maxslope = 10,
		maxwaterdepth = 255,
		metalcost = 90,
		nochasecategory = "NOTAIR",
		objectname = "Units/ARMSFIG2.s3o",
		script = "Units/ARMSFIG2.cob",
		seismicsignature = 0,
		selfdestructas = "smallExplosionGenericAir",
		sightdistance = 230,
		speed = 310.79999,
		speedtofront = 0.07,
		turnradius = 64,
		usesmoothmesh = true,
		wingangle = 0.06278,
		wingdrag = 0.235,
		customparams = {
			fighter = 1,
			model_author = "FireStorm",
			normaltex = "unittextures/Arm_normal.dds",
			subfolder = "ArmSeaplanes",
			unitgroup = "aa",
		},
		sfxtypes = {
			crashexplosiongenerators = {
				[1] = "crashing-tiny",
				[2] = "crashing-tiny2",
			},
			pieceexplosiongenerators = {
				[1] = "airdeathceg2",
				[2] = "airdeathceg3",
				[3] = "airdeathceg4",
			},
		},
		sounds = {
			build = "nanlath1",
			canceldestruct = "cancel2",
			repair = "repair1",
			underattack = "warning1",
			working = "reclaim1",
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
				[1] = "vtolcrmv",
			},
			select = {
				[1] = "seapsel1",
			},
		},
		weapondefs = {
			armsfig_weapon = {
				areaofeffect = 8,
				avoidfeature = false,
				avoidfriendly = false,
				burnblow = true,
				canattackground = false,
				castshadow = false,
				cegtag = "missiletrailfighter",
				collidefriendly = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				explosiongenerator = "custom:genericshellexplosion-tiny-air",
				firestarter = 0,
				flighttime = 1.3,
				impulseboost = 0,
				impulsefactor = 0,
				metalpershot = 0,
				model = "cormissile.s3o",
				name = "Guided a2a missile launcher",
				noselfdamage = true,
				range = 710,
				reloadtime = 0.83333,
				smokecolor = 0.55,
				smokeperiod = 4,
				smokesize = 1.8,
				smoketime = 8,
				smoketrail = false,
				smoketrailcastshadow = false,
				soundhit = "xplosml2",
				soundhitwet = "splshbig",
				soundstart = "Rocklit3",
				startvelocity = 480,
				texture1 = "null",
				texture2 = "smoketrail",
				tolerance = 8000,
				tracks = true,
				turnrate = 22000,
				turret = true,
				weaponacceleration = 425,
				weapontimer = 5,
				weapontype = "MissileLauncher",
				weaponvelocity = 900,
				damage = {
					commanders = 4,
					default = 12,
					vtol = 210,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "NOTAIR",
				def = "ARMSFIG_WEAPON",
				onlytargetcategory = "VTOL",
			},
		},
	},
}
