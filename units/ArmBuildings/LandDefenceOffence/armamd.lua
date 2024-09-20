return {
	armamd = {
		maxacc = 0,
		maxdec = 0,
		buildangle = 4096,
		energycost = 38000,
		metalcost = 1500,
		buildpic = "ARMAMD.DDS",
		buildtime = 60000,
		canattack = false,
		canrepeat = false,
		category = "",
		collisionvolumeoffsets = "0 0 -1",
		collisionvolumescales = "53 78 53",
		collisionvolumetype = "Box",
		corpse = "DEAD",
		explodeas = "largeexplosiongeneric",
		footprintx = 4,
		footprintz = 4,
		idleautoheal = 5,
		idletime = 1800,
		health = 3650,
		maxslope = 10,
		maxwaterdepth = 0,
		noautofire = true,
		objectname = "Units/ARMAMD.s3o",
		radardistance = 50,
		script = "Units/ARMAMD.cob",
		seismicsignature = 0,
		selfdestructas = "largeExplosionGenericSelfd",
		sightdistance = 201,
		yardmap = "oooooooooooooooo",
		customparams = {
			usebuildinggrounddecal = true,
			buildinggrounddecaltype = "decals/armamd_aoplane.dds",
			buildinggrounddecalsizey = 5,
			buildinggrounddecalsizex = 5,
			buildinggrounddecaldecayspeed = 30,
			unitgroup = 'antinuke',
			model_author = "FireStorm",
			normaltex = "unittextures/Arm_normal.dds",
			removestop = true,
			removewait = true,
			subfolder = "armbuildings/landdefenceoffence",
			techlevel = 2,
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0 0 0",
				collisionvolumescales = "53 78 53",
				collisionvolumetype = "Box",
				damage = 1980,
				featuredead = "HEAP",
				footprintx = 5,
				footprintz = 6,
				height = 20,
				metal = 934,
				object = "Units/armamd_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 990,
				footprintx = 5,
				footprintz = 5,
				height = 4,
				metal = 374,
				object = "Units/arm5X5B.s3o",
				reclaimable = true,
				resurrectable = 0,
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
				[1] = "loadwtr2",
			},
			select = {
				[1] = "loadwtr2",
			},
		},
		weapondefs = {
			amd_rocket = {
				areaofeffect = 420,
				avoidfeature = false,
				avoidfriendly = false,
				burnblow = true,
				cegtag = "antimissiletrail",
				collideenemy = false,
				collidefeature = false,
				collidefriendly = false,
				coverage = 2000,
				craterareaofeffect = 420,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				energypershot = 7500,
				explosiongenerator = "custom:antinuke",
				firestarter = 100,
				flighttime = 20,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				interceptor = 1,
				metalpershot = 150,
				model = "fmdmissile.s3o",
				name = "ICBM intercepting missile launcher",
				noselfdamage = true,
				range = 72000,
				reloadtime = 2,
				smoketrail = true,
				smokePeriod = 10,
				smoketime = 110,
				smokesize = 27,
				smokecolor = 0.70,
				smokeTrailCastShadow = true,
				soundhit = "xplomed4",
				soundhitwet = "splslrg",
				soundstart = "antinukelaunch",
				stockpile = true,
				stockpiletime = 90,
				texture1 = "bluenovaexplo",
				texture2 = "smoketrailbar",
				texture3 = "null",
				tolerance = 7000,
				tracks = true,
				turnrate = 10000,
				weaponacceleration = 150,
				weapontimer = 3,
				weapontype = "StarburstLauncher",
				weaponvelocity = 6000,
				damage = {
					default = 1500,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "ALL",
				def = "AMD_ROCKET",
			},
		},
	},
}
