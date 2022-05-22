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
getrenv().fastrun_enabled = false
getrenv().fastrun_speed = 0.6

local gamemt = getrawmetatable(game)
local __namecallBackup = gamemt.__namecall
local __indexBackpup = gamemt.__index


local runservice = game:GetService("RunService")

local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer


local _whitelist
local _plrlist





local Settings = {
    Box_Color = Color3.fromRGB(255, 0, 0),
    Box_Thickness = 2,
    Team_Check = false,
    Team_Color = false,
    Autothickness = true
}

local shared = {
    infammo = false,
    norecoil = false,
    nospread = false,
    auto = false,
    chat = "Buy blank hub",
    spam = false
}

local Toggles = {
    VisibleCheck = false,
    TeamCheck = false,
    fov_Enabled = false,
    MousePosition = false,
    aim_Enabled = false,
    Visible = false,
    Prediction = true,
}

local Options = {
    TargetPart = "Head",
    Radius = 180,
    Amount = 1,
    Method = "FindPartOnRayWithIgnoreList",
    MouseVisualizeColor = Color3.fromRGB(54, 57, 241),
    Color = Color3.fromRGB(54, 57, 241),
}

local oldvalues = {
    recoil = 5,
    severity = 10,
    antirecoil = 10,
    horizseverity = 10,
    debounce = 10
}
    
    local newvalues = {
        recoil = 0,
        severity = 1,
        antirecoil = 0,
        horizseverity = 0,
        debounce = 0
    }
    
    local Espsettings = {
        teamcheck = false,
        esp = false,
        ShowHealth = false,
        lineesp = false,
        color1 = Color3.fromRGB(0,0,255),
    }

    local settings_tbl = {
        ESP_Enabled = false,
        ESP_TeamCheck = false,
        Chams = true,
        Chams_Color = Color3.fromRGB(0,0,255),
        Chams_Transparency = 0.1,
        Chams_Glow_Color = Color3.fromRGB(0, 255, 98)
    }



    
    local function fastrun()
    
        local lastTick = tick()
        local cooldown = 0.01
        
        local process = game:GetService("RunService").Heartbeat:Connect(function()
        
            if not (tick() - lastTick > cooldown) then return end
            
            if not (plr and plr.Character and plr.Character:FindFirstChildWhichIsA("Humanoid") and plr.Character:FindFirstChildWhichIsA("Humanoid").MoveDirection.Magnitude > 0) then return end
            
            lastTick = tick()
            
            plr.Character:TranslateBy(plr.Character:FindFirstChildWhichIsA("Humanoid").MoveDirection * Vector3.new(getrenv().fastrun_speed, getrenv().fastrun_speed, getrenv().fastrun_speed))
            
        end)
        
        while getrenv().fastrun_enabled do
            runservice.Heartbeat:Wait()
        end
        
        process:Disconnect()
        
    end
     
    
local Space = game:GetService("Workspace")
local Player = game:GetService("Players").LocalPlayer
local dwEntities = game:GetService("Players")
local dwLocalPlayer = dwEntities.LocalPlayer 
local dwRunService = game:GetService("RunService")

local Camera = game:GetService("Workspace").CurrentCamera
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local GetChildren = game.GetChildren
local WorldToScreen = Camera.WorldToScreenPoint
local WorldToViewportPoint = Camera.WorldToViewportPoint
local GetPartsObscuringTarget = Camera.GetPartsObscuringTarget
local FindFirstChild = game.FindFirstChild
local RenderStepped = RunService.RenderStepped
local GuiInset = GuiService.GetGuiInset

local resume = coroutine.resume 
local create = coroutine.create

local ValidTargetParts = {"Head", "HumanoidRootPart"};

local function getPositionOnScreen(Vector)
    local Vec3, OnScreen = WorldToScreen(Camera, Vector)
    return Vector2.new(Vec3.X, Vec3.Y), OnScreen
end

local function ValidateArguments(Args, RayMethod)
    local Matches = 0
    if #Args < RayMethod.ArgCountRequired then
        return false
    end
    for Pos, Argument in next, Args do
        if typeof(Argument) == RayMethod.Args[Pos] then
            Matches = Matches + 1
        end
    end
    return Matches >= RayMethod.ArgCountRequired
end

local function getDirection(Origin, Position)
    return (Position - Origin).Unit * 1000
end

local function getMousePosition()
    return Vector2.new(Mouse.X, Mouse.Y)
end

