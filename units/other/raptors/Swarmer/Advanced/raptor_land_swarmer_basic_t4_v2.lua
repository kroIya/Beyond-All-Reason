return {
	raptor_land_swarmer_basic_t4_v2 = {
		maxacc = 0.805,
		autoheal = 20,
		maxdec = 5.75,
		energycost = 1000,
		metalcost = 150,
		builder = false,
		buildpic = "raptors/raptor2b.DDS",
		buildtime = 10500,
		canattack = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = "1",
		capturable = false,
		category = "RAPTOR",
		collisionvolumeoffsets = "0 -1 0",
		collisionvolumescales = "25 40 70",
		collisionvolumetype = "box",
		defaultmissiontype = "Standby",
		explodeas = "BUG_DEATH",
		floater = false,
		footprintx = 2,
		footprintz = 2,
		leavetracks = true,
		maneuverleashlength = 640,
		mass = 1200,
		health = 2000,
		maxslope = 18,
		speed = 180.0,
		maxwaterdepth = 0,
		movementclass = "RAPTORSMALLHOVER",
		noautofire = false,
		nochasecategory = "VTOL SPACE",
		objectname = "Raptors/raptor2b.s3o",
		script = "Raptors/raptor2b.cob",
		seismicsignature = 0,
		selfdestructas = "BUG_DEATH",
		side = "THUNDERBIRDS",
		sightdistance = 200,
		smoothanim = true,
		trackoffset = 0,
		trackstrength = 3,
		trackstretch = 1,
		tracktype = "RaptorTrack",
		trackwidth = 18,
		turninplace = true,
		turninplaceanglelimit = 90,
		turnrate = 1840,
		unitname = "raptor_land_swarmer_basic_t4_v2",
		upright = false,
		waterline = 22,
		workertime = 0,
		customparams = {
			subfolder = "other/raptors",
			model_author = "KDR_11k, Beherith",
			normalmaps = "yes",
			normaltex = "unittextures/chicken_m_normals.png",
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
				areaofeffect = 32,
				collidefriendly = 0,
				collidefeature = 0,
				avoidfeature = 0,
				avoidfriendly = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.3,
				explosiongenerator = "custom:raptorspike-medium-sparks-burn",
				firesubmersed = true,
				impulseboost = 2.2,
				impulsefactor = 1,
				interceptedbyshieldtype = 0,
				model = "Raptors/spike.s3o",
				name = "Claws",
				noselfdamage = true,
				range = 200,
				reloadtime = 0.5,
				soundstart = "smallraptorattack",
				targetborder = 1,
				tolerance = 5000,
				turret = true,
				waterweapon = true,
				weapontimer = 0.1,
				weapontype = "Cannon",
				weaponvelocity = 1000,
				damage = {
					default = 300,
				},
			},
		},
		weapons = {
			[1] = {
				def = "WEAPON",
				maindir = "0 0 1",
				maxangledif = 180,
			},
		},
	},
}
