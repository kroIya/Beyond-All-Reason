return {
	coreyes = {
		maxacc = 0,
		activatewhenbuilt = true,
		maxdec = 0,
		buildangle = 8192,
		energycost = 850,
		metalcost = 32,
		buildpic = "COREYES.DDS",
		buildtime = 750,
		canrepeat = false,
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "20 24 20",
		collisionvolumetype = "CylY",
		cloakcost = 10,
		corpse = "CDRAGONSEYES_DEAD",
		energyupkeep = 5,
		footprintx = 1,
		footprintz = 1,
		idleautoheal = 5,
		idletime = 300,
		initcloaked = true,
		levelground = false,
		health = 280,
		maxslope = 24,
		maxwaterdepth = 0,
		mincloakdistance = 36,
		objectname = "Units/COREYES.s3o",
		script = "Units/COREYES.cob",
		seismicsignature = 0,
		sightdistance = 540,
		stealth = true,
		waterline = 5,
		yardmap = "o",
		customparams = {
			unitgroup = 'util',
			model_author = "Mr Bob",
			normaltex = "unittextures/cor_normal.dds",
			removestop = true,
			removewait = true,
			subfolder = "corbuildings/landutil",
		},
		featuredefs = {
			cdragonseyes_dead = {
				blocking = false,
				category = "heaps",
				collisionvolumeoffsets = "-0.0323944091797 0.0 0.00588226318359",
				collisionvolumescales = "21.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 120,
				footprintx = 1,
				footprintz = 1,
				height = 4,
				metal = 12,
				object = "Units/cor1X1A.s3o",
				reclaimable = true,
				resurrectable = 0,
			},
		},
		sfxtypes = {
			pieceexplosiongenerators = {
				[1] = "deathceg2",
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
				[1] = "servsml6",
			},
			select = {
				[1] = "minesel2",
			},
		},
	},
}
