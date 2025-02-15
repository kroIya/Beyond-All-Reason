--============================================================--

-- Action Types

--============================================================--

local actionTypes = {
	-- Triggers
	EnableTrigger      = 100,       --
	DisableTrigger     = 101,       --

	-- Orders
	IssueOrders        = 200,       --
	AllowCommands      = 201,
	RestrictCommands   = 202,

	-- Build Options
	AlterBuildlist     = 300,
	EnableBuildOption  = 301,
	DisableBuildOption = 302,

	-- Units
	SpawnUnits         = 400,       --
	DespawnUnits       = 401,       --
	TransferUnits      = 404,       --

	-- SFX
	SpawnExplosion     = 500,       --
	SpawnWeapons       = 501,
	SpawnEffects       = 502,

	-- Map
	RevealLOS          = 600,
	UnrevealLOS        = 601,
	AlterMapZones      = 602,

	-- Media
	ControlCamera      = 700,
	Pause              = 701,
	Unpause            = 702,
	PlayMedia          = 703,
	SendMessage        = 704,

	-- Win Condition
	Victory            = 800,
	Defeat             = 801,

	-- Custom
	Custom             = 900,       --
}

--============================================================--

-- Action Parameters

--============================================================--

local parameters = {
	-- Triggers
	[actionTypes.EnableTrigger] = {
		[1] = {
			name = 'triggerID',
			required = true,
			type = 'string',
		},
	},

	[actionTypes.DisableTrigger] = {
		[1] = {
			name = 'triggerID',
			required = true,
			type = 'string',
		},
	},

	-- Orders
	[actionTypes.IssueOrders] = {
		[1] = {
			name = 'name',
			required = 'name or unitDefName',
			type = 'string'
		},
		[2] = {
			name = 'unitDefName',
			required = 'name or unitDefName',
			type = 'string'
		},
		[3] = {
			name = 'team',
			required = false,
			type = 'number'
		},
		[4] = {
			name = 'orders',
			required = true,
			type = 'table'
		}
	},
	[actionTypes.AllowCommands] = {},
	[actionTypes.RestrictCommands] = {},

	-- Build Options
	[actionTypes.AlterBuildlist] = {},
	[actionTypes.EnableBuildOption] = {},
	[actionTypes.DisableBuildOption] = {},

	-- Units
	[actionTypes.SpawnUnits] = {
		[1] = {
			name = 'name',
			required = false,
			type = 'string',
		},
		[2] = {
			name = 'unitDefName',
			required = true,
			type = 'string',
		},
		[3] = {
			name = 'quantity',
			required = false,
			type = 'number',
		},
		[4] = {
			name = 'position x',
			required = true,
			type = 'number'
		},
		[5] = {
			name = 'position y',
			required = false,
			type = 'number'
		},
		[6] = {
			name = 'position z',
			required = true,
			type = 'number'
		},
		[7] = {
			name = 'facing',
			required = false,
			type = 'string'
		},
		[8] = {
			name = 'construction',
			required = false,
			type = 'bool'
		}
	},

	[actionTypes.DespawnUnits] = {
		[1] = {
			name = 'name',
			required = 'name or unitDefName',
			type = 'string'
		},
		[2] = {
			name = 'unitDefName',
			required = 'name or unitDefName',
			type = 'string'
		},
		[3] = {
			name = 'team',
			required = false,
			type = 'number'
		},
		[4] = {
			name = 'explode',
			required = false,
			type = 'boolean'
		},
	},
	[actionTypes.SpawnWeapons] = {},
	[actionTypes.SpawnEffects] = {},
	[actionTypes.TransferUnits] = {
		[1] = {
			name = 'name',
			required = 'name or unitDefName',
			type = 'string'
		},
		[2] = {
			name = 'unitDefName',
			required = 'name or unitDefName',
			type = 'string'
		},
		[3] = {
			name = 'team',
			required = false,
			type = 'number'
		},
		[4] = {
			name = 'newTeam',
			required = true,
			type = 'number'
		},
		[5] = {
			name = 'given',
			required = false,
			type = 'boolean'
		}
	},

	-- SFX
	[actionTypes.SpawnExplosion] = {
		[1] = {
			name = 'position x',
			required = true,
			type = 'number'
		},
		[2] = {
			name = 'position y',
			required = false,
			type = 'number'
		},
		[3] = {
			name = 'position z',
			required = true,
			type = 'number'
		},
		[4] = {
			name = 'direction x',
			required = true,
			type = 'number'
		},
		[5] = {
			name = 'direction y',
			required = true,
			type = 'number'
		},
		[6] = {
			name = 'direction z',
			required = true,
			type = 'number'
		},
		[7] = {
			name = 'params',
			required = true,
			type = 'table'
		}
	},

	-- Map
	[actionTypes.RevealLOS] = {},
	[actionTypes.UnrevealLOS] = {},
	[actionTypes.AlterMapZones] = {},

	-- Media
	[actionTypes.ControlCamera] = {},
	[actionTypes.Pause] = {},
	[actionTypes.Unpause] = {},
	[actionTypes.PlayMedia] = {},

	[actionTypes.SendMessage] = {
		[1] = {
			name = 'message',
			required = true,
			type = 'string',
		}
	},

	-- Win Condition
	[actionTypes.Victory] = {
		[1] = {
			name = 'allyTeams',
			required = true,
			type = 'table'
		}
	},
	[actionTypes.Defeat] = {
		[1] = {
			name = 'allyTeams',
			required = true,
			type = 'table'
		}
	},

	-- Custom
	[actionTypes.Custom] = {
		[1] = {
			name = 'function',
			required = true,
			type = 'function',
		},
	},
}

--============================================================--

return {
	Types = actionTypes,
	Parameters = parameters
}

--============================================================--
