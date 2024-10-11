return {
	raptor_land_swarmer_heal_t1_v1 = {
		maxacc = 1,
		activatewhenbuilt = true,
		autoheal = 32,
		maxdec = 1,
		energycost = 600,
		metalcost = 40,
		builddistance = 200,
		builder = 1,
		buildpic = "raptors/raptorhealer.DDS",
		buildtime = 750,
		canassist = 1,
		canbuild = 1,
		canguard = 1,
		canmove = 1,
		canpatrol = 1,
		canrepair = 1,
		canreclaim = 0,
		canstop = 1,
		capturable = false,
		category = "RAPTOR",
		collide = 0,
		collisionvolumeoffsets = "0 -1 0",
		collisionvolumescales = "10 14 22",
		collisionvolumetype = "box",
		defaultmissiontype = "Standby",
		energymake = 25,
		explodeas = "WEAVER_DEATH",
		floater = false,
		footprintx = 1,
		footprintz = 1,
		hidedamage = 1,
		leavetracks = true,
		maneuverleashlength = 640,
		mass = 50,
		health = 250,
		maxslope = 18,
		speed = 75.0,
		maxwaterdepth = 0,
		metalstorage = 1000,
		mobilestandorders = 1,
		movementclass = "RAPTORSMALLHOVER",
		noautofire = 0,
		objectname = "Raptors/raptorhealer1.s3o",
		reclaimspeed = 400,
		repairable = false,
		script = "Raptors/raptorhealer.cob",
		seismicsignature = 1,
		selfdestructas = "WEAVER_DEATH",
		side = "THUNDERBIRDS",
		sightdistance = 600,
		smoothanim = true,
		standingmoveorder = 1,
		stealth = 1,
		trackoffset = 1,
		trackstrength = 3,
		trackstretch = 1,
		tracktype = "RaptorTrack",
		trackwidth = 10,
		turninplace = true,
		turninplaceanglelimit = 90,
		turnrate = 1840,
		unitname = "raptor_land_swarmer_heal_t1_v1",
		upright = false,
		waterline = 12,
		workertime = 250,
		buildoptions = {
			"raptor_turret_basic_t2_v1",
			"raptor_turret_antiair_t2_v1",
		},
		customparams = {
			subfolder = "other/raptors",
			model_author = "KDR_11k, Beherith",
			normalmaps = "yes",
			normaltex = "unittextures/chicken_s_normals.png",
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:blood_spray",
				[2] = "custom:blood_explode",
				[3] = "custom:dirt",
			},
			pieceexplosiongenerators = {
				[1] = "blood_spray",
				[2] = "blood_spray",
				[3] = "blood_spray",
			},
		},
	},
}
