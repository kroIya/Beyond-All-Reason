return {
	armfig = {
		acceleration = 0.3,
		airsightdistance = 950,
		blocking = false,
		maxdec = 0.075,
		energycost = 2900,
		metalcost = 73,
		buildpic = "ARMFIG.DDS",
		buildtime = 3500,
		canfly = true,
		canmove = true,
		category = "",
		collide = false,
		cruisealtitude = 125,
		explodeas = "smallExplosionGenericAir",
		footprintx = 2,
		footprintz = 2,
		maxacc = 0.1825,
		maxaileron = 0.0144,
		maxbank = 0.8,
		health = 167,
		maxelevator = 0.01065,
		maxpitch = 0.625,
		maxrudder = 0.00615,
		maxslope = 10,
		speed = 289.2,
		maxwaterdepth = 0,
		nochasecategory = "NOTAIR",
		objectname = "Units/ARMFIG.s3o",
		script = "Units/ARMFIG.cob",
		seismicsignature = 0,
		selfdestructas = "smallExplosionGenericAir",
		sightdistance = 210,
		speedtofront = 0.06417,
		turnradius = 64,
		turnrate = 850,
		usesmoothmesh = true,
		wingangle = 0.06315,
		wingdrag = 0.185,
		customparams = {
			unitgroup = 'aa',
			model_author = "FireStorm",
			normaltex = "unittextures/Arm_normal.dds",
			subfolder = "armaircraft",
			fighter = 1,
		},
		sfxtypes = {
			crashexplosiongenerators = {
				[1] = "crashing-tiny",
				[2] = "crashing-tiny2",
			},
			pieceexplosiongenerators = {
				[1] = "airdeathceg2",
				[2] = "airdeathceg3",
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
			armvtol_missile = {
				areaofeffect = 8,
				avoidfeature = false,
				avoidfriendly = false,
				burnblow = true,
				canattackground = false,
				cegtag = "missiletrailfighter",
				collidefriendly = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				explosiongenerator = "custom:genericshellexplosion-tiny-air",
				firestarter = 0,
				flighttime = 1.2,
				impulseboost = 0,
				impulsefactor = 0,
				metalpershot = 0,
				model = "cormissile.s3o",
				name = "Light a2a missile launcher",
				noselfdamage = true,
				range = 680,
				reloadtime = 0.9,
				smoketrail = false,
				smokePeriod = 4,
				smoketime = 8,
				smokesize = 1.8,
				smokecolor = 0.55,
				smokeTrailCastShadow = false,
				castshadow = false,
				soundhit = "xplosml2",
				soundhitwet = "splshbig",
				soundstart = "Rocklit3",
				startvelocity = 450,
				texture1 = "null",
				texture2 = "smoketrail",
				tolerance = 12000,
				tracks = true,
				turnrate = 20000,
				weaponacceleration = 400,
				weapontype = "MissileLauncher",
				weaponvelocity = 850,
				damage = {
					commanders = 4,
					default = 12,
					vtol = 125,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "NOTAIR",
				def = "ARMVTOL_MISSILE",
				onlytargetcategory = "VTOL",
			},
		},
	},
}
