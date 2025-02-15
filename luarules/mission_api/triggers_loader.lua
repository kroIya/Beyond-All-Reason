local schema = VFS.Include('luarules/mission_api/triggers_schema.lua')
local parameters = schema.Parameters

--[[
	triggerID = {
		type = triggerTypes.TimeElapsed,
		settings = { -- all individual settings, and settings table itself, are optional
			prerequisites = {},
			repeating = false,
			maxRepeats = nil,
			difficulties = {},
			coop = false,
			active = true,
		},
		parameters = {
			gameFrame = 123,
			interval = 300,
		},
		actions = { 'actionID1', 'actionID2' },
	}
]]

local triggers = {}

local function prevalidateTriggers()
	for triggerID, trigger in pairs(triggers) do
		if not trigger.type then
			Spring.Log('triggers_loader.lua', LOG.ERROR, "[Mission API] Trigger missing type: " .. triggerID)
		end

		if not trigger.actions or next(trigger.actions) == nil then
			Spring.Log('triggers_loader.lua', LOG.ERROR, "[Mission API] Trigger has no actions: " .. triggerID)
		end

		local requisites = {}
		for _, parameter in pairs(parameters[trigger.type]) do
			local value = trigger.parameters[parameter.name]
			local valueType = type(value)
			if parameter.required then
				if value == nil and type(parameter.required) == 'boolean' then
					Spring.Log('triggers_loader.lua', LOG.ERROR, "[Mission API] Trigger missing required parameter. Trigger: " .. triggerID .. ", Parameter: " .. parameter.name)
				elseif type(parameter.required) == 'string' then
					if not requisites[parameter.required] then
						requisites[parameter.required] = false
					end
					if value ~= nil then
						requisites[parameter.required] = true
					end
				else
					Spring.Log('triggers_loader.lua', LOG.ERROR, "[Mission API] Unknown requirement type, not player-facing. Trigger: " ..triggerID .. ", Parameter: " .. parameter.name)
				end
			end

			if value ~= nil and GG['MissionAPI'].Types[parameter.type] then
				if value.__name ~= parameter.type then
					local actualType = value.__name or valueType
					Spring.Log('actions_loader.lua', LOG.ERROR, "[Mission API] Unexpected parameter type, expected " .. parameter.type .. ", got " .. actualType .. ". Action: " .. triggerID .. ", Parameter: " .. parameter.name)
				elseif value.validate then 
					value.validate('actions_loader.lua', 'Mission API') 
				end

			elseif value ~= nil and type ~= parameter.type then
				Spring.Log('triggers_loader.lua', LOG.ERROR, "[Mission API] Unexpected parameter type, expected " .. parameter.type .. ", got " .. valueType .. ". Trigger: " .. triggerID .. ", Parameter: " .. parameter.name)
			end
		end
		for requisite, bool in pairs(requisites) do
			if bool == false then
				Spring.Log('actions_loader.lua', LOG.ERROR, "[Mission API] Action missing required parameter(s). Action: " ..actionID .. ", Parameter(s): " .. parameter.required)
			end
		end
	end
end

local function preprocessRawTriggers(rawTriggers)
	for triggerID, rawTrigger in pairs(rawTriggers) do
		local settings = rawTrigger.settings or {}
		settings.prerequisites = settings.prerequisites or {}
		settings.repeating = settings.repeating or false
		settings.maxRepeats = settings.maxRepeats or nil
		settings.difficulties = settings.difficulties or nil
		settings.coop = settings.coop or false
		settings.active = settings.active or true

		rawTrigger.settings = settings
		rawTrigger.triggered = false
		rawTrigger.repeatCount = 0

		triggers[triggerID] = table.copy(rawTrigger)
	end

	prevalidateTriggers()
end

local function postvalidateTriggers()
	local actions = GG['MissionAPI'].Actions
	for triggerID, trigger in pairs(triggers) do
		for _, actionID in pairs(trigger.actions) do
			if not actions[actionID] then
				Spring.Log('triggers_loader.lua', LOG.ERROR, "[Mission API] Trigger has action that does not exist. Trigger: " .. triggerID .. ", Action: " .. actionID)
			end
		end
	end
end

local function postprocessTriggers()
	postvalidateTriggers()
end

local function getTriggers()
	return triggers
end

return {
	GetTriggers = getTriggers,
	PreprocessRawTriggers = preprocessRawTriggers,
	PostprocessTriggers = postprocessTriggers,
}
