return {
	armason = {
		maxacc = 0,
		activatewhenbuilt = true,
		maxdec = 0,
		buildangle = 8192,
		energycost = 2600,
		metalcost = 170,
		buildpic = "ARMASON.DDS",
		buildtime = 6150,
		canattack = false,
		canrepeat = false,
		corpse = "DEAD",
		damagemodifier = 0.46,
		explodeas = "mediumBuildingexplosiongeneric-uw",
		footprintx = 4,
		footprintz = 4,
		idleautoheal = 5,
		idletime = 1800,
		health = 2350,
		maxslope = 10,
		minwaterdepth = 24,
		objectname = "Units/ARMASON.s3o",
		onoffable = false,
		script = "Units/ARMASON.cob",
		seismicsignature = 0,
		selfdestructas = "mediumBuildingExplosionGenericSelfd-uw",
		sightdistance = 215,
		sonardistance = 1600,
		yardmap = "yooy oooo oooo yooy",
		customparams = {
			usebuildinggrounddecal = true,
			buildinggrounddecaltype = "decals/armason_aoplane.dds",
			buildinggrounddecalsizey = 6,
			buildinggrounddecalsizex = 6,
			buildinggrounddecaldecayspeed = 30,
			unitgroup = 'util',
			model_author = "FireStorm",
			normaltex = "unittextures/Arm_normal.dds",
			removestop = true,
			removewait = true,
			subfolder = "armbuildings/seautil",
			techlevel = 2,
		},
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "-2.53617095947 -6.10351563068e-07 -2.30155944824",
				collisionvolumescales = "30.2144622803 57.7799987793 23.5352478027",
				collisionvolumetype = "Box",
				damage = 1272,
				footprintx = 4,
				footprintz = 4,
				height = 40,
				metal = 106,
				object = "Units/armason_dead.s3o",
				reclaimable = true,
			},
		},
		sfxtypes = {
			pieceexplosiongenerators = {
				[1] = "deathceg2",
				[2] = "deathceg3",
				[3] = "deathceg4",
			},
		},
		sounds = {
			activate = "cmd-on",
			canceldestruct = "cancel2",
			deactivate = "cmd-off",
			underattack = "warning1",
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			select = {
				[1] = "sonar1",
			},
		},
	},
}
