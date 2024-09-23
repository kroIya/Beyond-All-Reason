return {
	legvenator = {
		maxacc= 0.6,
		airsightdistance = 1100,
		blocking = false,
		maxdec = 0.0675,
		energycost = 3200,
		metalcost = 110,
		buildpic = "legvenator.DDS",
		buildtime = 8400,
		canfly = true,
		canmove = true,
		category = "",
		collide = false,
		cruisealtitude = 160,
		explodeas = "smallExplosionGenericAir",
		footprintx = 2,
		footprintz = 2,
		maxacc= 0.2075,
		maxaileron = 0.01488,
		maxbank = 0.7,
		health = 210,
		maxelevator = 0.01113,
		maxpitch = 0.525,
		maxrudder = 0.00463,
		maxslope = 10,
		speed = 450,
		maxwaterdepth = 0,
		nochasecategory = "NOTAIR",
		objectname = "Units/legvenator.s3o",
		script = "Units/legvenator.cob",
		seismicsignature = 0,
		selfdestructas = "smallExplosionGenericAir",
		sightdistance = 250,
		speedtofront = 0.06475,
		stealth = true,
		turnradius = 90,
		turnrate = 700,
		usesmoothmesh = true,
		wingangle = 0.06363,
		wingdrag = 0.21,
		customparams = {
			unitgroup = 'aa',
			model_author = "Hornet",
			normaltex = "unittextures/cor_normal.dds",
			subfolder = "coraircraft/t2",
			techlevel = 2,
			fighter = 1,
		},
		sfxtypes = {
			crashexplosiongenerators = {
				[1] = "crashing-tiny",
				[2] = "crashing-tiny2",
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
				[1] = "vtolcrmv",
			},
			select = {
				[1] = "vtolcrac",
			},
		},
		weapondefs = {
			birdshot = {
				areaofeffect = 100,
				avoidfeature = false,
				burnblow = true,
				craterboost = 0,
				cratermult = 0,
				collidefriendly = false,
				edgeeffectiveness = 0.65,
				explosiongenerator = "custom:genericshellexplosion-small",
				impulseboost = 0.2,
				impulsefactor = 0.2,
				intensity = 3,
				name = "Birdshot Cannon",
				noselfdamage = true,
				predictboost = 1,
				projectiles = 3,
				range = 700,
				reloadtime = 2.5,
				rgbcolor = "1 0.75 0.25",
				size = 2,
				soundhit = "flakhit",
				soundhitwet = "splshsml",
				soundstart = "flakfire",
				soundstartvolume = 6,
				sprayangle = 200,
				turret = true,
				weapontimer = 1,
				weapontype = "Cannon",
				weaponvelocity = 1600,
				damage = {
					commanders = 8,
					default = 24,
					vtol = 480,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "NOTAIR",
				def = "birdshot",
				onlytargetcategory = "VTOL",
				maindir = "0 0 1",
				maxangledif = 25,
				fastautoretargeting = true,
				weaponAimAdjustPriority = 20,
			},
		},
	},
}
