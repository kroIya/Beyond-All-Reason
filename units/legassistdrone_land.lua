return {
	legassistdrone_land = {
		maxacc = 1,
		maxdec = 1,
		energycost = 1,
		metalcost = 1,
		builddistance = 150,
		builder = true,
		buildpic = "CORMUSKRAT.DDS",
		buildtime = 500,
		cancapture = true,
		canmove = true,
		collisionvolumeoffsets = "0 -1 1",
		collisionvolumescales = "11 8 21",
		collisionvolumetype = "Box",
		explodeas = "smallexplosiongeneric-builder",
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		health = 2000,
		maxslope = 16,
		speed = 37.5,
		maxwaterdepth = 255,
		movementclass = "ATANK3",
		objectname = "Units/corassistdrone_land.s3o",
		script = "Units/CORMUSKRAT.cob",
		seismicsignature = 0,
		selfdestructas = "smallExplosionGenericSelfd-builder",
		sightdistance = 150,
		terraformspeed = 400,
		trackoffset = 8,
		trackstrength = 5,
		tracktype = "corwidetracks",
		trackwidth = 12,
		turninplace = true,
		turninplaceanglelimit = 90,
		turninplacespeedlimit = 0.9504,
		turnrate = 1000,
		workertime = 100*Spring.GetModOptions().assistdronesbuildpowermultiplier,
		buildoptions = {
			"legsolar",
			"legwin",
			"cormstor",
			"legestor",
			"legmex",
			"cormakr",
			"leglab",
			"legvp",
			"legap",
			"coreyes",
			"corrad",
			"legdrag",
			"corllt",
			"corrl",
			"cordl",
			"cortide",
			"coruwms",
			"coruwes",
			"corfmkr",
			"corsy",
			"corfdrag",
			"cortl",
			"corfrt",
			"corfrad",
			-- Experimental:
			"corhp",
			"corfhp",
		},
		customparams = {
			unitgroup = 'builder',
			model_author = "Mr Bob",
			normaltex = "unittextures/cor_normal.dds",
			subfolder = "corvehicles",
		},
		sfxtypes = {
			pieceexplosiongenerators = {
				[1] = "deathceg2",
				[2] = "deathceg3",
				[3] = "deathceg4",
			},
		},
		sounds = {
			build = "nanlath2",
			canceldestruct = "cancel2",
			capture = "capture1",
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
				[1] = "vcormove",
			},
			select = {
				[1] = "vcorsel",
			},
		},
	},
}
