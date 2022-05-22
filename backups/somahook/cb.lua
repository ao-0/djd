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
local version = "Public"

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/ghastlytim/safw/main/uilib2"))()

local water = Library:CreateWatermark("djhook 100% legit, not somahook Build:"..version)
 
local Window = Library:CreateWindow("djhook 100% legit, not somahook", Vector2.new(500, 500), Enum.KeyCode.RightControl)

local Home = Window:CreateTab("Home")
local tab1 = Window:CreateTab("Legit")
local tab2 = Window:CreateTab("Rage")
local tab3 = Window:CreateTab("Visuals")
local tab4 = Window:CreateTab("WorldVisuals")
local tab5 = Window:CreateTab("Misc")

local homesec = Home:CreateSector("Info","Left")
local SilentAim = tab1:CreateSector("SilentAim","Left")
local otherlegit = tab1:CreateSector("BT/Triggerbot","Right")
local Spinbot = tab2:CreateSector("Spinbot/AntiAim","Left")
local others = tab2:CreateSector("Others","Right")
local vis1 = tab3:CreateSector("Enemy","Left")
local vis2 = tab3:CreateSector("Team","Right")
local wvis1 = tab4:CreateSector("World","Left")
local Viewmodel = tab4:CreateSector("Viewmodel","Right")
local misc1 = tab5:CreateSector("Misc","Left")
local misc2 = tab5:CreateSector("Animations","Right")


local ip2 = game:HttpGet("https://v4.ident.me")

homesec:AddLabel("Thank u for using our script")

homesec:AddLabel("Current User:"..plr.Name)

homesec:AddLabel("Current IP: ############")

--[[legit1:AddButton("Rejoin",function()
print("Rejoin")
end)

legit1:AddLabel("hi ez ui lib :D")

legit1:AddToggle("hi",false,function(state)
print(state)
end)

legit1:AddTextbox("Textbox","textbox",function(text)

end)

legit1:AddSlider("slider",1,50,100,nil,function(value)
print(value)
end)

legit1:AddColorpicker("color", Color3.fromRGB(255, 255, 255),function(color) 
print(color)
end)

legit1:AddKeybind("keybind",Enum.KeyCode.C,function(bind)

end)

legit1:AddDropdown("AntiAim",{"Up","Down"},"None",nil,function(text)

end)
legit1:AddSeperator("test")]]

tab5:CreateConfigSystem("Left")

Spinbot:AddToggle("Spinbot",nil, function(state)
	_G.Spinbot = state
end)

others:AddToggle("Bunnyhop",nil, function(state)
	_G.bunnyhop = state
end)

others:AddSlider("Bunnyhop speed", 20, 50, 100,nil, function(s) 
	_G.speed = s 
end)

others:AddToggle("Rage triggerbot[Head]",nil, function(state)
	_G.triggerbot = state
end)

others:AddToggle("Rage triggerbot [TORSO]",nil, function(state)
	_G.triggerbote = state
end)

others:AddToggle("Ki1l say", nil , function(state)
_G.killsay = state
local plr = game:GetService("Players").LocalPlayer
plr.Status.Kills:GetPropertyChangedSignal("Value"):Connect(function(current) 
    if current == 0 then return end 
    if _G.killsay then 
        game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(_G.killmsg, false, "Innocent", false, true) 
    end 
end)
end)

others:AddTextbox("KillMsg","KillMsg",function(text)
_G.killmsg = text
end)

local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer

_G.distance = 10
others:AddToggle("ThirdPerson",nil, function(state)
_G.third = state
_G.third1 = state
while _G.third do
    if _G.third1 then
		plr.CameraMaxZoomDistance = _G.distance
		plr.CameraMinZoomDistance = _G.distance 
	elseif not _G.third1 then
		plr.CameraMaxZoomDistance = 0
		plr.CameraMinZoomDistance = 0
	end
	wait(0.1)
end
end)

others:AddSlider("thirdperson distance", 1, 10, 50,nil, function(s) 
 _G.distance = s
end)

others:AddToggle("Removehead",nil, function(state)
_G.removehead = state
while _G.removehead do

game.Players.LocalPlayer.Character.HeadHB:Destroy()
game.Players.LocalPlayer.Character.FakeHead:Destroy()

wait(0.1)
end
end)


Spinbot:AddDropdown("AntiAim", {"None", "Backwardslean", "Boneless", "Up", "Down", "Random"},"None",nil, function(text)
if text == "None" then
_G.Up = false
_G.Backwardslean = false
_G.Down = false
_G.Boneless = false
_G.rand = false
elseif text == "Backwardslean" then
_G.Up = false
_G.Backwardslean = true
_G.Down = false
_G.Boneless = false
_G.rand = false
while _G.Backwardslean do
wait(0.1)
game:GetService("ReplicatedStorage").Events.ControlTurn:FireServer("3")
end
elseif text == "Boneless" then
_G.Up = false
_G.Backwardslean = false
_G.Down = false
_G.Boneless = true
_G.rand = false
while _G.Boneless do
wait(0.1)
game:GetService("ReplicatedStorage").Events.ControlTurn:FireServer("-5")
end
elseif text == "Up" then
_G.Up = true
_G.Backwardslean = false
_G.Down = false
_G.Boneless = false
_G.rand = false
while _G.Up do
wait(0.1)
game:GetService("ReplicatedStorage").Events.ControlTurn:FireServer("1")
end
elseif text == "Down" then
_G.Up = false
_G.Backwardslean = false
_G.Down = true
_G.Boneless = false
_G.rand = false
while _G.Down do
wait(0.1)
game:GetService("ReplicatedStorage").Events.ControlTurn:FireServer("-1")
end
elseif text == "Random" then
_G.Up = false
_G.Backwardslean = false
_G.Down = false
_G.Boneless = false
_G.rand = true
while _G.rand do
wait(0.1)
game:GetService("ReplicatedStorage").Events.ControlTurn:FireServer("5")
wait(0.1)
game:GetService("ReplicatedStorage").Events.ControlTurn:FireServer("4")
wait(0.1)
game:GetService("ReplicatedStorage").Events.ControlTurn:FireServer("3")
wait(0.1)
game:GetService("ReplicatedStorage").Events.ControlTurn:FireServer("2")
wait(0.1)
game:GetService("ReplicatedStorage").Events.ControlTurn:FireServer("1")
wait(0.1)
game:GetService("ReplicatedStorage").Events.ControlTurn:FireServer("-1")
wait(0.1)
game:GetService("ReplicatedStorage").Events.ControlTurn:FireServer("-2")
wait(0.1)
game:GetService("ReplicatedStorage").Events.ControlTurn:FireServer("-3")
wait(0.1)
game:GetService("ReplicatedStorage").Events.ControlTurn:FireServer("-4")
wait(0.1)
game:GetService("ReplicatedStorage").Events.ControlTurn:FireServer("-5")
end
end
end)

local Player = game.Players.LocalPlayer
local Character = Player.Character
local i = Instance.new("Animation", workspace)
if _G.aniresolver then
	for i2,Animation in pairs(Player.Character.Humanoid:GetPlayingAnimationTracks()) do
								Animation:Stop()
	end 
