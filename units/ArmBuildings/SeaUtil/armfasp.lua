return {
	armfasp = {
		acceleration = 0,
		activatewhenbuilt = true,
		brakerate = 0,
		buildangle = 0,
		buildcostenergy = 4300,
		buildcostmetal = 400,
		builddistance = 136,
		buildpic = "ARMFASP.DDS",
		buildtime = 9100,
		canrepeat = false,
		category = "",
		collisionvolumeoffsets = "0 -10 0",
		collisionvolumescales = "155 55 155",
		collisionvolumetype = "Box",
		corpse = "DEAD",
		explodeas = "largeBuildingexplosiongeneric",
		footprintx = 11,
		footprintz = 11,
		idleautoheal = 5,
		idletime = 1800,
		mass = 200000,
		maxdamage = 1670,
		minwaterdepth = 5,
		objectname = "Units/ARMFASP.s3o",
		script = "Units/ARMASP.cob",
		seismicsignature = 0,
		selfdestructas = "largeBuildingExplosionGenericSelfd",
		sightdistance = 357.5,
		terraformspeed = 5000,
		waterline = 3,
		workertime = 1000,
		yardmap = "ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo",
		customparams = {
			usebuildinggrounddecal = true,
			buildinggrounddecaltype = "decals/armasp_aoplane.dds",
			buildinggrounddecalsizey = 11.5,
			buildinggrounddecalsizex = 11.5,
			buildinggrounddecaldecayspeed = 30,
			unitgroup = 'buildert2',
			isairbase = true,
			model_author = "Beherith, Hornet",
			normaltex = "unittextures/Arm_normal.dds",
			removestop = true,
			removewait = true,
			subfolder = "armbuildings/landutil",
			techlevel = 2,
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0 -8 0",
				collisionvolumescales = "135 24 135",
				collisionvolumetype = "Box",
				damage = 1116,
				featuredead = "HEAP",
				footprintx = 4,
				footprintz = 4,
				height = 40,
				metal = 366,
				object = "Units/armasp_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "85.0 14.0 6.0",
				collisionvolumetype = "cylY",
				damage = 558,
				footprintx = 1,
				footprintz = 1,
				height = 4,
				metal = 126,
				object = "Units/arm4X4A.s3o",
				reclaimable = true,
				resurrectable = 0,
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
			canceldestruct = "cancel2",
			underattack = "warning1",
			unitcomplete = "untdone",
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			select = {
				[1] = "pairactv",
			},
		},
	},
}
