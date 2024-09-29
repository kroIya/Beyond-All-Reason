return {
	corvp = {
		maxacc = 0,
		maxdec = 0,
		buildangle = 2048,
		energycost = 1800,
		metalcost = 720,
		builder = true,
		buildpic = "CORVP.DDS",
		buildtime = 7150,
		canmove = true,
		collisionvolumeoffsets = "3 15 2",
		collisionvolumescales = "101 40 106",
		collisionvolumetype = "Box",
		corpse = "DEAD",
		energystorage = 100,
		explodeas = "largeBuildingexplosiongeneric",
		footprintx = 7,
		footprintz = 7,
		idleautoheal = 5,
		idletime = 1800,
		levelground = false,
		health = 3000,
		maxslope = 15,
		maxwaterdepth = 0,
		metalstorage = 100,
		objectname = "Units/CORVP.s3o",
		script = "Units/CORVP.lua",
		seismicsignature = 0,
		selfdestructas = "largeBuildingexplosiongenericSelfd",
		sightdistance = 279,
		terraformspeed = 500,
		workertime = 100,
		yardmap = "ooooooo ooooooo ooooooo oocccoo oocccoo oocccoo oocccoo",
		buildoptions = {
			[1] = "corcv",
			[2] = "cormuskrat",
			[3] = "cormlv",
			[4] = "corfav",
			[5] = "corgator",
			[6] = "corgarp",
			[7] = "corraid",
			[8] = "corlevlr",
			[9] = "corwolv",
			[10] = "cormist",
		},
		customparams = {
			usebuildinggrounddecal = true,
			buildinggrounddecaltype = "decals/corvp_aoplane.dds",
			buildinggrounddecalsizey = 9,
			buildinggrounddecalsizex = 9,
			buildinggrounddecaldecayspeed = 30,
			unitgroup = 'builder',
			model_author = "Mr Bob",
			normaltex = "unittextures/cor_normal.dds",
			subfolder = "corbuildings/landfactories",
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0 -13 0",
				collisionvolumescales = "101 40 106",
				collisionvolumetype = "BOX",
				damage = 1590,
				featuredead = "HEAP",
				footprintx = 7,
				footprintz = 7,
				height = 20,
				metal = 470,
				object = "Units/corvp_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 795,
				footprintx = 7,
				footprintz = 7,
				height = 4,
				metal = 188,
				object = "Units/cor7X7B.s3o",
				reclaimable = true,
				resurrectable = 0,
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:WhiteLight",
			},
			pieceexplosiongenerators = {
				[1] = "deathceg3",
				[2] = "deathceg4",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
			underattack = "warning1",
			unitcomplete = "unitready",
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			select = {
				[1] = "vehplantselect",
			},
		},
	},
}