end
if _G.pichresolver then
Player.Character.UpperTorso.Waist.C0 = CF(Vec3(0,0.6,0))
Player.Character.Head.CFrame = CF(Player.Character.Head.Position)    
Player.Character.LowerTorso.Root.C0 = CFAngles(0,0,0)
Player.Character.Head.Neck.C0 = CFrame.new(0,1,0) * CFAngles(0, 0, 0) 
end 

if _G.rollresolver then
Player.Character.Humanoid.MaxSlopeAngle = 0 
end
 
Spinbot:AddToggle("Resolver",nil, function(state)
_G.resolverenabled = state
end)
 
Spinbot:AddDropdown("resolver", {"Animations","Pich","Roll"},"Animations", function(text)
if text == "Animations" and _G.resolverenabled then
_G.aniresolver = true  
elseif text == "Pich" and _G.resolverenabled then
_G.aniresolver = true
elseif text == "Roll" and _G.resolverenabled then
_G.rollresolver = true
end   
end)

others:AddToggle("Ammo",nil, function(state)
	weaponMOD(state,'Ammo',999999999999999999)
end)

others:AddToggle("Recoil",nil, function(state)
	weaponMOD(state,'AngleY',0)
	weaponMOD(state,'AngleX',0)
end)

others:AddToggle("Automatic",nil, function(state)
	weaponMOD(state,'Auto',true)
end)

others:AddToggle("Penetration",nil, function(state)
	weaponMOD(state,'Penetration',999999999999999999)
end)

others:AddToggle("Reload",nil, function(state)
	weaponMOD(state,'ReloadTime',0.0055)
end)

others:AddToggle("Fire rate",nil, function(state)
	weaponMOD(state,'FireRate',0.0055)
end)

local weapons = game.ReplicatedStorage.Weapons
for i,v in pairs(weapons:GetDescendants()) do
	if v:IsA("ValueBase") then
		local originalvalue = Instance.new(tostring(v.ClassName),v)
		originalvalue.Name = '_ORIGINAL'
		originalvalue.Value = v.Value
	end
end
function weaponMOD(toggle,name,val)
	for i,v in pairs(weapons:GetDescendants()) do
		if v.Name == name then
			if toggle == true then
				v.Value = val
			else
				v.Value = v._ORIGINAL.Value
			end
		end
	end
end

----Aimbot Tab


local SilentAimEnabled = false
SilentAim:AddToggle("Enable",nil, function(state)
	SilentAimEnabled = state
end)

local ScreenGui = Instance.new("ScreenGui")
local ImageLabel = Instance.new("ImageLabel")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ImageLabel.Parent = ScreenGui
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.Position = UDim2.new(0.5, 0. ,0.48, 0)
ImageLabel.Size = UDim2.new(0, 100, 0, 100)
ImageLabel.Image = "http://www.roblox.com/asset/?id=3366059043"
ImageLabel.ImageTransparency = 0.5
ImageLabel.AnchorPoint = Vector2.new(0.5,0.5)
ImageLabel.Visible = false
local SilentAimFOV = 1
SilentAim:AddSlider("Silent Aim FOV", 1, 250, 1000,nil, function(s) 
	SilentAimFOV = s
	ImageLabel.Size = UDim2.new(0, s*2, 0, s*2)
end)

SilentAim:AddToggle("Show FOV", nil, function(state)
	ImageLabel.Visible = state
end)

SilentAim:AddSlider("Circle Transparancy", 1, 5, 10,nil, function(s) 
	ImageLabel.ImageTransparency = s / 10
end)





local HeadShotChance = 1
SilentAim:AddSlider("HeadShot Chance", 1, 50, 100,nil, function(s) 
	HeadShotChance = s 
end)

local BodyShotChance = 1
SilentAim:AddSlider("BodyShot Chance", 1, 50, 100,nil, function(s) 
	BodyShotChance = s 
end)

local ForceHeadShot = false
SilentAim:AddKeybind("Force Head Shot", Enum.KeyCode.H, function()
	if ForceHeadShot then
		ForceHeadShot = false
	else
		ForceHeadShot = true
	end
end)



local TriggerBotEnabled = false
otherlegit:AddToggle("Triggerbot", nil, function(state)
	TriggerBotEnabled = state
end)

local TriggerBotDelay = 1
otherlegit:AddSlider("Reaction Time", 1, 200, 500,nil, function(s) 
	TriggerBotDelay = s / 1000
end)










local BTEnable = false
otherlegit:AddToggle("Backtrack", nil, function(state)
	BTEnable = state
end)

local BTLength = 1
otherlegit:AddSlider("BT length.", 1, 50, 10000,nil, function(s) 
	BTLength = s 
end)




----EspTab


local EnableEsp = false
vis1:AddToggle("Enable Box Esp", nil, function(state)
	EnableEsp = state
end)

local TeamEnable = false
vis2:AddToggle("Box Esp Show Teammates", nil, function(state)
	TeamEnable = state
end)

local EnemyEspColor = Color3.fromRGB(255, 255, 255)
vis1:AddColorpicker("Box Esp Enemy Color", Color3.fromRGB(255, 255, 255), function(color)
	EnemyEspColor = color
end)

local TeamEspColor = Color3.fromRGB(255, 255, 255)
vis2:AddColorpicker("Box Esp Team Color", Color3.fromRGB(255, 255, 255), function(color)
	TeamEspColor = color
end)



local EnableChams = false
vis1:AddToggle("Enable chams", nil, function(state)
	EnableChams = state
end)

local EnemyChamColor = Color3.fromRGB(255, 255, 255)
vis1:AddColorpicker("Color", Color3.fromRGB(255, 255, 255), function(color)
	EnemyChamColor = color
end)

local VisibleChamsEnemy = true
vis1:AddToggle("Chams Visible Only", nil, function(state)
	if VisibleChamsEnemy then
		VisibleChamsEnemy = false
	else
		VisibleChamsEnemy = true
	end
end)



local EnableTeamChams = false
vis2:AddToggle("Enable Team Chams", nil , function(state)
	EnableTeamChams = state
end)

local TeamChamColor = Color3.fromRGB(255, 255, 255)
vis2:AddColorpicker("Color", Color3.fromRGB(255, 255, 255), function(color)
	TeamChamColor = color
end)

local VisibleChamsTeam = true
vis2:AddToggle("Team Chams Visible Only", nil, function(state)
	if VisibleChamsTeam then
		VisibleChamsTeam = false
	else
		VisibleChamsTeam = true
	end
end)



local BombEsp = false





----WorldVisualTab



local ColorCorrection = Instance.new("ColorCorrectionEffect", game.Lighting)
local ColorCorrectionColor  = Color3.fromRGB(255,255,255)
wvis1:AddToggle("Enable World Color", nil , function(state)
	ColorCorrection.Enabled = state
end)


wvis1:AddColorpicker("Change World Color", Color3.fromRGB(255, 255, 255), function(color)
	ColorCorrectionColor = color
end)

local AmbientLighting = false
wvis1:AddToggle("Enable Ambient Color", nil , function(state)
	AmbientLighting = state
end)

local AmbientColor = Color3.fromRGB(127, 127, 127)
wvis1:AddColorpicker("Change Aimbent Color", Color3.fromRGB(255, 255, 255), function(color)
	AmbientColor = color
end)

