return {
	armalab = {
		maxacc = 0,
		maxdec = 0,
		buildangle = 1024,
		energycost = 15000,
		metalcost = 2900,
		builder = true,
		buildpic = "ARMALAB.DDS",
		buildtime = 16200,
		canmove = true,
		collisionvolumescales = "85 75 100",
		collisionvolumetype = "Box",
		corpse = "DEAD",
		energystorage = 200,
		explodeas = "largeBuildingexplosiongeneric",
		footprintx = 6,
		footprintz = 6,
		idleautoheal = 5,
		idletime = 1800,
		health = 4250,
		maxslope = 15,
		maxwaterdepth = 0,
		metalstorage = 200,
		objectname = "Units/ARMALAB.s3o",
		script = "Units/ARMALAB.cob",
		seismicsignature = 0,
		selfdestructas = "largeBuildingExplosionGenericSelfd",
		sightdistance = 286,
		terraformspeed = 1000,
		workertime = 300,
		yardmap = "yooooy oooooy yooooy cccccc cccccc cccccc",
		buildoptions = {
			[1] = "armack",
			[2] = "armfark",
			[3] = "armfast",
			[4] = "armamph",
			[5] = "armzeus",
			[6] = "armmav",
			[7] = "armsptk",
			[8] = "armfido",
			[9] = "armsnipe",
			[10] = "armfboy",
			[11] = "armspid",
			[12] = "armaak",
			[13] = "armvader",
			[14] = "armdecom",
			[15] = "armscab",
			[16] = "armaser",
			[17] = "armspy",
			[18] = "armmark",
		},
		customparams = {
			usebuildinggrounddecal = true,
			buildinggrounddecaltype = "decals/armalab_aoplane.dds",
			buildinggrounddecalsizey = 8.6,
			buildinggrounddecalsizex = 8.6,
			buildinggrounddecaldecayspeed = 30,
			unitgroup = 'buildert2',
			model_author = "Cremuss",
			normaltex = "unittextures/Arm_normal.dds",
			subfolder = "armbuildings/landfactories",
			techlevel = 2,
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0 -17 -1",
				collisionvolumescales = "73 56 89",
				collisionvolumetype = "CylZ",
				damage = 2285,
				featuredead = "HEAP",
				footprintx = 5,
				footprintz = 6,
				height = 20,
				metal = 1773,
				object = "Units/armalab_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 1143,
				footprintx = 5,
				footprintz = 5,
				height = 4,
				metal = 887,
				object = "Units/arm5X5A.s3o",
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
			unitcomplete = "untdone",
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			select = {
				[1] = "plabactv",
			},
		},
	},
}
