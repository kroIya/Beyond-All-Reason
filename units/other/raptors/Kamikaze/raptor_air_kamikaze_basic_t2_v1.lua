return {
	raptor_air_kamikaze_basic_t2_v1 = {
		acceleration = 0.8,
		airhoverfactor = 0,
		attackrunlength = 32,
		maxdec = 0.1,
		energycost = 4550,
		metalcost = 212,
		builder = false,
		buildpic = "raptors/raptor_dodoair.DDS",
		buildtime = 9375,
		canattack = true,
		canfly = true,
		canguard = true,
		canland = true,
		canmove = true,
		canpatrol = true,
		canstop = "1",
		cansubmerge = true,
		capturable = false,
		category = "RAPTOR",
		collide = false,
		collisionvolumeoffsets = "0 8 -2",
		collisionvolumescales = "35 7 24",
		collisionvolumetype = "box",
		cruisealtitude = 30,
		defaultmissiontype = "Standby",
		explodeas = "DODO_DEATHAIR",
		footprintx = 2,
		footprintz = 2,
		hidedamage = 1,
		idleautoheal = 5,
		idletime = 0,
		maneuverleashlength = "20000",
		mass = 227.5,
		maxacc = 0.25,
		maxaileron = 0.025,
		maxbank = 0.8,
		health = 1330,
		maxelevator = 0.025,
		maxpitch = 1,
		maxrudder = 0.025,
		speed = 450.0,
		moverate1 = "32",
		noautofire = false,
		nochasecategory = "VTOL",
		objectname = "Raptors/raptor_dodo_air.s3o",
		script = "Raptors/raptorf1.cob",
		seismicsignature = 0,
		selfdestructas = "DODO_DEATHAIR",
		side = "THUNDERBIRDS",
		sightdistance = 100,
		smoothanim = true,
		speedtofront = 0.07,
		turninplace = true,
		turnradius = 32,
		turnrate = 3200,
		unitname = "raptorf1",
		usesmoothmesh = true,
		wingangle = 0.06593,
		wingdrag = 0.835,
		workertime = 0,
		kamikaze = true,
		kamikazedistance = 128,
		customparams = {
			subfolder = "other/raptors",
			model_author = "KDR_11k, Beherith",
			normalmaps = "yes",
			normaltex = "unittextures/chicken_l_normals.png",
		},
		sfxtypes = {
			crashexplosiongenerators = {
				[1] = "crashing-small",
				[2] = "crashing-small",
				[3] = "crashing-small2",
				[4] = "crashing-small3",
				[5] = "crashing-small3",
			},
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