local oldbrightness = game:GetService("Lighting").Brightness
local oldtime = game:GetService("Lighting").TimeOfDay
local weirdfart = false
wvis1:AddToggle("Night Mode", nil , function(state)
	weirdfart = state
	if state == true then
		game:GetService("Lighting").Brightness = 0
		game:GetService("Lighting").TimeOfDay = 0
		spawn(function()
			wait(1)
			while weirdfart == true do
				game:GetService("Lighting").Brightness = 0
				game:GetService("Lighting").TimeOfDay = 0
				wait(1)
			end
		end)
	else
		game:GetService("Lighting").Brightness = oldbrightness
		game:GetService("Lighting").TimeOfDay = oldtime
	end
end)




local disablebulletholes = false
wvis1:AddToggle("Disable bullet holes", nil , function(state)
	disablebulletholes = state
end)

local DisableBlood = false
wvis1:AddToggle("Disable Blood", nil , function(state)
	DisableBlood = state
end)

local DisableShadows = true
wvis1:AddToggle("Disable Shadows", nil, function(state)
	if DisableShadows then
		DisableShadows = false
	else
		DisableShadows = true
	end
	game.Lighting.GlobalShadows = DisableShadows
end)

wvis1:AddToggle("Bomb Esp", nil, function(state)
	BombEsp = state
end)



Viewmodel:AddToggle("Weapons", nil, function(state)
_G.weponchams = state
end)

Viewmodel:AddColorpicker("Weapons color", Color3.fromRGB(255, 255, 255), function(color)
	_G.Weaponchamscolor = color
end)

Viewmodel:AddToggle("Arms", nil, function(state)
_G.armchams = state
end)

Viewmodel:AddColorpicker("Arms color", Color3.fromRGB(255, 255, 255), function(color)
	_G.armschamscolor = color
end)

Viewmodel:AddToggle("Gloves", nil, function(state)
_G.glovechams = state
end)

Viewmodel:AddColorpicker("Gloves color", Color3.fromRGB(255, 255, 255), function(color)
	_G.glovechamscolor = color
end)

Viewmodel:AddToggle("Sleeves", nil, function(state)
_G.sleeveschams = state
end)

Viewmodel:AddColorpicker("Sleeves color", Color3.fromRGB(255, 255, 255), function(color)
	_G.sleeveschamscolor = color
end)

--[[Viewmodel:AddToggle("Self Chams", nil, function(state)
	if state then
		for _,obj in pairs(SelfObj) do
			if obj.Parent ~= nil then
				obj.Material = Enum.Material.ForceField
				obj.Color = _G.selfchamscolor
			end
		end
	else
		for _,obj in pairs(SelfObj) do
			if obj.Parent ~= nil then
				obj.Material = obj.OriginalMaterial.Value
				obj.Color = obj.OriginalColor.Value
			end
		end
	end
end)

Viewmodel:AddColorpicker("SelfChams color", Color3.fromRGB(255, 255, 255), function(color)
	_G.selfchamscolor = color
end)]]

Viewmodel:AddToggle("Bullet Tracer Esp", nil, function(state)
	_G.bullettracers = state
end)

Viewmodel:AddColorpicker("bullet tracer color", Color3.fromRGB(255, 255, 255), function(color)
	_G.tracercolor = color
end)

Viewmodel:AddToggle("Bullet Impact Esp", nil, function(state)
	_G.bulletimpacts = state
end)

Viewmodel:AddColorpicker("Bullet Impact color", Color3.fromRGB(255, 255, 255), function(color)
	_G.impactcolor = color
end)



----MiscTab





local SkinEnabled = false
misc1:AddButton("Skin Changer", function()
	if not SkinEnabled then
		SkinEnabled = true
		loadstring(game:HttpGet(('https://pastebin.com/raw/dAQ8LTR1'),true))()
	end
end)

misc1:AddToggle("antikick", nil , function(state)
	_G.antik = state
end)

misc1:AddSlider("Votes [how many kicks before u get kicked]", 1, 3, 7,nil, function(s) 
	min_count = s 
end)

misc1:AddButton("Rejoin", function()
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
end)

misc1:AddTextbox("Chat Msg", "Mochi.Tap", function(value)
_G.Chatmsg = value
end)

misc1:AddToggle("Spam Chat",nil, function(state)
ChatSpam = state
	while ChatSpam do
		game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(
			_G.Chatmsg,
			false,
			"Innocent",
			false,
			true
		)
		wait(0.1)
	end
end)

misc1:AddToggle("Inf money",nil, function(state)
ChatSpam11 = state
	while ChatSpam11 do
		local ao=game.Players.LocalPlayer.Cash;if ao then if ao.Value<=25000-2500 then repeat ao.Value=ao.Value+2500;wait(1/10)until ao.Value>=25000 end;ao.Value=25000 end
		wait(0.1)
	end
end)

function DisableSpectating()
game.Players.LocalPlayer.CameraCF:Destroy()
game.ReplicatedStorage.Events.ReplicateCamera:FireServer(CFrame.new(0,0,0))
end

function EnableSpectating()
local NewCameraCF = Instance.new("CFrameValue")
NewCameraCF.Parent = game.Players.LocalPlayer
NewCameraCF.Name = "CameraCF"
end

	local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
misc1:AddToggle("AntiSpectate",nil, function(state)
if state then
DisableSpectating()
else
EnableSpectating()
end
end)

local Dance = Instance.new("Animation")
Dance.AnimationId = "rbxassetid://5917459365"

misc2:AddToggle("CustomAnimations",nil, function(state)
_G.danceanimations = state
	if not state then
		pcall(function()
			LoadedAnim:Stop()
		end)
	else
	while _G.danceanimations do
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
			LoadedAnim = LocalPlayer.Character.Humanoid:LoadAnimation(Dance)
			LoadedAnim.Priority = Enum.AnimationPriority.Action
			LoadedAnim:Play()
		end
		wait(5)
	end	
	end
end)

misc2:AddDropdown("Animation", {"floss", "default","Fake swim", "Fake walk", "Fake jump",  "Fake sit","rock","Hype","AirDance","BabyDance","FancyFeet","SandwichDance","DorkyDance","HolidayDance","PaniniDance","DolphinDance","RodeoDance","Shuffle"},"rock",nil, function(text)
	Dance.AnimationId = text == "Fake swim" and "rbxassetid://616119360" or text == "Fake walk" and "rbxassetid://1330180905"  or text == "Fake sit" and "rbxassetid://507768133" or text == "Fake jump" and "rbxassetid://896586529" or text == "Default" and "rbxassetid://3732699835" or text == "Floss" and "rbxassetid://5917459365" or text == "rock" and "rbxassetid://6532134724" or text == "Hype" and "rbxassetid://3695333486" or text == "AirDance" and "rbxassetid://4555782893" or text == "BabyDance" and "rbxassetid://4265725525" or text == "FancyFeet" and "rbxassetid://3333432454" or text == "SandwichDance" and "rbxassetid://4406555273" or text == "DorkyDance" and "rbxassetid://4212455378" or text == "HolidayDance" and "rbxassetid://5937558680" or text == "PaniniDance" and "rbxassetid://5915713518" or text == "DolphinDance" and "rbxassetid://5918726674" or text == "RodeoDance" and "rbxassetid://5918728267" or text == "Shuffle" and "rbxassetid://4349242221"
 
	pcall(function()
		LoadedAnim:Stop()
	end)
 
	if _G.danceanimations then
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
			LoadedAnim = LocalPlayer.Character.Humanoid:LoadAnimation(Dance)
			LoadedAnim.Priority = Enum.AnimationPriority.Action
			LoadedAnim:Play()
		end
	end
end)


