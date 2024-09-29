return {
	corgarp = {
		maxacc = 0.03226,
		activatewhenbuilt = true,
		maxdec = 0.06453,
		energycost = 2600,
		metalcost = 220,
		buildpic = "CORGARP.DDS",
		buildtime = 3100,
		canmove = true,
		collisionvolumeoffsets = "0 -3 0",
		collisionvolumescales = "30 21 36",
		collisionvolumetype = "Box",
		usepiececollisionvolumes = 1, --------use collisionvolumes.lua
		corpse = "DEAD",
		explodeas = "smallexplosiongeneric-phib",
		footprintx = 3,
		footprintz = 3,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		health = 1420,
		maxslope = 12,
		speed = 58.5,
		maxwaterdepth = 200,
		movementclass = "ATANK3",
		nochasecategory = "VTOL",
		objectname = "Units/CORGARP.s3o",
		script = "Units/CORGARP.cob",
		seismicsignature = 0,
		selfdestructas = "smallExplosionGenericSelfd-phib",
		sightdistance = 305,
		sonardistance = 175.5,
		trackoffset = 0,
		trackstrength = 6,
		tracktype = "corparrowtracks",
		trackwidth = 22,
		turninplace = true,
		turninplaceanglelimit = 90,
		turninplacespeedlimit = 1.386,
		turnrate = 387,
		customparams = {
			unitgroup = 'weapon',
			basename = "base",
			firingceg = "barrelshot-tiny",
			kickback = "-2.4",
			model_author = "Flaka",
			normaltex = "unittextures/cor_normal.dds",
			paralyzemultiplier = 0.125,
			subfolder = "corvehicles",
			weapon1turretx = 90,
			weapon1turrety = 90,
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0.0 -0.580979279785 -0.621788024902",
				collisionvolumescales = "30.1485290527 10.4821014404 33.694442749",
				collisionvolumetype = "Box",
				damage = 731,
				featuredead = "HEAP",
				footprintx = 2,
				footprintz = 2,
				height = 9,
				metal = 134,
				object = "Units/corgarp_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "35.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 488,
				footprintx = 2,
				footprintz = 2,
				height = 4,
				metal = 67,
				object = "Units/cor2X2E.s3o",
				reclaimable = true,
				resurrectable = 0,
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:barrelshot-small",
			},
			pieceexplosiongenerators = {
				[1] = "deathceg2",
				[2] = "deathceg3",
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
			arm_pincer_gauss = {
				areaofeffect = 8,
				avoidfeature = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				cylindertargeting = 1,
				edgeeffectiveness = 0.15,
				explosiongenerator = "custom:genericshellexplosion-small",
				impulseboost = 0.123,
				impulsefactor = 0.123,
				name = "PincerCannon",
				noselfdamage = true,
				range = 305,
				reloadtime = 1.5,
				soundhit = "xplomed2",
				soundhitwet = "splshbig",
				soundstart = "cannhvy1",
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 450,
				damage = {
					default = 116,
					vtol = 25,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "ARM_PINCER_GAUSS",
				onlytargetcategory = "NOTSUB",
			},
		},
	},
}
