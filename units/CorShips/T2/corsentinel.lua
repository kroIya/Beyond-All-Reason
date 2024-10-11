return {
	corsentinel = {
		acceleration = 0.01722,
		activatewhenbuilt = true,
		brakerate = 0.01722,
		buildangle = 16384,
		buildcostenergy = 12500,
		buildcostmetal = 1250,
		buildpic = "CORSENTINEL.DDS",
		buildtime = 20000,
		canmove = true,
		canreclaim = false,
		canrepair = false,
		collisionvolumeoffsets = "-1 5 0",
		collisionvolumescales = "48 48 102",
		collisionvolumetype = "CylZ",
		corpse = "DEAD",
		explodeas = "hugeexplosiongeneric",
		floater = true,
		footprintx = 6,
		footprintz = 6,
		idleautoheal = 15,
		idletime = 600,
		losemitheight = 56,
		mass = 5000,
		maxdamage = 3800,
		maxvelocity = 2.1,
		minwaterdepth = 15,
		movementclass = "BOAT8",
		nochasecategory = "VTOL",
		objectname = "Units/CORSENTINEL.s3o",
		script = "Units/CORSENTINEL.cob",
		seismicsignature = 0,
		selfdestructas = "hugeexplosiongenericSelfD",
		sightdistance = 650,
		sonardistance = 700,
		turninplace = true,
		turninplaceanglelimit = 90,
		turnrate = 180,
		waterline = 0,
		customparams = {
			maxrange = 600,
			model_author = "Odin, Hornet",
			normaltex = "unittextures/Cor_normal.dds",
			subfolder = "CorShips/T2",
			techlevel = 2,
			inheritxpratemultiplier = 1,
			childreninheritxp = "DRONE",
			parentsinheritxp = "DRONE",
		},
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "-0.0550308227539 1.52587890767e-06 4.55026245117",
				collisionvolumescales = "61.8225860596 60.9250030518 154.450805664",
				collisionvolumetype = "Box",
				damage = 9168,
				energy = 0,
				featuredead = "HEAP",
				footprintx = 6,
				footprintz = 6,
				height = 4,
				hitdensity = 100,
				metal = 700,
				object = "Units/CORSENTINEL_DEAD.s3o",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 4032,
				energy = 0,
				footprintx = 2,
				footprintz = 2,
				height = 4,
				hitdensity = 100,
				metal = 350,
				object = "Units/arm6X6C.s3o",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:radarpulse_t1_slow",
				[2] = "custom:waterwake-large",
				[3] = "custom:bowsplash-huge",
			},
			pieceexplosiongenerators = {
				[1] = "deathceg2",
				[2] = "deathceg3",
				[3] = "deathceg4",
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
				[1] = "sharmmov",
			},
			select = {
				[1] = "sharmsel",
			},
		},
		weapondefs = {
			plasma = {
				areaofeffect = 4,
				avoidfeature = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				explosiongenerator = "",--"custom:genericshellexplosion-medium",
				gravityaffected = "true",
				hightrajectory = 1,
				impulseboost = 1.9,
				impulsefactor = 0.123,
				name = "Depth Charge Drones",
				noselfdamage = true,
				range = 1300,
				reloadtime = 2.5,
				size = 0,
				soundhit = "",--"xplomed2",
				soundhitwet = "",--"splssml",
				soundstart = "",--"cannhvy1",
				turret = true,
				waterweapon = true,
				weapontype = "Cannon",
				weaponvelocity = 800,
				damage = {
					default = 0,
				},
				customparams = {
					carried_unit = "cortdrone",     --Name of the unit spawned by this carrier unit.
					-- carried_unit2... 			Currently not implemented, but planned.
					engagementrange = 1300,
					spawns_surface = "SEA",    -- "LAND" or "SEA". The SEA option has not been tested currently.
					spawnrate = 6, 				--Spawnrate roughly in seconds.
					maxunits = 5,				--Will spawn units until this amount has been reached.
					buildcostenergy = 1000,--650,			--Custom spawn cost. Remove this or set = nil to inherit the cost from the carried_unit unitDef. Cost inheritance is currently not working.
					buildcostmetal = 40,--29,			--Custom spawn cost. Remove this or set = nil to inherit the cost from the carried_unit unitDef. Cost inheritance is currently not working.
					controlradius = 1400,			--The spawned units should stay within this radius. Unfinished behavior may cause exceptions. Planned: radius = 0 to disable radius limit.
					decayrate = 2,
					attackformationspread = 200,	--Used to spread out the drones when attacking from a docked state. Distance between each drone when spreading out.
					attackformationoffset = 30,	--Used to spread out the drones when attacking from a docked state. Distance from the carrier when they start moving directly to the target. Given as a percentage of the distance to the target.
					carrierdeaththroe = "death",
					dockingarmor = 0.2,
					dockinghealrate = 54,
					docktohealthreshold = 50,
					enabledocking = true,		--If enabled, docking behavior is used. Currently docking while moving or stopping, and undocking while attacking. Unfinished behavior may cause exceptions.
					dockingHelperSpeed = 5,
					dockingpieces = "4 5 6 7 8 9 10",
					dockingradius = 300,			--The range at which the units snap to the carrier unit when docking.
				}
			},
			
			sentinel_depthcharge = {
				avoidfeature = false,
				avoidfriendly = false,
				bouncerebound = 0.6,
				bounceslip = 0.6,
				burnblow = true,
				collidefriendly = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				explosiongenerator = "custom:genericshellexplosion-small-uw",
				flighttime = 1.75,
				groundbounce = true,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				model = "cordepthcharge.s3o",
				name = "Depthcharge launcher",
				noselfdamage = true,
				numbounce = 1,
				range = 600,
				reloadtime = 1.5,
				soundhit = "xplodep2",
				soundhitwet = "splsmed",
				soundstart = "torpedo1",
				soundhitvolume = 3,
				soundhitwetvolume = 12,
				startvelocity = 300,
				tracks = true,
				turnrate = 64000,
				turret = true,
				waterweapon = true,
				weapontype = "TorpedoLauncher",
				weaponvelocity = 200,
				damage = {
					--commanders = 340,
					default = 255,
					-- subs = 300,
				},
			},			
			
		},
		weapons = {
			[1] = {
				def = "PLASMA",
				onlytargetcategory = "CANBEUW UNDERWATER",
			},
			[2] = {
				def = "sentinel_depthcharge",
				onlytargetcategory = "CANBEUW UNDERWATER",
			},
		},
	},
}