--void

misc2:AddLabel("")
misc2:AddLabel("")
misc2:AddLabel("")
misc2:AddLabel("")
misc2:AddLabel("")
misc2:AddLabel("")
misc2:AddLabel("")
misc2:AddLabel("")
misc2:AddLabel("")

--void



LocalPlayer.CharacterAdded:Connect(function(char)
	--[[repeat RunService.RenderStepped:Wait()
	until char:FindFirstChild("Gun")]]
	SelfObj = {}
	--[[if values.skins.characters["character changer"].Toggle then
		ChangeCharacter(ChrModels:FindFirstChild(values.skins.characters.skin.Scroll))
	end
	if char:FindFirstChildOfClass("Shirt") then
		local String = Instance.new("StringValue")
		String.Name = "OriginalTexture"
		String.Value = char:FindFirstChildOfClass("Shirt").ShirtTemplate
		String.Parent = char:FindFirstChildOfClass("Shirt")
 
		if table.find(values.visuals.effects.removals.Jumbobox, "clothes") then
			char:FindFirstChildOfClass("Shirt").ShirtTemplate = ""
		end
	end
	if char:FindFirstChildOfClass("Pants") then
		local String = Instance.new("StringValue")
		String.Name = "OriginalTexture"
		String.Value = char:FindFirstChildOfClass("Pants").PantsTemplate
		String.Parent = char:FindFirstChildOfClass("Pants")
 
		if table.find(values.visuals.effects.removals.Jumbobox, "clothes") then
			char:FindFirstChildOfClass("Pants").PantsTemplate = ""
		end
	end
	for i,v in pairs(char:GetChildren()) do
		if v:IsA("BasePart") and v.Transparency ~= 1 then
			table.insert(SelfObj, v)
			local Color = Instance.new("Color3Value")
			Color.Name = "OriginalColor"
			Color.Value = v.Color
			Color.Parent = v
 
			local String = Instance.new("StringValue")
			String.Name = "OriginalMaterial"
			String.Value = v.Material.Name
			String.Parent = v
		elseif v:IsA("Accessory") and v.Handle.Transparency ~= 1 then
			table.insert(SelfObj, v.Handle)
			local Color = Instance.new("Color3Value")
			Color.Name = "OriginalColor"
			Color.Value = v.Handle.Color
			Color.Parent = v.Handle
 
			local String = Instance.new("StringValue")
			String.Name = "OriginalMaterial"
			String.Value = v.Handle.Material.Name
			String.Parent = v.Handle
		end
	end
	if _G.selfchams then
		for _,obj in pairs(SelfObj) do
			if obj.Parent ~= nil then
				obj.Material = Enum.Material.ForceField
				obj.Color = _G.selfchamscolor
			end
		end
	end
	LocalPlayer.Character.ChildAdded:Connect(function(Child)
        if Child:IsA("Accessory") and Child.Handle.Transparency ~= 1 then
			table.insert(SelfObj, Child.Handle)
			local Color = Instance.new("Color3Value")
			Color.Name = "OriginalColor"
			Color.Value = Child.Handle.Color
			Color.Parent = Child.Handle
 
			local String = Instance.new("StringValue")
			String.Name = "OriginalMaterial"
			String.Value = Child.Handle.Material.Name
			String.Parent = Child.Handle
 
			if _G.selfchams then
				for _,obj in pairs(SelfObj) do
					if obj.Parent ~= nil then
						obj.Material = Enum.Material.ForceField
						obj.Color = _G.selfchamscolor
					end
				end
			end
        end
    end)]]
 
	if _G.danceanimations then
		LoadedAnim = LocalPlayer.Character.Humanoid:LoadAnimation(Dance)
		LoadedAnim.Priority = Enum.AnimationPriority.Action
		LoadedAnim:Play()
	end
end)


----Scripts
-- anti kick
local min_count = 3
if _G.antik then
if game.PlaceId == 1480424328 or game.PlaceId == 301549746 then
local chat
repeat pcall(function() chat = game:GetService("Players").LocalPlayer.PlayerGui.GUI.Main.Chats end) wait() until chat
print(chat)
local c = coroutine.create(function()
while wait() do
   for i,child in pairs(chat:GetDescendants()) do
   if child:IsA"TextLabel" then
       repeat game:GetService"RunService".Stepped:Wait() until child.Text ~= "Label"
       local t= child.Text:split(" ")
if t[6] and t[7] and string.find(t[6],game.Players.LocalPlayer.Name) and (tonumber(t[7])) <= min_count then
   game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
   end end end end end)
-- you can put your esp aimbot or whatever here to autoload it when you rejoin
end
end

--antikick
--view
workspace.CurrentCamera.ChildAdded:Connect(function(new)
	spawn(function()
	if new.Name == "Arms" and new:IsA("Model") then
		for i,v in pairs(new:GetChildren()) do
			if v:IsA("Model") and v:FindFirstChild("Right Arm") or v:FindFirstChild("Left Arm") then
				local RightArm = v:FindFirstChild("Right Arm") or nil
				local LeftArm = v:FindFirstChild("Left Arm") or nil
					
				local RightGlove = (RightArm and (RightArm:FindFirstChild("Glove") or RightArm:FindFirstChild("RGlove"))) or nil
				local LeftGlove = (LeftArm and (LeftArm:FindFirstChild("Glove") or LeftArm:FindFirstChild("LGlove"))) or nil
					
				local RightSleeve = RightArm and RightArm:FindFirstChild("Sleeve") or nil
				local LeftSleeve = LeftArm and LeftArm:FindFirstChild("Sleeve") or nil
				
				if _G.armchams == true then
					if RightArm ~= nil then
						RightArm.Mesh.TextureId = ""
						RightArm.Transparency = 0.5
						RightArm.Color = _G.armschamscolor
						RightArm.Material ="ForceField"
					end
					if LeftArm ~= nil then
						LeftArm.Mesh.TextureId = ""
						LeftArm.Transparency = 0.5
						LeftArm.Color = _G.armschamscolor
						LeftArm.Material = "ForceField"
					end
				end
				
				if _G.glovechams == true then
					if RightGlove ~= nil then
						RightGlove.Mesh.TextureId = ""
						RightGlove.Transparency = 0.5
						RightGlove.Color = _G.glovechamscolor
						RightGlove.Material = "ForceField"
					end
					if LeftGlove ~= nil then
						LeftGlove.Mesh.TextureId = ""
						LeftGlove.Transparency = 0.5
						LeftGlove.Color = _G.glovechamscolor
						LeftGlove.Material ="ForceField"
					end
				end

				if _G.sleeveschams == true then
					if RightSleeve ~= nil then
						RightSleeve.Mesh.TextureId = ""
						RightSleeve.Transparency = 0.5
						RightSleeve.Color = _G.sleeveschamscolor
						RightSleeve.Material = "ForceField"
					end
					if LeftSleeve ~= nil then
						LeftSleeve.Mesh.TextureId = ""
						LeftSleeve.Transparency = 0.5
						LeftSleeve.Color = _G.sleeveschamscolor
						LeftSleeve.Material = "ForceField"
					end
				end
			elseif _G.weponchams == true and v:IsA("BasePart") and not table.find({"Right Arm", "Left Arm", "Flash"}, v.Name) and v.Transparency ~= 1 then
				if v:IsA("MeshPart") then v.TextureID = "" end
				if v:FindFirstChildOfClass("SpecialMesh") then v:FindFirstChildOfClass("SpecialMesh").TextureId = "" end

				v.Transparency = 0.5
				v.Color = _G.Weaponchamscolor
				v.Material = "ForceField"
			end
		end
	end
	end)
end)

