return {
	legfig = {
		acceleration = 0.35,
		airsightdistance = 950,
		blocking = false,
		maxdec = 0.075,
		energycost = 1600,
		metalcost = 40,
		buildpic = "LEGFIG.DDS",
		buildtime = 2000,
		canfly = true,
		canmove = true,
		category = "",
		collide = false,
		cruisealtitude = 125,
		explodeas = "smallExplosionGenericAir",
		footprintx = 2,
		footprintz = 2,
		maxacc = 0.2,
		maxaileron = 0.0144,
		maxbank = 0.8,
		health = 220,
		maxelevator = 0.01065,
		maxpitch = 0.625,
		maxrudder = 0.00615,
		maxslope = 10,
		speed = 270.0,
		maxwaterdepth = 0,
		nochasecategory = "NOTAIR",
		objectname = "Units/LEGFIG.s3o",
		radardistance = 400,
		script = "Units/LEGFIG.cob",
		seismicsignature = 0,
		selfdestructas = "smallExplosionGenericAir",
		sightdistance = 700,
		speedtofront = 0.06417,
		turnradius = 48,
		turnrate = 950,
		usesmoothmesh = true,
		wingangle = 0.06315,
		wingdrag = 0.185,
		customparams = {
			unitgroup = 'aa',
			model_author = "ZephyrSkies",
			normaltex = "unittextures/leg_normal.dds",
			subfolder = "Legion/Air",
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
			semiauto = {
				accuracy = 7,
				areaofeffect = 0,
				avoidfeature = true,
				avoidfriendly = false,
				burst = 2,
				burstrate = 0.1,
				burnblow = false,
				collideFriendly = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				duration = 0.02,
				edgeeffectiveness = 0.85,
				explosiongenerator = "custom:plasmahit-sparkonly",
				fallOffRate = 0.2,
				firestarter = 0,
				impulseboost = 0.4,
				impulsefactor = 1.5,
				intensity = 0.8,
				name = "Rapid-fire a2a machine guns",
				noselfdamage = true,
				ownerExpAccWeight = 4.0,
				predictboost = 0.5,
				proximitypriority = 3,
				range = 600,
				reloadtime = 0.6,
				rgbcolor = "1 0.4 0.95",
				soundhit = "bimpact3",
				soundhitwet = "splshbig",
				soundstart = "minigun3",
				soundstartvolume = 3,
				sprayangle = 500,
				thickness = 0.6,
				tolerance = 2400,
				turret = true,
				weapontype = "LaserCannon",
				weaponvelocity = 1500,
				damage = {
					commanders = 1,
					default = 2,
					vtol = 36,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "NOTAIR",
				def = "SEMIAUTO",
				maindir = "0 0 1",
				maxangledif = 20,
				onlytargetcategory = "VTOL",
			},
		},
	},
}