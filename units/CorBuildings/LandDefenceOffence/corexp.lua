return {
	corexp = {
		maxacc = 0,
		activatewhenbuilt = true,
		maxdec = 0,
		buildangle = 32768,
		energycost = 1900,
		metalcost = 240,
		buildingmask = 0,
		buildpic = "COREXP.DDS",
		buildtime = 2720,
		canattack = true,
		canrepeat = false,
		category = "",
		collisionvolumeoffsets = "0 -10 0",
		collisionvolumescales = "40 45 40",
		collisionvolumetype = "BOX",
		corpse = "DEAD",
		energyupkeep = 3,
		explodeas = "mediumBuildingExplosionGeneric",
		extractsmetal = 0.001,
		footprintx = 4,
		footprintz = 4,
		idleautoheal = 5,
		idletime = 1800,
		health = 1440,
		maxslope = 30,
		maxwaterdepth = 20,
		metalstorage = 75,
		nochasecategory = "MOBILE",
		objectname = "Units/COREXP.s3o",
		onoffable = false,
		script = "Units/COREXP.cob",
		seismicsignature = 0,
		selfdestructas = "mediumBuildingExplosionGeneric",
		selfdestructcountdown = 1,
		sightdistance = 455,
		yardmap = "h cbbbbbbc bssssosb bosbbssb bsbbbbsb bsbbbbsb bssbbsob bsossssb cbbbbbbc",
		customparams = {
			usebuildinggrounddecal = true,
			buildinggrounddecaltype = "decals/corexp_aoplane.dds",
			buildinggrounddecalsizey = 5,
			buildinggrounddecalsizex = 5,
			buildinggrounddecaldecayspeed = 30,
			unitgroup = 'metal',
			cvbuildable = true,
			metal_extractor = 1,
			model_author = "Mr Bob",
			normaltex = "unittextures/cor_normal.dds",
			removewait = true,
			subfolder = "corbuildings/landdefenceoffence",
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0.0 0.0 -0.0",
				collisionvolumescales = "40 45 40",
				collisionvolumetype = "Box",
				damage = 780,
				featuredead = "HEAP",
				footprintx = 3,
				footprintz = 3,
				height = 20,
				metal = 122,
				object = "Units/corexp_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "55.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 390,
				footprintx = 3,
				footprintz = 3,
				height = 4,
				metal = 49,
				object = "Units/cor3X3A.s3o",
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
			activate = "mexrun2",
			canceldestruct = "cancel2",
			deactivate = "mexoff2",
			underattack = "warning1",
			working = "mexrun2",
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
				[1] = "servmed2",
			},
			select = {
				[1] = "mexon2",
			},
		},
		weapondefs = {
			hllt_bottom = {
				areaofeffect = 12,
				avoidfeature = false,
				beamtime = 0.12,
				corethickness = 0.175,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				energypershot = 15,
				explosiongenerator = "custom:laserhit-small-red",
				firestarter = 100,
				impactonly = 1,
				impulseboost = 0,
				impulsefactor = 0,
				laserflaresize = 7.7,
				name = "Light close-quarters g2g laser turret",
				noselfdamage = true,
				proximitypriority = 3,
				range = 435,
				reloadtime = 0.46667,
				rgbcolor = "1 0 0",
				soundhitdry = "",
				soundhitwet = "sizzle",
				soundstart = "lasrfir3",
				soundtrigger = 1,
				targetmoveerror = 0.1,
				thickness = 2.5,
				tolerance = 10000,
				turret = true,
				weapontype = "BeamLaser",
				weaponvelocity = 2250,
				damage = {
					commanders = 112.5,
					default = 75,
					vtol = 5,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "HLLT_BOTTOM",
				onlytargetcategory = "NOTSUB",
				fastautoretargeting = true,
			},
		},
	},
}