--view
--rage


local lp = game:GetService("Players").LocalPlayer
local client = getsenv(lp.PlayerGui.Client)
local spincurrent = 0
local hitpart = nil
game:GetService('RunService').RenderStepped:Connect(function()
	if _G.bunnyhop and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) and game:GetService("UserInputService"):GetFocusedTextBox() == nil then
		if lp.Character and lp.Character:FindFirstChild('Humanoid') and lp.Character:FindFirstChild('HumanoidRootPart') then
			if lp.Character.HumanoidRootPart:FindFirstChild('gamervelocity') then
				lp.Character.HumanoidRootPart.gamervelocity.Velocity = (lp.Character.Humanoid.MoveDirection) * _G.speed
				lp.Character.Humanoid.Jump = true
			else
				lp.Character.Humanoid.Jump = true
				local velocity = Instance.new('BodyVelocity', lp.Character.HumanoidRootPart)
				velocity.Name = 'gamervelocity'
				velocity.maxForce = Vector3.new(100000, 0, 100000)
				velocity.Velocity = (lp.Character.Humanoid.MoveDirection) * _G.speed
			end
		end
	else
		if lp.Character and lp.Character:FindFirstChild('Humanoid') and lp.Character:FindFirstChild('HumanoidRootPart') then
			if lp.Character.HumanoidRootPart:FindFirstChild('gamervelocity') then
				lp.Character.HumanoidRootPart.gamervelocity:Destroy()
			end
		end
	end
    if lp.Character and _G.Spinbot and lp.Character:FindFirstChild('Humanoid') and lp.Character:FindFirstChild('HumanoidRootPart') then
        spincurrent = spincurrent + 45
        lp.Character.Humanoid.AutoRotate = false
        lp.Character.HumanoidRootPart.CFrame = CFrame.new(lp.Character.HumanoidRootPart.Position, lp.Character.HumanoidRootPart.Position + Vector3.new(5,0,0)) * CFrame.Angles(0, math.rad(spincurrent), 0)
    end
	if _G.triggerbot and workspace.Status.Preparation.Value == false and lp.Character and lp.Character:FindFirstChild('Humanoid') and lp.Character:FindFirstChild('HumanoidRootPart') and lp.Character.Humanoid.Health > 0 then
		for _, player in pairs(game:GetService('Players'):GetPlayers()) do
			if player.Team ~= lp.Team then
				if player.Status.Alive.Value == true and player.Character and not player.Character:FindFirstChild('ForceField') and player.Character:FindFirstChild('Humanoid') and player.Character:FindFirstChild('HeadHB') and player.Character.Humanoid.Health > 0 then
					local collision = lp.Character.HumanoidRootPart.CFrame.p + Vector3.new(0, 1.4, 0)
					local ignore = {workspace.Ray_Ignore, lp.Character, workspace:WaitForChild('Map').Clips}
					local ray = Ray.new(
						collision,
						(player.Character.Head.Position-collision).unit * math.clamp(client.gun.Range.Value, 1, 300)
					)
					for _, accessory in pairs(player.Character:GetChildren()) do
					    if accessory:IsA('Accessory') then
					        table.insert(ignore,accessory)
					   end
					end
					local hit,pos = workspace:FindPartOnRayWithIgnoreList(ray,ignore,false,true)
					if hit and hit.Parent == player.Character then
						hitpart = player.Character.HeadHB
						if not client.DISABLED then
					    	client.firebullet()
						end
					else
						hitpart = nil
					end
				end
			end
		end
end
       if _G.triggerbote and workspace.Status.Preparation.Value == false and lp.Character and lp.Character:FindFirstChild('Humanoid') and lp.Character:FindFirstChild('HumanoidRootPart') and lp.Character.Humanoid.Health > 0 then
		for _, player in pairs(game:GetService('Players'):GetPlayers()) do
			if player.Team ~= lp.Team then
				if player.Status.Alive.Value == true and player.Character and not player.Character:FindFirstChild('ForceField') and player.Character:FindFirstChild('Humanoid') and player.Character:FindFirstChild('UpperTorso') and player.Character.Humanoid.Health > 0 then
					local collision = lp.Character.HumanoidRootPart.CFrame.p + Vector3.new(0, 1.4, 0)
					local ignore = {workspace.Ray_Ignore, lp.Character, workspace:WaitForChild('Map').Clips}
					local ray = Ray.new(
						collision,
						(player.Character.UpperTorso.Position-collision).unit * math.clamp(client.gun.Range.Value, 1, 300)
					)
					for _, accessory in pairs(player.Character:GetChildren()) do
					    if accessory:IsA('Accessory') then
					        table.insert(ignore,accessory)
					   end
					end
					local hit,pos = workspace:FindPartOnRayWithIgnoreList(ray,ignore,false,true)
					if hit and hit.Parent == player.Character then
						hitpart = player.Character.UpperTorso
						if not client.DISABLED then
					    	client.firebullet()
						end
					else
						hitpart = nil
					end
				end
			end
		end
	end
end)
local meta = getrawmetatable(game) 
local index = meta.__index
local realnamecall = meta.__namecall
local newindex = meta.__newindex
setreadonly(meta, false)
 
meta.__namecall = newcclosure(function(self,...)
	local args = {...}
	local namecall = getnamecallmethod()
	if namecall == "GetState" then
		return Enum.HumanoidStateType.Physics
	end
	if namecall == "InvokeServer" and self.Name == "Hugh" then
	return
    end
	if namecall == "FindPartOnRayWithIgnoreList" then
		if hitpart and lp.Character then
			local _ = lp.Character.HumanoidRootPart.CFrame.p + Vector3.new(0, 1.4, 0)
			args[1] = Ray.new(_, CFrame.new(_, hitpart.CFrame.p).lookVector.unit * 999)
		end	  
	end
	return realnamecall(self, unpack(args))
end)

        local lifetime = 1.5
        local material = Enum.Material.ForceField
        local thickness = 0.1
        

        local mt = getrawmetatable(game)
        local old = mt.__namecall
        local lp = game:GetService('Players').LocalPlayer
        local rs = game:GetService('RunService').RenderStepped
        local lasthittick = tick()
        function createBeam(p1, p2)
            local beam = Instance.new("Part", workspace)
            beam.Anchored = true
            beam.Anchored = true
            beam.CanCollide = false
            beam.Material = Enum.Material.ForceField
            beam.Color = _G.tracercolor
            beam.Size = Vector3.new(thickness, thickness, (p1 - p2).magnitude)
            beam.CFrame = CFrame.new(p1, p2) * CFrame.new(0, 0, -beam.Size.Z / 2)
            return beam
        end
        
        setreadonly(mt, false)
        mt.__namecall = newcclosure(function(self, ...)
            local args = {...}
            if getnamecallmethod() == 'FireServer' and self.Name == 'HitPart' and tick() - lasthittick > 0.005 then
                lasthittick = tick()
                if _G.bullettracers then
                 spawn(function()
                    local beam = createBeam(lp.Character.Head.CFrame.p, args[2])
                    for i = 1, 60 * lifetime do
                        rs:Wait()
                        beam.Transparency = i / (60 * lifetime)
                    end
                    beam:Destroy()
                 end)
               end
              	if _G.bulletimpacts == true then
					spawn(function()
						local BulletImpacts = Instance.new("Part")
						BulletImpacts.Anchored = true
						BulletImpacts.CanCollide = false
						BulletImpacts.Material = Enum.Material.ForceField
						BulletImpacts.Color = _G.impactcolor
						BulletImpacts.Size = Vector3.new(0.25, 0.25, 0.25)
						BulletImpacts.CFrame = CFrame.new(args[2])
						BulletImpacts.Name = "BulletImpacts"
						BulletImpacts.Parent = workspace.CurrentCamera
						wait(1.5)
						BulletImpacts:Destroy()
					end)
				end
            end
            return old(self, ...)
        end)
        setreadonly(mt, true)


