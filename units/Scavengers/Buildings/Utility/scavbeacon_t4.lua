return {
	scavbeacon_t4 = {
		maxacc = 0,
		activatewhenbuilt = true,
		autoheal = 10,
		blocking = false,
		maxdec = 0,
		energycost = 100000,
		metalcost = 10000,
		buildpic = "scavengers/SCAVBEACON.DDS",
		buildtime = 100000,
		category = "CANBEUW",
		canmove = false,
		canSelfDestruct = false,
		capturable = true,
		cantbetransported = true,
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "85 85 85",
		collisionvolumetype = "CylY",
		energystorage = 200000,
		metalstorage = 20000,
		energymake = 1600,
		metalmake = 16,
		explodeas = "commanderExplosion",
		floater = false,
		footprintx = 0,
		footprintz = 0,
		hidedamage = true,
		idleautoheal = 10,
		idletime = 90,
		levelground = false,
		mass = 10000,
		health = 100000,
		speed = 0.0,
		noautofire = false,
		objectname = "scavs/scavbeacon_t4.s3o",
		script = "scavs/scavbeacon.cob",
		seismicsignature = 4,
		selfdestructcountdown = 1,
		sightdistance = 750,
		smoothanim = true,
		transportByEnemy = true,
		turninplace = true,
		turninplaceanglelimit = 90,
		turnrate = 0,
		unitname = "scavengerbeacon",
		upright = false,
		yardmap = "",
		reclaimable = true,
		customparams = {
			subfolder = "scavengers",
			normaltex = "unittextures/cor_normal.dds",
			paratrooper = true,
		},
		featuredefs = {},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:PurpleLight",
			},
		},
		weapondefs = {
			weapon = {
				areaofeffect = 72,
				avoidfeature = false,
				beamtime = 1,
				cameraShake = 350,
				corethickness = 0.40,
				craterareaofeffect = 72,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				energypershot = 1200,
				explosiongenerator = "custom:genericshellexplosion-medium-beam",
				impulseboost = 0,
				impulsefactor = 0,
				largebeamlaser = true,
				laserflaresize = 8.8,
				name = "Armageddon Heat Ray",
				noselfdamage = true,
				range = 750,
				reloadtime = 15,
				rgbcolor = "1 0.8 0",
				rgbcolor2 = "0.8 0 0",
				scrollspeed = 5,
				soundhitdry = "",
				soundhitwet = "sizzle",
				soundstart = "heatray2xl",
				soundtrigger = 1,
				targetmoveerror = 0.1,
				thickness = 8,
				tolerance = 10000,
				turret = true,
				weapontype = "BeamLaser",
				weaponvelocity = 1800,
				damage = {
					commanders = 16500,
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
