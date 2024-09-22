return {
	coruwgeo = {
		acceleration = 0,
		activatewhenbuilt = true,
		brakerate = 0,
		buildangle = 4096,
		buildcostenergy = 13000,
		buildcostmetal = 540,
		buildpic = "CORUWGEO.DDS",
		buildtime = 12900,
		canrepeat = false,
		category = "",
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "63 45 63",
		collisionvolumetype = "cylY",
		corpse = "dead",
		energymake = 300,
		energystorage = 1000,
		explodeas = "geo",
		footprintx = 5,
		footprintz = 5,
		idleautoheal = 5,
		idletime = 1800,
		minwaterdepth = 6,
		maxdamage = 2050,
		maxslope = 15,
		maxwaterdepth = 99999,
		objectname = "Units/CORUWGEO.s3o",
		script = "Units/CORUWGEO.cob",
		seismicsignature = 0,
		selfdestructas = "geo",
		sightdistance = 273,
		yardmap = "h cbbbbgbbbc bgbggbbggb bgbgbggbbb bbgggbgggb gbgbgggbgb bgbgggbgbg bgggbgggbb bbbggbgbgb bggbbggbgb cbbbgbbbbc",
		customparams = {
			usebuildinggrounddecal = true,
			buildinggrounddecaltype = "decals/corgeo_aoplane.dds",
			buildinggrounddecalsizey = 6,
			buildinggrounddecalsizex = 6,
			buildinggrounddecaldecayspeed = 30,
			unitgroup = 'energy',
			cvbuildable = true,
			geothermal = 1,
			model_author = "Cremuss, Hornet",
			normaltex = "unittextures/cor_normal.dds",
			removestop = true,
			removewait = true,
			subfolder = "corbuildings/landeconomy",
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0 0 0",
				collisionvolumescales = "63 45 63",
				collisionvolumetype = "cylY",
				damage = 1110,
				featuredead = "HEAP",
				footprintx = 4,
				footprintz = 4,
				height = 20,
				metal = 328,
				object = "Units/corgeo_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "85.0 14.0 6.0",
				collisionvolumetype = "cylY",
				damage = 555,
				footprintx = 4,
				footprintz = 4,
				height = 4,
				metal = 131,
				object = "Units/cor4X4B.s3o",
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
			explosiongenerators = {
				[1] = "custom:geobubbles",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
			underattack = "warning1",
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			select = {
				[1] = "geothrm2",
			},
		},
	},
}
