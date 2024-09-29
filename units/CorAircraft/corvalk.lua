return {
	corvalk = {
		maxacc = 0.09,
		blocking = false,
		maxdec = 0.75,
		energycost = 2450,
		metalcost = 74,
		buildpic = "CORVALK.DDS",
		buildtime = 4940,
		canfly = true,
		canmove = true,
		collide = false,
		cruisealtitude = 100,
		explodeas = "mediumexplosiongeneric",
		footprintx = 2,
		footprintz = 3,
		idleautoheal = 5,
		idletime = 1800,
		loadingradius = 300,
		health = 280,
		maxslope = 10,
		speed = 198.0,
		maxwaterdepth = 0,
		objectname = "Units/CORVALK.s3o",
		releaseheld = true,
		script = "Units/CORVALK.cob",
		seismicsignature = 0,
		selfdestructas = "mediumExplosionGenericSelfd",
		sightdistance = 260,
		transportcapacity = 1,
		transportmass = 4999,
		transportsize = 3,
		transportunloadmethod = 0,
		turninplaceanglelimit = 360,
		turnrate = 550,
		verticalspeed = 3.75,
		customparams = {
			model_author = "Mr Bob",
			normaltex = "unittextures/cor_normal.dds",
			paralyzemultiplier = 0.025,
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
				[1] = "airdeathceg2",
				[2] = "airdeathceg3",
				[3] = "airdeathceg4",
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
				[1] = "vtolcrmv",
			},
			select = {
				[1] = "vtolcrac",
			},
		},
	},
}
