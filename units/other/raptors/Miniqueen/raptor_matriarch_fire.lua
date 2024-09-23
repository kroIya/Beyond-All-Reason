return {
	raptor_matriarch_fire = {
		maxacc = 0.1,
		airsightdistance = 2400,
		autoheal = 5,
		maxdec = 0.1,
		energycost = 2000000,
		metalcost = 50000,
		builddistance = 1000,
		builder = false,
		buildpic = "raptors/raptor_miniqueen_fire.DDS",
		buildtime = 1500000,
		canattack = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = "1",
		canrepair = 0,
		canreclaim = 0,
		cantbetransported = true,
		capturable = false,
		category = "RAPTOR",
		collisionspherescale = 1.75,
		collisionvolumeoffsets = "0 -30 23",
		collisionvolumescales = "60 113 105",
		collisionvolumetest = 1,
		collisionvolumetype = "box",
		defaultmissiontype = "Standby",
		explodeas = "BUG_DEATH",
		footprintx = 3,
		footprintz = 3,
		leavetracks = true,
		maneuverleashlength = 2000,
		mass = 2000000,
		health = 60000,
		maxslope = 40,
		speed = 67.5,
		maxwaterdepth = 0,
		movementclass = "RAPTORQUEENHOVER",
		noautofire = false,
		nochasecategory = "VTOL SPACE",
		objectname = "Raptors/raptor_miniqueen_fire.s3o",
		pushresistant = true,
		script = "Raptors/raptor_miniqueen.cob",
		seismicsignature = 0,
		selfdestructas = "BUG_DEATH",
		side = "THUNDERBIRDS",
		sightdistance = 500,
		smoothanim = true,
		trackoffset = 18,
		trackstrength = 3,
		trackstretch = 1,
		tracktype = "RaptorTrack",
		trackwidth = 80,
		turninplace = true,
		turninplaceanglelimit = 1,
		turnrate = 100,
		unitname = "raptor_matriarch_basic",
		upright = false,
		waterline = 40,
		workertime = 5000,
		customparams = {
			subfolder = "other/raptors",
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
			flamethrowerspike = {
				areaofeffect = 64,
				collidefriendly = 0,
				collidefeature = 0,
				avoidfeature = 0,
				avoidfriendly = 0,
				avoidground = false,
				bounceSlip = 1.0,
				burst = 12,
				burstrate = 0.03333,
				cegtag = "burnflamethermite",
				colormap = "1 0.95 0.9 0.032   0.55 0.55 0.40 0.028   0.40 0.28 0.19 0.024   0.033 0.018 0.011 0.04   0.0 0.0 0.0 0.01",
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.3,
				explosiongenerator = "custom:burnthermite",
				firestarter = 100,
				flamegfxtime = 1,
				impulseboost = 0,
				impulsefactor = 0,
				intensity = 0.65,
				name = "FlameThrower",
				noselfdamage = true,
				proximitypriority = 4,
				range = 300,
				reloadtime = 0,
				rgbcolor = "1 0.94 0.88",
				rgbcolor2 = "0.9 0.83 0.77",
				sizegrowth = 1.5,
				soundhitwet = "sizzle",
				soundstart = "cflamhvy1",
				soundtrigger = false,
				sprayangle = 100,
				targetborder = 0.75,
				targetmoveerror = 0.001,
				tolerance = 2500,
				turret = true,
				weapontimer = 1,
				weapontype = "Flame",
				weaponvelocity = 265,
				damage = {
					default = 20,
				},
			},
			flamethrowermain = {
				areaofeffect = 64,
				collidefriendly = 0,
				collidefeature = 0,
				avoidfeature = 0,
				avoidfriendly = 0,
				avoidground = false,
				bounceSlip = 1.0,
				burst = 12,
				burstrate = 0.03333,
				cegtag = "burnflamethermite",
				colormap = "1 0.95 0.9 0.032   0.55 0.55 0.40 0.028   0.40 0.28 0.19 0.024   0.033 0.018 0.011 0.04   0.0 0.0 0.0 0.01",
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.3,
				explosiongenerator = "custom:burnthermite",
				firestarter = 100,
				flamegfxtime = 1,
				impulseboost = 0,
				impulsefactor = 0,
				intensity = 0.65,
				name = "FlameThrower",
				noselfdamage = true,
				proximitypriority = 4,
				range = 500,
				reloadtime = 0,
				rgbcolor = "1 0.94 0.88",
				rgbcolor2 = "0.9 0.83 0.77",
				sizegrowth = 1.25,
				soundhitwet = "sizzle",
				soundstart = "cflamhvy1",
				soundtrigger = false,
				sprayangle = 100,
				targetborder = 0.75,
				targetmoveerror = 0.001,
				tolerance = 2500,
				turret = true,
				weapontimer = 1,
				weapontype = "Flame",
				weaponvelocity = 265,
				damage = {
					default = 40,
				},
			},
		},
		weapons = {
			[1] = {
				def = "flamethrowerspike",
				maindir = "0 0 1",
				maxangledif = 155,
				badtargetcategory = "SPACE",
			},
			[2] = {
				badtargetcategory = "NOTAIR",
				def = "flamethrowerspike",
			},
			[3] = {
				badtargetcategory = "WEAPON",
				def = "flamethrowerspike",
			},
			[4] = {
				badtargetcategory = "NOWEAPON",
				def = "flamethrowerspike",
			},
			[5] = {
				def = "flamethrowermain",
				maxangledif = 180,
				badtargetcategory = "SPACE",
			},
		},
	},
}
