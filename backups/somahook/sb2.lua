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

local getupvalue = getupvalue or debug.getupvalue;

local httpService = game:GetService("HttpService");
local players = game:GetService("Players");
local replicatedStorage = game:GetService("ReplicatedStorage");
local tweenService = game:GetService("TweenService");
local starterGui = game:GetService("StarterGui");
local client = players.LocalPlayer;

local runService = game:GetService("RunService");
local heartbeat = runService.heartbeat; 
-- Variables
local s =
setmetatable(
{},
{
	__index = function(self, service)
		return game:GetService(service)
	end,
	__newindex = function(self, key)
		self[key] = nil
	end
}
)

local Ser;

for i, v in next, getreg() do
if typeof(v) == "table" then
	if rawget(v, "Services") then
		Ser = v.Services
		break
	end
end
end

local key = getupvalue(Ser.Combat.Init, 2)

local user = s["Players"].LocalPlayer
local ReplicatedStorage = s["ReplicatedStorage"]

local getupvalue = getupvalue or debug.getupvalue;

local httpService = game:GetService("HttpService");
local players = game:GetService("Players");
local replicatedStorage = game:GetService("ReplicatedStorage");
local tweenService = game:GetService("TweenService");
local starterGui = game:GetService("StarterGui");
local client = players.LocalPlayer;

local runService = game:GetService("RunService");
local heartbeat = runService.heartbeat;

local services, crystalForge; do
repeat
	for i, v in next, getreg() do
		if (typeof(v) == "table" and rawget(v, "Services")) then
			services = v.Services;
		elseif (typeof(v) == "table" and rawget(v, "Craft")) then
			crystalForge = v;
		end;

		if (services and crystalForge) then break end;
	end;

	heartbeat:Wait();
until services and crystalForge;
end;

getgenv().TweenSpeed = 50
getgenv().Studs = 5000

-- etc

local BossNames = {
"Dire Wolf",
"Rahjin the Thief King",
"Borik the BeeKeeper",
"Gorrock the Grove Protector",
"Ra'thae the Ice King",
"Qerach The Forgotten Golem",
"Irath the Lion",
"Rotling",
"Fire Scorpion",
"Sa'jun the Centurian Chieftain",
"Frogazoid",
"Smashroom",
"Hippogriff",
"Formaug the Jungle Giant",
"Gargoyle Reaper",
"Mortis the Flaming Sear",
"Polyserpant",
"Baal",
"Grim the Overseer",
"Da",
"Ra",
"Ka",
"Egg Mimic" -- easter event
}

-- Functions

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
wait(1)
vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)



local function Damage(Enemy)
 ReplicatedStorage.Event:FireServer("Combat", key, {"Attack",nil,"1", Enemy})
end

local function dismantle(rarity)
local restartFunc = Instance.new("BindableFunction")
restartFunc.OnInvoke = function(text)
	if text == "Yes" then
		for i, v in pairs(game.ReplicatedStorage.Profiles[game:GetService("Players").LocalPlayer.Name].Inventory:children'') do
			if game.ReplicatedStorage.Database.Items[v.Name].Rarity.Value == rarity then
				game.ReplicatedStorage.Event:FireServer("Equipment", {
					"Dismantle",
					v
				})
			end
		end	
	else
		return
	end
end
game.StarterGui:SetCore("SendNotification", {
	Title = "Dismantle All" ..  rarity .. "?";
	Text = "Are you sure?";
	Callback = restartFunc;
	Button1 = "Yes";
	Button2 = "No";
})
end

local function UserWalkSpeed(person, speed)
if person and person.Character then
	if person.Character:FindFirstChildWhichIsA("Humanoid") then
		person.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed = speed
	end
end
end

local cf = nil

local mt = getrawmetatable(game)
local indexBackup = mt.__index

local plr = game.Players.LocalPlayer
local chr = plr.Character or plr.CharacterAdded:Wait()
local root = chr.HumanoidRootPart

plr.CharacterAdded:Connect(function(char)
chr = char
root = chr:WaitForChild("HumanoidRootPart")
end)

setreadonly(mt, false) 
mt.__index = function(self,key,...)
if not checkcaller() and self == root and getgenv().autofarm then
	if key == "CFrame" and cf then
		root.CFrame = cf
		return cf
	end
end
return indexBackup(self,key,...)
end
setreadonly(mt, true)

local function GoInvisible()
local Character = game:GetService("Players").LocalPlayer.Character
	local Clone = Character.LowerTorso.Root:Clone()
	Character.LowerTorso.Root:Destroy()
	Clone.Parent = Character.LowerTorso
	game.StarterGui:SetCore("SendNotification", {
		Title = "Invisibility Enabled"; -- the title (ofc)
		Text = "It will stop working when you die or reset. Use at your own risk.";
		Duration = 5; -- how long the notification should in secounds
	})
end

