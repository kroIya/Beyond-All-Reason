return {
	coruwms = {
		maxacc = 0,
		maxdec = 0,
		buildangle = 8192,
		energycost = 590,
		metalcost = 340,
		buildpic = "CORUWMS.DDS",
		buildtime = 2920,
		canrepeat = false,
		category = "SURFACE",
		corpse = "DEAD",
		explodeas = "largeBuildingexplosiongeneric-uw",
		footprintx = 4,
		footprintz = 4,
		idleautoheal = 5,
		idletime = 1800,
		health = 2100,
		maxslope = 20,
		metalstorage = 3000,
		minwaterdepth = 40,
		objectname = "Units/CORUWMS.s3o",
		script = "Units/CORUWMS.cob",
		seismicsignature = 0,
		selfdestructas = "largeBuildingExplosionGenericSelfd-uw",
		sightdistance = 169,
		yardmap = "oooooooooooooooo",
		customparams = {
			usebuildinggrounddecal = true,
			buildinggrounddecaltype = "decals/coruwms_aoplane.dds",
			buildinggrounddecalsizey = 6,
			buildinggrounddecalsizex = 6,
			buildinggrounddecaldecayspeed = 30,
			unitgroup = 'metal',
			model_author = "Mr Bob",
			normaltex = "unittextures/cor_normal.dds",
			removestop = true,
			removewait = true,
			subfolder = "corbuildings/seaeconomy",
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0.0 8.00781250021e-06 -0.0",
				collisionvolumescales = "80.0 48.7014160156 80.0",
				collisionvolumetype = "Box",
				damage = 2100,
				featuredead = "HEAP",
				footprintx = 4,
				footprintz = 4,
				height = 20,
				metal = 228,
				object = "Units/coruwms_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "85.0 14.0 6.0",
				collisionvolumetype = "cylY",
				damage = 1050,
				footprintx = 4,
				footprintz = 4,
				height = 4,
				metal = 91,
				object = "Units/cor4X4D.s3o",
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
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			select = {
				[1] = "stormtl2",
			},
		},
	},
}