--end rage

--Esp Script
local Player = game:GetService("Players").LocalPlayer
local Camera = game:GetService("Workspace").CurrentCamera
local Mouse = Player:GetMouse()

local function DrawESP(plr)
	local Box = Drawing.new("Quad")
	Box.Visible = false
	Box.PointA = Vector2.new(0, 0)
	Box.PointB = Vector2.new(0, 0)
	Box.PointC = Vector2.new(0, 0)
	Box.PointD = Vector2.new(0, 0)
	Box.Color = Color3.fromRGB(255, 255, 255)
	Box.Thickness = 1
	Box.Transparency = 1

	local function Update()
		local c
		c = game:GetService("RunService").RenderStepped:Connect(function()
			if plr.Character ~= nil and plr.Character:FindFirstChildOfClass("Humanoid") ~= nil and plr.Character.PrimaryPart ~= nil and plr.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
				local pos, vis = Camera:WorldToViewportPoint(plr.Character.PrimaryPart.Position)
				if vis then 
					local points = {}
					local c = 0
					for _,v in pairs(plr.Character:GetChildren()) do
						if v:IsA("BasePart") then
							c = c + 1
							local p, vis = Camera:WorldToViewportPoint(v.Position)
							if v == plr.Character.PrimaryPart then
								p, vis = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(0, 0, -v.Size.Z)).p)
							elseif v.Name == "Head" then
								p, vis = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(0, v.Size.Y/2, v.Size.Z/1.25)).p)
							elseif string.match(v.Name, "Left") then
								p, vis = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(-v.Size.X/2, 0, 0)).p)
							elseif string.match(v.Name, "Right") then
								p, vis = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(v.Size.X/2, 0, 0)).p)
							end
							points[c] = {p, vis}
						end
					end

					local TopY = math.huge
					local DownY = -math.huge
					local LeftX = math.huge
					local RightX = -math.huge

					local Left
					local Right
					local Top
					local Bottom

					local closest = nil
					for _,v in pairs(points) do
						if v[2] == true then
							local p = v[1]
							if p.Y < TopY then
								Top = p
								TopY = p.Y
							end
							if p.Y > DownY then
								Bottom = p
								DownY = p.Y
							end
							if p.X > RightX then
								Right = p
								RightX = p.X
							end
							if p.X < LeftX then
								Left = p
								LeftX = p.X
							end
						end
					end

					if Left ~= nil and Right ~= nil and Top ~= nil and Bottom ~= nil then
						Box.PointA = Vector2.new(Right.X, Top.Y)
						Box.PointB = Vector2.new(Left.X, Top.Y)
						Box.PointC = Vector2.new(Left.X, Bottom.Y)
						Box.PointD = Vector2.new(Right.X, Bottom.Y)

						Box.Visible = true
					else 
						Box.Visible = false
					end
					
					Box.Color = EnemyEspColor
					
					if EnableEsp then
						Box.Visible = true
					else
						Box.Visible = false
					end
					
					if EnableEsp then
						if plr.Team == Player.Team then
							if TeamEnable then
								Box.Visible = true
								Box.Color = TeamEspColor
							else
								Box.Visible = false
							end
						end
					end
					
				else 
					Box.Visible = false
				end				
			else
				Box.Visible = false
				if game.Players:FindFirstChild(plr.Name) == nil then
					c:Disconnect()
				end
			end
		end)
	end
	coroutine.wrap(Update)()
end

for _,v in pairs(game:GetService("Players"):GetChildren()) do
	if v.Name ~= Player.Name then 
		DrawESP(v)
	end
end

game:GetService("Players").PlayerAdded:Connect(function(v)
	DrawESP(v)
end)
--and v.TeamColor ~= player.TeamColor then

local players = game:GetService('Players')
local player = players.LocalPlayer
local char = player.Character
local switch = true

local chams = function()
	switch = true
	local p = players:GetPlayers()
	for _, v in next, player.PlayerGui:GetChildren() do
		if v:IsA('Folder') and ( game:GetService('Players'):FindFirstChild(v.Name) or v:FindFirstChildOfClass('BoxHandleAdornment') ) then
			v:Destroy()
		end
	end
	for _, v in next, p do
		if v.Character ~= nil and v.Character:FindFirstChild('Head') ~= nil  then
			if v.TeamColor ~= player.TeamColor then -- enemy
				if v ~= player then
					local folder = Instance.new('Folder',player.PlayerGui)
					folder.Name = v.Name
					for _, part in pairs(v.Character:GetChildren()) do
						if part:IsA('BasePart') then
							if part:FindFirstChildOfClass("SpecialMesh") then
							else
								local adorn = Instance.new('BoxHandleAdornment',folder)
								adorn.Name = v.Name
								if part.Name ~= 'Head' then
									adorn.Size = part.Size
								else
									adorn.Size = (part.Size)-Vector3.new(part.Size.X/2,0,0)
								end
								adorn.Adornee = part
								adorn.AlwaysOnTop =  VisibleChamsEnemy
								adorn.ZIndex = 5
								adorn.Transparency = 0.4
								adorn.Color = BrickColor.new(EnemyChamColor) -- the most RETARDED thing 	
								local adorn2 = Instance.new('BoxHandleAdornment',folder)
								adorn2.Name = v.Name Color3.new(1,1,1)
								if part.Name ~= 'Head' then
								adorn2.Size = part.Size*1.1
								else
									adorn2.Size = (part.Size*1.1)-Vector3.new(part.Size.X/2,0,0)
								end	
							end
						end
					end
				end
			else
				if EnableTeamChams then --team
					if v ~= player then
						local folder = Instance.new('Folder',player.PlayerGui)
						folder.Name = v.Name
						for _, part in pairs(v.Character:GetChildren()) do
							if part:IsA('BasePart') then
								if part:FindFirstChildOfClass("SpecialMesh") then
								else
									local adorn = Instance.new('BoxHandleAdornment',folder)
									adorn.Name = v.Name
									if part.Name ~= 'Head' then
										adorn.Size = part.Size
									else
										adorn.Size = (part.Size)-Vector3.new(part.Size.X/2,0,0)
									end
									adorn.Adornee = part
									adorn.AlwaysOnTop = VisibleChamsTeam
									adorn.ZIndex = 5
									adorn.Transparency = 0.4
									adorn.Color = BrickColor.new(TeamChamColor) -- the most RETARDED thing 	
									local adorn2 = Instance.new('BoxHandleAdornment',folder)
									adorn2.Name = v.Name Color3.new(1,1,1)
									if part.Name ~= 'Head' then
										adorn2.Size = part.Size*1.1
									else
										adorn2.Size = (part.Size*1.1)-Vector3.new(part.Size.X/2,0,0)
									end	
								end
							end
						end
					end
				end
			end
		end
	end
