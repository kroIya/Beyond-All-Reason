return {
	legshot = {
		maxacc = 0.16,
		maxdec = 0.8,
		energycost = 6300,
		metalcost = 630,
		buildpic = "LEGSHOT.DDS",
		buildtime = 11000,
		canmove = true,
		collisionvolumeoffsets = "0 0 -2",
		collisionvolumescales = "33 40 33",
		collisionvolumetype = "CylY",
		corpse = "DEAD",
		damagemodifier = 0.333,
		explodeas = "largeexplosiongeneric",
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 1800,
		health = 4000,
		maxslope = 17,
		speed = 42.0,
		maxwaterdepth = 25,
		movementclass = "BOT3",
		nochasecategory = "VTOL",
		objectname = "Units/LEGSHOT.s3o",
		script = "Units/LEGSHOT.cob",
		seismicsignature = 0,
		selfdestructas = "largeexplosiongenericSelfd",
		sightdistance = 350,
		strafetoattack = true,
		turninplace = true,
		turninplaceanglelimit = 90,
		turninplacespeedlimit = 1.815,
		turnrate = 1316.75,
		upright = true,
		customparams = {
			unitgroup = 'weapon',
			model_author = "Beherith, PtaQ",
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
				damage = 3500,
				featuredead = "HEAP",
				footprintx = 2,
				footprintz = 2,
				height = 20,
				metal = 450,
				object = "Units/legshot_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "35.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 650,
				footprintx = 2,
				footprintz = 2,
				height = 4,
				metal = 225,
				object = "Units/cor2X2C.s3o",
				reclaimable = true,
				resurrectable = 0,
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:barrelshot-small-impulse",
			},
			pieceexplosiongenerators = {
				[1] = "deathceg2",
				[2] = "deathceg3",
				[3] = "deathceg3",
				[4] = "deathceg4-fire",
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
			shotgun = {
				accuracy = 7,
				areaofeffect = 16,
				avoidfeature = false,
				projectiles = 14,
				burnblow = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				duration = 0.015,
				edgeeffectiveness = 0.85,
				explosiongenerator = "custom:plasmahit-sparkonly",
				fallOffRate = 0.2,
				firestarter = 0,
				impulseboost = 0.4,
				impulsefactor = 1.5,
				intensity = 0.8,
				name = "Medium Shotgun",
				noselfdamage = true,
				ownerExpAccWeight = 4.0,
				proximitypriority = 3,
				range = 321,
				reloadtime = 2,
				rgbcolor = "1 0.95 0.4",
				soundhit = "bimpact3",
				soundhitwet = "splshbig",
				soundstart = "kroggie2xs",
				soundstartvolume = 3,
				sprayangle = 1900,
				thickness = 0.6,
				tolerance = 6000,
				turret = true,
				weapontype = "LaserCannon",
				weaponvelocity = 960,
				damage = {
					default = 40,
					vtol = 13,
				},
			},
		},
		weapons = {
			[1] = {
				def = "SHOTGUN",
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
