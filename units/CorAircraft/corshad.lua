return {
	corshad = {
		acceleration = 0.05,
		blocking = false,
		maxdec = 0.055,
		energycost = 4600,
		metalcost = 150,
		buildpic = "CORSHAD.DDS",
		buildtime = 5050,
		canfly = true,
		canmove = true,
		collide = true,
		cruisealtitude = 165,
		explodeas = "mediumexplosiongeneric",
		footprintx = 3,
		footprintz = 3,
		idleautoheal = 5,
		idletime = 1800,
		maxacc = 0.0575,
		maxaileron = 0.01421,
		maxbank = 0.8,
		health = 680,
		maxelevator = 0.01046,
		maxpitch = 0.625,
		maxrudder = 0.00596,
		maxslope = 10,
		speed = 234.0,
		maxwaterdepth = 0,
		noautofire = true,
		nochasecategory = "VTOL",
		objectname = "Units/CORSHAD.s3o",
		script = "Units/CORSHAD.cob",
		seismicsignature = 0,
		selfdestructas = "mediumExplosionGenericSelfd",
		sightdistance = 169,
		speedtofront = 0.06183,
		turnradius = 64,
		turnrate = 800,
		usesmoothmesh = true,
		wingangle = 0.06296,
		wingdrag = 0.145,
		customparams = {
			unitgroup = 'weapon',
			model_author = "Mr Bob",
			normaltex = "unittextures/cor_normal.dds",
			subfolder = "coraircraft",
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
				[1] = "airdeathceg2",
				[2] = "airdeathceg3",
				[3] = "airdeathceg4",
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
				[1] = "vtolcrmv",
			},
			select = {
				[1] = "vtolcrac",
			},
		},
		weapondefs = {
			corbomb = {
				accuracy = 500,
				areaofeffect = 168,
				avoidfeature = false,
				burst = 5,
				burstrate = 0.26667,
				collidefriendly = false,
				commandfire = false,
				craterareaofeffect = 168,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.4,
				explosiongenerator = "custom:genericshellexplosion-medium-bomb",
				gravityaffected = "true",
				impulseboost = 0.3,
				impulsefactor = 0.3,
				model = "airbomb.s3o",
				name = "Medium a2g incinerating warheads",
				noselfdamage = true,
				range = 1280,
				reloadtime = 6,
				soundhit = "bombssml1",
				soundhitwet = "splslrg",
				soundstart = "bombrel",
				sprayangle = 300,
				weapontype = "AircraftBomb",
				damage = {
					default = 112,
					subs = 35,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "MOBILE",
				def = "CORBOMB",
				onlytargetcategory = "NOTSUB",
			},
		},
	},
}
