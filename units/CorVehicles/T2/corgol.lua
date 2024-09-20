return {
	corgol = {
		maxacc = 0.01018,
		maxdec = 0.02037,
		energycost = 22000,
		metalcost = 1650,
		buildpic = "CORGOL.DDS",
		buildtime = 26100,
		canmove = true,
		category = "",
		collisionvolumeoffsets = "0 -10 -1",
		collisionvolumescales = "50 50 50",
		collisionvolumetype = "BOX",
		corpse = "DEAD",
		explodeas = "hugeexplosiongeneric",
		footprintx = 4,
		footprintz = 4,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		mass = 5001,
		health = 7800,
		maxslope = 12,
		speed = 40.5,
		maxwaterdepth = 12,
		movementclass = "HTANK4",
		nochasecategory = "VTOL",
		objectname = "Units/CORGOL.s3o",
		script = "Units/CORGOL.cob",
		seismicsignature = 0,
		selfdestructas = "hugeExplosionGenericSelfd",
		sightdistance = 395,
		trackoffset = 8,
		trackstrength = 10,
		tracktype = "corwidetracks",
		trackwidth = 49,
		turninplace = true,
		usePieceCollisionVolumes= 1,
		turninplaceanglelimit = 90,
		turninplacespeedlimit = 0.957,
		turnrate = 176,
		customparams = {
			usebuildinggrounddecal = true,
			buildinggrounddecaltype = "decals/corgol_aoplane.dds",
			buildinggrounddecalsizey = 6,
			buildinggrounddecalsizex = 6,
			buildinggrounddecaldecayspeed = 30,
			buildinggrounddecalalpha = 0.5,
			unitgroup = 'weapon',
			basename = "base",
			firingceg = "barrelshot-medium",
			kickback = "-2.4",
			model_author = "Mr Bob",
			normaltex = "unittextures/cor_normal.dds",
			subfolder = "corvehicles/t2",
			techlevel = 2,
			weapon1turretx = 30,
			weapon1turrety = 40,
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0 -10 -1",
				collisionvolumescales = "50 50 50",
				collisionvolumetype = "BOX",
				damage = 4500,
				featuredead = "HEAP",
				footprintx = 4,
				footprintz = 4,
				height = 20,
				metal = 894,
				object = "Units/corgol_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "85.0 14.0 6.0",
				collisionvolumetype = "cylY",
				damage = 3000,
				footprintx = 4,
				footprintz = 4,
				height = 4,
				metal = 378,
				object = "Units/cor4X4C.s3o",
				reclaimable = true,
				resurrectable = 0,
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:barrelshot-large",
				[2] = "custom:dust_cloud_dirt",
			},
			pieceexplosiongenerators = {
				[1] = "deathceg3",
				[2] = "deathceg4",
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
				[1] = "tcormove",
			},
			select = {
				[1] = "tcorsel",
			},
		},
		weapondefs = {
			cor_gol = {
				areaofeffect = 292,
				avoidfeature = false,
				craterareaofeffect = 292,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				explosiongenerator = "custom:genericshellexplosion-large-aoe",
				gravityaffected = "true",
				impulseboost = 0.123,
				impulsefactor = 0.123,
				name = "HeavyCannon",
				noselfdamage = true,
				range = 650,
				reloadtime = 3,
				soundhit = "xplomed4",
				soundhitwet = "splslrg",
				soundstart = "cannhvy2",
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 310,
				damage = {
					default = 900,
					subs = 200,
					vtol = 55,
				},
			},
		},
		weapons = {
			[1] = {
				def = "COR_GOL",
				onlytargetcategory = "SURFACE",
				fastautoretargeting = true,
			},
		},
	},
}
