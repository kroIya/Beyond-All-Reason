return {
	armexcalibur = {
		maxacc = 0.03,
		activatewhenbuilt = false,
		maxdec = 0.05,
		buildcostenergy = 16000,
		buildcostmetal = 900,
		buildpic = "armexcalibur.DDS",
		buildtime = 18000,
		canmove = true,
		category = "",
		collide=true,
		collisionvolumeoffsets = "0 1 -4",
		collisionvolumescales = "20 15 52",
		collisionvolumetype = "box",
		corpse = "DEAD",
		explodeas = "mediumExplosionGeneric-uw",
		footprintx = 3,
		footprintz = 3,
		idleautoheal = 10,
		idletime = 900,
		health = 1200,
		speed = 60,
		minwaterdepth = 15,
		movementclass = "BOAT3",
		nochasecategory = "VTOL",
		objectname = "Units/armexcalibur.s3o",
		script = "Units/armexcalibur_clean.cob",
		seismicsignature = 0,
		selfdestructas = "mediumExplosionGenericSelfd-uw",
		sightdistance = 500,
		sonardistance = 200,
		turninplace = true,
		turninplaceanglelimit = 90,
		turnrate = 540,
		upright = true,
		--usepiececollisionvolumes = 1,
		waterline = 25,
		customparams = {
			unitgroup = 'sub',
			model_author = "Hornet",
			normaltex = "unittextures/arm_normal.dds",
			subfolder = "armships/t2",
			techlevel = 2,
		},
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "0 0 -4",
				collisionvolumescales = "20 15 52",
				collisionvolumetype = "Box",
				damage = 1362,
				energy = 0,
				featuredead = "HEAP",
				footprintx = 6,
				footprintz = 6,
				height = 4,
				hitdensity = 100,
				metal = 375,
				object = "Units/armexcalibur_dead.s3o",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "35.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 4032,
				energy = 0,
				footprintx = 2,
				footprintz = 2,
				height = 4,
				hitdensity = 100,
				metal = 187,
				object = "Units/cor2X2A.s3o",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sfxtypes = {
		
			explosiongenerators = {
				[0] = "custom:subbubbles",
				[1] = "custom:subwake",
				[2] = "custom:tachyonshot",
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
				[1] = "sucormov",
			},
			select = {
				[1] = "sucorsel",
			},
		},
		weapondefs = {
			exata = {
				areaofeffect = 16,
				avoidfeature = false,
				beamtime = 1,
				collidefriendly = false,
				corethickness = 0.15,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				energypershot = 400,
				explosiongenerator = "custom:laserhit-large-blue",
				firestarter = 45,
				fireTolerance = 1000,
				impulseboost = 0,
				impulsefactor = 0,
				largebeamlaser = true,
				laserflaresize = 3.5,
				name = "Caliburn s2g tachyon accelerator beam",
				noselfdamage = true,
				range = 600,
				reloadtime = 6,
				rgbcolor = "0 0 1",
				scrollspeed = 5,
				soundhitdry = "",
				soundhitwet = "sizzle",
				soundstart = "annigun1",
				soundtrigger = 1,
				targetmoveerror = 0.3,
				texture3 = "largebeam",
				thickness = 1.5,
				tilelength = 150,
				tolerance = 10000,
				turret = true,
				weapontype = "BeamLaser",
				weaponvelocity = 1400,
				damage = {
					commanders = 400,
					default = 800,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "UNDERWATER",
				def = "EXATA",
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
