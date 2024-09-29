return {
	armbrawl = {
		maxacc = 0.24,
		blocking = false,
		maxdec = 0.44,
		energycost = 6200,
		metalcost = 310,
		buildpic = "ARMBRAWL.DDS",
		buildtime = 13500,
		canfly = true,
		canmove = true,
		collide = true,
		cruisealtitude = 100,
		explodeas = "mediumExplosionGeneric",
		footprintx = 3,
		footprintz = 3,
		hoverattack = true,
		idleautoheal = 5,
		idletime = 1800,
		health = 1780,
		maxslope = 10,
		speed = 160.8,
		maxwaterdepth = 0,
		nochasecategory = "VTOL",
		objectname = "Units/ARMBRAWL.s3o",
		script = "Units/ARMBRAWL.cob",
		seismicsignature = 0,
		selfdestructas = "mediumExplosionGenericSelfd",
		sightdistance = 550,
		turninplaceanglelimit = 360,
		turnrate = 800,
		customparams = {
			unitgroup = 'weapon',
			model_author = "FireStorm",
			normaltex = "unittextures/Arm_normal.dds",
			subfolder = "armaircraft/t2",
			techlevel = 2,
			firingceg = "barrelshot-tiny",
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:barrelshot-tiny",
			},
			crashexplosiongenerators = {
				[1] = "crashing-small",
				[2] = "crashing-small",
				[3] = "crashing-small2",
				[4] = "crashing-small3",
				[5] = "crashing-small3",
			},
			pieceexplosiongenerators = {
				[1] = "airdeathceg3",
				[2] = "airdeathceg4",
				[3] = "airdeathceg2",
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
				[1] = "vtolarmv",
			},
			select = {
				[1] = "vtolarac",
			},
		},
		weapondefs = {
			vtol_emg = {
				areaofeffect = 16,
				avoidfeature = false,
				burst = 4,
				burstrate = 0.15,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				explosiongenerator = "custom:plasmahit-medium",
				impulseboost = 0.123,
				impulsefactor = 0.123,
				intensity = 0.8,
				name = "Rapid-fire a2g plasma guns",
				noselfdamage = true,
				range = 380,
				reloadtime = 0.6,
				rgbcolor = "1 0.95 0.4",
				size = 3,
				soundhitwet = "splshbig",
				soundstart = "brawlemg",
				sprayangle = 1024,
				tolerance = 6000,
				turret = false,
				weapontimer = 1,
				weapontype = "Cannon",
				weaponvelocity = 800,
				damage = {
					default = 16,
					vtol = 2,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "VTOL_EMG",
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
