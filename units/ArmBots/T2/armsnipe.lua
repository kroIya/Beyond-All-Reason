return {
	armsnipe = {
		maxacc = 0.138,
		maxdec = 0.6486,
		energycost = 20000,
		metalcost = 680,
		buildpic = "ARMSNIPE.DDS",
		buildtime = 19000,
		canmove = true,
		cloakcost = 75,
		cloakcostmoving = 200,
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "30 44 30",
		collisionvolumetype = "CylY",
		corpse = "DEAD",
		explodeas = "mediumexplosiongeneric",
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 1800,
		health = 580,
		maxslope = 14,
		speed = 33.0,
		maxwaterdepth = 22,
		mincloakdistance = 80,
		movementclass = "BOT3",
		nochasecategory = "VTOL",
		objectname = "Units/ARMSNIPE.s3o",
		power = 750, --compensation for XP rank with super low AoE weapons
		script = "Units/ARMSNIPE.cob",
		selfdestructas = "mediumExplosionGenericSelfd",
		sightdistance = 455,
		turninplace = true,
		turninplaceanglelimit = 90,
		turninplacespeedlimit = 0.7788,
		turnrate = 1538.69995,
		upright = true,
		customparams = {
			unitgroup = 'weapon',
			model_author = "Kaiser",
			normaltex = "unittextures/Arm_normal.dds",
			subfolder = "armbots/t2",
			techlevel = 2,
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0 0 0",
				collisionvolumescales = "30 12 44",
				collisionvolumetype = "Box",
				damage = 400,
				featuredead = "HEAP",
				footprintx = 2,
				footprintz = 2,
				height = 20,
				metal = 322,
				object = "Units/armsnipe_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "35.0 4.0 20",
				collisionvolumetype = "cylY",
				damage = 300,
				footprintx = 2,
				footprintz = 2,
				height = 4,
				metal = 129,
				object = "Units/arm2X2D.s3o",
				reclaimable = true,
				resurrectable = 0,
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:barrelshot-sniper",
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
				[1] = "kbarmmov",
			},
			select = {
				[1] = "kbarmsel",
			},
		},
		weapondefs = {
			armsnipe_weapon = {	-- NOTE this range of 900 was shown in unit stats but was only effectively 800 by range
				areaofeffect = 16,
				avoidfeature = true,
				avoidfriendly = true,
				beamtime = 0.1,
				collidefeature = true,
				collidefriendly = false,
				corethickness = 0.1,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				duration = 0.1,
				edgeeffectiveness = 0.15,
				energypershot = 500,
				explosiongenerator = "custom:genericshellexplosion-sniper",
				firestarter = 100,
				impulseboost = 0.234,
				impulsefactor = 0.234,
				minintensity = 1,
				name = "Long-range g2g armor-piercing rifle",
				range = 900,
				reloadtime = 10,
				rgbcolor = "1 0.2 0",
				rgbcolor2 = "1 1 1",
				soundhit = "sniperhit",
				soundhitwet = "sizzle",
				soundstart = "sniper3",
				soundtrigger = true,
				texture1 = "shot",
				texture2 = "empty",
				thickness = 0,
				tolerance = 1000,
				turret = true,
				weapontype = "LaserCannon",
				weaponvelocity = 3000,
				damage = {
					commanders = 1025,
					default = 2500,
				},
			},
			old_armsnipe_weapon = {
				areaofeffect = 16,
				avoidfeature = false,
				collidefriendly = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				duration = 0.0025,
				edgeeffectiveness = 0.15,
				energypershot = 500,
				explosiongenerator = "custom:genericshellexplosion-sniper",
				impactonly = true,
				impulseboost = 0.234,
				impulsefactor = 0.234,
				intensity = 0.75,
				interceptedbyshieldtype = 0,
				name = "SniperWeapon",
				noselfdamage = true,
				range = 900,
				reloadtime = 10,
				rgbcolor = "1 1 0",
				size = 0.1,
				soundhit = "sniperhit",
				soundhitvolume = 10,
				soundhitwet = "sizzle",
				soundstart = "sniper3",
				soundstartvolume = 20,
				thickness = 0.5,
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 3000,
				customparams = {
				},
				damage = {
					commanders = 1025,
					default = 2500,
				},
			},
		},
		weapons = {
			[1] = {
				def = "OLD_ARMSNIPE_WEAPON",
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
