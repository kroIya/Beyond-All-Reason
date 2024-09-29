return {
	leegmech = {
		maxacc = 0.11845,
		airsightdistance = 1100,
		maxdec = 0.7521,
		energycost = 200000,
		metalcost = 10000,
		buildpic = "LEGMECH.DDS",
		buildtime = 200000,
		canmove = true,
		collisionvolumeoffsets = "0 -11 0",
		collisionvolumescales = "66 86 66",
		collisionvolumetype = "CylY",
		corpse = "DEAD",
		explodeas = "bantha",
		footprintx = 4,
		footprintz = 4,
		idleautoheal = 25,
		idletime = 900,
		mass = 200000,
		health = 60000,
		maxslope = 17,
		speed = 40.5,
		maxwaterdepth = 12,
		movementclass = "HBOT4",
		nochasecategory = "VTOL",
		objectname = "Units/LEGMECH.s3o",
		pushresistant = true,
		script = "Units/LEGMECH.cob",
		seismicsignature = 0,
		selfdestructas = "banthaSelfd",
		selfdestructcountdown = 10,
		sightdistance = 617,
		turninplace = true,
		turninplaceanglelimit = 90,
		turninplacespeedlimit = 1.089,
		turnrate = 450,
		upright = true,
		customparams = {
			unitgroup = 'weapon',
			customrange = 400,
			model_author = "Kremenchuk",
			normaltex = "unittextures/leegmech_normal.dds",
			subfolder = "leggantry",
			techlevel = 3,
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "5 -2 0",
				collisionvolumescales = "73 24 87",
				collisionvolumetype = "Box",
				damage = 30000,
				featuredead = "HEAP",
				footprintx = 3,
				footprintz = 3,
				height = 20,
				metal = 6350,
				object = "Units/legmech_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "55.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 10500,
				footprintx = 3,
				footprintz = 3,
				height = 4,
				metal = 3300,
				object = "Units/arm3X3A.s3o",
				reclaimable = true,
				resurrectable = 0,
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:barrelshot-small-impulse",
			},
			pieceexplosiongenerators = {
				[1] = "deathceg3",
				[2] = "deathceg4",
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
				[1] = "krogok1",
			},
			select = {
				[1] = "krogsel1",
			},
		},
		weapondefs = {
			aimhull = {
				areaofeffect = 70,
				avoidfeature = false,
				burnblow = true,
				burst = 16,
				burstrate = 0.2,
				collidefriendly = false,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.65,
				explosiongenerator = "custom:burnfire-xs",
				firestarter = 70,
				flighttime = 4,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				model = "artshell-large.s3o",
				name = "Parabolic trajectory g2g multi-rocket launcher",
				noselfdamage = true,
				range = 700,
				reloadtime = 8,
				smoketrail = true,
				smokePeriod = 7,
				smoketime = 21,
				smokesize = 6.5,
				smokecolor = 0.5,
				smokeTrailCastShadow = false,
				castshadow = true, --projectile
				soundhitdry = "flamhit1",
				soundhitwet = "splssml",
				soundstart = "rocksalvo",
				soundtrigger = true,
				startvelocity = 160,
				targetmoveerror = 0.2,
				texture1 = "null",
				texture2 = "smoketraildark",
				trajectoryheight = 1.5,
				turnrate = 4000,
				turret = true,
				weaponacceleration = 100,
				weapontimer = 6,
				weapontype = "MissileLauncher",
				weaponvelocity = 600,
				wobble = 10000,
				damage = {
					default = 30,
					subs = 15,
				},
			},
			shotgun = {
				areaofeffect = 50,
				avoidfeature = false,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.65,
				explosiongenerator = "custom:genericshellexplosion-small",
				impulseboost = 0.2,
				impulsefactor = 0.2,
				intensity = 3,
				name = "Shotgun",
				noselfdamage = true,
				predictboost = 1,
				projectiles = 9,
				range = 550,
				reloadtime = 3,
				rgbcolor = "1 0.75 0.25",
				size = 2,
				soundhit = "xplomed2xs",
				soundhitwet = "splsmed",
				soundstart = "kroggie2xs",
				soundstartvolume = 12,
				sprayangle = 1500,
				tolerance = 6000,
				turret = true,
				weapontimer = 1,
				weapontype = "Cannon",
				weaponvelocity = 600,
				damage = {
					default = 125,
				},
			},
			railgunt3 = {
				areaofeffect = 24,
				avoidfeature = false,
				burnblow = false,
				cegtag = "railgun",
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				duration = 0.12,
				edgeeffectiveness = 0.85,
				energypershot = 1000,
				explosiongenerator = "custom:plasmahit-sparkonly",
				fallOffRate = 0.2,
				firestarter = 0,
				impulseboost = 0.4,
				impulsefactor = 1,
				intensity = 0.8,
				name = "Railgun",
				noselfdamage = true,
				ownerExpAccWeight = 4.0,
				proximitypriority = 3,
				range = 850,
				reloadtime = 2.25,
				rgbcolor = "0.74 0.64 0.94",
				soundhit = "mavgun3",
				soundhitwet = "splshbig",
				soundstart = "railgun3",
				soundstartvolume = 26,
				thickness = 3,
				tolerance = 6000,
				turret = true,
				weapontype = "LaserCannon",
				weaponvelocity = 3180,
				damage = {
					commanders = 250,
					default = 500,
				},
			},
			frontgun = {
				accuracy = 7,
				areaofeffect = 16,
				avoidfeature = false,
				burst = 6,
				burstrate = 0.0675,
				burnblow = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				duration = 0.04,
				edgeeffectiveness = 0.85,
				explosiongenerator = "custom:plasmahit-sparkonly",
				fallOffRate = 0.2,
				firestarter = 0,
				impulseboost = 0.4,
				impulsefactor = 1.5,
				intensity = 0.8,
				name = "Rapid-fire short range machine guns",
				noselfdamage = true,
				ownerExpAccWeight = 4.0,
				proximitypriority = 3,
				range = 400,
				reloadtime = 0.4,
				rgbcolor = "1 0.95 0.4",
				soundhit = "bimpact3",
				soundhitwet = "splshbig",
				soundstart = "minigun3",
				soundstartvolume = 7.5,
				sprayangle = 968,
				thickness = 1.4,
				turret = true,
				weapontype = "LaserCannon",
				weaponvelocity = 921,
				damage = {
					commanders = 33,
					default = 33,
					vtol = 33,
				},
			},
			topgunaa = {
				accuracy = 7,
				areaofeffect = 16,
				avoidfeature = false,
				burst = 4,
				burstrate = 0.1,
				burnblow = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				duration = 0.045,
				edgeeffectiveness = 0.85,
				explosiongenerator = "custom:plasmahit-sparkonly",
				fallOffRate = 0.2,
				firestarter = 0,
				impulseboost = 0.4,
				impulsefactor = 1.5,
				intensity = 0.8,
				name = "Rapid-fire anti-air machine guns",
				noselfdamage = true,
				ownerExpAccWeight = 4.0,
				proximitypriority = 3,
				range = 651,
				reloadtime = 1,
				rgbcolor = "1 0.4 0.95",
				soundhit = "bimpact3",
				soundhitwet = "splshbig",
				soundstart = "minigun3",
				soundstartvolume = 12,
				sprayangle = 1000,
				thickness = 1.1,
				turret = true,
				weapontype = "LaserCannon",
				weaponvelocity = 975,
				damage = {
					default = 75,
				},
			},
		},
		weapons = {
			[1] = {
				def = "AIMHULL",
				onlytargetcategory = "SURFACE",
			},
			[2] = {
				badtargetcategory = "VTOL",
				def = "SHOTGUN",
				maindir = "1 0 0",
				maxangledif = 270,
				onlytargetcategory = "SURFACE",
			},
			[3] = {
				def = "RAILGUNT3",
				maindir = "-1 0 0",
				maxangledif = 270,
				onlytargetcategory = "NOTSUB",
			},
			[4] = {
				badtargetcategory = "VTOL",
				def = "FRONTGUN",
				maindir = "0 0 1",
				maxangledif = 270,
				onlytargetcategory = "SURFACE",
			},
			[5] = {
				badtargetcategory = "NOTAIR GROUNDSCOUT",
				def = "TOPGUNAA",
				onlytargetcategory = "VTOL",
			},
		},
	},
}
