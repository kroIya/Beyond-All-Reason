return {
	cormakr = {
		activatewhenbuilt = true,
		buildangle = 8192,
		buildpic = "CORMAKR.DDS",
		buildtime = 2680,
		canrepeat = false,
		collisionvolumeoffsets = "0 -1 0",
		collisionvolumescales = "32 25 32",
		collisionvolumetype = "Box",
		energycost = 1250,
		explodeas = "metalmaker",
		footprintx = 3,
		footprintz = 3,
		health = 167,
		idleautoheal = 5,
		idletime = 1800,
		maxacc = 0,
		maxdec = 0,
		maxslope = 10,
		maxwaterdepth = 0,
		metalcost = 1,
		objectname = "Units/CORMAKR.s3o",
		script = "Units/CORMAKR.cob",
		seismicsignature = 0,
		selfdestructas = "metalmakerSelfd",
		sightdistance = 273,
		yardmap = "ooooooooo",
		customparams = {
			buildinggrounddecaldecayspeed = 30,
			buildinggrounddecalsizex = 4,
			buildinggrounddecalsizey = 4,
			buildinggrounddecaltype = "decals/cormakr_aoplane.dds",
			energyconv_capacity = 70,
			energyconv_efficiency = 0.01429,
			model_author = "Mr Bob",
			normaltex = "unittextures/cor_normal.dds",
			removestop = true,
			removewait = true,
			subfolder = "CorBuildings/LandEconomy",
			unitgroup = "metal",
			usebuildinggrounddecal = true,
		},
		sfxtypes = {
			pieceexplosiongenerators = {
				[1] = "deathceg2",
				[2] = "deathceg3",
				[3] = "deathceg4",
			},
		},
		sounds = {
			activate = "arm-bld-mm-activate",
			canceldestruct = "cancel2",
			deactivate = "arm-bld-mm-deactivate",
			underattack = "warning1",
			working = "arm-bld-metalmaker",
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			select = {
				[1] = "metlon2",
			},
		},
	},
}
