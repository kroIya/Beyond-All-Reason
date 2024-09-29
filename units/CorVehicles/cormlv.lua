return {
	cormlv = {
		maxacc = 0.06681,
		activatewhenbuilt = true,
		maxdec = 0.1327,
		energycost = 1300,
		metalcost = 65,
		builddistance = 96,
		builder = true,
		buildpic = "CORMLV.DDS",
		buildtime = 3640,
		canassist = false,
		--canguard = false,
		canmove = true,
		canreclaim = false,
		canrepair = true,
		canrestore = false,
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "30 17 45",
		collisionvolumetype = "Box",
		corpse = "DEAD",
		explodeas = "smallexplosiongeneric",
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		mass = 1500,
		health = 450,
		maxslope = 16,
		speed = 69.0,
		maxwaterdepth = 0,
		movementclass = "TANK2",
		nochasecategory = "VTOL",
		objectname = "Units/CORMLV.s3o",
		radardistancejam = 64,
		script = "Units/cormlv_clean.cob",
		seismicsignature = 0,
		selfdestructas = "smallExplosionGenericSelfd",
		sightdistance = 450,
		stealth = true,
		terraformspeed = 120,
		trackoffset = 12,
		trackstrength = 5,
		tracktype = "corwidetracks",
		trackwidth = 17,
		turninplace = true,
		turninplaceanglelimit = 90,
		turninplacespeedlimit = 1.62228,
		turnrate = 590,
		workertime = 40,
		buildoptions = {
			[1] = "cormine1",
			[2] = "cormine2",
			[3] = "cormine3",
			[4] = "cordrag",
			[5] = "coreyes",
		},
		customparams = {
			minesweeper = 450,
			unitgroup = 'builder',
			model_author = "Mr Bob",
			normaltex = "unittextures/cor_normal.dds",
			subfolder = "corvehicles",
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0 -1 0",
				collisionvolumescales = "30 17 45",
				collisionvolumetype = "Box",
				damage = 133,
				featuredead = "HEAP",
				footprintx = 2,
				footprintz = 2,
				height = 20,
				metal = 37,
				object = "Units/cormlv_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "55.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 60,
				footprintx = 3,
				footprintz = 3,
				height = 4,
				metal = 15,
				object = "Units/cor3X3F.s3o",
				reclaimable = true,
				resurrectable = 0,
			},
		},
		sfxtypes = {
			pieceexplosiongenerators = {
				[1] = "deathceg2",
				[2] = "deathceg3",
			},
		},
		sounds = {
			build = "nanlath2",
			canceldestruct = "cancel2",
			capture = "capture1",
			repair = "repair2",
			underattack = "warning1",
			working = "reclaim1",
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
		weapondefs = {
			minesweep = {
				areaofeffect = 48,
				avoidfeature = false,
				collidefriendly = false,
				craterareaofeffect = 48,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.4,
				explosiongenerator = "custom:MINESWEEP",
				name = "Seismic charge",
				noselfdamage = true,
				range = 220,
				reloadtime = 3,
				rgbcolor = "0.2 0.6 0.2",
				tolerance = 3000,
				fireTolerance = 3000,
				turret = true,
				weapontimer = 0.1,
				weapontype = "Cannon",
				weaponvelocity = 275,
				damage = {
					default = 15,
				},
			},
		},
		weapons = {
			[1] = {
				def = "MINESWEEP",
				onlytargetcategory = "MINE",
			},
		},
	},
}
