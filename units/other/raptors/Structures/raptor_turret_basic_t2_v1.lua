return {
	raptor_turret_basic_t2_v1 = {
		maxacc = 0.0115,
		activatewhenbuilt = true,
		autoheal = 1,
		maxdec = 0.0115,
		energycost = 3000,
		metalcost = 120,
		builddistance = 500,
		builder = false,
		buildpic = "raptors/raptor_turrets.DDS",
		buildtime = 2700,
		canattack = true,
		canreclaim = false,
		canrestore = false,
		canstop = "1",
		capturable = false,
		category = "RAPTOR",
		collisionvolumeoffsets = "0 -15 0",
		collisionvolumescales = "20 50 20",
		collisionvolumetype = "box",
		energystorage = 500,
		explodeas = "bug_death",
		--extractsmetal = 0.001,
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 15,
		idletime = 300,
		levelground = false,
		mass = 700,
		health = 1670,
		maxslope = 255,
		speed = 0.0,
		maxwaterdepth = 0,
		movementclass = "NANO",
		noautofire = false,
		nochasecategory = "MOBILE",
		objectname = "Raptors/raptor_turrets_v2.s3o",
		repairable = true,
		script = "Raptors/raptor_turrets_v2.cob",
		seismicsignature = 0,
		selfdestructas = "bug_death",
		side = "THUNDERBIRDS",
		sightdistance = 750,
		smoothanim = true,
		turninplace = true,
		turninplaceanglelimit = 90,
		turnrate = 1840,
		unitname = "raptord1",
		upright = false,
		waterline = 1,
		workertime = 200,
		yardmap = "oo oo",
		customparams = {
			subfolder = "other/raptors",
			model_author = "LathanStanley, Beherith",
			normalmaps = "yes",
			normaltex = "unittextures/chicken_l_normals.png",
			treeshader = "yes",
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
		weapondefs = {
			weapon = {
				accuracy = 1024,
				areaofeffect = 256,
				collidefriendly = 0,
				collidefeature = 0,
				avoidfeature = 0,
				avoidfriendly = 0,
				burst = 1,
				burstrate = 0.001,
				cegtag = "blob_trail_red",
				craterareaofeffect = 256,
				craterboost = 0.2,
				cratermult = 0.2,
				edgeeffectiveness = 0.63,
				explosiongenerator = "custom:genericshellexplosion-huge",
				impulseboost = 0,
				impulsefactor = 0.4,
				intensity = 0.7,
				interceptedbyshieldtype = 1,
				name = "GOOLAUNCHER",
				noselfdamage = true,
				proximitypriority = -1,
				range = 750,
				reloadtime = 20,
				rgbcolor = "1 0.5 0.1",
				size = 5.5,
				sizedecay = 0.09,
				soundhit = "bombsmed2",
				soundstart = "bugarty",
				sprayangle = 1024,
				tolerance = 5000,
				turret = true,
				weapontype = "Cannon",
				weapontimer = 0.2,
				weaponvelocity = 520,
				damage = {
					default = 1280,
					shields = 320,
				},
			},
		},
		weapons = {
			[1] = {
				def = "WEAPON",
				onlytargetcategory = "NOTAIR",
			},
		},
	},
}
