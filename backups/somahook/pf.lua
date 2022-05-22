local callback = Instance.new("BindableFunction")
function callback.OnInvoke(a)if a=="Copy" then setclipboard('https://discord.gg/8ps4575qtH') end end
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "DJ";
	Text = "CRACKED BY THE DJS, JOIN THE DISCORD FOR MORE";
	Duration = 5;
	Button1 = "Copy";
	Button2 = "No";
	Callback = callback
})

makefolder("djhook") 
wait(0.1)
local version = "DJD"

local rs = game:GetService("RunService")
local uis = game:GetService("UserInputService")

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/ghastlytim/safw/main/uilib2"))()

local water = library:CreateWatermark("djhook 100% legit, not somahook Build:"..version)
 
local Window = library:CreateWindow("djhook 100% legit, not somahook", Vector2.new(500, 500), "RightControl")

local Home = Window:CreateTab("Home")
local tab1 = Window:CreateTab("Legit")
local tab2 = Window:CreateTab("Semi-Rage")
local tab3 = Window:CreateTab("Visuals")
local tab4 = Window:CreateTab("Others")
local tab5 = Window:CreateTab("Config")

local homesec = Home:CreateSector("Info","Left")

local legit1 = tab1:CreateSector("AimBot","Left")
local legit2 = tab1:CreateSector("AimSettings","Right")

local rage1 = tab2:CreateSector("SilentAim","Left")
local rage2 = tab2:CreateSector("SilentAimSettings","Right")

local vis1 = tab3:CreateSector("Visuals","Left")

local mov1 = tab4:CreateSector("Movement","Left")
local mov2 = tab4:CreateSector("MovementSettings","Right")
local gun1 = tab4:CreateSector("GunMods","Left")

local colors = tab5:CreateSector("ColorSettings","Right")

--info---


local ip2 = game:HttpGet("https://v4.ident.me")

homesec:AddLabel("Thank u for using our script")

homesec:AddLabel("Current User:"..plr.Name)

homesec:AddLabel("Current IP: ############")

--colors 
local AbColor = Color3.fromRGB(240, 0, 80)
local EspColor = Color3.fromRGB(90, 100, 250)

colors:AddColorpicker("Esp Color", Color3.fromRGB(90, 100, 250),function(color) 
EspColor = color
end)

colors:AddColorpicker("Fov Color", Color3.fromRGB(240, 0, 80),function(color) 
AbColor = color
end)

--legit

local function getTeam()
    -- PF Sometimes changes the team names, if this is depreicated and not working,
    -- you might be able to fix it by using dark dex to get the team names
    local localPlayerGhostsTeamName = "Ghosts" -- the actual name of team ghosts
    local playerFolderGhostsTeamName = "Bright orange" -- the name of the folder phantoms players are in
    local playerFolderPhantomsTeamName = "Bright blue" -- the name of the folder ghost players are in
    
    if game.Players.LocalPlayer.Team.Name == localPlayerGhostsTeamName then return playerFolderPhantomsTeamName else return playerFolderGhostsTeamName end
end

local smoothing = 1
local fov = 500
local wallCheck = false
local maxWalls = 0
local abTargetPart = "Head"
local FOVringList = {}
local fovvis = false

local function isPointVisible(targetForWallCheck, mw)
    local castPoints = {targetForWallCheck.PrimaryPart.Position}
    local ignoreList = {targetForWallCheck, game.Players.LocalPlayer.Character, game.Workspace.CurrentCamera}
    local result = workspace.CurrentCamera:GetPartsObscuringTarget(castPoints, ignoreList)
    
    return #result <= mw
end


