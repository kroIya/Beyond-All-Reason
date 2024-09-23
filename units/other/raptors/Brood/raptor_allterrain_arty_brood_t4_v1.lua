return {
	raptor_allterrain_arty_brood_t4_v1 = {
		maxacc = 1.15,
		maxdec = 9.2,
		energycost = 12320,
		metalcost = 396,
		builder = false,
		buildpic = "raptors/raptorbroodarty.DDS",
		buildtime = 270000,
		canattack = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = "1",
		capturable = false,
		category = "RAPTOR",
		collisionvolumeoffsets = "0 -1 0",
		collisionvolumescales = "120 80 120",
		collisionvolumetest = 1,
		collisionvolumetype = "CylY",
		defaultmissiontype = "Standby",
		explodeas = "LOBBER_MORPH",
		footprintx = 4,
		footprintz = 4,
		hidedamage = 1,
		idleautoheal = 20,
		idletime = 300,
		leavetracks = true,
		maneuverleashlength = "640",
		mass = 40000,
		health = 8000,
		maxslope = 18,
		speed = 84.0,
		maxwaterdepth = 0,
		movementclass = "RAPTORALLTERRAINBIG2HOVER",
		noautofire = false,
		nochasecategory = "VTOL SPACE",
		objectname = "Raptors/raptor_artillery_brood_big.s3o",
		script = "Raptors/raptor_artillery_v2.cob",
		seismicsignature = 0,
		selfdestructas = "LOBBER_MORPH",
		side = "THUNDERBIRDS",
		sightdistance = 1000,
		smoothanim = true,
		trackoffset = 6,
		trackstrength = 3,
		trackstretch = 1,
		tracktype = "RaptorTrack",
		trackwidth = 100,
		turninplace = true,
		turninplaceanglelimit = 90,
		turnrate = 600,
		unitname = "raptor_allterrain_arty_brood_t4_v1",
		upright = false,
		waterline = 10,
		workertime = 0,
		customparams = {
			subfolder = "other/raptors",
			model_author = "KDR_11k, Beherith",
			normalmaps = "yes",
			normaltex = "unittextures/chicken_l_normals.png",
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:blood_spray",
				[2] = "custom:blood_explode",
				[3] = "custom:dirt",
			},
			pieceexplosiongenerators = {
				[1] = "blood_spray",
				[2] = "blood_spray",
				[3] = "blood_spray",
			},
		},
		weapondefs = {
			bloodyeggs = {
				accuracy = 1024,
				areaofeffect = 128,
				collidefriendly = 0,
				collidefeature = 0,
				avoidfeature = 0,
				avoidfriendly = 0,
				burst = 4,
				burstrate = 0.001,
				canattackground = false,
				cegtag = "arty-heavy-purple",
				craterareaofeffect = 128,
				craterboost = 0.2,
				cratermult = 0.2,
				edgeeffectiveness = 0.63,
				explosiongenerator = "custom:dirt",
				impulseboost = 0,
				impulsefactor = 0.4,
				intensity = 0.7,
				interceptedbyshieldtype = 0,
				model = "Raptors/s_raptor_white.s3o",
				name = "GOOLAUNCHER",
				noselfdamage = true,
				proximitypriority = -4,
				range = 2000,
				reloadtime = 10,
				rgbcolor = "0.5 0 1",
				size = 5.5,
				sizedecay = 0.09,
				soundhit = "smallraptorattack",
				soundstart = "bugarty",
				sprayangle = 1024,
				tolerance = 5000,
				turret = true,
				weapontimer = 0.2,
				weaponvelocity = 520,
				damage = {
					default = 1,
					shields = 200,
				},
				customparams = {
					spawns_name = "raptor_land_swarmer_brood_t2_v1",
					spawns_surface = "LAND SEA", -- Available: "LAND SEA"
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "MOBILE",
				def = "bloodyeggs",
				maindir = "0 0 1",
				maxangledif = 50,
				onlytargetcategory = "NOTAIR",
			},
		},
	},
}
