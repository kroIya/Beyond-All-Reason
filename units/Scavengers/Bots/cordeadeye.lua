return {
	cordeadeye = {
		maxacc = 0.138,
		maxdec = 0.6486,
		energycost = 27500,
		metalcost = 1050,
		buildpic = "cordeadeye.DDS",
		buildtime = 32000,
		canmove = true,
		category = "",
		collisionvolumeoffsets = "0 0 -2",
		collisionvolumescales = "32 34 30",
		collisionvolumetype = "CylY",
		corpse = "DEAD",
		explodeas = "penetrator",
		footprintx = 4,
		footprintz = 4,
		idleautoheal = 5,
		idletime = 1800,
		health = 2700,
		maxslope = 16,
		speed = 40,
		maxwaterdepth = 22,
		movementclass = "HBOT4",
		nochasecategory = "VTOL",
		objectname = "Units/cordeadeye.s3o",
		script = "scavs/cordeadeye.COB",
		seismicsignature = 0,
		selfdestructas = "deadeyeSelfd",
		selfdestructcountdown = 3,
		sightdistance = 500,
		turninplace = true,
		turninplaceanglelimit = 90,
		turninplacespeedlimit = 0.65,
		turnrate = 800.5,
		upright = false,
		customparams = {
			unitgroup = 'weapon',
			model_author = "Kaludjo",
			normaltex = "unittextures/cor_normal.dds",
			subfolder = "corbots/t2",
			techlevel = 2,
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0.220962524414 -3.57609763184 -0.162803649902",
				collisionvolumescales = "39.2589111328 21.1636047363 24.3341522217",
				collisionvolumetype = "Box",
				damage = 1800,
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 20,
				hitdensity = 100,
				metal = 339,
				object = "Units/cordeadeye_dead.s3o",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "35.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 1250,
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 4,
				hitdensity = 100,
				metal = 136,
				object = "Units/cor3X3A.s3o",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
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
				[1] = "kbcormov",
			},
			select = {
				[1] = "kbcorsel",
			},
		},
		weapondefs = {
			cor_burst_laser = {
				areaofeffect = 8,
				avoidfeature = false,
				beamtime = 0.5,
				beamburst = true,
				burst = 3,
				burstrate = 0.5,
				beamttl = 2.4,
				corethickness = 0.25,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				energypershot = 1200,
				explosiongenerator = "custom:laserhit-large-red",
				firestarter = 90,
				impactonly = 1,
				impulseboost = 0,
				impulsefactor = 0,
				laserflaresize = 10,
				name = "HighEnergyLaser",
				noselfdamage = true,
				range = 850,
				reloadtime = 12,
				rgbcolor = "1 0.0 0.0",
				rgbcolor2 = "1.0 1.0 1.0",
				soundhitdry = "",
				soundhitwet = "sizzle",
				soundstart = "lasrcrw1",
				soundtrigger = false,
				targetmoveerror = 0,
				thickness = 10.0,
				fireTolerance = 1000,
				tolerance = 1000,
				turret = true,
				weapontype = "BeamLaser",
				weaponvelocity = 700,
				damage = {
					default = 1900,
					commanders = 665,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "COR_BURST_LASER",
				onlytargetcategory = "SURFACE",
				burstControlWhenOutOfArc = 2,
			},
		},
	},
}