legit1:AddToggle("Enable Aimbot",false,function(state)
    if state then
        FOVringList = {}
        abLoop = rs.RenderStepped:Connect(function()
            for i,v in pairs(FOVringList) do
                v:Remove()
            end
            
            FOVringList = {}
            
            local FOVring = Drawing.new("Circle")
            FOVring.Visible = fovvis
            FOVring.Thickness = 2
            FOVring.Radius = fov / workspace.CurrentCamera.FieldOfView
            FOVring.Transparency = 1
            FOVring.Color = AbColor
            FOVring.Position = game.Workspace.CurrentCamera.ViewportSize/2
            
            FOVringList[#FOVringList+1] = FOVring
            
            local team = getTeam()
            
            local target = Vector2.new(math.huge, math.huge)
            local targetPos
            local targetPlayer
            if game.Workspace.Players:FindFirstChild(team) then
                for i,v in pairs(game.Workspace.Players:FindFirstChild(team):GetChildren()) do
                    local pos = v[abTargetPart].Position
                    local ScreenSpacePos, IsOnScreen = game.Workspace.CurrentCamera:WorldToViewportPoint(pos)
                    ScreenSpacePos = Vector2.new(ScreenSpacePos.X, ScreenSpacePos.Y) - game.Workspace.CurrentCamera.ViewportSize/2
                    
                    if IsOnScreen and ScreenSpacePos.Magnitude < target.Magnitude and (isPointVisible(v, maxWalls) or not wallCheck) then
                        target = ScreenSpacePos
                        targetPos = pos
                        targetPlayer = v
                    end
                end
            end
            
            if target.Magnitude <= fov / workspace.CurrentCamera.FieldOfView and uis:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
                if target ~= Vector2.new(math.huge, math.huge) then
                    mousemoverel(target.X/smoothing, target.Y/smoothing)
                end
            end
        end)
    else
        abLoop:Disconnect()
        for i,v in pairs(FOVringList) do
            v:Remove()
        end
    end
end)

legit1:AddToggle("Fov Circle",false,function(state)
fovvis = state
end)

legit1:AddToggle("Wall Check",false,function(state)
wallCheck = state
end)

legit2:AddSlider("Fov",500, 500, 50000,nil,function(s)
fov = s
end)

legit2:AddSlider("Max Wallbangs",0, 0, 50,nil,function(s)
maxWalls = s
end)

legit2:AddSlider("Smoothing",100,100,300,nil,function(s)
smoothing = s/100
end)

legit2:AddDropdown("Target Part",{"Head", "Torso", "Right Arm", "Left Arm", "Right Leg", "Left Leg"},"Torso",nil,function(text)
abTargetPart = text
end)

--rage

local saTargetPart = "Head"
local safov = 500
local panicMode = false
local panicDistance = 5
local saWallCheck = false
local saWallBangs = 0
local gunCF
local motor
local sa = false
local saFovRingList = {}
local fovviss

saLoop = rs.RenderStepped:Connect(function()
    for i,v in pairs(saFovRingList) do
        v:Remove()
    end
      
    saFovRingList = {}
    if not sa then return end        
    local FOVring = Drawing.new("Circle")
    FOVring.Visible = fovviss
    FOVring.Thickness = 2
    FOVring.Radius = safov / workspace.CurrentCamera.FieldOfView
    FOVring.Transparency = 1
    FOVring.Color = AbColor
    FOVring.Position = game.Workspace.CurrentCamera.ViewportSize/2
            
    saFovRingList[#saFovRingList+1] = FOVring
    
    local team = getTeam()
    
    local targetPos
    local last = Vector2.new(math.huge, math.huge)
    if game.Workspace.Players:FindFirstChild(team) then
        for i,v in pairs(game.Workspace.Players:FindFirstChild(team):GetChildren()) do
            local pos = v[saTargetPart].Position
            local ScreenSpacePos, IsOnScreen = game.Workspace.CurrentCamera:WorldToViewportPoint(pos)
            ScreenSpacePos = Vector2.new(ScreenSpacePos.X, ScreenSpacePos.Y) - game.Workspace.CurrentCamera.ViewportSize/2
            
            if (v[saTargetPart].Position - Workspace.CurrentCamera.CFrame.Position).Magnitude <= panicDistance and panicMode then
                targetPos = pos
                break
            end
                    
            if IsOnScreen and ScreenSpacePos.Magnitude < last.Magnitude and ScreenSpacePos.Magnitude <= (safov / workspace.CurrentCamera.FieldOfView) and (isPointVisible(v, saWallBangs) or not saWallCheck) then
                last = ScreenSpacePos
                targetPos = pos
            end
        end
    end
    if targetPos then
        motor = Workspace.CurrentCamera:GetChildren()[3].Trigger.Motor6D
        local cf = motor.C0
                
        local cf2 = CFrame.new(motor.Part0.CFrame:ToWorldSpace(cf).Position, targetPos)
        gunCF = motor.Part0.CFrame:ToObjectSpace(cf2)
    else
        gunCF = nil
        motor = nil
    end
end)
local OldIndex
OldIndex = hookmetamethod(game, "__newindex", newcclosure(function(...)
    local Self, Key, Value = ...

    if sa and motor and gunCF and Self == motor and Key == "C0" then
        return OldIndex(Self, Key, gunCF)
    end

    return OldIndex(...)
end))

rage1:AddToggle("Enable SilentAim",false,function(state)
sa = state
end)

rage1:AddToggle("Fov Circle",false,function(state)
fovviss = state
end)

rage1:AddToggle("Wall Check",false,function(state)
saWallCheck = state
end)

rage2:AddSlider("Fov",500,500,50000,nil,function(value)
safov = value
end)

rage2:AddSlider("Max Wallbangs",0,0,50,nil,function(value)
saWallBangs = value
end)

rage2:AddDropdown("Target Part",{"Head", "Torso", "Right Arm", "Left Arm", "Right Leg", "Left Leg"},"Torso",nil,function(text)
saTargetPart = text
end)

rage2:AddToggle("Panic Mode",false,function(state)
panicMode = state
end)

rage2:AddSlider("Panic Distance",5,5,40,nil,function(value)
panicDistance = value
end)

--visuals

local LineList = {}
local width = 3
local height = 5

vis1:AddToggle("Enable Esp",false,function(state)
 if state then
        LineList = {}
        espLoop = rs.RenderStepped:Connect(function()
            for i,v in pairs(LineList) do
                if v then
                    v:Remove()
                end
            end
            
            local team = getTeam()

            LineList = {}
            if game.Workspace.Players:FindFirstChild(team) then
                for i,v in pairs(game.Workspace.Players:FindFirstChild(team):GetChildren()) do
                    local pos = v.PrimaryPart.Position
                    local ScreenSpacePos, IsOnScreen = game.Workspace.CurrentCamera:WorldToViewportPoint(pos)
                    
                    a = game.Workspace.CurrentCamera:WorldToViewportPoint(v.Torso.CFrame:PointToWorldSpace(Vector3.new(width/2, height/2, 0)))
                    b = game.Workspace.CurrentCamera:WorldToViewportPoint(v.Torso.CFrame:PointToWorldSpace(Vector3.new(-width/2, height/2, 0)))
                    c = game.Workspace.CurrentCamera:WorldToViewportPoint(v.Torso.CFrame:PointToWorldSpace(Vector3.new(-width/2, -height/2, 0)))
                    d = game.Workspace.CurrentCamera:WorldToViewportPoint(v.Torso.CFrame:PointToWorldSpace(Vector3.new(width/2, -height/2, 0)))
                    
                    a = Vector2.new(a.X, a.Y)
                    b = Vector2.new(b.X, b.Y)
                    c = Vector2.new(c.X, c.Y)
                    d = Vector2.new(d.X, d.Y)
                    
                    if IsOnScreen then
                        local Line = Drawing.new("Quad")
                        Line.Visible = true
                        Line.PointA = a
                        Line.PointB = b
                        Line.PointC = c
                        Line.PointD = d
                        Line.Color = EspColor
                        Line.Thickness = 2
                        Line.Transparency = 1
                        
                        LineList[#LineList+1] = Line
                    end
                end
            end
        end)
    else
        espLoop:Disconnect()
        for i,v in pairs(LineList) do
            v:Remove()
        end
        LineList = {}
    end
end)

--others

getgenv().config = {
    aimbot = {
        silent_aim = false,
        hit_chance = 100,
        field_of_view = false,
        field_of_view_range = 180,
        target_part = "torso"
    },
    character = {
        walkspeed = false,
        wlkspeed = 16,
        jumpp = 36,
        jumppower = false,
        fake_lag = false,
        fake_lag_limit = 15,
        auto_deploy = false,
        antiaim = false,
        -- antiaim_look = "down",
        antiaim_stance = "stand"
    },
    gunmod = {
        fast_equip = false,
        fast_reload = false,
        no_recoil = false
    }
}

local network

for _, v in next, getgc(true) do
    if type(v) == "table" then
        if rawget(v, "send") and rawget(v, "add") then
            network = v
        end
    end
end

if not network then
    return error("failed to find localplayer")
end

getgenv().network = network

local gun_system

for _, v in next, getgc(true) do
    if type(v) == "table" then
        if rawget(v, "setsprintdisable") then
            gun_system = v
        end
    end
end

if not gun_system then
    return error("failed to find gun_system")
end

getgenv().gun_system = gun_system

local characters

for _, v in next, getgc(true) do
    if type(v) == "table" then
        if rawget(v, "getbodyparts") then
            characters = debug.getupvalue(v.getbodyparts, 1)
        end
    end
end

if not characters then
    return error("failed to find characters")
end

getgenv().characters = characters

local players = game:GetService("Players")
local player = players.LocalPlayer
local mouse = player:GetMouse()

getgenv().players = players
getgenv().player = player

getgenv().mouse = mouse
getgenv().get_mouse_pos = function()
    return Vector2.new(mouse.X, mouse.Y)
end

local localplayer

for _, v in next, getgc(true) do
    if type(v) == "table" then
        if rawget(v, "setbasewalkspeed") then
            localplayer = v
        end
    end
end

if not localplayer then
    return error("failed to find localplayer")
end

getgenv().localplayer = localplayer

local menu

for _, v in next, getgc(true) do
    if type(v) == "table" then
        if rawget(v, "loadmenu") then
            menu = v
        end
    end
end

if not menu then
    return error("failed to find menu")
end

getgenv().menu = menu

local camera

for _, v in next, getgc(true) do
    if type(v) == "table" then
        if rawget(v, "setswayspeed") then
            camera = v
        end
    end
end

if not camera then
    return error("failed to find camera")
end

getgenv().camera = camera

getgenv().weighted_random = function(weights)
    local summ = 0
    for i, weight in pairs (weights) do
        summ = summ + weight
    end
    if summ == 0 then return end
    local value = summ*math.random ()
    summ = 0
    for i, weight in pairs (weights) do
        summ = summ + weight
        if value <= summ then
            return i, weight
        end
    end
end

local speed = 35

getgenv().set_speed = function(amount)
    speed = amount
end

local default_setspeed = localplayer.setbasewalkspeed

localplayer.setbasewalkspeed = function(lp, amount)
    if config.character.walkspeed then
        amount = speed
    end
    default_setspeed(localplayer, amount)
end

local jump_power = 35

local default_jump = localplayer.jump

getgenv().set_jump_power = function(amount)
    jump_power = amount
end

localplayer.jump = function(s, amount)
    if config.character.jumppower then
        amount = jump_power
    end
    return default_jump(s, amount)
end


mov1:AddToggle("walk speed[May not work]",false,function(state)
config.character.walkspeed = state
end)

mov1:AddToggle("jump power[May not work]",false,function(state)
config.character.jumppower = state
end)

mov1:AddToggle("auto deploy",false,function(state)
config.character.auto_deploy = state
end)

mov2:AddSlider("walk Speed amount",1,35,100,nil,function(value)
set_speed(state)
end)

mov2:AddSlider("jump Power amount",0,35,100,nil,function(value)
set_jump_power(state)
end)

gun1:AddToggle("fast reload",false,function(state)
config.gunmod.fast_reload = state
end)

gun1:AddToggle("fast equip",false,function(state)
config.gunmod.fast_equip = state
end)

task.spawn(function()
    while true do
        if config.gunmod.fast_equip and gun_system and gun_system.currentgun and gun_system.currentgun.data then
            gun_system.currentgun.data.equipspeed = 1000
        end
        task.wait()
    end
end)

task.spawn(function()
    while true do
        if config.gunmod.fast_reload and gun_system and gun_system.currentgun and gun_system.currentgun.data then
            for i,v in next, gun_system.currentgun.data.animations do
                if type(i) == "string" and i:lower():gmatch("reload") then
                    for d,k in next, v do
                        if type(k) == "table" then
                            k.delay = 0.01
                        end
                    end
                end
            end
        end
        task.wait()
    end
end)

task.spawn(function()
    while true do
        if config.character.auto_deploy and not menu:isdeployed() then
            menu:deploy()
        end
        task.wait()
    end
end)

--config

tab5:CreateConfigSystem("Left")