local function Primeonly()
local Character = game:GetService("Players").LocalPlayer.Character
	local Clone = Character.LowerTorso.Root:Clone()
	Character.LowerTorso.Root:Destroy()
	Clone.Parent = Character.LowerTorso
	game.StarterGui:SetCore("SendNotification", {
		Title = "premium only"; -- the title (ofc)
		Text = "Buy Premium";
		Duration = 5; -- how long the notification should in secounds
	})
end

local function Nearest()
local d = getgenv().Studs
local t = nil

for i, v in pairs(game.Workspace.Mobs:GetChildren()) do
	if
		(v.PrimaryPart ~= nil and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Nameplate") and
			v.Parent and
			v:FindFirstChild("Entity") and
			v.Entity.Health.Value > 0)
	 then
		if getgenv().TargetBosses then
			for _, i in next, BossNames do
				if (i == v.Name) then
					return v
				end
			end
		end
		local Magnitude = client:DistanceFromCharacter(v.HumanoidRootPart.Position)
		if (Magnitude < d and Magnitude > 0) then
			d = Magnitude
			t = v
		end
	end
end

return t
end


local function getClosestMob()
    local distance, mob = math.huge;
    for i, v in next, workspace.Mobs:GetChildren() do
        if (v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Nameplate") and v.PrimaryPart and v.Parent and v:FindFirstChild("Entity") and v.Entity.Health.Value > 0) then
            if (getgenv().TargetBosses) then
                for a, b in next, bosses[game.PlaceId] do
                    if (b == v.Name) then
                        return v;
                    end;
                end;
            end;

            local distanceFromChar = client:DistanceFromCharacter(v.HumanoidRootPart.Position);
            if (distanceFromChar < distance) then
                if (_G.chosen_mob and v.Name == _G.chosen_mob) then
                    distance = distanceFromChar;
                    mob = v;
                end;
            end;
        end;
    end;

    return mob;
end;

local mobs = {
    [542351431] = {
        "Bear";
        "Draconite";
        "Frenzy Boar";
        "Hermit Crab";
        "Ruin Knight";
        "Ruin Kobold Knight";
        "Wolf";
    };

    [548231754] = {
        "Bushback Tortoise";
        "Leaf Beetle";
        "Leaf Ogre";
        "Leafray";
        "Pearl Keeper";
        "Wasp";
    };

    [555980327] = {
        "Angry Snowman";
        "Ice Elemental";
        "Icewhal";
        "Ice Walker";
        "Snowgre";
        "Snowhorse";
    };

    [572487908] = {
        "Bamboo Spider";
        "Bamboo Spiderling";
        "Birchman";
        "Boneling";
        "Dungeon Dweller";
        "Lion Protector";
        "Treeray";
        "Wattlechin Crocodile";
    };

    [580239979] = {
        "Angry Cactus";
        "Desert Vulture";
        "Girdled Lizard";
        "Giant Centipede";
        "Sand Scorpion";
    };

    [582198062] = {
        "Blightmouth.";
        "Firefly";
        "Gloom Shroom";
        "Horned Sailfin Iguana";
        "Jelly Wisp";
        "Shroom Back Clam";
        "Snapper";
    };
    
    [548878321] = {
        "Giant Praying Mantis";
        "Petal Knight";
        "Leaf Rhino";
        "Sky Raven";
        "Forest Wanderer";
        "Wingless Hippogriff";
        "Dungeon Crusador";
    };

    [573267292] = {
        "Batting Eye";
        "Ent";
        "Enraged Lingerer";
        "Fishrock Spider";
        "Lingerer";
        "Reptasaurus";
        "Undead Warrior";
        "Undead Berserker";
    };

    [2659143505] = {
        "Grunt";
        "Guard Hound";
        "Minion";
        "Shady Villager";
        "Undead Servant";
        "Winged Minion";
        "Wendigo";
    };

    [5287433115] = {
        "Command Falcon";
        "Reaper";
        "Shadow Figure";
        "Soul Eater";
        "???????";
    };

    [6144637080] = { -- Winter event
        "Evergreen Sentinel";
        "Crystalite";
        "Gemulite";
        "Icy Imp";
    };
};

local bosses = {
    [542351431] = {
        "Dire Wolf";
        "Rahjin the Thief King";
    };

    [548231754] = {
        "Borik the BeeKeeper";
        "Gorrock the Grove Protector";
    };

    [555980327] = {
        "Ra'thae the Ice King";
        "Qerach The Forgotten Golem";
    };

    [572487908] = {
        "Irath the Lion";
        "Rotling";
    };

    [580239979] = {
        "Fire Scorpion";
        "Sa'jun the Centurian Chieftain";
    };
    
    [582198062] = {
        "Frogazoid";
        "Smashroom";
    };

    [548878321] = {
        "Hippogriff";
        "Formaug the Jungle Giant";
    };

    [573267292] = {
        "Gargoyle Reaper";
        "Mortis the Flaming Sear";
        "Polyserpant";
    };

    [2659143505] = {
        "Baal";
        "Grim the Overseer";
    };

    [5287433115] = {
        "Da";
        "Ra";
        "Ka";
    };

    [6144637080] = { -- Winter event
        "Wintula the Punisher";
    };
};


--[[
soon

local function NearestPlayer()
local Root = user and user:FindFirstChild("HumanoidRootPart")
if not (user or Root) then return end

local d = getgenv().Studs
local t = nil

for i, v in pairs(game.Players:GetChildren()) do
	if (v ~= user and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character.Humanoid.Health > 0)
	 then
		local Magnitude = (user.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
		if (Magnitude < d) then
			d = Magnitude
			t = v
		end
	end
end

return t
end
--]]

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

spin = false
followed = false
traill = false
noclip = false
annoying = false
hwalk = false
droppinghats = false
droppingtools = false
flying = false
spamdelay = 1
spamming = false
spammingpm = false
cbringing = false
remotes = true
added = true
binds = false
stopsitting = false
clickgoto = false
gettingtools = false
removingmeshhats = false
removingmeshtool = false
clickdel = false
staring = false
chatlogs = false
banpl = false
changingstate = false
statechosen = 0

adminversion = "Reviz Admin by illremember, Version 2.0"

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


local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/ghastlytim/modules/main/linoriaedit.lua'))();
local SaveManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/ghastlytim/modules/main/savemanager.lua'))();


local Fonts = {};
for Font, _ in next, Drawing.Fonts do
	table.insert(Fonts, Font);
end;
local plr = game.Players.LocalPlayer
local TestWindow = Library:CreateWindow('djhook 100% legit, not somahook');

local RunService = game:GetService("RunService")

local TimeFunction = RunService:IsRunning() and time or os.clock

local LastIteration, Start
local FrameUpdateTable = {}

local function HeartbeatUpdate()
	LastIteration = TimeFunction()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = FrameUpdateTable[Index] >= LastIteration - 1 and FrameUpdateTable[Index] or nil
	end

	FrameUpdateTable[1] = LastIteration
	Library:SetWatermark('djhook 100% legit, not somahook | Swordburst 2 | User: '..plr.DisplayName..' | FPS: '..tostring(math.floor(TimeFunction() - Start >= 1 and #FrameUpdateTable or #FrameUpdateTable / (TimeFunction() - Start)))..' | Ping: '..game.Players.LocalPlayer:GetNetworkPing() * 1000);
end

Start = TimeFunction()
RunService.Heartbeat:Connect(HeartbeatUpdate)
Library:Notify('Loading UI...');

local FarmTab = TestWindow:AddTab('Farming');
local AniTab = TestWindow:AddTab('Animations');
local UpgdisTab = TestWindow:AddTab('Upg/Dis');
local MiscTab = TestWindow:AddTab('Misc');
local TeleTab = TestWindow:AddTab('Telports');
local ModTab = TestWindow:AddTab('Mod[soon]');
local SettingsTab = TestWindow:AddTab('Settings');


local LegitTabbox1 = FarmTab:AddLeftTabbox('AutoFarm');
local lAimbot1 = LegitTabbox1:AddTab('AutoFarm');
lAimbot1:AddToggle('Autofarm', { Text = 'Autofarm' });

lAimbot1:AddDropdown('SelectedMob', { Text = 'Selected Mob', Default = "None", Values = mobs[game.PlaceId] });
lAimbot1:AddToggle('FarmAll', { Text = 'Farm All' });
lAimbot1:AddToggle('Prioboss', { Text = 'Priortize Bosses' }):OnChanged(function()
    
end);

local LegitTabbox2 = FarmTab:AddLeftTabbox('settigns');
local autoSettings = LegitTabbox2:AddTab('Settings');
autoSettings:AddSlider('MaxEntityDis', { Text = 'Max Entity Distance', Default = 5000, Min = 150, Max = 10000, Rounding = 0, Suffix = 'm' });
autoSettings:AddSlider('TweeningSpeed', { Text = 'Tweening Speed', Default = 50, Min = 10, Max = 80, Rounding = 1 });


local lAimbotSettings = FarmTab:AddRightTabbox();

local LegitSettings = lAimbotSettings:AddTab('Mob Aura');
LegitSettings:AddToggle('KillAura', { Text = 'MobAura' }):OnChanged(function()

end);



     
           






local ESP = AniTab:AddLeftTabbox();
local EnemyESP = ESP:AddTab('Animations');
EnemyESP:AddDropdown('Animation', { Text = 'Animation', Default = "Berserker", Values = {"Berserker","Ninja","Noble","Vigilante","DualWield","Katana","Rapier","SingleSword","2HSword"} });
EnemyESP:AddButton('Enable Animation', function()
local plrs = game:GetService("Players")
    local plr = plrs.LocalPlayer.Name
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local profiles = ReplicatedStorage.Profiles

    
    
    local w = profiles:GetDescendants()
       for i = 1, #w do
           if w[i].Name == plr then
               local asd = w[i].AnimSettings:GetDescendants()
               for v = 1, #asd do
                   if asd[v]:IsA("StringValue") then
                       asd[v].Value = Flags.Animation.Value
                       w[i].AnimSettings.Unarmed.Value = ""
                   end
               end
           end
       end
end)
EnemyESP:AddButton('Enable All Animations', function()
 local prof = game.ReplicatedStorage.Profiles[game:GetService("Players").LocalPlayer.Name]
    local animS = prof.AnimSettings
    local animP = prof.AnimPacks
    
    animS["2HSword"].Value = "Berserker"
    animS["Katana"].Value = "Ninja"
    animS["DualWield"].Value = "Vigilante"
    animS["SingleSword"].Value = "Noble"
    
    local vig = animP:FindFirstChild("Vigilante") or Instance.new("StringValue", animP)
    vig.Name = "Vigilante"
    vig.Value = "DualWield"
    local vig = animP:FindFirstChild("Ninja") or Instance.new("StringValue", animP)
    vig.Name = "Ninja"
    vig.Value = "Katana"
    local vig = animP:FindFirstChild("Berserker") or Instance.new("StringValue", animP)
    vig.Name = "Berserker"
    vig.Value = "2HSword"
    local vig = animP:FindFirstChild("Noble") or Instance.new("StringValue", animP)
    vig.Name = "Noble"
    vig.Value = "SingleSword"
end)

local misctab1 = MiscTab:AddLeftTabbox('Misc');
local miscsec = misctab1:AddTab('Misc');
miscsec:AddButton('Invisibility', function()
GoInvisible()
end);
miscsec:AddButton('Block Random', function()
		local pp = {}
for _,v in pairs(game.Players:GetPlayers()) do
   if v ~= game.Players.LocalPlayer.Name then
       table.insert(pp, v.Name)
   end
end

if pp[1] ~= nil then
   local v = math.random(1,#pp)
   local e = pp[v]
  
   game.StarterGui:SetCore("PromptBlockPlayer", game.Players[e])
end
end);
miscsec:AddButton('Previous', function()
	 if plrNum ~= 1 then
plrNum = plrNum - 1
end
for i,v in pairs(game.Players:GetPlayers()) do
if i == plrNum then
game.Workspace.Camera.CameraSubject = v.Character.Humanoid
end
end	
end);
miscsec:AddButton('Next', function()
 if plrNum < #game.Players:GetPlayers() then
plrNum = plrNum + 1
for i,v in pairs(game.Players:GetPlayers()) do
if i == plrNum then
game.Workspace.Camera.CameraSubject = v.Character.Humanoid
end
end
end
end);

local misctab2 = MiscTab:AddRightTabbox('Player');
local plrsec = misctab2:AddTab('Player');
plrsec:AddToggle('Flying', { Text = 'Flying' }):OnChanged(function()
                if Flags.Flying.Value == true then
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
end);

game:GetService('RunService').Stepped:connect(function()
if Noclipping and Flags.Noclip.Value == false then
	Noclipping:Disconnect()
end
end)
Clip = true
function noclip()
	Clip = false
	function NoclipLoop()
		if Clip == false and game.Players.LocalPlayer.Character ~= nil then
			for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if child:IsA("BasePart") and child.CanCollide == true then
					child.CanCollide = false
				end
			end
		end
	end
	Noclipping = game:GetService('RunService').Stepped:connect(NoclipLoop)
end

plrsec:AddToggle('Noclip', { Text = 'Noclip' }):OnChanged(function()
if Flags.Noclip.Value == true then
noclip()
end
end);

local Player = game.Players.LocalPlayer
local Floating = true
local FloatingEnabledKey = false
local FloatFunc
function Float()
	if Floating then
		if Player.Character and not game.Workspace:FindFirstChild("Float") then
			spawn(function()
				local Float = Instance.new("Part", game.Workspace)
				Float.Name = "Float"
				Float.Transparency = 1
				Float.Size = Vector3.new(6, 1, 6)
				Float.Anchored = true
				Float.CFrame = Player.Character.HumanoidRootPart.CFrame - Vector3.new(0, 3.5, 0)
				local function LoopGen()
					if game.Workspace:FindFirstChild("Float") and FloatingEnabledKey and Floating then
						Float.CFrame = Player.Character.HumanoidRootPart.CFrame - Vector3.new(0, 3.5, 0)
					else
						FloatFunc:Disconnect()
					end
				end
				FloatFunc = game:GetService('RunService').RenderStepped:connect(LoopGen)
			end)
		end
	end
end

plrsec:AddToggle('Float', { Text = 'Float' }):OnChanged(function()
if Flags.Float.Value == true then
    if not FloatingEnabledKey then
			FloatingEnabledKey = true

			Float()
    end

else
			FloatingEnabledKey = false
			if game.Workspace:FindFirstChild("Float") then
				FloatingEnabledKey = false
				FloatFunc:Disconnect()
				game.Workspace.Float:Destroy()
			end
end
end);
plrsec:AddSlider('walkspeed', { Text = 'Walk Speed', Default = 20, Min = 20, Max = 80, Rounding = 1 });
plrsec:AddSlider('Zomedistance', { Text = 'Zoom Distance', Default = 15, Min = 15, Max = 100, Rounding = 1 });



Library:Notify('Loaded Upgrade and Dismantle Module!');
wait(1)
local uptab = UpgdisTab:AddLeftTabbox('Up/dismantle');
local Upgrade = uptab:AddTab('Upgrade');
Upgrade:AddInput('ItemName1',    { Text = 'ItemName' });
Upgrade:AddButton('Upgrade', function()
replicatedStorage.Event:FireServer("Equipment", {"Upgrade", replicatedStorage.Profiles[client.Name].Inventory:FindFirstChild(Flags.ItemName1.Value)});
end);

local distab = UpgdisTab:AddLeftTabbox('Up/dismantle');
local Dismantle = distab:AddTab('Dismantle');
Dismantle:AddInput('ItemName2',    { Text = 'ItemName' });
Dismantle:AddButton('Dismantle', function()
replicatedStorage.Event:FireServer("Equipment", {"Dismantle", replicatedStorage.Profiles[client.Name].Inventory:FindFirstChild(Flags.ItemName2.Value)});
end);

local disOthers = UpgdisTab:AddRightTabbox('Others');
local Otherdis = disOthers:AddTab('Others');
Otherdis:AddButton('Dismantle All Common', function()
for i, v in pairs(game.ReplicatedStorage.Profiles[game:GetService("Players").LocalPlayer.Name].Inventory:children'') do
			if game.ReplicatedStorage.Database.Items[v.Name].Rarity.Value == "Common" then
				game.ReplicatedStorage.Event:FireServer("Equipment", {
					"Dismantle",
					v
				})
			end
		end
end);
Otherdis:AddButton('Dismantle All Uncommon', function()
for i, v in pairs(game.ReplicatedStorage.Profiles[game:GetService("Players").LocalPlayer.Name].Inventory:children'') do
			if game.ReplicatedStorage.Database.Items[v.Name].Rarity.Value == "Uncommon" then
				game.ReplicatedStorage.Event:FireServer("Equipment", {
					"Dismantle",
					v
				})
			end
		end
end);
Otherdis:AddButton('Dismantle All Rare', function()
for i, v in pairs(game.ReplicatedStorage.Profiles[game:GetService("Players").LocalPlayer.Name].Inventory:children'') do
			if game.ReplicatedStorage.Database.Items[v.Name].Rarity.Value == "Rare" then
				game.ReplicatedStorage.Event:FireServer("Equipment", {
					"Dismantle",
					v
				})
			end
		end
end);
Otherdis:AddButton('Max Equipped Weapon', function()
local ownedId = game.ReplicatedStorage.Profiles[game:GetService("Players").LocalPlayer.Name].Equip.Right.Value
	local equipped
	
	for i, v in pairs(game.ReplicatedStorage.Profiles[game:GetService("Players").LocalPlayer.Name].Inventory:children'') do
		if tonumber(v.Value) == tonumber(ownedId) then
			equipped = v
			break
		end
	end
	repeat
		wait(0.05)
		game.ReplicatedStorage.Event:FireServer("Equipment", {
			"Upgrade",
			equipped,
			false
		})
	until 
			equipped:FindFirstChild("Upgrade").Value == 10
end);
Otherdis:AddButton('Max Equipped Armor', function()
local ownedId = game.ReplicatedStorage.Profiles[game:GetService("Players").LocalPlayer.Name].Equip.Clothing.Value
		local equipped
		
		for i, v in pairs(game.ReplicatedStorage.Profiles[game:GetService("Players").LocalPlayer.Name].Inventory:children'') do
			if tonumber(v.Value) == tonumber(ownedId) then
				equipped = v
				break
			end
		end
		repeat
			wait(0.1)
			game.ReplicatedStorage.Event:FireServer("Equipment", {
				"Upgrade",
				equipped,
				false
			})
		until 
				equipped:FindFirstChild("Upgrade").Value == 10
end);

Library:Notify('Loaded TeleportModule!');
wait(1)
local TeletabBOX = TeleTab:AddLeftTabbox('Teleports');
local teletabsec = TeletabBOX:AddTab('Floor Teleports');

 local locations = require(replicatedStorage.Database.Locations);
    

    for i, v in next, locations.floors do
teletabsec:AddButton(v.Name, function()
                if (not client.Character) then return end;
                client.Character:BreakJoints();
                client.CharacterAdded:Wait();
                for i, v in next, workspace:GetDescendants() do
                    if (v.Name ~= "TeleportPad" or not client.Character) then return end;
                    repeat wait() until client.Character:FindFirstChild("HumanoidRootPart");
                    client.Character.HumanoidRootPart.CFrame = v.CFrame;
                    break;
                end;
                replicatedStorage.Function:InvokeServer("Teleport", {"Teleport", v.PlaceId});
            end);
    end;

local fTeletab = TeleTab:AddRightTabbox('Floor teleports');
local fteletabsec = fTeletab:AddTab('In Floor Teleports');

local SBInfo = loadstring(game:HttpGet("https://raw.githubusercontent.com/Malakai0/scripts/master/scripts/SwordburstInfo.lua"))();

local InsideDoorP = SBInfo.Doors.Inside[game.PlaceId];
local OutsideDoorP = SBInfo.Doors.Outside[game.PlaceId];
local InsideDoor,OutsideDoor;
local Player = game:GetService'Players'.LocalPlayer
if (workspace.StreamingEnabled) then
    Player:RequestStreamAroundAsync(InsideDoorP.Position);
    Player:RequestStreamAroundAsync(OutsideDoorP.Position);
end

for _,v in next, workspace:GetDescendants() do
    if v:IsA("BasePart") then
        if (v.CFrame == InsideDoorP) then
            InsideDoor = v;
        elseif (v.CFrame == OutsideDoorP) then
            OutsideDoor = v;
        end
    end
end


fteletabsec:AddButton('Teleprot to boss', function()
 firetouchinterest(Player.Character.PrimaryPart, InsideDoor, 0)
    wait()
    firetouchinterest(Player.Character.PrimaryPart, InsideDoor, 1);
end);

fteletabsec:AddButton('Teleport to end', function()
firetouchinterest(Player.Character.PrimaryPart, OutsideDoor, 0)
    wait()
firetouchinterest(Player.Character.PrimaryPart, OutsideDoor, 1);
end);





local function UpdateTheme()
    Library.BackgroundColor = Flags.BackgroundColor.Value;
    Library.MainColor = Flags.MainColor.Value;
    Library.AccentColor = Flags.AccentColor.Value;
    Library.AccentColorDark = Library:GetDarkerColor(Library.AccentColor);
    Library.OutlineColor = Flags.OutlineColor.Value;
    Library.FontColor = Flags.FontColor.Value;

    Library:UpdateColorsUsingRegistry();
end;

local cheatthemes = {"Default","TokyoNight","NekoRed","NekoBlue","Fatality","GameSense","Twitch"}

local function SetThemes()
if Flags.Selectedtheme.Value == "Default" then
    Flags.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
    Flags.MainColor:SetValueRGB(Color3.fromRGB(0,0,0));
    Flags.BackgroundColor:SetValueRGB(Color3.fromRGB(0,0,0));
    Flags.AccentColor:SetValueRGB(Color3.fromRGB(0,0,255));
    Flags.OutlineColor:SetValueRGB(Color3.fromRGB(50, 50, 50));
    Flags.Rainbow:SetValue(false);
    UpdateTheme();
elseif Flags.Selectedtheme.Value == "TokyoNight" then
    Flags.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
    Flags.MainColor:SetValueRGB(Color3.fromRGB(24,25,37));
    Flags.BackgroundColor:SetValueRGB(Color3.fromRGB(22,22,31));
    Flags.AccentColor:SetValueRGB(Color3.fromRGB(103,89,179));
    Flags.OutlineColor:SetValueRGB(Color3.fromRGB(50, 50, 50));
    Flags.Rainbow:SetValue(false);
    UpdateTheme();
elseif Flags.Selectedtheme.Value == "NekoRed" then
    Flags.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
    Flags.MainColor:SetValueRGB(Color3.fromRGB(23,23,23));
    Flags.BackgroundColor:SetValueRGB(Color3.fromRGB(18,18,18));
    Flags.AccentColor:SetValueRGB(Color3.fromRGB(226, 30, 112));
    Flags.OutlineColor:SetValueRGB(Color3.fromRGB(60, 60, 60));
    Flags.Rainbow:SetValue(false);
    UpdateTheme();
elseif Flags.Selectedtheme.Value == "NekoBlue" then
    Flags.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
    Flags.MainColor:SetValueRGB(Color3.fromRGB(23,23,23));
    Flags.BackgroundColor:SetValueRGB(Color3.fromRGB(18,18,18));
    Flags.AccentColor:SetValueRGB(Color3.fromRGB(0, 247, 255));
    Flags.OutlineColor:SetValueRGB(Color3.fromRGB(60, 60, 60));
    Flags.Rainbow:SetValue(false);
    UpdateTheme();
elseif Flags.Selectedtheme.Value == "Fatality" then
    Flags.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
    Flags.MainColor:SetValueRGB(Color3.fromRGB(29,23,66));
    Flags.BackgroundColor:SetValueRGB(Color3.fromRGB(25,19,53));
    Flags.AccentColor:SetValueRGB(Color3.fromRGB(197,7,83));
    Flags.OutlineColor:SetValueRGB(Color3.fromRGB(29,23,66));
    Flags.Rainbow:SetValue(false);
    UpdateTheme();
elseif Flags.Selectedtheme.Value == "GameSense" then
    Flags.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
    Flags.MainColor:SetValueRGB(Color3.fromRGB(35,35,35));
    Flags.BackgroundColor:SetValueRGB(Color3.fromRGB(17,17,17));
    Flags.AccentColor:SetValueRGB(Color3.fromRGB(147,184,26));
    Flags.OutlineColor:SetValueRGB(Color3.fromRGB(47,47,47));
    Flags.Rainbow:SetValue(false);
    UpdateTheme();
elseif Flags.Selectedtheme.Value == "Twitch" then
    Flags.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
    Flags.MainColor:SetValueRGB(Color3.fromRGB(24,24,27));
    Flags.BackgroundColor:SetValueRGB(Color3.fromRGB(14,14,14));
    Flags.AccentColor:SetValueRGB(Color3.fromRGB(169,112,255));
    Flags.OutlineColor:SetValueRGB(Color3.fromRGB(45,45,45));
    Flags.Rainbow:SetValue(false);
    UpdateTheme();
end
end;

local Theme = SettingsTab:AddLeftGroupbox('Theme');
Theme:AddLabel('Background Color'):AddColorPicker('BackgroundColor', { Default =  Color3.fromRGB(0,0,0) });
Theme:AddLabel('Main Color'):AddColorPicker('MainColor', { Default =  Color3.fromRGB(0,0,0) });
Theme:AddLabel('Accent Color'):AddColorPicker('AccentColor', { Default =  Color3.fromRGB(0,0,255) });
Theme:AddToggle('Rainbow', { Text = 'Rainbow Accent Color' });
Theme:AddLabel('Outline Color'):AddColorPicker('OutlineColor', { Default =  Color3.fromRGB(50, 50, 50) });
Theme:AddLabel('Font Color'):AddColorPicker('FontColor', { Default = Library.FontColor });
Theme:AddDropdown('Selectedtheme', { Text = 'Theme', Default = 1, Values = cheatthemes }):OnChanged(function()
   SetThemes(); 
end);
Theme:AddToggle('Keybinds', { Text = 'Show Keybinds Menu', Default = true }):OnChanged(function()
    Library.KeybindFrame.Visible = Flags.Keybinds.Value;
end);
Theme:AddToggle('Watermark', { Text = 'Show Watermark', Default = true }):OnChanged(function()
    Library:SetWatermarkVisibility(Flags.Watermark.Value);
end);

local Credit = SettingsTab:AddLeftGroupbox('Credits');

Credit:AddLabel('Made by PurplMochii#5589');
Credit:AddLabel('Tahnks to SALFIIN#2470 for multiple mob attacking');

Credit:AddButton('Copy Discord Invite', function()
setclipboard('https://discord.gg/a7xNQhffEz')
end)


SaveManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager. 
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings() 

-- Adds our MenuKeybind to the ignore list 
-- (do you want each config to have a different menu key? probably not.)
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 

-- use case for doing it this way: 
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
SaveManager:SetFolder('djhook 100% legit, not somahook/SwordBurst2')

-- Builds our config menu on the right side of our tab

		local section = SettingsTab:AddRightGroupbox('Configuration')

		section:AddDropdown('SaveManager_ConfigList', { Text = 'Config list', Values = SaveManager:RefreshConfigList(), AllowNull = true })
		section:AddInput('SaveManager_ConfigName',    { Text = 'Config name' })

	

		section:AddButton('Create config', function()
			local name = Flags.SaveManager_ConfigName.Value

			if name:gsub(' ', '') == '' then 
				return Library:Notify('Invalid config name (empty)', 2)
			end

			local success, err = SaveManager:Save(name)
			if not success then
				return Library:Notify('Failed to save config: ' .. err)
			end

			Library:Notify(string.format('Created config %q', name))

			Flags.SaveManager_ConfigList.Values = SaveManager:RefreshConfigList()
			Flags.SaveManager_ConfigList:SetValues()
			Flags.SaveManager_ConfigList:SetValue(nil)
		end)
		section:AddButton('Load config', function()
			local name = Flags.SaveManager_ConfigList.Value

			local success, err = SaveManager:Load(name)
			if not success then
				return Library:Notify('Failed to load config: ' .. err)
			end

			Library:Notify(string.format('Loaded config %q', name))
		end)

		section:AddButton('Overwrite config', function()
			local name = Flags.SaveManager_ConfigList.Value

			local success, err = SaveManager:Save(name)
			if not success then
				return Library:Notify('Failed to overwrite config: ' .. err)
			end

			Library:Notify(string.format('Overwrote config %q', name))
		end)
		
		section:AddButton('Autoload config', function()
			local name = Flags.SaveManager_ConfigList.Value
			writefile('djhook 100% legit, not somahook/settings/autoload.txt', name)
			SaveManager.AutoloadLabel:SetText('Current autoload config: ' .. name)
			Library:Notify(string.format('Set %q to auto load', name))
		end)

		section:AddButton('Refresh config list', function()
			Flags.SaveManager_ConfigList.Values = SaveManager:RefreshConfigList()
			Flags.SaveManager_ConfigList:SetValues()
			Flags.SaveManager_ConfigList:SetValue(nil)
		end)

		SaveManager.AutoloadLabel = section:AddLabel('Current autoload config: none', true)

		if isfile('djhook 100% legit, not somahook/settings/autoload.txt') then
			local name = readfile( 'djhook 100% legit, not somahook/settings/autoload.txt')
			SaveManager.AutoloadLabel:SetText('Current autoload config: ' .. name)
		end

		SaveManager:SetIgnoreIndexes({ 'SaveManager_ConfigList', 'SaveManager_ConfigName' })

task.spawn(function()
    while game:GetService('RunService').RenderStepped:Wait() do
        if Flags.Rainbow.Value then
            local Registry = TestWindow.Holder.Visible and Library.Registry or Library.HudRegistry;

            for Idx, Object in next, Registry do
                for Property, ColorIdx in next, Object.Properties do
                    if ColorIdx == 'AccentColor' or ColorIdx == 'AccentColorDark' then
                        local Instance = Object.Instance;
                        local yPos = Instance.AbsolutePosition.Y;

                        local Mapped = Library:MapValue(yPos, 0, 1080, 0, 0.5) * 1.5;
                        local Color = Color3.fromHSV((Library.CurrentRainbowHue - Mapped) % 1, 0.8, 1);

                        if ColorIdx == 'AccentColorDark' then
                            Color = Library:GetDarkerColor(Color);
                        end;

                        Instance[Property] = Color;
                    end;
                end;
            end;
        end;
    end;
end);

Flags.Rainbow:OnChanged(function()
    if not Flags.Rainbow.Value then
        UpdateTheme();
    end;
end);

Flags.BackgroundColor:OnChanged(UpdateTheme);
Flags.MainColor:OnChanged(UpdateTheme);
Flags.AccentColor:OnChanged(UpdateTheme);
Flags.OutlineColor:OnChanged(UpdateTheme);
Flags.FontColor:OnChanged(UpdateTheme);
wait(1)
Library:Notify('djhook 100% legit, not somahook Is Loaded!');
wait(1)


Library:Notify('Loaded KillAura Module!');

heartbeat:Connect(function()
    if (client.Character and _G.aautofarming) then
        for i, v in next, client.Character:GetChildren() do
            if (v:IsA("BasePart")) then
                v.CanCollide = false;
            end;
        end;
    end;
end);

spawn(function()
    while true do
        if (_G.aautofarming) then
            local mob = getClosestMob();

            if (mob) then
                pcall(function()
                  
                    tweenService:Create(client.Character.HumanoidRootPart, TweenInfo.new(((client.Character.HumanoidRootPart.Position - mob.HumanoidRootPart.Position)).Magnitude / getgenv().TweenSpeed), {CFrame = mob.PrimaryPart.CFrame * CFrame.new(0, 15, 0)}):Play();
                end);
            end;
        end;
        wait();
    end;
end);

spawn(function()
		local client = game:GetService("Players").LocalPlayer
		while wait() do
			if client.Character and _G.infStamina then
				client.Character:WaitForChild("Entity").Stamina.Value = 100
			end
		end
	end)
	




game:GetService('RunService').Stepped:connect(function()
getgenv().killaura = Flags.KillAura.Value
getgenv().autofarm = Flags.FarmAll.Value
_G.aautofarming = Flags.Autofarm.Value
_G.chosen_mob = Flags.SelectedMob.Value
getgenv().TargetBosses = Flags.Prioboss.Value
getgenv().Studs = Flags.MaxEntityDis.Value
getgenv().TweenSpeed = Flags.TweeningSpeed.Value
game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = Flags.Zomedistance.Value
UserWalkSpeed(user, Flags.walkspeed.Value)
if getgenv().autofarm then        
                local Enemy = Nearest()

                if (Enemy ~= nil) then
                    tweenService, tweenInfo = s["TweenService"], TweenInfo.new((user.Character.HumanoidRootPart.Position - Enemy.HumanoidRootPart.Position).Magnitude / getgenv().TweenSpeed, Enum.EasingStyle.Linear)
                    T = tweenService:Create(user.Character.HumanoidRootPart, tweenInfo, {CFrame = Enemy.PrimaryPart.CFrame * CFrame.new(0, 17, 0)})
                    T:Play()
                end
                wait()
end
wait()
end)

while true do
local Player = game.Players.LocalPlayer
local Root = Player.Character:WaitForChild('LowerTorso', 2)
    local Hits = 2;

    
  if getgenv().killaura then


for i,mob in next,game.Workspace.Mobs:GetChildren() do
pcall(function()
  if mob and mob.Parent and mob.Entity and mob.Entity:FindFirstChild("Health") and mob.Entity.Health.Value > 0 and (mob:FindFirstChild("HumanoidRootPart") and plr:DistanceFromCharacter(mob.HumanoidRootPart.Position) <= 60) then
   Damage(mob)
          wait(.2)
   Damage(mob)

          wait(.2)
  end
end)
end
            

 end
wait(.2) 

end




