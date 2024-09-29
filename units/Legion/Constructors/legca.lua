return {
	legca = {
		maxacc = 0.06,
		blocking = false,
		maxdec = 0.4275,
		energycost = 3200,
		metalcost = 115,
		builddistance = 136,
		builder = true,
		buildpic = "LEGCA.DDS",
		buildtime = 8400,
		canfly = true,
		canmove = true,
		collide = true,
		cruisealtitude = 75,
		energymake = 5,
		energystorage = 25,
		explodeas = "smallexplosiongeneric",
		footprintx = 3,
		footprintz = 3,
		hoverattack = true,
		idleautoheal = 5,
		idletime = 1800,
		health = 161,
		maxslope = 10,
		speed = 201.0,
		maxwaterdepth = 0,
		objectname = "Units/LEGCA.s3o",
		radardistance = 50,
		script = "Units/LEGCA.cob",
		seismicsignature = 0,
		selfdestructas = "smallExplosionGenericSelfd",
		sightdistance = 351,
		terraformspeed = 225,
		turninplaceanglelimit = 360,
		turnrate = 240,
		workertime = 60,
		buildoptions = {
			"legsolar",
			"legadvsol",
			"legwin",
			"leggeo",
			"coruwgeo",
			"legmstor",
			"legestor",
			"legmex",
			"legmext15",
			"legeconv",
			"corasp",
			"corfasp",
			"legaap",
			"leglab",
			"legvp",
			"legap",
			"leghp",
			"legnanotc",
			"legeyes",
			"legrad",
			"legdrag",
			"legdtr",
			"leglht",
			"legmg",
			"legcluster",
			"legrl",
			"legrhapsis",
			"leglupara",
			"cordl",
			"legjam",
			"corjuno",
			"corsy",
			"leghive",
		},
		customparams = {
			unitgroup = 'builder',
			model_author = "ZephyrSkies",
			normaltex = "unittextures/leg_normal.dds",
			subfolder = "coraircraft",
		},
		sfxtypes = {
			crashexplosiongenerators = {
				[1] = "crashing-small",
				[2] = "crashing-small",
				[3] = "crashing-small2",
				[4] = "crashing-small3",
				[5] = "crashing-small3",
			},
			pieceexplosiongenerators = {
				[1] = "airdeathceg2-builder",
				[2] = "airdeathceg3-builder",
			},
		},
		sounds = {
			build = "nanlath2",
			canceldestruct = "cancel2",
			repair = "repair2",
			underattack = "warning1",
			working = "reclaim1",
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
				[1] = "vtolcrmv",
			},
			select = {
				[1] = "vtolcrac",
			},
		},
	},
}
