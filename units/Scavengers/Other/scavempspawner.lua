return {
	scavempspawner = {
		maxacc = 0,
		activatewhenbuilt = true,
		autoheal = 1.8,
		maxdec = 0,
		blocking = false,
		energycost = 10,
		metalcost = 10,
		buildpic = "other/nuketest.dds",
		buildtime = 10,
		craterboost = 0,
		cratermult = 0,
		capturable = false,
		category = "",
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "0 0 0",
		collisionvolumetype = "box",
		footprintx = 0,
		footprintz = 0,
		idleautoheal = 10,
		idletime = 90,
		impulseboost = 0,
		impulsefactor = 0,
		levelground = false,
		mass = 10,
		health = 11,
		speed = 0.0,
		noautofire = false,
		objectname = "scavs/cube.s3o",
		script = "scavs/droppod.cob",
		seismicsignature = 4,
		selfdestructas = "custom:newnuke-cor",
		smoothanim = true,
		turninplace = true,
		turninplaceanglelimit = 90,
		turnrate = 0,
		unitname = "nukedroppod",
		upright = false,
		yardmap = "",
		customparams = {
			subfolder = "other",
		},
		featuredefs = {},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:dirt",
			},
		},
		weapondefs = {
			weapon = {
				alwaysvisible = true,
				areaofeffect = 312,
				avoidfriendly = false,
				cegtag = "cruisemissiletrail-emp",
				collidefriendly = 0,
				--craterareaofeffect = 1920,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.45,
				explosiongenerator = "custom:genericshellexplosion-huge-lightning",
				firestarter = 100,
				flighttime = 100,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				metalpershot = 0,
				model = "cortronmissile.s3o",
				name = "Heavy long-range g2g EMP starburst rocket",
				paralyzer = true,
				paralyzetime = 35,
				range = 29999,
				reloadtime = 5,
				smoketrail = false,
				soundhit = "emgpuls1",
				--soundhitwet = "splslrg",
				soundstart = "mismed1emp1",
				startvelocity = 1,
				targetborder = 0.75,
				texture1 = "null",
				turret = 1,
				weaponacceleration = 1800,
				weapontimer = 2,
				weapontype = "MissileLauncher",
				weaponvelocity = 1200,
				wobble = 50,
				damage = {
					default = 50000,
				},
			},
		},
		weapons = {
			[1] = {
				def = "WEAPON",
			},
		},
	},
}
