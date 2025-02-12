function widget:GetInfo()
    return {
        name      = "Scenario UI Widget",
        desc      = "Draws scenario ui",
        author    = "kroIya",
        date      = "2024-11-09",
        license   = "license",
        layer     = 0,
        enabled   = true
    }
end

local vsx, vsy = Spring.GetViewGeometry()
local currentStage
local currentObjective
local scenarioHint
local hintTimer = -100
local hintDuration = 10
local blackoutTimer = -100
local blackoutDuration = 15
local fadeUp
local fadeDown
local fadeStage
local fadeDuration = 60
local savedCamera
local autoSavedCamera
local timer
local timerDuration

local sensibleDefaultCamera = {
    dist=1416.48291,
    dx=0,
    dy=-0.9840788,
    dz=-0.1777325,
    fov=45,
    mode=2,
    name="spring",
    px=3104.51172,
    py=170.348755,
    pz=4825.15771,
    rx=2.96291089,
    ry=0.19348277,
    rz=0,
  }

local function SendMousePosToChat()
    local mx, my = Spring.GetMouseState()
    local _, coords = Spring.TraceScreenRay(mx, my, true)
    Spring.Echo(Spring.GetCameraState())
    if coords then
        local x, y, z = coords[1], coords[2], coords[3]
        local message = string.format("Mouse coords: %d, %d, %d", x, y, z)
        Spring.SendCommands("say " .. message)
    else
        Spring.SendCommands("say No coords")
    end
end

function widget:TextCommand(command)
    if command == "mousepos" then
        Spring.Echo(WG.autogroup.getGroups())
        SendMousePosToChat()
        return true
    end
    if command == "dolly" then
        Spring.SetConfigString("CamModeName", "dolly")
    end
    if command == "rundolly" then
        Spring.SetDollyCameraCurve(3, {3567.71411,500,4475.24902,1,3150.18018,500,3199.35474,1,5600.96484,500,3126.2207,1,4393.65723,500,5171.01465,1,3562.51855,500,4475.24951,1,}, { 0, 0, 0, 0, .5, 1, 1, 1, 1 })
        Spring.SetDollyCameraLookPosition(4000, 200, 4000)
        Spring.RunDollyCamera(5000)
    end
    if command == "spring" then
        Spring.SetConfigString("CamModeName", "spring")
    end
    if command == "fpscam" then
        Spring.SetConfigString("CamModeName", "fps")
    end
    return false
end

function widget:GameFrame(frameNum)
    if fadeUp then
        fadeStage = fadeStage or 0
        if fadeStage < fadeDuration then
        fadeStage = fadeStage + 1
        else
        fadeUp = nil
        fadeDown = true
        end
    end
    if fadeDown then
        if fadeStage >0 then
        fadeStage = fadeStage - 1
        else
        fadeDown = nil
        fadeStage = nil
        end
    end

    if frameNum%15 == 0 then
        local currentCamera = Spring.GetCameraState()
        if currentCamera and currentCamera.name == "spring" then autoSavedCamera = currentCamera end
    end
end

function widget:RecvLuaMsg(msg, playerID)
    if msg:find("currentStage|") then
        currentStage = msg:sub(14)
    end
    if msg:find("currentObjective|") then
        currentObjective = msg:sub(18)
    end
    if msg:find("scenarioHint|") then
        scenarioHint = msg:sub(14)
        hintTimer = os.clock()
        hintDuration = scenarioHint:len() / 10 + 5
    end
    if msg:find("blackout|") then
        blackoutTimer = os.clock()
    end

    --black sheep
    if msg:find("CheckAutoGroups|") then
    local autogroups = WG.autogroup.getGroups()
    local gruntDefID = tonumber(msg:sub(17))
    if autogroups and autogroups[gruntDefID] and (autogroups[gruntDefID] == "1" or autogroups[gruntDefID] == 1) then
    Spring.SendLuaRulesMsg("AutogroupCheckPassed")
    end
    end

    --keeping the camera stuff in the widget because I don't want to copypaste it into every script. Wait for the cam gadget
    if msg:find("SetCameraPos|") then
        local camPos = Spring.GetCameraState()
        camPos.px = tonumber(msg:sub(14, 17))
        camPos.pz = tonumber(msg:sub(18, 21))
        Spring.SetCameraState(camPos, 1)
    end
    if msg:find("FadeToBlack") then
        fadeUp = true
    end
    if msg:find("SaveCamera") then
        savedCamera = Spring.GetCameraState()
    end
    if msg:find("RestoreCamera") then
        Spring.SetConfigString("CamModeName", "spring")
        Spring.SetCameraState(autoSavedCamera or sensibleDefaultCamera, 0)
    end
    if msg:find("RestoreSavedCamera") then
        Spring.SetConfigString("CamModeName", "spring")
        Spring.SetCameraState(savedCamera or sensibleDefaultCamera, 0)
    end
    if msg:find("RestoreDefaultCamera") then
        Spring.SetConfigString("CamModeName", "spring")
        Spring.SetCameraState(sensibleDefaultCamera, 0)
    end
    if msg:find("SelectUnit|") then
        local unitToSelect = tonumber(msg:sub(12))
        Spring.SelectUnitArray({unitToSelect})
    end

    if msg:find("StartTimer|") then
    timer = Spring.GetTimer() --doing it with frames would've been infinitely better, but yay, timers
    timerDuration = tonumber(msg:sub(12))
    end
end

function widget:DrawScreen()
    local fontSize = 20
    gl.Color(1, 1, 1, 1)
    gl.Text("Current stage: "..(currentStage or "none"), 0.40 * vsx, 0.85 * vsy, fontSize, "v")
    if timer then
        local timerNow = Spring.GetTimer()
        local timerRemaining = timerDuration - Spring.DiffTimers(timerNow, timer)
        local minutesRemaining = math.floor(timerRemaining/60)
        local secondsRemaining = tostring(math.floor(timerRemaining%60))
        if secondsRemaining and string.len(secondsRemaining) == 1 then
            secondsRemaining = "0"..secondsRemaining
        end
        local timerRemainingString = minutesRemaining..":"..secondsRemaining
        if timerRemaining < 1 then
            timer = nil
        end
        gl.Text("Current objective: "..((currentObjective or "none").." (Time remaining: "..timerRemainingString..")"), 0.40 * vsx, 0.83 * vsy, fontSize, "v")
    else
        gl.Text("Current objective: "..(currentObjective or "none"), 0.40 * vsx, 0.83 * vsy, fontSize, "v")
    end
    if os.clock() - hintTimer <= hintDuration then
        gl.Text("Hint: "..scenarioHint, 0.40 * vsx, 0.70 * vsy, fontSize, "v")
    end
    if os.clock() - blackoutTimer <= blackoutDuration then
        gl.Color(0, 0, 0, 1)
        gl.Rect(0, 0, gl.GetViewSizes())
        gl.Color(1, 1, 1, 1)
        gl.Text("NO SIGNAL", 0.5 * vsx, 0.5 * vsy, 150, "vc")
        gl.Color(0, 0, 0, 1)
    end
    if fadeStage then
        gl.Color(0, 0, 0, fadeStage/fadeDuration)
        gl.Rect(0, 0, gl.GetViewSizes())
    end
end
