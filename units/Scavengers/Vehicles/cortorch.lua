return {
	cortorch = {
		maxacc = 0.005,
		activatewhenbuilt = true,
		maxdec = 0.12,
		energycost = 4400,
		metalcost = 220,
		buildpic = "CORTORCH.DDS",
		buildtime = 4150,
		canmove = true,
		collisionvolumeoffsets = "0 -3 0",
		collisionvolumescales = "30 21 36",
		collisionvolumetype = "Box",
		corpse = "DEAD",
		explodeas = "smallexplosiongeneric",
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		health = 650,
		maxslope = 12,
		speed = 141.0,
		maxwaterdepth = 200,
		movementclass = "TANK2",
		nochasecategory = "VTOL",
		objectname = "Units/scavboss/CORTORCH.s3o",
		script = "Units/scavboss/CORTORCH.cob",
		seismicsignature = 0,
		selfdestructas = "pyroselfd",
		selfdestructcountdown = 1,
		sightdistance = 308,
		trackoffset = 0,
		trackstrength = 6,
		tracktype = "corparrowtracks",
		trackwidth = 22,
		turninplace = false,
		--turninplaceanglelimit = 90,
		turninplacespeedlimit = 4.7,
		turnrate = 364,
		customparams = {
			unitgroup = 'weapon',
			model_author = "Flaka, Itanthias kitbash",
			normaltex = "unittextures/cor_normal.dds",
			paralyzemultiplier = 0.0130,
			subfolder = "corvehicles",
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0 -3 0",
				collisionvolumescales = "30 21 36",
				collisionvolumetype = "Box",
				damage = 731,
				featuredead = "HEAP",
				footprintx = 2,
				footprintz = 2,
				height = 9,
				metal = 134,
				object = "Units/scavboss/cortorch_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "35.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 488,
				footprintx = 2,
				footprintz = 2,
				height = 4,
				metal = 67,
				object = "Units/cor2X2E.s3o",
				reclaimable = true,
				resurrectable = 0,
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:pilotlight",
				[2] = "custom:flamestream",
			},
			pieceexplosiongenerators = {
				[1] = "deathceg2",
				[2] = "deathceg3",
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
			flame_thrower = {
				--burst = 16,
				--burstrate = 0.05,
				--projectiles = 9,
				--fixedLauncher = true,
				areaofeffect = 8,
				avoidfeature = false,
				cameraShake = 0,
				cegtag = "burnflame-anim-x2",
				colormap = "1 0.95 0.9 0.032   0.55 0.55 0.40 0.028   0.40 0.28 0.19 0.024   0.033 0.018 0.011 0.04   0.0 0.0 0.0 0.01",
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				explosiongenerator = "custom:blank",
				firestarter = 70,
				impulseboost = 0,
				impulsefactor = 0,
				intensity = 1.0,
				metalpershot = 0,
				--model = "cormissile2.s3o",
				name = "Flamethrower",
				noselfdamage = true,
				--noExplode = true,
				range = 280,
				reloadtime = 0.733,
				rgbcolor = "1 0.94 0.88",
				rgbcolor2 = "0.9 0.84 0.8",
				--smoketrail = true,
				--smokePeriod = 11,
				--smoketime = 28,
				--smokesize = 3.3,
				--smokecolor = 1.0,
				smokeTrailCastShadow = false,
				castshadow = true, --projectile
				soundhitdry = "flamhit1",
				soundhitwet = "sizzle",
				soundstart = "flamhvy1",
				soundhitvolume = 7.5,
				soundstartvolume = 5.3,
				startvelocity = 450,
				texture1 = "null",
				texture2 = "smoketraildark",
				trajectoryheight = 0.26,
				turnrate = 10000,
				tracks = true,
				turret = true,
				--weaponacceleration = 120,
				flightTime = 2.7,
				burnblow = true,
				weapontype = "MissileLauncher",
				weaponvelocity = 450,
				--customparams = {
				--	fire_volume = "true",
				--	noexplosionlight = 1,
				--},
				damage = {
					default = 85,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "flame_thrower",
				onlytargetcategory = "NOTSUB",
			},
		},
	},
}
