return {
	legacluster = {
		maxacc = 0,
		activatewhenbuilt = false,
		maxdec = 0,
		buildangle = 8192,
		energycost = 15000,
		metalcost = 2300,
		buildpic = "LEGACLUSTER.DDS",
		buildtime = 25700,
		canrepeat = false,
		category = "",
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "47 47 47",
		collisionvolumetype = "CylY",
		corpse = "DEAD",
		damagemodifier = 0.25,
		explodeas = "largeBuildingexplosiongeneric",
		footprintx = 4,
		footprintz = 4,
		idleautoheal = 5,
		idletime = 1800,
		health = 3700,
		maxslope = 12,
		maxwaterdepth = 0,
		nochasecategory = "MOBILE",
		objectname = "Units/LEGACLUSTER.s3o",
		onoffable = true,
		script = "Units/LEGACLUSTER.cob",
		seismicsignature = 0,
		selfdestructas = "largeBuildingExplosionGenericSelfd",
		sightdistance = 455,
		yardmap = "oooo oooo oooo oooo",
		customparams = {
			usebuildinggrounddecal = true,
			buildinggrounddecaltype = "decals/legacluster_aoplane.dds",
			buildinggrounddecalsizey = 1,
			buildinggrounddecalsizex = 1,
			buildinggrounddecaldecayspeed = 30,
			unitgroup = 'weapon',
			model_author = "ZephyrSkies",
			normaltex = "unittextures/leg_normal.dds",
			onoffname = "trajectory",
			subfolder = "Legion/Defenses",
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0 0 0",
				collisionvolumescales = "47 47 47",
				collisionvolumetype = "Box",
				damage = 1764,
				featuredead = "HEAP",
				footprintx = 4,
				footprintz = 4,
				height = 20,
				metal = 936,
				object = "Units/legacluster_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "85.0 14.0 6.0",
				collisionvolumetype = "cylY",
				damage = 882,
				footprintx = 3,
				footprintz = 3,
				height = 3,
				metal = 373,
				object = "Units/cor4X4B.s3o",
				reclaimable = true,
				resurrectable = 0,
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:barrelshot-medium",
			},
			pieceexplosiongenerators = {
				[1] = "deathceg2",
				[2] = "deathceg3",
				[3] = "deathceg4",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
			cloak = "kloak2",
			uncloak = "kloak2un",
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
				[1] = "twrturn3",
			},
			select = {
				[1] = "twrturn3",
			},
		},
		weapondefs = {
			plasma = {
				accuracy = 50,
				areaofeffect = 120,
				avoidfeature = false,
				-- burst = 3,
				-- burstrate = 0.2,
				-- sprayangle = 200,
				cegtag = "starfire_arty",
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.4,
				explosiongenerator = "custom:ministarfire-explosion",
				gravityaffected = "true",
				impulseboost = 0.123,
				impulsefactor = 0.5,
				name = "Pop-Up Long-range g2g Cluster Plasma Cannon",
				noselfdamage = true,
				range = 1380,
				reloadtime = 2.6,
				rgbcolor = "0.7 0.7 1.0",
				soundhit = "xplomed2",
				soundhitwet = "splsmed",
				soundstart = "cannhvy5",
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 450,
				customparams = {
					cluster = true,
					number = 6,
				},
				damage = {
					default = 200,
					lboats = 200,
					subs = 50,
					vtol = 50,
				},
			},
			cluster_munition = {
				areaofeffect = 100,
				avoidfeature = false,
				cegtag = "ministarfire",
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.3,
				explosiongenerator = "custom:ministarfire-explosion",
				gravityaffected = "true",
				impulseboost = 0.123,
				impulsefactor = 0.5,
				name = "Pop-up Long-Range Heavy g2g Cluster Plasma Cannon",
				noselfdamage = true,
				maxvelocity = 480,
				range = 250,
				rgbcolor = "0.7 0.7 1.0",
				soundhit = "xplomed2",
				soundhitwet = "splsmed",
				soundstart = "cannhvy5",
				weapontype = "Cannon",
				weaponvelocity = 450,
				damage = {
					default = 100,
					lboats = 100,
					subs = 25,
					vtol = 25,
				},
			},
			plasma_high = {
				accuracy = 50,
				areaofeffect = 210,
				avoidfeature = false,
				cegtag = "starfire_arty",
				craterareaofeffect = 240,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.4,
				explosiongenerator = "custom:ministarfire-explosion",
				gravityaffected = "true",
				hightrajectory = 1,
				impulseboost = 0.123,
				impulsefactor = 0.5,
				name = "Pop-up High-Trajectory Long-Range Heavy g2g Cluster Plasma Cannon",
				noselfdamage = true,
				range = 1380,
				reloadtime = 6.3,
				rgbcolor = "0.7 0.7 1.0",
				soundhit = "xplolrg4",
				soundhitwet = "splslrg",
				soundstart = "cannhvy6",
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 450,
				customparams = {
					cluster = true,
					number = 8,
				},
				damage = {
					default = 250,
					subs = 50,
					vtol = 50,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "PLASMA",
				maindir = "0 1 0",
				maxangledif = 230,
				onlytargetcategory = "SURFACE",
			},
			[2] = {
				def = "PLASMA_HIGH",
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
