return {
	armcomlvl2 = {
		maxacc = 0.18,
		activatewhenbuilt = true,
		autoheal = 5,
		maxdec = 1.125,
		energycost = 30000,
		metalcost = 3000,
		builddistance = 153,
		builder = true,
		buildpic = "ARMCOM.DDS",
		buildtime = 75000,
		cancapture = true,
		cancloak = true,
		canmanualfire = true,
		canmove = true,
		capturable = false,
		capturespeed = 1800,
		category = "",
		cloakcost = 100,
		cloakcostmoving = 1000,
		collisionvolumeoffsets = "0 3 0",
		collisionvolumescales = "28 52 28",
		collisionvolumetype = "CylY",
		corpse = "DEAD",
		energymake = 50,
		energystorage = 1000,
		explodeas = "commanderExplosion",
		footprintx = 2,
		footprintz = 2,
		hidedamage = true,
    	holdsteady = true,
		icontype = "armcom",
		idleautoheal = 5,
		idletime = 1800,
		sightemitheight = 40,
		mass = 4900,
		health = 6000,
		maxslope = 20,
		speed = 37.5,
		maxwaterdepth = 35,
		metalmake = 3,
		metalstorage = 500,
		mincloakdistance = 50,
		movementclass = "COMMANDERBOT",
		nochasecategory = "ALL",
		objectname = "Units/ARMCOM"..(Spring.GetModOptions().xmas and '-XMAS' or '')..".s3o",
		pushresistant = true,
		radardistance = 700,
		radaremitheight = 40,
		reclaimable = false,
   		releaseheld  = true,
		script = "Units/ARMCOM_lus.lua",
		seismicsignature = 0,
		selfdestructas = "commanderexplosion",
		selfdestructcountdown = 5,
		showplayername = true,
		sightdistance = 450,
		sonardistance = 450,
		terraformspeed = 1500,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 0.825,
		turnrate = 1148,
		upright = true,
		workertime = 324,
		buildoptions = {
			"armsolar",
			"armwin",
			"armmstor",
			"armestor",
			"armmex",
			"armmakr",
			"armlab",
			"armvp",
			"armap",
			"armeyes",
			"armrad",
			"armdrag",
			"armllt",
			"armrl",
			"armdl",
			"armtide",
			"armuwms",
			"armuwes",
			"armfmkr",
			"armsy",
			"armfdrag",
			"armtl",
			"armfrt",
			"armfrad",
			"armhp",
			"armfhp",
			"armmine1",
			"armmine2",
			"armmine3",
			"armbeamer",
			"armhlt",
			"armferret",
			"armfrock",
		},
		customparams = {
			unitgroup = 'builder',
			area_mex_def = "armmex",
			iscommander = true,
			effigy_offset = 1,
			evocomlvl = 2,
			--energyconv_capacity = 70,
			--energyconv_efficiency = 1/70,
			model_author = "FireStorm",
			normaltex = "unittextures/Arm_normal.dds",
			paralyzemultiplier = 0.025,
			subfolder = "",
			combatradius = 0,
			workertimeboost = 2,
			wtboostunittype = "TURRET",
			inheritxpratemultiplier = 0.5,
			childreninheritxp = "TURRET MOBILEBUILT",
			parentsinheritxp = "TURRET MOBILEBUILT",
			evolution_health_transfer = "percentage",
			evolution_target = "armcomlvl3",
			evolution_condition = "timer",
			evolution_timer = 99999,
			evolution_power_threshold = 22000,
			evolution_power_multiplier = 1,
			effigy = "comeffigylvl1",
			minimum_respawn_stun = 5,
			distance_stun_multiplier = 1,
			fall_damage_multiplier = 5,--this ensures commander dies when it hits the ground so effigies can trigger respawn.
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0 0 0",
				collisionvolumescales = "35 12 54",
				collisionvolumetype = "CylY",
				damage = 12000,
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 20,
				hitdensity = 100,
				metal = 1250,
				object = "Units/armcom_dead.s3o",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "35 12 54",
				collisionvolumetype = "cylY",
				damage = 5000,
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 4,
				hitdensity = 100,
				metal = 500,
				object = "Units/arm2X2F.s3o",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:com_sea_laser_bubbles",
				[2] = "custom:barrelshot-medium",
				[3] = "custom:footstep-medium",
			},
			pieceexplosiongenerators = {
				[1] = "deathceg3",
				[2] = "deathceg4",
			},
		},
		sounds = {
			build = "nanlath1",
			canceldestruct = "cancel2",
			capture = "capture1",
			cloak = "kloak1",
			repair = "repair1",
			uncloak = "kloak1un",
			underattack = "warning2",
			unitcomplete = "armcomsel",
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
				[1] = "armcom1",
				[2] = "armcom2",
				[3] = "armcom3",
				[4] = "armcom4",
			},
			select = {
				[1] = "armcomsel",
			},
		},
		weapondefs = {
			shortgun = {
				accuracy = 50,
				allowNonBlockingAim = true,
				areaofeffect = 10,
				avoidfeature = false,
				beamdecay = 0.05,
				beamtime = 0.1,
				beamttl = 1,
				corethickness = 0.233,
				burnblow = true,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				cylindertargeting = 1,
				edgeeffectiveness = 0.15,
				explosionscar = false,
				explosiongenerator = "custom:laserhit-beamer",
				firestarter = 100,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				intensity = 0.7,
				laserflaresize = 9.35,
				name = "Scatter Beamer",
				noselfdamage = true,
				projectiles = 9,
				range = 300,
				reloadtime = 0.1,
				rgbcolor = "0 0 1",
				soundhitdry = "",
				soundhitwet = "sizzle",
				soundstart = "beamershot2",
				sprayangle = 2500,
				tolerance = 5000,
				turret = true,
				weapontype = "BeamLaser",
				weaponvelocity = 1000,
				damage = {
					default = 14,
				},
			},
			armcomsealaser = {
				areaofeffect = 12,
				avoidfeature = false,
				beamtime = 0.3,
				camerashake = 0,
				corethickness = 0.4,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				cylindertargeting = 1,
				edgeeffectiveness = 1,
				explosiongenerator = "custom:laserhit-small-blue",
				firestarter = 35,
				firesubmersed = true,
				impulseboost = 0,
				impulsefactor = 0,
				intensity = 0.3,
				laserflaresize = 7.7,
				name = "Light underwater-combat laser",
				noselfdamage = true,
				range = 300,
				reloadtime = 1,
				rgbcolor = "0 0 0.8",
				rgbcolor2 = "0.0 0.0 0.2",
				soundhitdry = "",
				soundhitwet = "sizzle",
				soundstart = "uwlasrfir1",
				soundtrigger = 1,
				targetmoveerror = 0.05,
				thickness = 5,
				tolerance = 10000,
				turret = true,
				waterweapon = true,
				weapontype = "BeamLaser",
				weaponvelocity = 900,
				damage = {
					default = 400,
					subs = 200,
				},
			},
			disintegrator = {
				areaofeffect = 36,
				avoidfeature = false,
				avoidfriendly = false,
				avoidground = false,
				bouncerebound = 0,
				cegtag = "dgunprojectile",
				commandfire = true,
				craterboost = 0,
				cratermult = 0.15,
				edgeeffectiveness = 0.15,
				energypershot = 500,
				explosiongenerator = "custom:expldgun",
				firestarter = 100,
				firesubmersed = false,
				impulseboost = 0,
				impulsefactor = 0,
				name = "Disintegrator",
				noexplode = true,
				noselfdamage = true,
				range = 250,
				reloadtime = 0.9,
				soundhit = "xplomas2",
				soundhitwet = "sizzlexs",
				soundstart = "disigun1",
				soundhitvolume = 36,
				soundstartvolume = 96,
				soundtrigger = true,
				tolerance = 20000,
				turret = true,
				waterweapon = true,
				weapontimer = 4.2,
				weapontype = "DGun",
				weaponvelocity = 300,
				damage = {
					commanders = 0,
					default = 99999,
					scavboss = 1000,
					raptorqueen = 1000,
				},
			},
			repulsor1 = {
				avoidfeature = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				name = "Plasma repulsor",
				range = 50,
				soundhitwet = "sizzle",
				weapontype = "Shield",
				damage = {
					default = 100,
				},
				shield = {
					alpha = 0.25,
					force = 2.5,
					intercepttype = 479,
					power = 1000,
					powerregen = 20,
					powerregenenergy = 0,
					radius = 30,
					repulser = false,
					smart = true,
					startingpower = 1000,
					visible = false,
					visiblehitframes = 0,
					badcolor = {
						[1] = 1,
						[2] = 0.2,
						[3] = 0.2,
						[4] = 0.25,
					},
					goodcolor = {
						[1] = 0.2,
						[2] = 1,
						[3] = 0.2,
						[4] = 0.2,
					},
				},
			},
		},
		weapons = {
			[1] = {
				def = "SHORTGUN",
				onlytargetcategory = "NOTSUB",
                fastautoretargeting = true,
			},
			[2] = {
				badtargetcategory = "VTOL",
				def = "ARMCOMSEALASER",
				onlytargetcategory = "NOTAIR"
			},
			[3] = {
				def = "DISINTEGRATOR",
				onlytargetcategory = "NOTSUB",
			},
		},
	},
}