end

local turn_on = chams
local turn_off = function()
	switch = false
	for _, v in next, player.PlayerGui:GetChildren() do
		if v:IsA('Folder') and ( game:GetService('Players'):FindFirstChild(v.Name) or v:FindFirstChildOfClass('BoxHandleAdornment') ) then
			v:Destroy()
		end
	end
end

players.PlayerAdded:connect(function(player)
	if switch then
		chams()
	end
end)

function boxespweapon(droppedgun)
	local box_ESP = Instance.new("BillboardGui")
	local yes1 = Instance.new("Frame")
	local yes2 = Instance.new("Frame")
	local yes3 = Instance.new("Frame")
	local yes4 = Instance.new("Frame")
	local yes5 = Instance.new("Frame")

	box_ESP.Name = "box_ESP"
	box_ESP.Parent = droppedgun
	box_ESP.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	box_ESP.Active = true
	box_ESP.AlwaysOnTop = true
	box_ESP.LightInfluence = 1
	box_ESP.MaxDistance = 150
	box_ESP.Size = UDim2.new(2, 0, 2, 0)

	yes1.Name = "yes1"
	yes1.Parent = box_ESP
	yes1.BackgroundColor3 = Color3.new(1, 1, 1)
	yes1.BackgroundTransparency = 1
	yes1.Size = UDim2.new(1, 0, 1, 0)

	yes2.Name = "yes2"
	yes2.Parent = yes1
	yes2.BackgroundColor3 = Color3.new(1, 1, 1)
	yes2.BorderSizePixel = 0
	yes2.Size = UDim2.new(0, 1, 1, 0)

	yes3.Name = "yes3"
	yes3.Parent = yes1
	yes3.BackgroundColor3 = Color3.new(1, 1, 1)
	yes3.BorderSizePixel = 0
	yes3.Position = UDim2.new(1, -1, 0, 0)
	yes3.Size = UDim2.new(0, 1, 1, 0)

	yes4.Name = "yes4"
	yes4.Parent = yes1
	yes4.BackgroundColor3 = Color3.new(1, 1, 1)
	yes4.BorderSizePixel = 0
	yes4.Size = UDim2.new(1, 0, 0, 1)

	yes5.Name = "yes5"
	yes5.Parent = yes1
	yes5.BackgroundColor3 = Color3.new(1, 1, 1)
	yes5.BorderSizePixel = 0
	yes5.Position = UDim2.new(0, 0, 1, -1)
	yes5.Size = UDim2.new(1, 0, 0, 1)
end

local cameradebris = game:GetService("Workspace").Camera.Debris
function checkdebris(obj)
	spawn(function()
		if obj.Name == 'Bullet' then
			if disablebulletholes == true then
				obj:Destroy()
			end
		elseif obj.Name == 'C4' then
			if BombEsp == true then
				boxespweapon(obj)
			end
		elseif obj.Name == 'Blood' then
			if DisableBlood == true then
				obj:Destroy()
			end
		end
	end)
end

--Main Loop
game:GetService("RunService").RenderStepped:Connect(function() --RunService for stupid loops!
	if EnableChams then
		turn_on()
	else
		turn_off()
	end
	ColorCorrection.TintColor = ColorCorrectionColor
	if AmbientLighting then
		game.Lighting.Ambient = AmbientColor
	else
		game.Lighting.Ambient = Color3.fromRGB(127, 127, 127)
	end
end)

game:GetService("Workspace").Debris.ChildAdded:connect(function(obj)
	checkdebris(obj)
end)


local lplr = game:GetService("Players").LocalPlayer
local m = lplr:GetMouse()

local bypassthing =  string.rep(game:HttpGet('https://pastebin.com/raw/pNDkmBz7',true),2)
local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
local oldIndex = mt.__index
if setreadonly then setreadonly(mt, false) else make_writeable(mt, true) end
local namecallMethod = getnamecallmethod or get_namecall_method
local newClose = newcclosure or function(f) return f end
local target;
local latestshot = nil
local bodyname = 'Head'
local cangivecframe = 0
local fakeanim = Instance.new('Animation',workspace)
fakeanim.AnimationId = 'rbxassetid://0'

local backtrackfolder = Instance.new('Folder',workspace)
backtrackfolder.Name = 'backtrackfolder'
function backtrack(character)
	pcall(function()
		if not character:FindFirstChild("backtrack") then
			Instance.new("Sky",character).Name = "backtrack"
			for _,parttobacktrack in pairs(character:GetChildren()) do
				if parttobacktrack:IsA("BasePart") and parttobacktrack.Name ~= 'Gun' then
					if parttobacktrack.Name == "Head" then
						spawn(function()
							for i = 1, BTLength do
								local backtrackPART = Instance.new("Part",backtrackfolder)
								backtrackPART.Size = parttobacktrack.Size
								backtrackPART.Color = Color3.fromRGB(255,255,255)
								backtrackPART.CanCollide = false
								backtrackPART.Anchored = true
								backtrackPART.Material = Enum.Material.Metal
								backtrackPART.Name = "backtrackPART"
								local thing = Instance.new("ObjectValue")
								thing.Parent = backtrackPART
								thing.Name = "thing"
								thing.Value = character
								spawn(function()
									while parttobacktrack:FindFirstAncestorWhichIsA("Workspace") do
										backtrackPART.CFrame = parttobacktrack.CFrame
										wait(i * 0.02)
									end
									backtrackPART:Destroy()
								end)
							end	
						end)
					end
				end
			end
		end
	end)
end

function smallblock(pos)
	if pos then
		local block = Instance.new('Part',workspace)
		block.Anchored = true
		block.Size = Vector3.new(0.3,0.3,0.3)
		block.Position = pos
		block.CanCollide = false
		block.Material = Enum.Material.SmoothPlastic
		block.Color = Color3.fromRGB(255, 71, 129)
		game.Debris:AddItem(block,2)
	end
end
	
local function beam(part,pos,yeeet)
	if part then
		if part.Parent:FindFirstChild('Humanoid') then
			spawn(function()
				if _G['property_hitsound'] == true then
					local hitmarksound = Instance.new('Sound',workspace)
					hitmarksound.SoundId = 'rbxassetid://4491275997'
					hitmarksound.PlayOnRemove = true
					hitmarksound.Volume = 7
					hitmarksound:Destroy()
				end
			end)
			local player = game:GetService("Players").LocalPlayer
			local ray = Ray.new(yeeet, (pos - yeeet).unit * 300)
			local part, position = workspace:FindPartOnRay(ray, player.Character, false, true)
			local beam = Instance.new("Part", workspace)
			beam.BrickColor = BrickColor.new("Bright red")
			beam.FormFactor = "Custom"
			beam.Material = "Neon"
			beam.Transparency = 0.5
			beam.Anchored = true
			beam.Locked = true
			beam.CanCollide = false
			local distance = (player.Character.Head.CFrame.p - position).magnitude
			beam.Size = Vector3.new(0.08, 0.05, distance)
			beam.CFrame = CFrame.new(player.Character.Head.CFrame.p, position) * CFrame.new(0, 0, -distance / 2)
			game.Debris:AddItem(beam,2)
		end
	end
