return {
	leginf = {
		maxacc = 0.0098,
		airsightdistance = 1050,
		maxdec = 0.0196,
		energycost = 30000,
		metalcost = 2000,
		buildpic = "LEGINF.DDS",
		buildtime = 33000,
		canmove = true,
		category = "",
		collisionvolumeoffsets = "0 -10 0",
		collisionvolumescales = "47 31 57",
		collisionvolumetype = "Box",
		corpse = "DEAD",
		explodeas = "hugeexplosiongeneric",
		footprintx = 4,
		footprintz = 4,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		mass = 5001,
		health = 3650,
		maxslope = 14,
		speed = 37.5,
		maxwaterdepth = 15,
		movementclass = "HTANK4",
		nochasecategory = "VTOL",
		objectname = "Units/leginf.s3o",
		script = "Units/LEGINF.cob",
		seismicsignature = 0,
		selfdestructas = "hugeExplosionGenericSelfd",
		sightdistance = 351,
		trackoffset = -8,
		trackstrength = 8,
		tracktype = "corwidetracks",
		trackwidth = 50,
		turninplace = true,
		turninplaceanglelimit = 90,
		turninplacespeedlimit = 0.95832,
		turnrate = 169.39999,
		customparams = {
			unitgroup = 'weapon',
			model_author = "Mr Bob",
			normaltex = "unittextures/cor_normal.dds",
			subfolder = "corvehicles/t2",
			techlevel = 2,
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "1.25984954834 -1.01012474365 0.475593566895",
				collisionvolumescales = "55.5426483154 42.2261505127 61.5749359131",
				collisionvolumetype = "Box",
				damage = 2000,
				featuredead = "HEAP",
				footprintx = 2,
				footprintz = 2,
				height = 8,
				metal = 1200,
				object = "Units/leginf_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "35.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 1500,
				footprintx = 2,
				footprintz = 2,
				height = 2,
				metal = 550,
				object = "Units/cor2X2B.s3o",
				reclaimable = true,
				resurrectable = 0,
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:barrelshot-medium",
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
				[1] = "tcormove",
			},
			select = {
				[1] = "tcorsel",
			},
		},
		weapondefs = {
			rapidnapalm = {
				areaofeffect = 150,
				avoidfeature = false,
				cegtag = "burnflame-xs",
				collidefriendly = false,
				colormap = "0.75 0.73 0.67 0.024   0.37 0.4 0.30 0.021   0.22 0.21 0.14 0.018  0.024 0.014 0.009 0.03   0.0 0.0 0.0 0.008",
				craterareaofeffect = 90,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				explosiongenerator = "custom:burnfire-xs",
				flamegfxtime = 1,
				gravityaffected = "true",
				impulseboost = 0.123,
				impulsefactor = 0.123,
				mygravity = 0.08,
				name = "HeavyCannon",
				noselfdamage = true,
				projectiles = 1,
				range = 1100,
				reloadtime = 0.5,
				rgbcolor = "1 0.25 0.1",
				size = 4,
				soundhitdry = "flamhit1",
				soundhitwet = "sizzle",
				soundstart = "cannhvy2",
				sprayangle = 2500,
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 300,
				damage = {
					default = 30,
					subs = 10,
					vtol = 10,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "RAPIDNAPALM",
				maindir = "0 0 1",
				maxangledif = 180,
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
