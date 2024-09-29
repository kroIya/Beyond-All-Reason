return {
	corgator = {
		maxacc = 0.04631,
		maxdec = 0.09262,
		energycost = 1042,
		metalcost = 118,
		buildpic = "CORGATOR.DDS",
		buildtime = 1761,
		canmove = true,
		collisionvolumeoffsets = "0 -1 1",
		collisionvolumescales = "30 15 38",
		collisionvolumetype = "Box",
		corpse = "DEAD",
		explodeas = "smallexplosiongeneric",
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		health = 820,
		maxslope = 10,
		speed = 85.5,
		maxwaterdepth = 12,
		movementclass = "TANK2",
		nochasecategory = "VTOL",
		objectname = "Units/CORGATOR.s3o",
		script = "Units/CORGATOR.cob",
		seismicsignature = 0,
		selfdestructas = "smallExplosionGenericSelfd",
		sightdistance = 273,
		trackoffset = 8,
		trackstrength = 5,
		tracktype = "corwidetracks",
		trackwidth = 21,
		turninplace = true,
		turninplaceanglelimit = 90,
		turninplacespeedlimit = 1.96,
		turnrate = 427,
		usePieceCollisionVolumes= 1,
		customparams = {
			unitgroup = 'weapon',
			basename = "base",
			firingceg = "barrelshot-tiny",
			kickback = "-2.4",
			model_author = "Mr Bob",
			normaltex = "unittextures/cor_normal.dds",
			subfolder = "corvehicles",
			weapon1turretx = 192.5,
			weapon1turrety = 192.5,
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0.0 -0.0103445068359 -0.00248718261719",
				collisionvolumescales = "21.4374389648 12.6050109863 32.0003356934",
				collisionvolumetype = "Box",
				damage = 550,
				featuredead = "HEAP",
				footprintx = 2,
				footprintz = 2,
				height = 20,
				metal = 77,
				object = "Units/corgator_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "35.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 225,
				footprintx = 2,
				footprintz = 2,
				height = 4,
				metal = 31,
				object = "Units/cor2X2F.s3o",
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
			gator_laserx = {
				areaofeffect = 8,
				avoidfeature = false,
				beamtime = 0.1,
				beamttl = 1,
				corethickness = 0.165,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				energypershot = 0,
				explosiongenerator = "custom:laserhit-small-red",
				firestarter = 50,
				impactonly = 1,
				impulseboost = 0,
				impulsefactor = 0,
				laserflaresize = 4.4,
				name = "Laser",
				noselfdamage = true,
				range = 230,
				reloadtime = 0.76667,
				rgbcolor = "1 0 0",
				soundhitdry = "",
				soundhitwet = "sizzle",
				soundstart = "lasrlit3",
				soundtrigger = 1,
				targetmoveerror = 0.12,
				thickness = 2.2,
				tolerance = 10000,
				turret = true,
				weapontype = "BeamLaser",
				weaponvelocity = 1000,
				damage = {
					default = 75,
					vtol = 9,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "GATOR_LASERX",
				onlytargetcategory = "NOTSUB",
			},
		},
	},
}
