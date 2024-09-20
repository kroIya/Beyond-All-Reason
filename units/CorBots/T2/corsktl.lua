return {
	corsktl = {
		maxacc = 0.138,
		maxdec = 0.6486,
		energycost = 26000,
		metalcost = 540,
		buildpic = "CORSKTL.DDS",
		buildtime = 17000,
		canmove = true,
		cantbetransported = true,
		category = "",
		cloakcost = 150,
		cloakcostmoving = 400,
		collisionvolumeoffsets = "0.5 -1 0",
		collisionvolumescales = "22 14 22",
		collisionvolumetype = "CylY",
		explodeas = "crawl_blast",
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 1800,
		health = 355,
		maxslope = 255,
		speed = 84.0,
		maxwaterdepth = 30,
		mincloakdistance = 60,
		movementclass = "ABOTBOMB2",
		nochasecategory = "VTOL",
		objectname = "Units/CORSKTL.s3o",
		script = "Units/CORSKTL.cob",
		seismicsignature = 4,
		selfdestructas = "corsktlSelfd",
		selfdestructcountdown = 0,
		sightdistance = 260,
		turninplace = true,
		turninplaceanglelimit = 90,
		turninplacespeedlimit = 1.155,
		turnrate = 1290.29993,
		upright = true,
		customparams = {
			unitgroup = 'explo',
			model_author = "Beherith",
			normaltex = "unittextures/cor_normal.dds",
			subfolder = "corbots/t2",
			techlevel = 2,
			instantselfd = true,
		},
		sfxtypes = {
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
				[1] = "servsml6",
			},
			select = {
				[1] = "servsml6",
			},
		},
		weapondefs = {
			crawl_detonator = {
				areaofeffect = 5,
				avoidfeature = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				explosiongenerator = "",
				firesubmersed = true,
				gravityaffected = "true",
				impulseboost = 0,
				impulsefactor = 0,
				name = "Mine Detonator",
				range = 1,
				reloadtime = 0.1,
				soundhitwet = "splshbig",
				weapontype = "Cannon",
				weaponvelocity = 1000,
				damage = {
					crawlingbombs = 1000,
					default = 0,
				},
				customparams = {
					bogus = 1
				}
			},
			crawl_dummy = {
				areaofeffect = 0,
				avoidfeature = false,
				avoidground = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				explosiongenerator = "",
				firesubmersed = true,
				impulseboost = 0,
				impulsefactor = 0,
				name = "Crawlingbomb Dummy Weapon",
				range = 80,
				reloadtime = 0.1,
				soundhitwet = "sizzle",
				tolerance = 100000,
				waterweapon = true,
				weapontype = "Melee",
				weaponvelocity = 100000,
				damage = {
					default = 0,
				},
				customparams = {
					bogus = 1
				}
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "CRAWL_DUMMY",
				onlytargetcategory = "SURFACE",
			},
			[2] = {
				def = "CRAWL_DETONATOR",
				onlytargetcategory = "NOTSUB",
			},
		},
	},
}