local function IsPlayerVisible(Player)
    local PlayerCharacter = Player.Character
    local LocalPlayerCharacter = LocalPlayer.Character
    
    if not (PlayerCharacter or LocalPlayerCharacter) then return end 
    
    local PlayerRoot = FindFirstChild(PlayerCharacter, Options.TargetPart) or FindFirstChild(PlayerCharacter, "HumanoidRootPart")
    
    if not PlayerRoot then return end 
    
    local CastPoints, IgnoreList = {PlayerRoot.Position, LocalPlayerCharacter, PlayerCharacter}, {LocalPlayerCharacter, PlayerCharacter}
    local ObscuringObjects = #GetPartsObscuringTarget(Camera, CastPoints, IgnoreList)
    
    return ((ObscuringObjects == 0 and true) or (ObscuringObjects > 0 and false))
end

local function getClosestPlayer()
    if not Options.TargetPart then return end
    local Closest
    local DistanceToMouse
    for _, Player in next, GetChildren(Players) do
        if Player == LocalPlayer then continue end
        if Toggles.TeamCheck and Player.Team == LocalPlayer.Team then continue end

        local Character = Player.Character
        if not Character then continue end
        
        if Toggles.VisibleCheck and not IsPlayerVisible(Player) then continue end

        local HumanoidRootPart = FindFirstChild(Character, "HumanoidRootPart")
        local Humanoid = FindFirstChild(Character, "Humanoid")

        if not HumanoidRootPart or not Humanoid or Humanoid and Humanoid.Health <= 0 then continue end

        local ScreenPosition, OnScreen = getPositionOnScreen(HumanoidRootPart.Position)

        if not OnScreen then continue end

        local Distance = (getMousePosition() - ScreenPosition).Magnitude
        if Distance <= (DistanceToMouse or (Toggles.fov_Enabled and Options.Radius) or 2000) then
            Closest = ((Options.TargetPart == "Random" and Character[ValidTargetParts[math.random(1, #ValidTargetParts)]]) or Character[Options.TargetPart])
            DistanceToMouse = Distance
        end
    end
    return Closest
end

local Luxtl = loadstring(game:HttpGet("https://raw.githubusercontent.com/xor123x/utils/master/luxuilib"))()

local Luxt = Luxtl.CreateWindow("djhook 100% legit, not somahook", 6105620301)

local mainTab = Luxt:Tab("Combat", 5892773989)

local ff1 = mainTab:Section("SilentAim")
local ff2 = mainTab:Section("SilentAim Settings")
ff1:Toggle("Enable", function(state)
    Toggles.aim_Enabled = state -- prints true or false
end)
ff1:Toggle("Team Check", function(state)
    Toggles.TeamCheck = state -- prints true or false
end)
ff1:Toggle("Visible Check", function(state)
    Toggles.VisibleCheck = state -- prints true or false
end)
ff1:DropDown("Target Part", {"Head","HumanoidRootPart","Random"}, function(text) -- food is chosen item
   Options.TargetPart = text
end)

local fov_circle = Drawing.new("Circle")
fov_circle.Thickness = 1
fov_circle.NumSides = 100
fov_circle.Radius = Options.Radius
fov_circle.Filled = false
fov_circle.Visible = Toggles.Visible
fov_circle.ZIndex = 999
fov_circle.Transparency = 1
fov_circle.Color = Color3.fromRGB(0, 255, 221)

local mouse_box = Drawing.new("Square")
mouse_box.Visible = Toggles.MousePosition 
mouse_box.ZIndex = 999 
mouse_box.Color = Color3.fromRGB(54, 57, 241)
mouse_box.Thickness = 20 
mouse_box.Size = Vector2.new(20, 20)
mouse_box.Filled = true 


ff2:Toggle("Enable", function(State)
    Toggles.fov_Enabled = state -- prints true or false
end)
ff2:Slider("Radius", 1, 5000, function(value)
    Options.Radius = value
end)
ff2:Toggle("Visible", function(state)
    Toggles.Visible = state -- prints true or false
end)

resume(create(function()
    RenderStepped:Connect(function()
        if Toggles.MousePosition then 
            if Toggles.aim_Enabled == true and Options.Method == "Mouse.Hit/Target" then
                mouse_box.Color = Options.MouseVisualizeColor
                
                mouse_box.Visible = ((getClosestPlayer() and true) or false)
                mouse_box.Position = ((getClosestPlayer() and Vector2.new(WorldToViewportPoint(Camera, getClosestPlayer().Parent.PrimaryPart.Position).X, WorldToViewportPoint(Camera, getClosestPlayer().Parent.PrimaryPart.Position).Y)) or Vector2.new(-9000, -9000)) -- I am too lazy to write this differently - xaxa
            end
        end
        
        if Toggles.Visible then 
            fov_circle.Visible = Toggles.Visible
            fov_circle.Radius = Options.Radius
            fov_circle.Color = Options.Color
            fov_circle.Position = getMousePosition() + Vector2.new(0, 36)
        else
        fov_circle.Visible = false
        end
    end)
end))

local ExpectedArguments = {
    FindPartOnRayWithIgnoreList = {
        ArgCountRequired = 3,
        Args = {
            "Instance", "Ray", "table", "boolean", "boolean"
        }
    },
    FindPartOnRayWithWhitelist = {
        ArgCountRequired = 3,
        Args = {
            "Instance", "Ray", "table", "boolean"
        }
    },
    FindPartOnRay = {
        ArgCountRequired = 2,
        Args = {
            "Instance", "Ray", "Instance", "boolean", "boolean"
        }
    },
    Raycast = {
        ArgCountRequired = 3,
        Args = {
            "Instance", "Vector3", "Vector3", "RaycastParams"
        }
    }
}

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(...)
    local Method = getnamecallmethod()
    local Arguments = {...}
    local self = Arguments[1]

    if Toggles.aim_Enabled and self == workspace then
        if Method == "FindPartOnRayWithIgnoreList" and Options.Method == Method then
            if ValidateArguments(Arguments, ExpectedArguments.FindPartOnRayWithIgnoreList) then
                local A_Ray = Arguments[2]

                local HitPart = getClosestPlayer()
                if HitPart then
                    local Origin = A_Ray.Origin
                    local Direction = getDirection(Origin, HitPart.Position)
                    Arguments[2] = Ray.new(Origin, Direction)

                    return oldNamecall(unpack(Arguments))
                end
            end
        elseif Method == "FindPartOnRayWithWhitelist" and Options.Method == Method then
            if ValidateArguments(Arguments, ExpectedArguments.FindPartOnRayWithWhitelist) then
                local A_Ray = Arguments[2]

                local HitPart = getClosestPlayer()
                if HitPart then
                    local Origin = A_Ray.Origin
                    local Direction = getDirection(Origin, HitPart.Position)
                    Arguments[2] = Ray.new(Origin, Direction)

                    return oldNamecall(unpack(Arguments))
                end
            end
        elseif (Method == "FindPartOnRay" or Method == "findPartOnRay") and Options.Method:lower() == Method:lower() then
            if ValidateArguments(Arguments, ExpectedArguments.FindPartOnRay) then
                local A_Ray = Arguments[2]

                local HitPart = getClosestPlayer()
                if HitPart then
                    local Origin = A_Ray.Origin
                    local Direction = getDirection(Origin, HitPart.Position)
                    Arguments[2] = Ray.new(Origin, Direction)

                    return oldNamecall(unpack(Arguments))
                end
            end
        elseif Method == "Raycast" and Options.Method == Method then
            if ValidateArguments(Arguments, ExpectedArguments.Raycast) then
                local A_Origin = Arguments[2]

                local HitPart = getClosestPlayer()
                if HitPart then
                    Arguments[3] = getDirection(A_Origin, HitPart.Position)

                    return oldNamecall(unpack(Arguments))
                end
            end
        end
    end
    return oldNamecall(...)
end)

local oldIndex = nil 
oldIndex = hookmetamethod(game, "__index", function(self, Index)
    if self == Mouse and (Index == "Hit" or Index == "Target") then 
        if Toggles.aim_Enabled == true and Options.Method == "Mouse.Hit/Target" and getClosestPlayer() then
            local HitPart = getClosestPlayer()

            return ((Index == "Hit" and ((Toggles.Prediction == false and HitPart.CFrame) or (Toggles.Prediction == true and (HitPart.CFrame + (HitPart.Velocity * PredictionAmount))))) or (Index == "Target" and HitPart))
        end
    end

    return oldIndex(self, Index)
end)

local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()

local teleportsTab = Luxt:Tab("Visuals", 5892783507)
local vis = teleportsTab:Section("Visuals")

vis:Toggle("Enable", function(state)
    ESP:Toggle(state) -- prints true or false
end)

ESP.Names = false
ESP.Boxes = false
ESP.Tracers = false
vis:Toggle("Names", function(state)
     ESP.Names = state -- prints true or false
end)

vis:Toggle("Boxes",function(state)
    ESP.Boxes = state
end)

vis:Toggle("Tracers",function(state)
    ESP.Tracers = state
end)






local miscTab = Luxt:Tab("Misc")
local ff = miscTab:Section("Misc")

speedget = 1

lplayer = game:GetService("Players").LocalPlayer

lplayer.CharacterAdded:Connect(function(character)
spin = false
flying = false
staring = false
banpl = false
end)

function change()
prefix = prefix
speedfly = speedfly
end

function GetPlayer(String) -- Credit to Timeless/xFunnieuss
local Found = {}
local strl = String:lower()
if strl == "all" then
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		table.insert(Found,v)
	end
elseif strl == "others" then
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		if v.Name ~= lplayer.Name then
			table.insert(Found,v)
		end
	end   
elseif strl == "me" then
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		if v.Name == lplayer.Name then
			table.insert(Found,v)
		end
	end  
else
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		if v.Name:lower():sub(1, #String) == String:lower() then
			table.insert(Found,v)
		end
	end    
end
return Found    
end

local Mouse = lplayer:GetMouse()


flying = false
speedfly = 1

function plrchat(plr, chat)
print(plr.Name..": "..tick().."\n"..chat)
end

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
v.Chatted:connect(function(chat)
if chatlogs then
plrchat(v, chat)
end
end)
end
game:GetService("Players").PlayerAdded:connect(function(plr)
plr.Chatted:connect(function(chat)
if chatlogs then
plrchat(plr, chat)
end
end)
end)

plrNum = 1
for i,v in pairs(game.Players:GetPlayers()) do
if i == plrNum then
game.Workspace.Camera.CameraSubject = v.Character.Humanoid
end
end


ff:Toggle('Flying', function(state)
     if state then
			repeat wait() until lplayer and lplayer.Character and lplayer.Character:FindFirstChild('HumanoidRootPart') and lplayer.Character:FindFirstChild('Humanoid')
					repeat wait() until Mouse
					
					local T = lplayer.Character.HumanoidRootPart
					local CONTROL = {F = 0, B = 0, L = 0, R = 0}
					local lCONTROL = {F = 0, B = 0, L = 0, R = 0}
					local SPEED = speedget
					
					local function fly()
						flying = true
						local BG = Instance.new('BodyGyro', T)
						local BV = Instance.new('BodyVelocity', T)
						BG.P = 9e4
						BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
						BG.cframe = T.CFrame
						BV.velocity = Vector3.new(0, 0.1, 0)
						BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
						spawn(function()
						repeat wait()
						lplayer.Character.Humanoid.PlatformStand = true
						if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 then
						SPEED = 50
						elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0) and SPEED ~= 0 then
						SPEED = 0
						end
						if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 then
						BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
						lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
						elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and SPEED ~= 0 then
						BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
						else
						BV.velocity = Vector3.new(0, 0.1, 0)
						end
						BG.cframe = workspace.CurrentCamera.CoordinateFrame
								until not flying
								CONTROL = {F = 0, B = 0, L = 0, R = 0}
								lCONTROL = {F = 0, B = 0, L = 0, R = 0}
								SPEED = 0
								BG:destroy()
								BV:destroy()
								lplayer.Character.Humanoid.PlatformStand = false
							end)
						end
					Mouse.KeyDown:connect(function(KEY)
						if KEY:lower() == 'w' then
							CONTROL.F = speedfly
						elseif KEY:lower() == 's' then
							CONTROL.B = -speedfly
						elseif KEY:lower() == 'a' then
							CONTROL.L = -speedfly 
						elseif KEY:lower() == 'd' then 
							CONTROL.R = speedfly
						end
					end)
					Mouse.KeyUp:connect(function(KEY)
						if KEY:lower() == 'w' then
							CONTROL.F = 0
						elseif KEY:lower() == 's' then
							CONTROL.B = 0
						elseif KEY:lower() == 'a' then
							CONTROL.L = 0
						elseif KEY:lower() == 'd' then
							CONTROL.R = 0
						end
					end)
					fly()
				else
				flying = false
					lplayer.Character.Humanoid.PlatformStand = false
				end
end)

local creditsTab = Luxt:Tab("Credits")
local cf = creditsTab:Section("Scripting Credits")
cf:Credit("Mochii: Main Coding")
cf:Credit("Kiriot22: Esp")
local cf1 = creditsTab:Section("UI Credits")
cf1:Credit("xHeptc: UI Library")
