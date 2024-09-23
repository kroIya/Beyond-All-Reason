return {
	legrhapsis = {
		maxacc = 0,
		airsightdistance = 850,
		maxdec = 0,
		buildangle = 8192,
		energycost = 6500,
		metalcost = 280,
		buildpic = "LEGRHAPSIS.DDS",
		buildtime = 4700,
		canrepeat = false,
		category = "",
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "28 40 28",
		collisionvolumetype = "CylY",
		corpse = "DEAD",
		energyupkeep = 5,
		explodeas = "mediumBuildingexplosiongeneric",
		footprintx = 3,
		footprintz = 3,
		idleautoheal = 5,
		idletime = 1800,
		health = 1900,
		maxslope = 10,
		maxwaterdepth = 0,
		objectname = "Units/LEGRHAPSIS.s3o",
		script = "Units/LEGRHAPSIS.cob",
		seismicsignature = 0,
		selfdestructas = "mediumBuildingExplosionGenericSelfd",
		sightdistance = 375,
		yardmap = "ooooooooo",
		customparams = {
			usebuildinggrounddecal = true,
			buildinggrounddecaltype = "decals/legrhapsis_aoplane.dds",
			buildinggrounddecalsizey = 5,
			buildinggrounddecalsizex = 5,
			buildinggrounddecaldecayspeed = 30,
			unitgroup = 'aa',
			model_author = "ZephyrSkies",
			normaltex = "unittextures/leg_normal.dds",
			removewait = true,
			subfolder = "Legion/Defenses",
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0 0 0",
				collisionvolumescales = "28 40 28",
				collisionvolumetype = "CylY",
				damage = 1500,
				featuredead = "HEAP",
				footprintx = 2,
				footprintz = 2,
				height = 10,
				metal = 190,
				object = "Units/legrhapsis_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "35.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 750,
				footprintx = 3,
				footprintz = 3,
				metal = 100,
				object = "Units/cor2X2C.s3o",
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
			cloak = "kloak1",
			uncloak = "kloak1un",
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
				[1] = "twrturn3",
			},
			select = {
				[1] = "twrturn3",
			},
		},
		weapondefs = {
			burst_aa_missile = {
				areaofeffect = 16,
				avoidfeature = false,
				burnblow = true,
				canattackground = false,
				burst = 6,
				burstrate = 0.005,
				--sprayangle = 20000,
				dance = 150,
				cegtag = "missiletrailaa",
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				explosiongenerator = "custom:genericshellexplosion-tiny-aa",
				firestarter = 72,
				flighttime = 2.5,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				model = "cormissile.s3o",
				name = "Advanced g2a Salvo Missile Launcher",
				noselfdamage = true,
				range = 840,
				reloadtime = 0.5,
				smoketrail = true,
				smokePeriod = 7,
				smoketime = 10,
				smokesize = 1.7,
				smokecolor = 1.0,
				smokeTrailCastShadow = false,
				castshadow = false,
				soundhit = "packohit",
				soundhitwet = "splshbig",
				soundstart = "packolau",
				soundtrigger = true,
				startvelocity = 800,
				texture1 = "null",
				texture2 = "smoketrailaa3",
				tolerance = 9950,
				tracks = true,
				turnrate = 68000,
				turret = true,
				weaponacceleration = 300,
				weapontimer = 2,
				weapontype = "MissileLauncher",
				weaponvelocity = 2500,
				damage = {
					vtol = 13,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "NOTAIR",
				def = "BURST_AA_MISSILE",
				onlytargetcategory = "VTOL",
				fastautoretargeting = true,
			},
		},
	},
}
