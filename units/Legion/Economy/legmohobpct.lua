return {
	legmohobpct = {
		maxacc = 0,
		maxdec = 4.5,
		energycost = 1,
		metalcost = 1,
		buildpic = "LEGMOHOBP.DDS",
		buildtime = 10,
		builddistance = 800,
		builder = true,
		canmove = false,
		category = "OBJECT",
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "0 0 0",
		collisionvolumetype = "Box",
		damagemodifier = 0,
		reclaimable = false,
		capturable = false,
		explodeas = "",
		footprintx = 3,
		footprintz = 3,
		idleautoheal = 5,
		idletime = 1800,
		health = 5125,
		maxwaterdepth = 0,
		objectname = "Units/LEGMOHOBPCT.s3o",
		script = "Units/LEGMOHOBPCT.cob",
		stealth = true,
		seismicsignature = 0,
		selfdestructas = "",
		sightdistance = 380,
		terraformspeed = 1000,
		turnrate = 1,
		upright = true,
		workertime = 400,
		customparams = {
			unitgroup = 'builder',
			model_author = "Tharsis",
			normaltex = "unittextures/leg_normal.dds",
			paralyzemultiplier = 0.1,
			subfolder = "corbuildings/landutil",
		},
		sfxtypes = {
			pieceexplosiongenerators = {
				[1] = "deathceg2-builder",
				[2] = "deathceg3-builder",
				[3] = "deathceg4-builder",
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
				[1] = "vcormove",
			},
			select = {
				[1] = "vcorsel",
			},
		},
	},
}