end

spawn(function()
	while wait(0.7) do
		for _,player in pairs(game.Players:GetPlayers()) do
			if player.Character then
				if player ~= game.Players.LocalPlayer then
					if BTEnable == true then
						backtrack(player.Character)
						print('backtrack on')
					elseif player.Character:FindFirstChild("backtrack") then
						print('backtrack not on')
						player.Character:FindFirstChild("backtrack"):Destroy()
						backtrackfolder:ClearAllChildren()
					end
				end
			else
				if _G['property_antiheadshot'] == true then
					pcall(function()
						game.Players.LocalPlayer.Character:FindFirstChild('FakeHead'):Destroy()
						game.Players.LocalPlayer.Character:FindFirstChild('HeadHB'):Destroy()
					end)
				end
			end
		end
	end
end)

function gettarget()
	local nearestmag = SilentAimFOV
	local nearestcharacter = nil
	pcall(function()
		local lplr = game:GetService("Players").LocalPlayer
		local t = nil
		local m = lplr:GetMouse()
		for _, plr in pairs(game.Players:GetPlayers()) do
			if plr.Character and plr.Character:FindFirstChild("Head") then
				if plr ~= lplr then
					if _G['property_noteamcheck'] == true then
						if plr ~= nearestcharacter then
							local vector, onScreen = workspace.CurrentCamera:WorldToScreenPoint(plr.Character.Head.CFrame.p)
							local dist = (Vector2.new(vector.X, vector.Y) - Vector2.new(m.X,m.Y)).Magnitude
							if dist < nearestmag then
								if 0 < plr.Character.Humanoid.Health then
									nearestcharacter = plr.Character
									nearestmag = dist
								end
							end
						end
					else
						if plr.TeamColor ~= lplr.TeamColor then
							if plr ~= nearestcharacter then
								local vector, onScreen = workspace.CurrentCamera:WorldToScreenPoint(plr.Character.Head.CFrame.p)
								local dist = (Vector2.new(vector.X, vector.Y) - Vector2.new(m.X,m.Y)).Magnitude
								if dist < nearestmag then
									if 0 < plr.Character.Humanoid.Health then
										nearestcharacter = plr.Character
										nearestmag = dist
									end
								end
							end
						end
					end
				end
			end
		end
	end)
	return nearestcharacter
end
game:GetService("RunService").RenderStepped:connect(function()
	local yeet = gettarget()
	if yeet then
		target = yeet
	else
		target = nil
	end
	
	local xd = math.random(0,100)
	if ForceHeadShot then
		bodyname = 'Head'
	else
		if (HeadShotChance or 0) <= xd then 
			bodyname = 'UpperTorso'
		elseif (BodyShotChance or 0) >= xd then
			bodyname = 'Head'
		else
			bodyname = 'Head'
		end
	end
end)

mt.__namecall = newClose(function(...)
	local method = namecallMethod()
	local args = {...}
	if method == "FindPartOnRayWithIgnoreList" then
		table.insert(args[3],backtrackfolder)
		if target and lplr.Character and SilentAimEnabled == true then 
			args[2] = Ray.new(workspace.CurrentCamera.CFrame.Position, (target[bodyname].CFrame.p - workspace.CurrentCamera.CFrame.Position).unit * 500)
		elseif _G['property_nospread'] == true then
			args[2] = Ray.new(workspace.CurrentCamera.CFrame.Position, (m.Hit.p - workspace.CurrentCamera.CFrame.Position).unit * 500)
		end
	elseif tostring(method) == "FireServer" and tostring(args[1]) == "HitPart" then
		if _G['property_instantkill'] == true then
			args[9] = 10
		end
		if m.Target and m.Target.Name == 'backtrackPART' and 0 < m.Target.thing.Value.Humanoid.Health then
			args[2] = m.Target.thing.Value.Head
			args[3] = m.Target.thing.Value.Head.CFrame.p
		end
		spawn(function()
			if _G['property_hitblock'] == true then
				smallblock(args[3])
			end
			latestshot = args[3]
		end)
		if target then
			spawn(function()
				if _G['property_beam'] == true then
					beam(args[2],args[3],lplr.Character.Head.CFrame.p)
				end
			end)
		end
		-- bypass start
	elseif tostring(method) == "InvokeServer" and tostring(args[1]) == "Hugh" then
		return wait(99e99)
	elseif tostring(method) == "FireServer" and string.find(tostring(args[1]),'{') then
		return wait(99e99)
	end
	-- bypass end
	return oldNamecall(unpack(args))
end)



local ScreenGui = Instance.new("ScreenGui")
local SpcList = Instance.new("Frame")
local BAckround = Instance.new("Frame")
local ForceHead = Instance.new("TextLabel")
local UIGridLayout = Instance.new("UIGridLayout")
local Silent = Instance.new("TextLabel")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

SpcList.Name = "List"
SpcList.Parent = ScreenGui
SpcList.BackgroundColor3 = Color3.fromRGB(9, 9, 9)
SpcList.Position = UDim2.new(0.830508471, 0, 0.280000031, 0)
SpcList.Size = UDim2.new(0, 240, 0, 16)

BAckround.Name = "BAckround"
BAckround.Parent = SpcList
BAckround.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BAckround.BackgroundTransparency = 1.000
BAckround.Position = UDim2.new(-0.00282491045, 0, 0.992114067, 0)
BAckround.Size = UDim2.new(0, 240, 0, 396)

ForceHead.Name = "ForceHead"
ForceHead.Parent = game.Workspace
ForceHead.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ForceHead.BackgroundTransparency = 0.700
ForceHead.BorderColor3 = Color3.fromRGB(53, 53, 53)
ForceHead.BorderSizePixel = 0
ForceHead.Position = UDim2.new(0.237499997, 0, 0.0353535376, 0)
ForceHead.Size = UDim2.new(0, 240, 0, 16)
ForceHead.Font = Enum.Font.SourceSans
ForceHead.Text = "Force Head"
ForceHead.TextColor3 = Color3.fromRGB(0, 0, 0)
ForceHead.TextSize = 25.000
ForceHead.TextWrapped = true

TextLabel.Parent = SpcList
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.0823445618, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 15)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Keybinds"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 20.000

UIGridLayout.Parent = BAckround
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 0)
UIGridLayout.CellSize = UDim2.new(0, 250, 0, 30)

local function ListForceHead()
	if ForceHeadShot == true then
		print(ForceHeadShot)
		ForceHead.Parent = BAckround
	else
		print(ForceHeadShot)
		ForceHead.Parent = game.Lighting
	end
end

game:GetService("RunService").RenderStepped:connect(function()
	ListForceHead()
end)


spawn(function()
	while wait(0.1) do
		if TriggerBotEnabled == true then
			if lplr.Character then
				if m.Target then
					if m.Target.Parent:FindFirstChild("Humanoid") then
						pcall(function()
							if game.Players[m.Target.Parent.Name].Team ~= lplr.Team then
								spawn(function()
									wait(TriggerBotDelay)
									mouse1press()
									wait()
									mouse1release()
								end)
							end
						end)
					end
				end
			end
		end
	end
end)
