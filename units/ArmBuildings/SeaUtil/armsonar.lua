return {
	armsonar = {
		maxacc = 0,
		activatewhenbuilt = true,
		maxdec = 0,
		buildangle = 8192,
		energycost = 450,
		metalcost = 20,
		buildpic = "ARMSONAR.DDS",
		buildtime = 910,
		canattack = false,
		canrepeat = false,
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "28 41 28",
		collisionvolumetype = "CylY",
		corpse = "DEAD",
		explodeas = "smallBuildingexplosiongeneric-uw",
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 1800,
		health = 56,
		maxslope = 10,
		minwaterdepth = 10,
		objectname = "Units/ARMSONAR.s3o",
		onoffable = false,
		script = "Units/ARMSONAR.cob",
		seismicsignature = 0,
		selfdestructas = "smallBuildingExplosionGenericSelfd-uw",
		sightdistance = 515,
		sonardistance = 1200,
		yardmap = "oooo",
		customparams = {
			unitgroup = 'util',
			model_author = "FireStorm",
			normaltex = "unittextures/Arm_normal.dds",
			removestop = true,
			removewait = true,
			subfolder = "armbuildings/seautil",
		},
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "0.0 -1.56127929678e-05 -0.0",
				collisionvolumescales = "31.3499755859 42.5373687744 28.2463684082",
				collisionvolumetype = "Box",
				damage = 30,
				footprintx = 2,
				footprintz = 2,
				height = 4,
				metal = 13,
				object = "Units/armsonar_dead.s3o",
				reclaimable = true,
			},
		},
		sfxtypes = {
			pieceexplosiongenerators = {
				[1] = "deathceg2",
				[2] = "deathceg3",
			},
		},
		sounds = {
			activate = "sonar1",
			canceldestruct = "cancel2",
			deactivate = "sonarde1",
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
