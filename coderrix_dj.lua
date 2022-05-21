-- coderixx "cracked" by the djs $$$$
-- pasted code
-- https://discord.gg/8ps4575qtH

if game.PlaceId == 1224212277 then
	print("Loaded")
	wait()
	print("For help join discord.gg/8ps4575qtH")
	local _speed = 2000
	function tp(...)
		local plr = game.Players.LocalPlayer
		local args = {
			...
		}
		if typeof(args[1]) == "number" and args[2] and args[3] then
			args = Vector3.new(args[1], args[2], args[3])
		elseif typeof(args[1]) == "Vector3" then
			args = args[1]
		elseif typeof(args[1]) == "CFrame" then
			args = args[1].Position
		end
		local dist = (plr.Character.HumanoidRootPart.Position - args).Magnitude
		game:GetService("TweenService"):Create(
       plr.Character.HumanoidRootPart,
       TweenInfo.new(dist / _speed, Enum.EasingStyle.Linear),
       {
			CFrame = CFrame.new(args)
		}
   ):Play()
	end
	local Library = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()
	local Window = Library:Window("MudWare Reborn v4.4.2.3.1 - Mad City", Color3.fromRGB(95, 65, 10), Enum.KeyCode.RightShift)

-- MAIN
	local main = Window:Tab("Main")
	main:Toggle("Speedhack", false, function(v)
		getgenv().speedhack = v
		while wait() do
			if getgenv().speedhack then
				game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 60
			else
				game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 16
			end
		end
	end)
	main:Toggle("Superjump", false, function(v)
		getgenv().superjump = v
		while wait() do
			if getgenv().superjump then
				game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = 150
			else
				game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 50
			end
		end
	end)
	main:Toggle("Walk On Water", false, function(state)
		getgenv().trin4nets = state
		if getgenv().trin4nets then
			for k, v in pairs(game:GetService("Workspace").Water:GetChildren()) do
				v.CanCollide = true
				v.Anchored = true
				v.Material = "Ice"
			end
		else
			for k, v in pairs(game:GetService("Workspace").Water:GetChildren()) do
				v.CanCollide = false
				v.Anchored = false
				v.Material = "Ice"
			end
		end
	end)
	main:Button("[F] Fly", function()
		local FlyKey = Enum.KeyCode.F
		local SpeedKey = Enum.KeyCode.LeftControl
		local SpeedKeyMultiplier = 3
		local FlightSpeed = 256
		local FlightAcceleration = 4
		local TurnSpeed = 16
		local UserInputService = game:GetService("UserInputService")
		local StarterGui = game:GetService("StarterGui")
		local RunService = game:GetService("RunService")
		local Players = game:GetService("Players")
		local User = Players.LocalPlayer
		local Camera = workspace.CurrentCamera
		local UserCharacter = nil
		local UserRootPart = nil
		local Connection = nil
		workspace.Changed:Connect(function()
			Camera = workspace.CurrentCamera
		end)
		local setCharacter = function(c)
			UserCharacter = c
			UserRootPart = c:WaitForChild("HumanoidRootPart")
		end
		User.CharacterAdded:Connect(setCharacter)
		if User.Character then
			setCharacter(User.Character)
		end
		local CurrentVelocity = Vector3.new(0, 0, 0)
		local Flight = function(delta)
			local BaseVelocity = Vector3.new(0, 0, 0)
			if not UserInputService:GetFocusedTextBox() then
				if UserInputService:IsKeyDown(Enum.KeyCode.W) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.LookVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.A) then
					BaseVelocity = BaseVelocity - (Camera.CFrame.RightVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.S) then
					BaseVelocity = BaseVelocity - (Camera.CFrame.LookVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.D) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.RightVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.UpVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(SpeedKey) then
					BaseVelocity = BaseVelocity * SpeedKeyMultiplier
				end
			end
			if UserRootPart then
				local car = UserRootPart:GetRootPart()
				if car.Anchored then
					return
				end
				if not isnetworkowner(car) then
					return
				end
				CurrentVelocity = CurrentVelocity:Lerp(
            BaseVelocity,
            math.clamp(delta * FlightAcceleration, 0, 1)
        )
				car.Velocity = CurrentVelocity + Vector3.new(0, 2, 0)
				if car ~= UserRootPart then
					car.RotVelocity = Vector3.new(0, 0, 0)
					car.CFrame = car.CFrame:Lerp(CFrame.lookAt(
                car.Position,
                car.Position + CurrentVelocity + Camera.CFrame.LookVector
            ), math.clamp(delta * TurnSpeed, 0, 1))
				end
			end
		end
		UserInputService.InputBegan:Connect(function(userInput, gameProcessed)
			if gameProcessed then
				return
			end
			if userInput.KeyCode == FlyKey then
				if Connection then
					Connection:Disconnect()
					Connection = nil
				else
					CurrentVelocity = UserRootPart.Velocity
					Connection = RunService.Heartbeat:Connect(Flight)
				end
			end
		end)
	end)
	main:Button("Destroy Lasers", function()
		game:GetService("Workspace").Heists.Bank.EssentialParts.Lasers:Destroy()
		game:GetService("Workspace").Heists.Casino.Interior.Lasers:Destroy()
		game:GetService("Workspace").Heists.JewelryStore.JewelryStore.Jewlery.Lasers:Destroy()
		game:GetService("Workspace").Ignore.WorldObjects["Lasers Club"]:Destroy()
		game:GetService("Workspace").ComputerStore.Lasers:Destroy()
	end)
	main:Button("Hide Name", function()
		game:GetService("RunService").RenderStepped:Connect(function()
			game.Players.LocalPlayer.Character.NameTag:Destroy()
		end)
	end)
	main:Button("Destroy Character", function()
		game.Players.LocalPlayer.Character.RightHand:Destroy()
		game.Players.LocalPlayer.Character.LeftLowerArm:Destroy()
		game.Players.LocalPlayer.Character.RightLowerArm:Destroy()
		game.Players.LocalPlayer.Character.LeftUpperArm:Destroy()
		game.Players.LocalPlayer.Character.RightUpperArm:Destroy()
		game.Players.LocalPlayer.Character.LeftLowerLeg:Destroy()
		game.Players.LocalPlayer.Character.LeftUpperLeg:Destroy()
		game.Players.LocalPlayer.Character.LeftFoot:Destroy()
		game.Players.LocalPlayer.Character.RightFoot:Destroy()
		game.Players.LocalPlayer.Character.RightLowerLeg:Destroy()
		game.Players.LocalPlayer.Character.RightUpperLeg:Destroy()
	end)

-- FUN
	local fun = Window:Tab("Fun")
	fun:Button("be black", function()
		for i = 1, 3 do
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-326, 142, -2869)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-326, 142, -2869)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1203.02539, 51058.3906, 552.828857, 0, -1, 0, 1, 0, -0, 0, 0, 1)
			wait(1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1203.02539, 51058.3906, 533.490723, 0, -1, 0, 1, 0, -0, 0, 0, 1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1203.02539, 51058.3906, 552.828857, 0, -1, 0, 1, 0, -0, 0, 0, 1)
		end
	end)
	fun:Toggle("GodMod", false, function(v)
		local this_guy_has_godmode = game.Players.LocalPlayer.Name
		getgenv().godmod = v
		while true do
			wait()
			if not getgenv().godmod then
				return
			end
			pcall(function()
				local A_1 = "RevivePlayer"
				local A_2 = game:GetService("Workspace")[this_guy_has_godmode]
				local A_3 = game:GetService("Workspace").ObjectSelection.DownedPart.DownedPart
				local Event = game:GetService("ReplicatedStorage").Event
				Event:FireServer(A_1, A_2, A_3)
			end)
		end
	end)
	fun:Toggle("Anti Arrest", false, function(v)
		getgenv().antiarrest = v
		while true do
			wait()
			if not getgenv().antiarrest then
				return
			end
			local args = {
				[1] = "Freedom",
				[2] = game:GetService("Players").LocalPlayer
			}
			game:GetService("ReplicatedStorage").Event:FireServer(unpack(args))
		end
	end)
	fun:Toggle("All Players Godmod", false, function(v)
		local Players = game:GetService("Players")
		getgenv().godmodserver = v
		while true do
			wait()
			if not getgenv().godmodserver then
				return
			end
			pcall(function()
				for i, all in pairs(Players:GetPlayers()) do
					local A_1 = "RevivePlayer"
					local A_2 = game:GetService("Workspace")[all.Name]
					local A_3 = game:GetService("Workspace").ObjectSelection.DownedPart.DownedPart
					local Event = game:GetService("ReplicatedStorage").Event
					Event:FireServer(A_1, A_2, A_3)
				end
			end)
		end
	end)
	fun:Toggle("All Players the Glider", false, function(state)
		if state then
			for i, v in pairs(game.Players:GetChildren()) do
				local args = {
					[1] = "Glider",
					[2] = v.Character.Parachute.Handle,
					[3] = -math.huge
				}
				game:GetService("ReplicatedStorage").Event:FireServer(unpack(args))
			end
		else
			for i, v in pairs(game.Players:GetChildren()) do
				local args = {
					[1] = "Glider",
					[2] = v.Character.Parachute.Handle,
					[3] = math.huge
				}
				game:GetService("ReplicatedStorage").Event:FireServer(unpack(args))
			end
		end
	end)

-- KILL
	local kill = Window:Tab("Kill")
	kill:Textbox("Loop Kill Player", true, function(txt)
		getgenv().killplr = true
		while true do
			wait()
			if not getgenv().killplr then
				return
			end
			local plr = game:GetService("Workspace"):FindFirstChild(txt)
			local _speed = 2000
			function tp(...)
				local plr = game.Players.LocalPlayer
				local args = {
					...
				}
				if typeof(args[1]) == "number" and args[2] and args[3] then
					args = Vector3.new(args[1], args[2], args[3])
				elseif typeof(args[1]) == "Vector3" then
					args = args[1]
				elseif typeof(args[1]) == "CFrame" then
					args = args[1].Position
				end
				local dist = (plr.Character.HumanoidRootPart.Position - args).Magnitude
				game:GetService("TweenService"):Create(
                       plr.Character.HumanoidRootPart,
                       TweenInfo.new(dist / _speed, Enum.EasingStyle.Linear),
                       {
					CFrame = CFrame.new(args)
				}
                   ):Play()
			end
			tp(plr.HumanoidRootPart.Position)
			local args = {
				[1] = "Punch",
				[2] = game:GetService("Players"):FindFirstChild(txt).Character.Humanoid
			}
			game:GetService("ReplicatedStorage").Event:FireServer(unpack(args))
		end
	end)
	kill:Button("Stop Loop", function()
		getgenv().killplr = false
	end)
	kill:Toggle("Criminals", false, function(state)
		local args = {
			[1] = "SetTeam",
			[2] = "Police"
		}
		game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
		wait(1)
		function messagebox(text, delay)
			local tbl_2B1BD128 = 
        {
				["Delay"] = delay,
				["Text"] = text
			}
			local tbl_2B1BCDF8 = 
        {
				tbl_2B1BD128
			}
			local tbl_main = 
        {
				"Dialogue",
				tbl_2B1BCDF8
			}
			game:GetService("ReplicatedStorage").Event:FireServer(unpack(tbl_main))
		end
		messagebox("Go into a buzzard or a Cobra.", 5)
		wait(1)
		getgenv().killcrims = state
		_G.TargetTeam = "Criminals"
		while  true  do
			wait()
			if not getgenv().killcrims then
				return
			end
			for i, v in next, game.Teams[_G.TargetTeam]:GetPlayers() do
				game.ReplicatedStorage.Event:FireServer("BM", v.Character.Head.Position)
				game.ReplicatedStorage.Event:FireServer("BM", v.Character.Head.Position)
			end
		end
	end)
	kill:Toggle("Police", false, function(state)
		local args = {
			[1] = "SetTeam",
			[2] = "Prisoners"
		}
		game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
		wait(1)
		function messagebox(text, delay)
			local tbl_2B1BD128 = 
        {
				["Delay"] = delay,
				["Text"] = text
			}
			local tbl_2B1BCDF8 = 
        {
				tbl_2B1BD128
			}
			local tbl_main = 
        {
				"Dialogue",
				tbl_2B1BCDF8
			}
			game:GetService("ReplicatedStorage").Event:FireServer(unpack(tbl_main))
		end
		messagebox("Go into a buzzard or a Cobra.", 5)
		wait(1)
		getgenv().killpolice = state
		_G.TargetTeam = "Police"
		while  true  do
			wait()
			if not getgenv().killpolice then
				return
			end
			for i, v in next, game.Teams[_G.TargetTeam]:GetPlayers() do
				game.ReplicatedStorage.Event:FireServer("BM", v.Character.Head.Position)
				game.ReplicatedStorage.Event:FireServer("BM", v.Character.Head.Position)
			end
		end
	end)
	kill:Toggle("Heroes", false, function(state)
		local args = {
			[1] = "SetTeam",
			[2] = "Prisoners"
		}
		game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
		wait(1)
		function messagebox(text, delay)
			local tbl_2B1BD128 = 
        {
				["Delay"] = delay,
				["Text"] = text
			}
			local tbl_2B1BCDF8 = 
        {
				tbl_2B1BD128
			}
			local tbl_main = 
        {
				"Dialogue",
				tbl_2B1BCDF8
			}
			game:GetService("ReplicatedStorage").Event:FireServer(unpack(tbl_main))
		end
		messagebox("Go into a buzzard or a Cobra.", 5)
		wait(1)
		getgenv().killheroes = state
		_G.TargetTeam = "Heroes"
		while  true  do
			wait()
			if not getgenv().killheroes then
				return
			end
			for i, v in next, game.Teams[_G.TargetTeam]:GetPlayers() do
				game.ReplicatedStorage.Event:FireServer("BM", v.Character.Head.Position)
				game.ReplicatedStorage.Event:FireServer("BM", v.Character.Head.Position)
			end
		end
	end)
	kill:Toggle("Villains", false, function(state)
		local args = {
			[1] = "SetTeam",
			[2] = "Police"
		}
		game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
		wait(1)
		function messagebox(text, delay)
			local tbl_2B1BD128 = 
        {
				["Delay"] = delay,
				["Text"] = text
			}
			local tbl_2B1BCDF8 = 
        {
				tbl_2B1BD128
			}
			local tbl_main = 
        {
				"Dialogue",
				tbl_2B1BCDF8
			}
			game:GetService("ReplicatedStorage").Event:FireServer(unpack(tbl_main))
		end
		messagebox("Go into a buzzard or a Cobra.", 5)
		wait(1)
		getgenv().killcrims = state
		_G.TargetTeam = "Villains"
		while  true  do
			wait()
			if not getgenv().killcrims then
				return
			end
			for i, v in next, game.Teams[_G.TargetTeam]:GetPlayers() do
				game.ReplicatedStorage.Event:FireServer("BM", v.Character.Head.Position)
				game.ReplicatedStorage.Event:FireServer("BM", v.Character.Head.Position)
			end
		end
	end)

-- TELEPORTS
	local teleports = Window:Tab("Teleports")
	teleports:Button("Tp To Mech", function()
		tp(game.Workspace.ObjectSelection["Mech Suit"].Chest.UpperChest.CFrame)
	end)
	teleports:Button("Tp To aircrate", function()
		tp(game.Workspace.ObjectSelection.CrateDrop.CrateDrop.Position)
	end)
	teleports:Button("Jail In", function()
		tp(CFrame.new(-893.619, 70, -3105.87))
	end)
	teleports:Button("Jail Out", function()
		tp(CFrame.new(-1030.99, 67.3196, -2935.08))
	end)
	teleports:Button("Gun Shop", function()
		tp(CFrame.new(-1643.92, 42.7647, 672.296))
	end)
	teleports:Button("Criminal Base In", function()
		tp(CFrame.new(2110.8, 26.4793, 427.597))
	end)
	teleports:Button("Criminal Base Out", function()
		tp(CFrame.new(2036.75, 30, 425.776))
	end)
	teleports:Button("Airport", function()
		tp(CFrame.new(-2145.58, 30, -1426.98))
	end)
	teleports:Button("Jewerly In", function()
		tp(CFrame.new(-98.3142, 26.3242, 795.379))
	end)
	teleports:Button("Jewerly Out", function()
		tp(CFrame.new(-130.017, 30, 721.418))
	end)
	teleports:Button("Bank In", function()
		tp(CFrame.new(644.203, 109.854, 616.807))
	end)
	teleports:Button("Bank Out", function()
		tp(CFrame.new(638.708, 50, 472.197))
	end)
	teleports:Button("Club In", function()
		tp(CFrame.new(1073.41, 55, 85.7288))
	end)
	teleports:Button("Club Out", function()
		tp(CFrame.new(1092.56, 53.3552, 180.755))
	end)
	teleports:Button("Pyramid Out", function()
		tp(CFrame.new(-1047.78, 20, -507.3))
	end)
	teleports:Button("Casino In", function()
		tp(CFrame.new(1696.66, 37.7537, 757.511))
	end)
	teleports:Button("Casino Out", function()
		tp(CFrame.new(1701.74, 25.654, 899.546))
	end)
	teleports:Button("Train", function()
		if game.Workspace.Train ~= nil then
			tp(game.Workspace.Train.Mid1.Yeet.Position)
		else
			tp(CFrame.new(135.332, 76.5584, -628.046))
		end
	end)
	teleports:Button("Train Out", function()
		tp(CFrame.new(155.048, 76.524, -664.481))
	end)
	teleports:Textbox("Tp To Player", true, function(txt)
		local stringA = txt
		for i, plr in next, game:GetService'Players':GetPlayers() do
			if plr.Name:sub(1, #stringA) == stringA then
				tp(CFrame.new(plr.Character.HumanoidRootPart.Position))
			end
		end
	end)

-- FAST CHANGER
	local fastchanger = Window:Tab("Fast Changer")
	fastchanger:Button("Prisoners", function()
		local args = {
			[1] = "SetTeam",
			[2] = "Prisoners"
		}
		game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
	end)
	fastchanger:Button("Criminals", function()
		wait(0.1)
		local args = {
			[1] = "SetTeam",
			[2] = "Prisoners"
		}
		game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
		wait(3)
		tp(CFrame.new(-280.035, 4.22509, -2811.1))
		wait(2)
		tp(CFrame.new(-716.32, 69.5678, -3058.8))
	end)
	fastchanger:Button("Police", function()
		local args = {
			[1] = "SetTeam",
			[2] = "Police"
		}
		game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
	end)
	fastchanger:Button("Heroes", function()
		local args = {
			[1] = "SetTeam",
			[2] = "Heroes"
		}
		game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
	end)

-- Give
	local give = Window:Tab("Give")
	give:Button("All Gamepasses", function()
		wait()
		local g1 = Instance.new("BoolValue", game.Players.LocalPlayer)
		g1.Name = "5275404"
		g1.Value = true
		local g2 = Instance.new("BoolValue", game.Players.LocalPlayer)
		g2.Name = "5275406"
		g2.Value = true
		local g3 = Instance.new("BoolValue", game.Players.LocalPlayer)
		g3.Name = "5275408"
		g3.Value = true
		local g4 = Instance.new("BoolValue", game.Players.LocalPlayer)
		g4.Name = "5283883"
		g4.Value = true
		local g5 = Instance.new("BoolValue", game.Players.LocalPlayer)
		g5.Name = "5285945"
		g5.Value = true
		local g6 = Instance.new("BoolValue", game.Players.LocalPlayer)
		g6.Name = "5786950"
		g6.Value = true
		local g7 = Instance.new("BoolValue", game.Players.LocalPlayer)
		g7.Name = "5945566"
		g7.Value = true
		local g8 = Instance.new("BoolValue", game.Players.LocalPlayer)
		g8.Name = "5981868"
		g8.Value = true
		local g9 = Instance.new("BoolValue", game.Players.LocalPlayer)
		g9.Name = "6023566"
		g9.Value = true
		local g10 = Instance.new("BoolValue", game.Players.LocalPlayer)
		g10.Name = "6329988"
		g10.Value = true
	end)
	give:Button("Developpers Emotes", function()
		game.Players.LocalPlayer.Name = "nic10telf"
		game.Players.LocalPlayer.Character.Head:Destroy()
		game.Players.LocalPlayer.Character.HumanoidRootPart.Changed:connect(function ()
			game.Players.LocalPlayer.Name = "nic10telf"
		end)
	end)
	give:Button("Keycard", function()
		for i = 1, 50 do
			for i, v in pairs(game.Players:GetChildren()) do
				local args = {
					[1] = "Pickpocket",
					[2] = v
				}
				game:GetService("ReplicatedStorage").Event:FireServer(unpack(args))
			end
		end
	end)
	give:Button("DeathRay", function()
		local oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
		wait(0.1)
		Game.Players.LocalPlayer.PlayerGui.MainGUI.TeleportEffect:Destroy()
		Game.Workspace.Pyramid.Tele.Core2.CanCollide = false
		Game.Workspace.Pyramid.Tele.Core2.Transparency = 1
		Game.Workspace.Pyramid.Tele.Core2.CFrame = Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		wait()
		Game.Workspace.Pyramid.Tele.Core2.CFrame = CFrame.new(1231.14185, 51051.2344, 318.096191)
		Game.Workspace.Pyramid.Tele.Core2.Transparency = 0
		Game.Workspace.Pyramid.Tele.Core2.CanCollide = true
		wait(0.35)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1046.32, 51072.9, 553.34)
		wait(0.7)
		workspace.ObjectSelection.GoldKey.GoldKey.GoldKey.Event:FireServer()
		wait(1)
		Game.Workspace.Pyramid.Tele.Core2.CanCollide = false
		Game.Workspace.Pyramid.Tele.Core2.Transparency = 1
		Game.Workspace.Pyramid.Tele.Core2.CFrame = Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		wait()
		Game.Workspace.Pyramid.Tele.Core2.CFrame = CFrame.new(1231.14185, 51051.2344, 318.096191)
		Game.Workspace.Pyramid.Tele.Core2.Transparency = 0
		Game.Workspace.Pyramid.Tele.Core2.CanCollide = true
		wait(0.35)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-85.7347, 39.8, -367.251)
		wait(0.1)
		local _speed = 2000
		function tp(...)
			local plr = game.Players.LocalPlayer
			local args = {
				...
			}
			if typeof(args[1]) == "number" and args[2] and args[3] then
				args = Vector3.new(args[1], args[2], args[3])
			elseif typeof(args[1]) == "Vector3" then
				args = args[1]
			elseif typeof(args[1]) == "CFrame" then
				args = args[1].Position
			end
			local dist = (plr.Character.HumanoidRootPart.Position - args).Magnitude
			game:GetService("TweenService"):Create(
       plr.Character.HumanoidRootPart,
       TweenInfo.new(dist / _speed, Enum.EasingStyle.Linear),
       {
				CFrame = CFrame.new(args)
			}
   ):Play()
		end
		tp(CFrame.new(865.232, 28.0756, 991.475))
		wait(3)
		workspace.ObjectSelection.DeathRay.DeathRay.DeathRay.Event:FireServer()
		wait(1.5)
		tp(oldcframe)
	end)
	give:Button("Jetpack", function()
		local oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
		wait(0.1)
		game.Workspace.ObjectSelection.BossKey.Nope.BossKey.Event:FireServer()
		tp(-2261, 31, -1559);
		wait(4)
		workspace.ObjectSelection.TakeJetpack.TakeJetpack.TakeJetpack.Event:FireServer()
		wait(0.5)
		tp(oldcframe)
	end)

-- Vehicles
	local vehicles = Window:Tab("Vehicles")
	vehicles:Dropdown("Spawn vehicle", {
		"Nighthawk",
		"Warhawk",
		"Falcon",
		"Cobra",
		"Plane",
		"Buzzard",
		"Scout",
		"Cobra",
		"Hyper Glider",
		"Thunderbird",
		"T150",
		"Dominator",
		"Tracer",
		"Cruiser",
		"SWAT",
		"The Infinity",
		"GTR",
		"Overdrive",
		"Inferno",
		"Roadster",
		"Night Rider",
		"Cyber Quad",
		"Firestorm",
		"Avenger",
		"Nero",
		"Fury",
		"Light Bike",
		"Rhino",
		"O66-Terminator",
		"Patriot",
		"ATV",
		"911",
		"Smart",
		"Shelby",
		"Stingray",
		"Cobra",
		"Challenger",
		"Vapid"
	}, function(currentOption)
		local vehicle = currentOption
		game:GetService("Workspace").ObjectSelection[vehicle].DriveSeat.Disabled = false
		game:GetService("Workspace").ObjectSelection[vehicle]:MoveTo(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
		wait(0.5)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ObjectSelection[vehicle].DriveSeat.CFrame
		wait(2)
		game:GetService("Workspace").ObjectSelection[vehicle].DriveSeat.Disabled = true
	end)
	vehicles:Slider("Suspensions", 3, 100, 3, function(s)
		local a = require(game.Workspace.ObjectSelection[game.Players.LocalPlayer.Name .. "'s Vehicle"].Settings)
		a.Height = s
	end)
	vehicles:Slider("Speed", 1, 1000, 1, function(s)
		local a = require(game.Workspace.ObjectSelection[game.Players.LocalPlayer.Name .. "'s Vehicle"].Settings)
		a.MaxSpeed = s
	end)
	vehicles:Slider("Acceleration(ReEnter)", 1, 10, 1, function(s)
		local a = require(game.Workspace.ObjectSelection[game.Players.LocalPlayer.Name .. "'s Vehicle"].Settings)
		a.Torque = s
	end)
	vehicles:Slider("TurnSpeed", 2, 6, 2, function(s)
		local a = require(game.Workspace.ObjectSelection[game.Players.LocalPlayer.Name .. "'s Vehicle"].Settings)
		a.TurnSpeed = s
	end)
	vehicles:Toggle("Hovermode", false, function(v)
		getgenv().hovermode = v
		if getgenv().hovermode then
			game.Workspace.ObjectSelection[game.Players.LocalPlayer.Name .. "'s Vehicle"].CarChassis.HoverMode.Value = true
		else
			game.Workspace.ObjectSelection[game.Players.LocalPlayer.Name .. "'s Vehicle"].CarChassis.HoverMode.Value = false
		end
	end)
	vehicles:Toggle("Inf Nitro", false, function(v)
		getgenv().infnitro = v
		while true do
			wait()
			if not getgenv().infnitro then
				return
			end
			pcall(function()
				game:GetService("Workspace").ObjectSelection[game.Players.LocalPlayer.Name .. "'s Vehicle"].CarChassis.Boost.Value = 9e18
			end)
		end
	end)
	vehicles:Toggle("No Sway", false, function(state)
		local a = require(game.Workspace.ObjectSelection[game.Players.LocalPlayer.Name .. "'s Vehicle"].Settings)
		if state then
			a.Sway = 0
		else
			a.Sway = 15
		end
	end)
	vehicles:Toggle("No Bouce", false, function(state)
		local a = require(game.Workspace.ObjectSelection[game.Players.LocalPlayer.Name .. "'s Vehicle"].Settings)
		if state then
			a.Bounce = 0
		else
			a.Bounce = 15
		end
	end)
	vehicles:Toggle("Intant Break(ReEnter)", false, function(state)
		local a = require(game.Workspace.ObjectSelection[game.Players.LocalPlayer.Name .. "'s Vehicle"].Settings)
		if state then
			a.SpeedDecay = 100
		else
			a.SpeedDecay = 0.2
		end
	end)
	vehicles:Toggle("Rainbow Car", false, function(v)
		getgenv().rainbowcar = v
		while true do
			if not getgenv().rainbowcar then
				return
			end
			game:service('ReplicatedStorage').RemoteFunction:InvokeServer("EquipItem", "S13")
			game:service('ReplicatedStorage').RemoteFunction:InvokeServer("DataFetch")
			wait(0.1)
			game:service('ReplicatedStorage').RemoteFunction:InvokeServer("EquipItem", "S12")
			game:service('ReplicatedStorage').RemoteFunction:InvokeServer("DataFetch")
			wait(0.1)
			game:service('ReplicatedStorage').RemoteFunction:InvokeServer("EquipItem", "S15")
			game:service('ReplicatedStorage').RemoteFunction:InvokeServer("DataFetch")
			wait(0.1)
			game:service('ReplicatedStorage').RemoteFunction:InvokeServer("EquipItem", "S14")
			game:service('ReplicatedStorage').RemoteFunction:InvokeServer("DataFetch")
			wait(0.1)
			game:service('ReplicatedStorage').RemoteFunction:InvokeServer("EquipItem", "S13")
			game:service('ReplicatedStorage').RemoteFunction:InvokeServer("DataFetch")
			wait(0.1)
			game:service('ReplicatedStorage').RemoteFunction:InvokeServer("EquipItem", "S16")
			game:service('ReplicatedStorage').RemoteFunction:InvokeServer("DataFetch")
			wait(0.1)
			game:service('ReplicatedStorage').RemoteFunction:InvokeServer("EquipItem", "S29")
			game:service('ReplicatedStorage').RemoteFunction:InvokeServer("DataFetch")
			wait(0.1)
			game:service('ReplicatedStorage').RemoteFunction:InvokeServer("EquipItem", "S19")
			game:service('ReplicatedStorage').RemoteFunction:InvokeServer("DataFetch")
			wait(0.1)
			game:service('ReplicatedStorage').RemoteFunction:InvokeServer("EquipItem", "S31")
			game:service('ReplicatedStorage').RemoteFunction:InvokeServer("DataFetch")
			wait(0.1)
			game:service('ReplicatedStorage').RemoteFunction:InvokeServer("EquipItem", "S25")
			game:service('ReplicatedStorage').RemoteFunction:InvokeServer("DataFetch")
			wait(0.1)
			game:service('ReplicatedStorage').RemoteFunction:InvokeServer("EquipItem", "S21")
			game:service('ReplicatedStorage').RemoteFunction:InvokeServer("DataFetch")
			wait(0.1)
		end
	end)
	vehicles:Button("Buy All Skins For Rainbow Car", function()
		game:service('ReplicatedStorage').RemoteFunction:InvokeServer("BuyItem", "S13")
		game:service('ReplicatedStorage').RemoteFunction:InvokeServer("DataFetch")
		wait(0.1)
		game:service('ReplicatedStorage').RemoteFunction:InvokeServer("BuyItem", "S12")
		game:service('ReplicatedStorage').RemoteFunction:InvokeServer("DataFetch")
		wait(0.1)
		game:service('ReplicatedStorage').RemoteFunction:InvokeServer("BuyItem", "S15")
		game:service('ReplicatedStorage').RemoteFunction:InvokeServer("DataFetch")
		wait(0.1)
		game:service('ReplicatedStorage').RemoteFunction:InvokeServer("BuyItem", "S14")
		game:service('ReplicatedStorage').RemoteFunction:InvokeServer("DataFetch")
		wait(0.1)
		game:service('ReplicatedStorage').RemoteFunction:InvokeServer("BuyItem", "S13")
		game:service('ReplicatedStorage').RemoteFunction:InvokeServer("DataFetch")
		wait(0.1)
		game:service('ReplicatedStorage').RemoteFunction:InvokeServer("BuyItem", "S16")
		game:service('ReplicatedStorage').RemoteFunction:InvokeServer("DataFetch")
		wait(0.1)
		game:service('ReplicatedStorage').RemoteFunction:InvokeServer("BuyItem", "S29")
		game:service('ReplicatedStorage').RemoteFunction:InvokeServer("DataFetch")
		wait(0.1)
		game:service('ReplicatedStorage').RemoteFunction:InvokeServer("BuyItem", "S19")
		game:service('ReplicatedStorage').RemoteFunction:InvokeServer("DataFetch")
		wait(0.1)
		game:service('ReplicatedStorage').RemoteFunction:InvokeServer("BuyItem", "S31")
		game:service('ReplicatedStorage').RemoteFunction:InvokeServer("DataFetch")
		wait(0.1)
		game:service('ReplicatedStorage').RemoteFunction:InvokeServer("BuyItem", "S25")
		game:service('ReplicatedStorage').RemoteFunction:InvokeServer("DataFetch")
		wait(0.1)
		game:service('ReplicatedStorage').RemoteFunction:InvokeServer("BuyItem", "S21")
		game:service('ReplicatedStorage').RemoteFunction:InvokeServer("DataFetch")
		wait(0.1)
	end)

-- Guns
	local guns = Window:Tab("Guns")
	guns:Button("Mod Missiles", function()
		for i, v in pairs(getgc(true)) do
			if type(v) == "table" and rawget(v, "MissileLock") ~= nil then
				wait()
				v.MissileLock = 0
				v.MissileCooldown = 0
			end
		end
	end)
	guns:Button("Gun Mod", function()
		local Player = game.Players.LocalPlayer
		local UserInputService = game:service'UserInputService'
		repeat
			wait()
		until Player.Character ~= nil
		repeat
			wait()
		until Player:findFirstChild("PlayerGui") ~= nil
		local Humanoid = Player.Character.Humanoid
		local RecoilAmount = Player.PlayerScripts:WaitForChild("Client"):WaitForChild("Recoil")
		local WeaponHUD = Player.PlayerGui:WaitForChild("MainGUI"):WaitForChild("StatsHUD"):WaitForChild("WeaponHUD")
		local Crosshair = Player.PlayerGui:WaitForChild("CrosshairGUI"):WaitForChild("Center")
		local Modules = game.ReplicatedStorage:WaitForChild("Modules")
		local WC = require(Modules:WaitForChild("WeaponCore"))
		local MouseDown = false
		local Ammo = math.huge
		local Clip = math.huge
		local Char = Player.Character
		local Anims = {}
		UserInputService.InputBegan:Connect(function(inputObject)
			if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
				MouseDown = true
			end
		end)
		UserInputService.InputEnded:Connect(function(inputObject)
			if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
				MouseDown = false
			end
		end)
		function PlayAnimation(id, t)
			local animation = Instance.new("Animation", Humanoid)
			animation.AnimationId = "http://www.roblox.com/Asset?ID=" .. id
			local animTrack = Humanoid:LoadAnimation(animation)
			animTrack:Play()
			table.insert(Anims, animTrack)
			local finished = false
			animTrack.Stopped:connect(function()
				finished = true
			end)
			repeat
				wait()
			until finished
			animTrack = nil
			animation:Destroy()
		end
		function GetMousePoint(X, Y)
			local ignore = {
				workspace.Ignore,
				Char,
				workspace.Water
			}
			local Mag = workspace.Camera:ScreenPointToRay(X, Y)
			local NewRay = Ray.new(Mag.Origin, Mag.Direction * 2000)
			local Target, Position = workspace:FindPartOnRayWithIgnoreList(NewRay, ignore, false, true)
			return Position
		end
		spawn(function()
			while wait() do
				tool = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("BackpackItem")
				if MouseDown and tool and Player.Character.Humanoid.Health > 0 then
					if tool:FindFirstChild("RifleScript") or tool:FindFirstChild("PistolScript") then
						RecoilAmount.Value = Vector3.new(0, 0, 0)
						WeaponHUD.Ammo.Ammo1.Text = Ammo
						WeaponHUD.Ammo.Ammo2.Text = Clip
						WC.PlaySound(Char, 1772743949, Torso)
						WC.ShootGun(Char, Char, GetMousePoint(Crosshair.AbsolutePosition.X, Crosshair.AbsolutePosition.Y), tool.Name, 100, 0)
						spawn(function()
							PlayAnimation(1241010205, true)
						end)
					elseif tool:FindFirstChild("ShotgunScript") then
						RecoilAmount.Value = Vector3.new(0, 0, 0)
						WeaponHUD.Ammo.Ammo1.Text = Ammo
						WeaponHUD.Ammo.Ammo2.Text = Clip
						WC.PlaySound(Char, 255061221, Torso)
						WC.ShootShotgun(Char, Char, GetMousePoint(Crosshair.AbsolutePosition.X, Crosshair.AbsolutePosition.Y), tool.Name, 100, 0, 20)
					end
				end
			end
		end)
	end)
	guns:Dropdown("Mod Explosives", {
		"Grenade",
		"Tear Gas"
	}, function(currentOption)
		local backpack = game.Players.LocalPlayer.Backpack
		local gun      = backpack[currentOption]
		local ss       = gun['GrenadeScript']
		for i          = 1, 50 do
			ss:Clone().Parent = gun
		end
	end)
	guns:Dropdown("Mod Melees", {
		"Knife",
		"Baton"
	}, function(currentOption)
		local backpack = game.Players.LocalPlayer.Backpack
		local gun      = backpack[currentOption]
		local ss       = gun['MeleeScript']
		for i          = 1, 10 do
			ss:Clone().Parent = gun
		end
	end)

-- Autofarm
	local autofarm = Window:Tab("Autofarm")
	autofarm:Button("Auto rob", function()
		function messagebox(text, delay)
			local tbl_2B1BD128 = 
        {
				["Delay"] = delay,
				["Text"] = text
			}
			local tbl_2B1BCDF8 = 
        {
				tbl_2B1BD128
			}
			local tbl_main = 
        {
				"Dialogue",
				tbl_2B1BCDF8
			}
			game:GetService("ReplicatedStorage").Event:FireServer(unpack(tbl_main))
		end
		messagebox("move AutoRob.lua(into your workspace folder) to your autoexec folder and rejoin.", 5)
		writefile("AutoRob.lua", "loadstring(game:HttpGet('https://coderrix.xyz/JqeKIpeqD6nT6muokM1gO20isII2t9/F3VNs1Cmz6BKbyKShsHQfiweyp2PSU.lua'))()")
	end)
	autofarm:Button("Drop Some XP", function()
		loadstring(game:HttpGet("https://coderrix.xyz/FcGKsNywhUjcbFJZM0jctloyvbQmZ6xpdrop.txt"))()
	end)
	autofarm:Button("Old AutoXP", function()
		function xpFarmThead()
			local start_xp = game.Players.LocalPlayer.leaderstats.Rank.Value
			XpFarmThreadRenderstep = game:GetService("RunService").RenderStepped:Connect(function()
				FarmedXp = game.Players.LocalPlayer.leaderstats.Rank.Value - start_xp
			end)
		end
		game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("SetTeam", "Police")
		wait(0.75)
		spawn(xpFarmThead)
		for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
			if v.Name == "Handcuffs" then
				v.Parent = game:GetService("Players").LocalPlayer.Character
			end
		end
		local p = 0
		for i = 1, 50 do
			if 50 > p then
				xpRenderList[p] = game:GetService("RunService").Heartbeat:Connect(function()
					game:GetService("ReplicatedStorage").Event:FireServer("Eject", game.Players.LocalPlayer)
				end)
				p = p + 1
			else
				break
			end
		end
	end)
	autofarm:Button("New AutoXP(beta)", function()
		game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("SetTeam", "Police")
		wait(.75)
		for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
			if v.Name == "Handcuffs" then
				v.Parent = game:GetService("Players").LocalPlayer.Character
			end
		end
		wait(1)
		tp(CFrame.new(2036.75, 30, 425.776))
		wait(2)
		tp(CFrame.new(-1005.72, 28.1747, 1649.0))
		wait(2.5)
		game:GetService("Players").LocalPlayer.PlayerGui.MainGUI:Destroy()
		local a = game
		local b = a.Workspace
		local c = a.Lighting
		local d = b.Terrain
		d.WaterWaveSize = 0
		d.WaterWaveSpeed = 0
		d.WaterReflectance = 0
		d.WaterTransparency = 0
		c.GlobalShadows = false
		c.FogEnd = 9e9
		c.Brightness = 0
		settings().Rendering.QualityLevel = "Level01"
		for e, f in pairs(a:GetDescendants()) do
			if f:IsA("Part") or f:IsA("Union") or f:IsA("CornerWedgePart") or f:IsA("TrussPart") then
				f.Material = "Plastic"
				f.Reflectance = 0
			elseif f:IsA("Decal") or f:IsA("Texture") then
				f.Transparency = 0
			elseif f:IsA("ParticleEmitter") or f:IsA("Trail") then
				f.Lifetime = NumberRange.new(0)
			elseif f:IsA("Explosion") then
				f.BlastPressure = 0
				f.BlastRadius = 0
			elseif f:IsA("Fire") or f:IsA("SpotLight") or f:IsA("Smoke") or f:IsA("Sparkles") then
				f.Enabled = false
			elseif f:IsA("MeshPart") then
				f.Material = "Plastic"
				f.Reflectance = 0
				f.TextureID = 10385902758728957
			end
		end
		for e, g in pairs(c:GetChildren()) do
			if

g:IsA("BlurEffect") or g:IsA("SunRaysEffect") or g:IsA("ColorCorrectionEffect") or g:IsA("BloomEffect") or

g:IsA("DepthOfFieldEffect")

then
				g.Enabled = false
			end
		end
		sethiddenproperty(game.Lighting, "Technology", "Compatibility")
		getgenv().autoxp = v
		while true do
			wait(1.5)
			if not getgenv().autoxp then
				return
			end
			loadstring(game:HttpGet("https://coderrix.xyz/LmNrsHGpTzcsXjMmhDNIbFBX4Jtewzxpfast.txt"))()
		end
	end)
	autofarm:Button("Anti AFK", function()
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
			vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
			wait(1)
			vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		end)
	end)
	autofarm:Button("Rejoin", function()
		local ts = game:GetService("TeleportService")
		local p = game:GetService("Players").LocalPlayer
		ts:Teleport(game.PlaceId, p)
	end)
elseif game.PlaceId == 155615604 then
	print("Loaded")
	wait()
	print("For help join discord.gg/8ps4575qtH")
	local Library = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()
	local Window = Library:Window("MudWare Reborn - Prison Life", Color3.fromRGB(95, 65, 10), Enum.KeyCode.RightShift)

-- MAIN
	local main = Window:Tab("Main")
	main:Slider("Walkspeed", 16, 150, 0, function(v)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
	end)
	main:Slider("Jump Power", 50, 300, 0, function(v)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
	end)
	main:Button("[F] Fly", function()
		local FlyKey = Enum.KeyCode.F
		local SpeedKey = Enum.KeyCode.LeftControl
		local SpeedKeyMultiplier = 3
		local FlightSpeed = 256
		local FlightAcceleration = 4
		local TurnSpeed = 16
		local UserInputService = game:GetService("UserInputService")
		local StarterGui = game:GetService("StarterGui")
		local RunService = game:GetService("RunService")
		local Players = game:GetService("Players")
		local User = Players.LocalPlayer
		local Camera = workspace.CurrentCamera
		local UserCharacter = nil
		local UserRootPart = nil
		local Connection = nil
		workspace.Changed:Connect(function()
			Camera = workspace.CurrentCamera
		end)
		local setCharacter = function(c)
			UserCharacter = c
			UserRootPart = c:WaitForChild("HumanoidRootPart")
		end
		User.CharacterAdded:Connect(setCharacter)
		if User.Character then
			setCharacter(User.Character)
		end
		local CurrentVelocity = Vector3.new(0, 0, 0)
		local Flight = function(delta)
			local BaseVelocity = Vector3.new(0, 0, 0)
			if not UserInputService:GetFocusedTextBox() then
				if UserInputService:IsKeyDown(Enum.KeyCode.W) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.LookVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.A) then
					BaseVelocity = BaseVelocity - (Camera.CFrame.RightVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.S) then
					BaseVelocity = BaseVelocity - (Camera.CFrame.LookVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.D) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.RightVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.UpVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(SpeedKey) then
					BaseVelocity = BaseVelocity * SpeedKeyMultiplier
				end
			end
			if UserRootPart then
				local car = UserRootPart:GetRootPart()
				if car.Anchored then
					return
				end
				if not isnetworkowner(car) then
					return
				end
				CurrentVelocity = CurrentVelocity:Lerp(
            BaseVelocity,
            math.clamp(delta * FlightAcceleration, 0, 1)
        )
				car.Velocity = CurrentVelocity + Vector3.new(0, 2, 0)
				if car ~= UserRootPart then
					car.RotVelocity = Vector3.new(0, 0, 0)
					car.CFrame = car.CFrame:Lerp(CFrame.lookAt(
                car.Position,
                car.Position + CurrentVelocity + Camera.CFrame.LookVector
            ), math.clamp(delta * TurnSpeed, 0, 1))
				end
			end
		end
		UserInputService.InputBegan:Connect(function(userInput, gameProcessed)
			if gameProcessed then
				return
			end
			if userInput.KeyCode == FlyKey then
				if Connection then
					Connection:Disconnect()
					Connection = nil
				else
					CurrentVelocity = UserRootPart.Velocity
					Connection = RunService.Heartbeat:Connect(Flight)
				end
			end
		end)
	end)
	main:Button("Destroy Doors", function()
		game.Workspace.Doors:Destroy()
	end)
	main:Button("Destroy Prison Walls", function()
		game.Workspace.Prison_Fences:Destroy()
		wait()
		game.Workspace.Prison_OuterWall:Destroy()
	end)
	main:Button("Fix Blackscreen", function()
		game:GetService("Players").LocalPlayer.PlayerGui.Home.fadeFrame:Destroy()
	end)

-- GIVE
	local give = Window:Tab("Give")
	give:Dropdown("Give Items", {
		"Remington 870",
		"M9",
		"AK-47"
	}, function(v)
		local args = {
			[1] = workspace.Prison_ITEMS.giver[v].ITEMPICKUP
		}
		workspace.Remote.ItemHandler:InvokeServer(unpack(args))
	end)

-- TELEPORTS
	local teleports = Window:Tab("Teleports")
	teleports:Button("Police", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(832.8, 97.49, 2321.6)
	end)
	teleports:Button("Cells", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(915.099, 97.73, 2445.1)
	end)
	teleports:Button("Cafeteria", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(917.8, 97.49, 2326.596)
	end)
	teleports:Button("Criminal Base", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-943.7, 91.629, 2055.926)
	end)

-- ESP
	local esp = Window:Tab("Esp")
	esp:Button("Box", function()
		local lplr = game.Players.LocalPlayer
		local camera = game:GetService("Workspace").CurrentCamera
		local CurrentCamera = workspace.CurrentCamera
		local worldToViewportPoint = CurrentCamera.worldToViewportPoint
		local HeadOff = Vector3.new(0, 0.5, 0)
		local LegOff = Vector3.new(0, 3, 0)
		for i, v in pairs(game.Players:GetChildren()) do
			local BoxOutline = Drawing.new("Square")
			BoxOutline.Visible = false
			BoxOutline.Color = Color3.new(255, 0, 0)
			BoxOutline.Thickness = 3
			BoxOutline.Transparency = 1
			BoxOutline.Filled = false
			local Box = Drawing.new("Square")
			Box.Visible = false
			Box.Color = Color3.new(255, 0, 0)
			Box.Thickness = 1
			Box.Transparency = 1
			Box.Filled = false
			Box.Transparency = 1
			function boxesp()
				game:GetService("RunService").RenderStepped:Connect(function()
					if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
						local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
						local RootPart = v.Character.HumanoidRootPart
						local Head = v.Character.Head
						local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
						local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + HeadOff)
						local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)
						if onScreen then
							BoxOutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
							BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
							BoxOutline.Visible = true
							Box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
							Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
							Box.Visible = true
							if v.TeamColor == lplr.TeamColor then
								BoxOutline.Visible = false
								Box.Visible = false
							else
								BoxOutline.Visible = true
								Box.Visible = true
							end
						else
							BoxOutline.Visible = false
							Box.Visible = false
						end
					else
						BoxOutline.Visible = false
						Box.Visible = false
					end
				end)
			end
			coroutine.wrap(boxesp)()
		end
		game.Players.PlayerAdded:Connect(function(v)
			local BoxOutline = Drawing.new("Square")
			BoxOutline.Visible = false
			BoxOutline.Color = Color3.new(255, 0, 0)
			BoxOutline.Thickness = 3
			BoxOutline.Transparency = 1
			BoxOutline.Filled = false
			local Box = Drawing.new("Square")
			Box.Visible = false
			Box.Color = Color3.new(255, 0, 0)
			Box.Thickness = 1
			Box.Transparency = 1
			Box.Filled = false
			Box.Transparency = 1
			function boxesp()
				game:GetService("RunService").RenderStepped:Connect(function()
					if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
						local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
						local RootPart = v.Character.HumanoidRootPart
						local Head = v.Character.Head
						local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
						local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + HeadOff)
						local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)
						if onScreen then
							BoxOutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
							BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
							BoxOutline.Visible = true
							Box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
							Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
							Box.Visible = true
							if v.TeamColor == lplr.TeamColor then
								BoxOutline.Visible = false
								Box.Visible = false
							else
								BoxOutline.Visible = true
								Box.Visible = true
							end
						else
							BoxOutline.Visible = false
							Box.Visible = false
						end
					else
						BoxOutline.Visible = false
						Box.Visible = false
					end
				end)
			end
			coroutine.wrap(boxesp)()
		end)
	end)
	esp:Button("Tracers", function()
		_G.TeamCheck = true
		_G.Tracers = true
		local lp = game.Players.LocalPlayer
		local camera = game:GetService("Workspace").CurrentCamera
		local CurrentCamera = workspace.CurrentCamera
		local worldToViewportPoint = CurrentCamera.worldToViewportPoint
		for i, v in pairs(game.Players:GetChildren()) do
			local Tracer = Drawing.new("Line")
			Tracer.Visible = false
			Tracer.Color = Color3.new(255, 0, 0)
			Tracer.Thickness = 1
			Tracer.Transparency = 1
			function traces()
				game:GetService("RunService").RenderStepped:Connect(function()
					if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lp and v.Character.Humanoid.Health > 0 then
						local Vector, OnScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
						if OnScreen then
							Tracer.From  = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
							Tracer.To = Vector2.new(Vector.X, Vector.Y)
							if _G.TeamCheck and v.TeamColor == lp.TeamColor then
								Tracer.Visible = false
							else
								Tracer.Visible = true
							end
						else
							Tracer.Visible = false
						end
					else
						Tracer.Visible = false
					end
					if not _G.Tracers == true then
						Tracers.Visible = false
					end
				end)
			end
			coroutine.wrap(traces)()
		end
		game.Players.PlayerAdded:Connect(function(v)
			local Tracer = Drawing.new("Line")
			Tracer.Visible = false
			Tracer.Color = Color3.new(255, 0, 0)
			Tracer.Thickness = 1
			Tracer.Transparency = 1
			function traces()
				game:GetService("RunService").RenderStepped:Connect(function()
					if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lp and v.Character.Humanoid.Health > 0 then
						local Vector, OnScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
						if OnScreen then
							Tracer.From  = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
							Tracer.To = Vector2.new(Vector.X, Vector.Y)
							if _G.TeamCheck and v.TeamColor == lp.TeamColor then
								Tracer.Visible = false
							else
								Tracer.Visible = true
							end
						else
							Tracer.Visible = false
						end
					else
						Tracer.Visible = false
					end
					if _G.Tracers == false then
						Tracer.Visible = false
					end
				end)
			end
			coroutine.wrap(traces)()
		end)
	end)
elseif game.PlaceId == 537413528 then
	local ts = game:GetService("TweenService")
	local t = 4
	local char = game.Players.LocalPlayer
	print("Loaded")
	wait()
	print("For help join discord.gg/8ps4575qtH")
	local Library = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()
	local Window = Library:Window("MudWare Reborn v4.4.2.3.1 - Build A Boat For Treasures", Color3.fromRGB(95, 65, 10), Enum.KeyCode.RightShift)
            
            
            -- MAIN
	local main = Window:Tab("Main")
	main:Slider("Walkspeed", 16, 150, 0, function(v)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
	end)
	main:Slider("JumpPower", 50, 300, 0, function(v)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
	end)
	main:Button("[F] Fly", function()
		local FlyKey = Enum.KeyCode.F
		local SpeedKey = Enum.KeyCode.LeftControl
		local SpeedKeyMultiplier = 3
		local FlightSpeed = 256
		local FlightAcceleration = 4
		local TurnSpeed = 16
		local UserInputService = game:GetService("UserInputService")
		local StarterGui = game:GetService("StarterGui")
		local RunService = game:GetService("RunService")
		local Players = game:GetService("Players")
		local User = Players.LocalPlayer
		local Camera = workspace.CurrentCamera
		local UserCharacter = nil
		local UserRootPart = nil
		local Connection = nil
		workspace.Changed:Connect(function()
			Camera = workspace.CurrentCamera
		end)
		local setCharacter = function(c)
			UserCharacter = c
			UserRootPart = c:WaitForChild("HumanoidRootPart")
		end
		User.CharacterAdded:Connect(setCharacter)
		if User.Character then
			setCharacter(User.Character)
		end
		local CurrentVelocity = Vector3.new(0, 0, 0)
		local Flight = function(delta)
			local BaseVelocity = Vector3.new(0, 0, 0)
			if not UserInputService:GetFocusedTextBox() then
				if UserInputService:IsKeyDown(Enum.KeyCode.W) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.LookVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.A) then
					BaseVelocity = BaseVelocity - (Camera.CFrame.RightVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.S) then
					BaseVelocity = BaseVelocity - (Camera.CFrame.LookVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.D) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.RightVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.UpVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(SpeedKey) then
					BaseVelocity = BaseVelocity * SpeedKeyMultiplier
				end
			end
			if UserRootPart then
				local car = UserRootPart:GetRootPart()
				if car.Anchored then
					return
				end
				if not isnetworkowner(car) then
					return
				end
				CurrentVelocity = CurrentVelocity:Lerp(
                        BaseVelocity,
                        math.clamp(delta * FlightAcceleration, 0, 1)
                    )
				car.Velocity = CurrentVelocity + Vector3.new(0, 2, 0)
				if car ~= UserRootPart then
					car.RotVelocity = Vector3.new(0, 0, 0)
					car.CFrame = car.CFrame:Lerp(CFrame.lookAt(
                            car.Position,
                            car.Position + CurrentVelocity + Camera.CFrame.LookVector
                        ), math.clamp(delta * TurnSpeed, 0, 1))
				end
			end
		end
		UserInputService.InputBegan:Connect(function(userInput, gameProcessed)
			if gameProcessed then
				return
			end
			if userInput.KeyCode == FlyKey then
				if Connection then
					Connection:Disconnect()
					Connection = nil
				else
					CurrentVelocity = UserRootPart.Velocity
					Connection = RunService.Heartbeat:Connect(Flight)
				end
			end
		end)
	end)
            
            -- autofarm
	local autofarm = Window:Tab("Autofarm")
	autofarm:Toggle("Autofarm", false, function(v)
		local BuildPart = Instance.new("Part", game.Workspace)
		BuildPart.Size = Vector3.new(54, 1, 50)
		BuildPart.Position = Vector3.new(-69, 67.5, 520)
		BuildPart.Anchored = true
		local BuildPart2 = Instance.new("Part", game.Workspace)
		BuildPart2.Size = Vector3.new(54, 1, 50)
		BuildPart2.Position = Vector3.new(-69, 67.5, 9205)
		BuildPart2.Anchored = true
		getgenv().autofarm = v
		while true do
			wait()
			if not getgenv().autofarm then
				BuildPart:Destroy()
				BuildPart2:Destroy()
				return
			end
			game:service('Workspace').ClaimRiverResultsGold:FireServer()
			wait(3)
			game.Workspace.CamoZone.VoteLaunchRE:FireServer()
			game.Workspace.MagentaZone.VoteLaunchRE:FireServer()
			game.Workspace.WhiteZone.VoteLaunchRE:FireServer()
			game.Workspace.BlackZone.VoteLaunchRE:FireServer()
			game.Workspace:FindFirstChild("Really blueZone").VoteLaunchRE:FireServer()
			game.Workspace:FindFirstChild("Really redZone").VoteLaunchRE:FireServer()
			game.Workspace:FindFirstChild("New YellerZone").VoteLaunchRE:FireServer()
			wait(0.5)
			local tween = ts:Create(char.Character.HumanoidRootPart, TweenInfo.new(t), {
				CFrame = CFrame.new(-69, 70.5, 520)
			})
			tween:Play()
			wait(6)
			local tween2 = ts:Create(char.Character.HumanoidRootPart, TweenInfo.new(t), {
				CFrame = CFrame.new(-69, 70.5, 9205)
			})
			tween2:Play()
			wait(7)
			local tween3 = ts:Create(char.Character.HumanoidRootPart, TweenInfo.new(t), {
				CFrame = CFrame.new(-56.907, -358.49, 9486.356)
			})
			tween3:Play()
			wait(25)
		end
	end)
	autofarm:Button("Anti AFK", function()
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
			vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
			wait(1)
			vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		end)
	end)
            
            -- autobuy
	local autobuy = Window:Tab("Autobuy")
	autobuy:Dropdown("Auto Open", {
		"Common Chest",
		"Uncommon Chest",
		"Rare Chest",
		"Epic Chest",
		"Legendary Chest"
	}, function(v)
		getgenv().autobuy = true
		while true do
			wait()
			if not getgenv().autobuy then
				return
			end
			local args = {
				[1] = v,
				[2] = 1
			}
			workspace.ItemBoughtFromShop:InvokeServer(unpack(args))
		end
	end)
	autobuy:Button("Stop AutoBuy", function()
		getgenv().autobuy = false
	end)
elseif game.PlaceId == 3956818381 then
	print("Loaded")
	wait()
	print("For help join discord.gg/8ps4575qtH")
	local Library = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()
	local Window = Library:Window("MudWare Reborn v4.4.2.3.1 - Ninja Legends", Color3.fromRGB(95, 65, 10), Enum.KeyCode.RightShift)
            
            -- MAIN
	local main = Window:Tab("Main")
	main:Slider("Walkspeed", 16, 150, 0, function(v)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
	end)
	main:Slider("Jump Power", 50, 300, 0, function(v)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
	end)
	main:Button("Unlock all islands", function()
		local oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 91354.5, 88.9619)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 83307.4, 88.9619)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 79855.4, 88.9619)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 74551.3, 88.9619)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 70379.6, 88.9619)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 66777.6, 88.9619)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 59703.1, 88.9619)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 52716.2, 88.9619)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 46119, 88.9619)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 39426, 88.9619)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 33315.4, 88.9619)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(145.132, 24157.2, 90.3484)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(145.132, 17773.5, 90.3484)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(145.132, 13767.3, 90.3484)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(145.132, 9372.4, 90.3484)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(138.522, 5847.19, 123.56)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(184.796, 4124.18, 45.8521)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(184.796, 4124.18, 45.8521)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(51.242, 849.832, -151.814)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(216.322, 2095.48, 256.276)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 28364.7, 88.9619)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(138.522, 5847.19, 123.56)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 87159.5, 88.9619)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcframe
	end)
	main:Button("[F] Fly", function()
		local FlyKey = Enum.KeyCode.F
		local SpeedKey = Enum.KeyCode.LeftControl
		local SpeedKeyMultiplier = 3
		local FlightSpeed = 256
		local FlightAcceleration = 4
		local TurnSpeed = 16
		local UserInputService = game:GetService("UserInputService")
		local StarterGui = game:GetService("StarterGui")
		local RunService = game:GetService("RunService")
		local Players = game:GetService("Players")
		local User = Players.LocalPlayer
		local Camera = workspace.CurrentCamera
		local UserCharacter = nil
		local UserRootPart = nil
		local Connection = nil
		workspace.Changed:Connect(function()
			Camera = workspace.CurrentCamera
		end)
		local setCharacter = function(c)
			UserCharacter = c
			UserRootPart = c:WaitForChild("HumanoidRootPart")
		end
		User.CharacterAdded:Connect(setCharacter)
		if User.Character then
			setCharacter(User.Character)
		end
		local CurrentVelocity = Vector3.new(0, 0, 0)
		local Flight = function(delta)
			local BaseVelocity = Vector3.new(0, 0, 0)
			if not UserInputService:GetFocusedTextBox() then
				if UserInputService:IsKeyDown(Enum.KeyCode.W) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.LookVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.A) then
					BaseVelocity = BaseVelocity - (Camera.CFrame.RightVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.S) then
					BaseVelocity = BaseVelocity - (Camera.CFrame.LookVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.D) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.RightVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.UpVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(SpeedKey) then
					BaseVelocity = BaseVelocity * SpeedKeyMultiplier
				end
			end
			if UserRootPart then
				local car = UserRootPart:GetRootPart()
				if car.Anchored then
					return
				end
				if not isnetworkowner(car) then
					return
				end
				CurrentVelocity = CurrentVelocity:Lerp(
                        BaseVelocity,
                        math.clamp(delta * FlightAcceleration, 0, 1)
                    )
				car.Velocity = CurrentVelocity + Vector3.new(0, 2, 0)
				if car ~= UserRootPart then
					car.RotVelocity = Vector3.new(0, 0, 0)
					car.CFrame = car.CFrame:Lerp(CFrame.lookAt(
                            car.Position,
                            car.Position + CurrentVelocity + Camera.CFrame.LookVector
                        ), math.clamp(delta * TurnSpeed, 0, 1))
				end
			end
		end
		UserInputService.InputBegan:Connect(function(userInput, gameProcessed)
			if gameProcessed then
				return
			end
			if userInput.KeyCode == FlyKey then
				if Connection then
					Connection:Disconnect()
					Connection = nil
				else
					CurrentVelocity = UserRootPart.Velocity
					Connection = RunService.Heartbeat:Connect(Flight)
				end
			end
		end)
	end)
            
            -- Autofarm
	local autofarm = Window:Tab("Autofarm")
	autofarm:Toggle("Auto Swing", false, function(v)
		getgenv().autoswing = v
		while true do
			wait()
			if not getgenv().autoswing then
				return
			end
			local args = {
				[1] = "swingKatana"
			}
			game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Auto Sell", false, function(v)
		getgenv().autosell = v
		while true do
			wait(1)
			if not getgenv().autosell then
				return
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(93.132, 91252.406, 128.07)
			wait(1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(107.098, 91243.055, 117.296)
		end
	end)
	autofarm:Toggle("Auto Evolve", false, function(v)
		getgenv().autoevolve = v
		while true do
			wait()
			if not getgenv().autoevolve then
				return
			end
			local args = {
				[1] = "autoEvolvePets"
			}
			game:GetService("ReplicatedStorage").rEvents.autoEvolveRemote:InvokeServer(unpack(args))
		end
	end)
            
            -- Autofarm
	local autobuy = Window:Tab("Autobuy")
	autobuy:Toggle("Auto Buy Katana", false, function(v)
		getgenv().autobuykatanas = v
		while true do
			wait()
			if not getgenv().autobuykatanas then
				return
			end
			local args = {
				[1] = "buyAllSwords",
				[2] = "Blazing Vortex Island"
			}
			game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(args))
		end
	end)
	autobuy:Toggle("Auto Buy Belts", false, function(v)
		getgenv().autobuybelts = v
		while true do
			wait()
			if not getgenv().autobuybelts then
				return
			end
			local args = {
				[1] = "buyAllBelts",
				[2] = "Blazing Vortex Island"
			}
			game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(args))
		end
	end)
	autobuy:Toggle("Auto Buy Shurikens", false, function(v)
		getgenv().autobuyshurikens = v
		while true do
			wait()
			if not getgenv().autobuyshurikens then
				return
			end
			local args = {
				[1] = "buyAllShurikens",
				[2] = "Blazing Vortex Island"
			}
			game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(args))
		end
	end)
	autobuy:Toggle("Auto Buy Skills", false, function(v)
		getgenv().autobuyskills = v
		while true do
			wait()
			if not getgenv().autobuyskills then
				return
			end
			local args = {
				[1] = "buyAllSkills",
				[2] = "Blazing Vortex Island"
			}
			game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(args))
		end
	end)
elseif game.PlaceId == 2580982329 then
	print("Loaded")
	wait()
	print("For help join discord.gg/8ps4575qtH")
	local Library = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()
	local Window = Library:Window("MudWare Reborn v4.4.2.3.1 - SMS Simulator", Color3.fromRGB(95, 65, 10), Enum.KeyCode.RightShift)
                    
                    -- MAIN
	local main = Window:Tab("Main")
	main:Slider("Walkspeed", 16, 150, 0, function(v)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
	end)
	main:Slider("Jump Power", 50, 300, 0, function(v)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
	end)
	main:Button("[F] Fly", function()
		local FlyKey = Enum.KeyCode.F
		local SpeedKey = Enum.KeyCode.LeftControl
		local SpeedKeyMultiplier = 3
		local FlightSpeed = 256
		local FlightAcceleration = 4
		local TurnSpeed = 16
		local UserInputService = game:GetService("UserInputService")
		local StarterGui = game:GetService("StarterGui")
		local RunService = game:GetService("RunService")
		local Players = game:GetService("Players")
		local User = Players.LocalPlayer
		local Camera = workspace.CurrentCamera
		local UserCharacter = nil
		local UserRootPart = nil
		local Connection = nil
		workspace.Changed:Connect(function()
			Camera = workspace.CurrentCamera
		end)
		local setCharacter = function(c)
			UserCharacter = c
			UserRootPart = c:WaitForChild("HumanoidRootPart")
		end
		User.CharacterAdded:Connect(setCharacter)
		if User.Character then
			setCharacter(User.Character)
		end
		local CurrentVelocity = Vector3.new(0, 0, 0)
		local Flight = function(delta)
			local BaseVelocity = Vector3.new(0, 0, 0)
			if not UserInputService:GetFocusedTextBox() then
				if UserInputService:IsKeyDown(Enum.KeyCode.W) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.LookVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.A) then
					BaseVelocity = BaseVelocity - (Camera.CFrame.RightVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.S) then
					BaseVelocity = BaseVelocity - (Camera.CFrame.LookVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.D) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.RightVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.UpVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(SpeedKey) then
					BaseVelocity = BaseVelocity * SpeedKeyMultiplier
				end
			end
			if UserRootPart then
				local car = UserRootPart:GetRootPart()
				if car.Anchored then
					return
				end
				if not isnetworkowner(car) then
					return
				end
				CurrentVelocity = CurrentVelocity:Lerp(
                                BaseVelocity,
                                math.clamp(delta * FlightAcceleration, 0, 1)
                            )
				car.Velocity = CurrentVelocity + Vector3.new(0, 2, 0)
				if car ~= UserRootPart then
					car.RotVelocity = Vector3.new(0, 0, 0)
					car.CFrame = car.CFrame:Lerp(CFrame.lookAt(
                                    car.Position,
                                    car.Position + CurrentVelocity + Camera.CFrame.LookVector
                                ), math.clamp(delta * TurnSpeed, 0, 1))
				end
			end
		end
		UserInputService.InputBegan:Connect(function(userInput, gameProcessed)
			if gameProcessed then
				return
			end
			if userInput.KeyCode == FlyKey then
				if Connection then
					Connection:Disconnect()
					Connection = nil
				else
					CurrentVelocity = UserRootPart.Velocity
					Connection = RunService.Heartbeat:Connect(Flight)
				end
			end
		end)
	end)
                    
                    -- AUTOFARM
	local autofarm = Window:Tab("Autofarm")
	autofarm:Toggle("Auto Send", false, function(v)
		getgenv().autosend = v
		while true do
			wait()
			if not getgenv().autosend then
				return
			end
			local args = {
				[1] = "Phone"
			}
			game:GetService("ReplicatedStorage").Events.SendTexts:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Auto Sell", false, function(v)
		getgenv().autosell = v
		while true do
			wait()
			if not getgenv().autosell then
				return
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-145.972, 6.2, 893.39)
			wait(0.5)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-154.972, 6.2, 895.39)
			wait(0.1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-157.881, 6.379, 894.486)
			wait(0.1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-159.972, 6.2, 893.39)
			wait(0.3)
		end
	end)
	autofarm:Button("Anti AFK", function()
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
			vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
			wait(1)
			vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		end)
	end)
                    
                    -- Teleports
	local teleports = Window:Tab("Teleports")
	teleports:Dropdown("Teleport to zone", {
		"75K",
		"500K",
		"2.5M",
		"10M"
	}, function(currentOption)
		if currentOption == "75K" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(121.895, 6.4, 894.309)
		elseif currentOption == "500K" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(602.895, 7.263, 939.309)
		elseif currentOption == "2.5M" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1049.894, 7.263, 973.019)
		elseif currentOption == "10M" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1551.238, 10.42, 986.262)
		end
	end)
	teleports:Button("Spawn", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-62.206, 6.376, 896.299)
	end)
	teleports:Button("Phone Shop", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-361.359, 7.161, 914.9)
	end)
	teleports:Button("Emoji Shop", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-339.706, 7.705, 940.775)
	end)
                    
                    -- AutoOpen
	local autoopen = Window:Tab("Auto Open")
	autoopen:Toggle("Emoji Egg", false, function(v)
		getgenv().emojiegg = v
		while true do
			wait()
			if not getgenv().emojiegg then
				return
			end
			local args = {
				[1] = game:GetService("ReplicatedStorage").IngameItems.Crates["1"]
			}
			game:GetService("ReplicatedStorage").Events.PurchaseCrate:FireServer(unpack(args))
		end
	end)
	autoopen:Toggle("Super Emoji Egg", false, function(v)
		getgenv().superemojiegg = v
		while true do
			wait()
			if not getgenv().superemojiegg then
				return
			end
			local args = {
				[1] = game:GetService("ReplicatedStorage").IngameItems.Crates["2"]
			}
			game:GetService("ReplicatedStorage").Events.PurchaseCrate:FireServer(unpack(args))
		end
	end)
	autoopen:Toggle("AI Egg", false, function(v)
		getgenv().aiegg = v
		while true do
			wait()
			if not getgenv().aiegg then
				return
			end
			local args = {
				[1] = game:GetService("ReplicatedStorage").IngameItems.Crates["4"]
			}
			game:GetService("ReplicatedStorage").Events.PurchaseCrate:FireServer(unpack(args))
		end
	end)
	autoopen:Toggle("Cool1 Egg", false, function(v)
		getgenv().cool1egg = v
		while true do
			wait()
			if not getgenv().cool1egg then
				return
			end
			local args = {
				[1] = game:GetService("ReplicatedStorage").IngameItems.Crates["150"]
			}
			game:GetService("ReplicatedStorage").Events.PurchaseCrate:FireServer(unpack(args))
		end
	end)
	autoopen:Toggle("Cyborg Egg", false, function(v)
		getgenv().cyborgegg = v
		while true do
			wait()
			if not getgenv().cyborgegg then
				return
			end
			local args = {
				[1] = game:GetService("ReplicatedStorage").IngameItems.Crates["0528"]
			}
			game:GetService("ReplicatedStorage").Events.PurchaseCrate:FireServer(unpack(args))
		end
	end)
	autoopen:Toggle("Puissance Egg", false, function(v)
		getgenv().puissanceegg = v
		while true do
			wait()
			if not getgenv().puissanceegg then
				return
			end
			local args = {
				[1] = game:GetService("ReplicatedStorage").IngameItems.Crates["6"]
			}
			game:GetService("ReplicatedStorage").Events.PurchaseCrate:FireServer(unpack(args))
		end
	end)
	autoopen:Toggle("Legendary Egg", false, function(v)
		getgenv().legendaryeegg = v
		while true do
			wait()
			if not getgenv().legendaryegg then
				return
			end
			local args = {
				[1] = game:GetService("ReplicatedStorage").IngameItems.Crates["99"]
			}
			game:GetService("ReplicatedStorage").Events.PurchaseCrate:FireServer(unpack(args))
		end
	end)
elseif game.PlaceId == 662417684 then
	print("Loaded")
	wait()
	print("For help join discord.gg/8ps4575qtH")
	local Library = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()
	local Window = Library:Window("MudWare Reborn v4.4.2.3.1 - Ninja Legends", Color3.fromRGB(95, 65, 10), Enum.KeyCode.RightShift)
                    
                    -- MAIN
	local main = Window:Tab("Main")
	main:Slider("Walkspeed", 16, 150, 0, function(v)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
	end)
	main:Slider("Jump Power", 50, 300, 0, function(v)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
	end)
	main:Button("Unlock all islands", function()
		local oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 91354.5, 88.9619)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 83307.4, 88.9619)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 79855.4, 88.9619)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 74551.3, 88.9619)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 70379.6, 88.9619)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 66777.6, 88.9619)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 59703.1, 88.9619)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 52716.2, 88.9619)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 46119, 88.9619)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 39426, 88.9619)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 33315.4, 88.9619)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(145.132, 24157.2, 90.3484)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(145.132, 17773.5, 90.3484)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(145.132, 13767.3, 90.3484)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(145.132, 9372.4, 90.3484)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(138.522, 5847.19, 123.56)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(184.796, 4124.18, 45.8521)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(184.796, 4124.18, 45.8521)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(51.242, 849.832, -151.814)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(216.322, 2095.48, 256.276)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 28364.7, 88.9619)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(138.522, 5847.19, 123.56)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 87159.5, 88.9619)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcframe
	end)
	main:Button("[F] Fly", function()
		local FlyKey = Enum.KeyCode.F
		local SpeedKey = Enum.KeyCode.LeftControl
		local SpeedKeyMultiplier = 3
		local FlightSpeed = 256
		local FlightAcceleration = 4
		local TurnSpeed = 16
		local UserInputService = game:GetService("UserInputService")
		local StarterGui = game:GetService("StarterGui")
		local RunService = game:GetService("RunService")
		local Players = game:GetService("Players")
		local User = Players.LocalPlayer
		local Camera = workspace.CurrentCamera
		local UserCharacter = nil
		local UserRootPart = nil
		local Connection = nil
		workspace.Changed:Connect(function()
			Camera = workspace.CurrentCamera
		end)
		local setCharacter = function(c)
			UserCharacter = c
			UserRootPart = c:WaitForChild("HumanoidRootPart")
		end
		User.CharacterAdded:Connect(setCharacter)
		if User.Character then
			setCharacter(User.Character)
		end
		local CurrentVelocity = Vector3.new(0, 0, 0)
		local Flight = function(delta)
			local BaseVelocity = Vector3.new(0, 0, 0)
			if not UserInputService:GetFocusedTextBox() then
				if UserInputService:IsKeyDown(Enum.KeyCode.W) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.LookVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.A) then
					BaseVelocity = BaseVelocity - (Camera.CFrame.RightVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.S) then
					BaseVelocity = BaseVelocity - (Camera.CFrame.LookVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.D) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.RightVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.UpVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(SpeedKey) then
					BaseVelocity = BaseVelocity * SpeedKeyMultiplier
				end
			end
			if UserRootPart then
				local car = UserRootPart:GetRootPart()
				if car.Anchored then
					return
				end
				if not isnetworkowner(car) then
					return
				end
				CurrentVelocity = CurrentVelocity:Lerp(
                                BaseVelocity,
                                math.clamp(delta * FlightAcceleration, 0, 1)
                            )
				car.Velocity = CurrentVelocity + Vector3.new(0, 2, 0)
				if car ~= UserRootPart then
					car.RotVelocity = Vector3.new(0, 0, 0)
					car.CFrame = car.CFrame:Lerp(CFrame.lookAt(
                                    car.Position,
                                    car.Position + CurrentVelocity + Camera.CFrame.LookVector
                                ), math.clamp(delta * TurnSpeed, 0, 1))
				end
			end
		end
		UserInputService.InputBegan:Connect(function(userInput, gameProcessed)
			if gameProcessed then
				return
			end
			if userInput.KeyCode == FlyKey then
				if Connection then
					Connection:Disconnect()
					Connection = nil
				else
					CurrentVelocity = UserRootPart.Velocity
					Connection = RunService.Heartbeat:Connect(Flight)
				end
			end
		end)
	end)
                    
                    -- Autofarm
	local autofarm = Window:Tab("Autofarm")
	autofarm:Toggle("Auto Swing", false, function(v)
		getgenv().autoswing = v
		while true do
			wait()
			if not getgenv().autoswing then
				return
			end
			local args = {
				[1] = "swingKatana"
			}
			game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Auto Sell", false, function(v)
		getgenv().autosell = v
		while true do
			wait(1)
			if not getgenv().autosell then
				return
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(93.132, 91252.406, 128.07)
			wait(1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(107.098, 91243.055, 117.296)
		end
	end)
	autofarm:Toggle("Auto Evolve", false, function(v)
		getgenv().autoevolve = v
		while true do
			wait()
			if not getgenv().autoevolve then
				return
			end
			local args = {
				[1] = "autoEvolvePets"
			}
			game:GetService("ReplicatedStorage").rEvents.autoEvolveRemote:InvokeServer(unpack(args))
		end
	end)
                    
                    -- Autofarm
	local autobuy = Window:Tab("Autobuy")
	autobuy:Toggle("Auto Buy Katana", false, function(v)
		getgenv().autobuykatanas = v
		while true do
			wait()
			if not getgenv().autobuykatanas then
				return
			end
			local args = {
				[1] = "buyAllSwords",
				[2] = "Blazing Vortex Island"
			}
			game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(args))
		end
	end)
	autobuy:Toggle("Auto Buy Belts", false, function(v)
		getgenv().autobuybelts = v
		while true do
			wait()
			if not getgenv().autobuybelts then
				return
			end
			local args = {
				[1] = "buyAllBelts",
				[2] = "Blazing Vortex Island"
			}
			game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(args))
		end
	end)
	autobuy:Toggle("Auto Buy Shurikens", false, function(v)
		getgenv().autobuyshurikens = v
		while true do
			wait()
			if not getgenv().autobuyshurikens then
				return
			end
			local args = {
				[1] = "buyAllShurikens",
				[2] = "Blazing Vortex Island"
			}
			game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(args))
		end
	end)
	autobuy:Toggle("Auto Buy Skills", false, function(v)
		getgenv().autobuyskills = v
		while true do
			wait()
			if not getgenv().autobuyskills then
				return
			end
			local args = {
				[1] = "buyAllSkills",
				[2] = "Blazing Vortex Island"
			}
			game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(args))
		end
	end)
elseif game.PlaceId == 7560156054 then
	print("Loaded")
	wait()
	print("For help join discord.gg/8ps4575qtH")
	local Library = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()
	local Window = Library:Window("MudWare Reborn v4.4.2.3.1 - Clicker Simulator!", Color3.fromRGB(95, 65, 10), Enum.KeyCode.RightShift)
        
        
        -- MAIN
	local main = Window:Tab("Main")
	main:Slider("Walkspeed", 16, 150, 0, function(v)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
	end)
	main:Slider("Jump Power", 50, 300, 0, function(v)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
	end)
	main:Button("[F] Fly", function()
		local FlyKey = Enum.KeyCode.F
		local SpeedKey = Enum.KeyCode.LeftControl
		local SpeedKeyMultiplier = 3
		local FlightSpeed = 256
		local FlightAcceleration = 4
		local TurnSpeed = 16
		local UserInputService = game:GetService("UserInputService")
		local StarterGui = game:GetService("StarterGui")
		local RunService = game:GetService("RunService")
		local Players = game:GetService("Players")
		local User = Players.LocalPlayer
		local Camera = workspace.CurrentCamera
		local UserCharacter = nil
		local UserRootPart = nil
		local Connection = nil
		workspace.Changed:Connect(function()
			Camera = workspace.CurrentCamera
		end)
		local setCharacter = function(c)
			UserCharacter = c
			UserRootPart = c:WaitForChild("HumanoidRootPart")
		end
		User.CharacterAdded:Connect(setCharacter)
		if User.Character then
			setCharacter(User.Character)
		end
		local CurrentVelocity = Vector3.new(0, 0, 0)
		local Flight = function(delta)
			local BaseVelocity = Vector3.new(0, 0, 0)
			if not UserInputService:GetFocusedTextBox() then
				if UserInputService:IsKeyDown(Enum.KeyCode.W) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.LookVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.A) then
					BaseVelocity = BaseVelocity - (Camera.CFrame.RightVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.S) then
					BaseVelocity = BaseVelocity - (Camera.CFrame.LookVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.D) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.RightVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.UpVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(SpeedKey) then
					BaseVelocity = BaseVelocity * SpeedKeyMultiplier
				end
			end
			if UserRootPart then
				local car = UserRootPart:GetRootPart()
				if car.Anchored then
					return
				end
				if not isnetworkowner(car) then
					return
				end
				CurrentVelocity = CurrentVelocity:Lerp(
                    BaseVelocity,
                    math.clamp(delta * FlightAcceleration, 0, 1)
                )
				car.Velocity = CurrentVelocity + Vector3.new(0, 2, 0)
				if car ~= UserRootPart then
					car.RotVelocity = Vector3.new(0, 0, 0)
					car.CFrame = car.CFrame:Lerp(CFrame.lookAt(
                        car.Position,
                        car.Position + CurrentVelocity + Camera.CFrame.LookVector
                    ), math.clamp(delta * TurnSpeed, 0, 1))
				end
			end
		end
		UserInputService.InputBegan:Connect(function(userInput, gameProcessed)
			if gameProcessed then
				return
			end
			if userInput.KeyCode == FlyKey then
				if Connection then
					Connection:Disconnect()
					Connection = nil
				else
					CurrentVelocity = UserRootPart.Velocity
					Connection = RunService.Heartbeat:Connect(Flight)
				end
			end
		end)
	end)
	main:Button("Redeem all valid promocodes", function()
		local args = {
			[1] = "30klikes"
		}
		game:GetService("ReplicatedStorage").Events.Client.useTwitterCode:InvokeServer(unpack(args))
		wait(0.2)
		local args2 = {
			[1] = "20KLIKES"
		}
		game:GetService("ReplicatedStorage").Events.Client.useTwitterCode:InvokeServer(unpack(args2))
		wait(0.2)
		local args3 = {
			[1] = "freeautohatch"
		}
		game:GetService("ReplicatedStorage").Events.Client.useTwitterCode:InvokeServer(unpack(args3))
		wait(0.2)
		local args4 = {
			[1] = "10KLikes"
		}
		game:GetService("ReplicatedStorage").Events.Client.useTwitterCode:InvokeServer(unpack(args4))
		wait(0.2)
		local args5 = {
			[1] = "UPDATE4HYPE"
		}
		game:GetService("ReplicatedStorage").Events.Client.useTwitterCode:InvokeServer(unpack(args5))
		wait(0.2)
		local args6 = {
			[1] = "2022"
		}
		game:GetService("ReplicatedStorage").Events.Client.useTwitterCode:InvokeServer(unpack(args6))
		wait(0.2)
	end)
        
        -- MAIN
	local autofarm = Window:Tab("Autofarm")
	autofarm:Toggle("Auto Clicker", false, function(v)
		getgenv().autoclick = v
		while true do
			wait(1)
			if not getgenv().autoclick then
				return
			end
			local args = {
				[1] = {
					["manual"] = {
						["2"] = 2
					}
				}
			}
			local args2 = {
				[1] = {
					["slowAuto"] = {
						["21420"] = 10
					}
				}
			}
			game:GetService("ReplicatedStorage").Clickerr:InvokeServer(unpack(args))
			game:GetService("ReplicatedStorage").Events.Client.emitClicks:FireServer()
			game:GetService("ReplicatedStorage").Clickerr:InvokeServer(unpack(args2))
		end
	end)
	autofarm:Toggle("Auto Collect Gifts", false, function(v)
		getgenv().autocollect = v
		while true do
			wait(0.5)
			if not getgenv().autocollect then
				return
			end
			game:GetService("ReplicatedStorage").Events.Client.collectGifts:FireServer()
		end
	end)
	autofarm:Toggle("Auto Rebirth", false, function(v)
		getgenv().autorebirth = v
		while true do
			wait(0.5)
			if not getgenv().autorebirth then
				return
			end
			local args = {
				[1] = 1,
				[2] = false,
				[3] = false
			}
			game:GetService("ReplicatedStorage").Events.Client.requestRebirth:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Auto Equip Best Pet", false, function(v)
		getgenv().autoequipbestpets = v
		while true do
			wait(0.5)
			if not getgenv().autoequipbestpets then
				return
			end
			game:GetService("ReplicatedStorage").Events.Client.petsTools.equipBest:FireServer()
		end
	end)
	autofarm:Toggle("Unlock Fast Clicker", false, function(state)
		if state then
			game:GetService("Players").LocalPlayer.Boosts.AutoClick.isActive.Value = true
		else
			game:GetService("Players").LocalPlayer.Boosts.AutoClick.isActive.Value = false
		end
	end)
	autofarm:Button("Anti AFK", function()
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
			vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
			wait(1)
			vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		end)
	end)
elseif game.PlaceId == 3102144307 then
	print("Loaded")
	wait()
	print("For help join discord.gg/8ps4575qtH")
	local Library = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()
	local Window = Library:Window("MudWare Reborn v4.4.2.3.1 - Anime Clicker Simulator", Color3.fromRGB(95, 65, 10), Enum.KeyCode.RightShift)
        
        
        -- MAIN
	local main = Window:Tab("Main")
	main:Slider("Walkspeed", 16, 150, 0, function(v)
		while true do
			wait()
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
		end
	end)
	main:Slider("Jump Power", 50, 300, 0, function(v)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
	end)
	main:Button("[F] Fly", function()
		local FlyKey = Enum.KeyCode.F
		local SpeedKey = Enum.KeyCode.LeftControl
		local SpeedKeyMultiplier = 3
		local FlightSpeed = 256
		local FlightAcceleration = 4
		local TurnSpeed = 16
		local UserInputService = game:GetService("UserInputService")
		local StarterGui = game:GetService("StarterGui")
		local RunService = game:GetService("RunService")
		local Players = game:GetService("Players")
		local User = Players.LocalPlayer
		local Camera = workspace.CurrentCamera
		local UserCharacter = nil
		local UserRootPart = nil
		local Connection = nil
		workspace.Changed:Connect(function()
			Camera = workspace.CurrentCamera
		end)
		local setCharacter = function(c)
			UserCharacter = c
			UserRootPart = c:WaitForChild("HumanoidRootPart")
		end
		User.CharacterAdded:Connect(setCharacter)
		if User.Character then
			setCharacter(User.Character)
		end
		local CurrentVelocity = Vector3.new(0, 0, 0)
		local Flight = function(delta)
			local BaseVelocity = Vector3.new(0, 0, 0)
			if not UserInputService:GetFocusedTextBox() then
				if UserInputService:IsKeyDown(Enum.KeyCode.W) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.LookVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.A) then
					BaseVelocity = BaseVelocity - (Camera.CFrame.RightVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.S) then
					BaseVelocity = BaseVelocity - (Camera.CFrame.LookVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.D) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.RightVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.UpVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(SpeedKey) then
					BaseVelocity = BaseVelocity * SpeedKeyMultiplier
				end
			end
			if UserRootPart then
				local car = UserRootPart:GetRootPart()
				if car.Anchored then
					return
				end
				if not isnetworkowner(car) then
					return
				end
				CurrentVelocity = CurrentVelocity:Lerp(
                    BaseVelocity,
                    math.clamp(delta * FlightAcceleration, 0, 1)
                )
				car.Velocity = CurrentVelocity + Vector3.new(0, 2, 0)
				if car ~= UserRootPart then
					car.RotVelocity = Vector3.new(0, 0, 0)
					car.CFrame = car.CFrame:Lerp(CFrame.lookAt(
                        car.Position,
                        car.Position + CurrentVelocity + Camera.CFrame.LookVector
                    ), math.clamp(delta * TurnSpeed, 0, 1))
				end
			end
		end
		UserInputService.InputBegan:Connect(function(userInput, gameProcessed)
			if gameProcessed then
				return
			end
			if userInput.KeyCode == FlyKey then
				if Connection then
					Connection:Disconnect()
					Connection = nil
				else
					CurrentVelocity = UserRootPart.Velocity
					Connection = RunService.Heartbeat:Connect(Flight)
				end
			end
		end)
	end)
	main:Button("Collect Daily Rewards", function()
		local args = {
			[1] = "DailyRewards"
		}
		game:GetService("ReplicatedStorage").Remotes.CollectChest:InvokeServer(unpack(args))
	end)
	main:Button("Collect Group Rewards", function()
		local args = {
			[1] = "GroupRewards"
		}
		game:GetService("ReplicatedStorage").Remotes.CollectChest:InvokeServer(unpack(args))
	end)
        
        -- Autofarm
	local autofarm = Window:Tab("Autofarm")
	autofarm:Toggle("Auto Click", false, function(v)
		getgenv().autoclick = v
		while true do
			wait()
			if not getgenv().autoclick then
				return
			end
			local args = {
				[1] = false,
				[2] = "Clicker!"
			}
			game:GetService("ReplicatedStorage").Remotes.ClickRemote:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Auto Rebirth: 1", false, function(v)
		getgenv().autorebirth1 = v
		while true do
			wait()
			if not getgenv().autorebirth1 then
				return
			end
			local args = {
				[1] = 1
			}
			game:GetService("ReplicatedStorage").Remotes.RebirthRemote:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Auto Rebirth: 5", false, function(v)
		getgenv().autorebirth5 = v
		while true do
			wait()
			if not getgenv().autorebirth5 then
				return
			end
			local args = {
				[1] = 5
			}
			game:GetService("ReplicatedStorage").Remotes.RebirthRemote:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Auto Rebirth: 15", false, function(v)
		getgenv().autorebirth15 = v
		while true do
			wait()
			if not getgenv().autorebirth15 then
				return
			end
			local args = {
				[1] = 15
			}
			game:GetService("ReplicatedStorage").Remotes.RebirthRemote:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Auto Rebirth: 25", false, function(v)
		getgenv().autorebirth25 = v
		while true do
			wait()
			if not getgenv().autorebirth25 then
				return
			end
			local args = {
				[1] = 25
			}
			game:GetService("ReplicatedStorage").Remotes.RebirthRemote:FireServer(unpack(args))
		end
	end)
	autofarm:Button("Anti AFK", function()
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
			vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
			wait(1)
			vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		end)
	end)
        
        -- Teleports
	local teleports = Window:Tab("Teleports")
	teleports:Button("Spawn", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(444.636, -1.4, 506.873)
	end)
	teleports:Button("Pirate Docks", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(281.744, -2.4, -984.416)
	end)
	teleports:Button("Purple Forest", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(275.344, -1.4, -1594.671)
	end)
	teleports:Button("Shinobi Village", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(366.278, -2.4, -2269.633)
	end)
	teleports:Button("Spirit Society", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(288.508, -2.248, -3056.646)
	end)
	teleports:Button("Walled City", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(313.803, -19.261, -3972.932)
	end)
	teleports:Button("Narmek", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-713.768, 14.574, 1585.878)
	end)
	teleports:Button("Hero Academy", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1012.135, -2.1, -501.796)
	end)
	teleports:Button("Stand City", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(247.096, -1.19, -4721.25)
	end)
	teleports:Button("Hunter Kingdom", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1345.698, -17.55, 1965.871)
	end)
	teleports:Button("Jiu-Jitsu Sewers", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1007.598, -36.778, -855.524)
	end)
	teleports:Button("The Sin Zone", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-563.991, -105.474, 2637.173)
	end)
	teleports:Button("World Of Fate", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1641.042, 68.2, -832.344)
	end)
        
        -- Autoboss
	local autoboss = Window:Tab("Autoboss")
	autoboss:Toggle("Evil Vegete", false, function(v)
		getgenv().evilvegete = v
		while true do
			wait()
			if not getgenv().evilvegete then
				return
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(104.273, 18.799, 745.768)
			wait()
			local args = {
				[1] = false,
				[2] = false,
				[3] = "Clicker!",
				[4] = "Evil Vegete"
			}
			game:GetService("ReplicatedStorage").Remotes.ClickRemote:FireServer(unpack(args))
		end
	end)
	autoboss:Toggle("Long Nose", false, function(v)
		getgenv().longnose = v
		while true do
			wait()
			if not getgenv().longnose then
				return
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(283.971, -2.406, -567.321)
			wait()
			local args = {
				[1] = false,
				[2] = false,
				[3] = "Clicker!",
				[4] = "Long Nose"
			}
			game:GetService("ReplicatedStorage").Remotes.ClickRemote:FireServer(unpack(args))
		end
	end)
	autoboss:Toggle("Akazaki", false, function(v)
		getgenv().akazaki = v
		while true do
			wait()
			if not getgenv().akazaki then
				return
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3.7, 0.744, -1483.988)
			wait()
			local args = {
				[1] = false,
				[2] = false,
				[3] = "Clicker!",
				[4] = "Akazaki"
			}
			game:GetService("ReplicatedStorage").Remotes.ClickRemote:FireServer(unpack(args))
		end
	end)
	autoboss:Toggle("Serparu", false, function(v)
		getgenv().separu = v
		while true do
			wait()
			if not getgenv().separu then
				return
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(557.145, -0.036, -2367.525)
			wait()
			local args = {
				[1] = false,
				[2] = false,
				[3] = "Clicker!",
				[4] = "Serparu"
			}
			game:GetService("ReplicatedStorage").Remotes.ClickRemote:FireServer(unpack(args))
		end
	end)
	autoboss:Toggle("Grim", false, function(v)
		getgenv().grim = v
		while true do
			wait()
			if not getgenv().grim then
				return
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(323.769, -0.399, -3264.148)
			wait()
			local args = {
				[1] = false,
				[2] = false,
				[3] = "Clicker!",
				[4] = "Grim"
			}
			game:GetService("ReplicatedStorage").Remotes.ClickRemote:FireServer(unpack(args))
		end
	end)
	autoboss:Toggle("Freezie", false, function(v)
		getgenv().freezie = v
		while true do
			wait()
			if not getgenv().freezie then
				return
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-829.33, 15.642, 1750.143)
			wait()
			local args = {
				[1] = false,
				[2] = false,
				[3] = "Clicker!",
				[4] = "Freezie"
			}
			game:GetService("ReplicatedStorage").Remotes.ClickRemote:FireServer(unpack(args))
		end
	end)
	autoboss:Toggle("The One", false, function(v)
		getgenv().theone = v
		while true do
			wait()
			if not getgenv().theone then
				return
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(887.227, -0.526, -439.146)
			wait()
			local args = {
				[1] = false,
				[2] = false,
				[3] = "Clicker!",
				[4] = "The One"
			}
			game:GetService("ReplicatedStorage").Remotes.ClickRemote:FireServer(unpack(args))
		end
	end)
	autoboss:Toggle("Brand", false, function(v)
		getgenv().brand = v
		while true do
			wait()
			if not getgenv().brand then
				return
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-45.353, -0.256, -4711.306)
			wait()
			local args = {
				[1] = false,
				[2] = false,
				[3] = "Clicker!",
				[4] = "Brand"
			}
			game:GetService("ReplicatedStorage").Remotes.ClickRemote:FireServer(unpack(args))
		end
	end)
	autoboss:Toggle("Chima King", false, function(v)
		getgenv().chimaking = v
		while true do
			wait()
			if not getgenv().chimaking then
				return
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1222.538, -16.197, 2089.668)
			wait()
			local args = {
				[1] = false,
				[2] = false,
				[3] = "Clicker!",
				[4] = "Chima King"
			}
			game:GetService("ReplicatedStorage").Remotes.ClickRemote:FireServer(unpack(args))
		end
	end)
	autoboss:Toggle("Hito", false, function(v)
		getgenv().hito = v
		while true do
			wait()
			if not getgenv().hito then
				return
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1249.926, -30.176, -861.791)
			wait()
			local args = {
				[1] = false,
				[2] = false,
				[3] = "Clicker!",
				[4] = "Hito"
			}
			game:GetService("ReplicatedStorage").Remotes.ClickRemote:FireServer(unpack(args))
		end
	end)
	autoboss:Toggle("Demon King", false, function(v)
		getgenv().demonking = v
		while true do
			wait()
			if not getgenv().demonking then
				return
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-814.522, -103.774, 2688.453)
			wait()
			local args = {
				[1] = false,
				[2] = false,
				[3] = "Clicker!",
				[4] = "Demon King"
			}
			game:GetService("ReplicatedStorage").Remotes.ClickRemote:FireServer(unpack(args))
		end
	end)
	autoboss:Toggle("The Priest", false, function(v)
		getgenv().thepriest = v
		while true do
			wait()
			if not getgenv().thepriest then
				return
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1863.426, 70.474, -868.796)
			wait()
			local args = {
				[1] = false,
				[2] = false,
				[3] = "Clicker!",
				[4] = "The Priest"
			}
			game:GetService("ReplicatedStorage").Remotes.ClickRemote:FireServer(unpack(args))
		end
	end)
        
        -- AutoOpen
	local autoopen = Window:Tab("AutoOpen")
	autoopen:Toggle("Dragon Star", false, function(v)
		getgenv().dragonstaregg = v
		while true do
			wait()
			if not getgenv().dragonstaregg then
				return
			end
			local args = {
				[1] = "Dragon Star",
				[2] = false,
				[3] = false
			}
			game:GetService("ReplicatedStorage").Remotes.OpenEgg:InvokeServer(unpack(args))
		end
	end)
	autoopen:Toggle("Demon Star", false, function(v)
		getgenv().dragonstaregg = v
		while true do
			wait()
			if not getgenv().dragonstaregg then
				return
			end
			local args = {
				[1] = "Demon Star",
				[2] = false,
				[3] = false
			}
			game:GetService("ReplicatedStorage").Remotes.OpenEgg:InvokeServer(unpack(args))
		end
	end)
	autoopen:Toggle("Pirate Star", false, function(v)
		getgenv().piratestaregg = v
		while true do
			wait()
			if not getgenv().piratestaregg then
				return
			end
			local args = {
				[1] = "Pirate Star",
				[2] = false,
				[3] = false
			}
			game:GetService("ReplicatedStorage").Remotes.OpenEgg:InvokeServer(unpack(args))
		end
	end)
	autoopen:Toggle("Slayer Star", false, function(v)
		getgenv().slayerstaregg = v
		while true do
			wait()
			if not getgenv().slayerstaregg then
				return
			end
			local args = {
				[1] = "Slayer Star",
				[2] = false,
				[3] = false
			}
			game:GetService("ReplicatedStorage").Remotes.OpenEgg:InvokeServer(unpack(args))
		end
	end)
	autoopen:Toggle("Nine Talled Star", false, function(v)
		getgenv().ninetailedstaregg = v
		while true do
			wait()
			if not getgenv().ninetailedstaregg then
				return
			end
			local args = {
				[1] = "Nine Tailed Star",
				[2] = false,
				[3] = false
			}
			game:GetService("ReplicatedStorage").Remotes.OpenEgg:InvokeServer(unpack(args))
		end
	end)
	autoopen:Toggle("Spirit Star", false, function(v)
		getgenv().spiritstaregg = v
		while true do
			wait()
			if not getgenv().spiritegg then
				return
			end
			local args = {
				[1] = "Spirit Star",
				[2] = false,
				[3] = false
			}
			game:GetService("ReplicatedStorage").Remotes.OpenEgg:InvokeServer(unpack(args))
		end
	end)
	autoopen:Toggle("Walled Star", false, function(v)
		getgenv().walledstaregg = v
		while true do
			wait()
			if not getgenv().walledstaregg then
				return
			end
			local args = {
				[1] = "Walled Star",
				[2] = false,
				[3] = false
			}
			game:GetService("ReplicatedStorage").Remotes.OpenEgg:InvokeServer(unpack(args))
		end
	end)
	autoopen:Toggle("Narmekian Star", false, function(v)
		getgenv().narmekianstaregg = v
		while true do
			wait()
			if not getgenv().narmekianstaregg then
				return
			end
			local args = {
				[1] = "Narmekian Star",
				[2] = false,
				[3] = false
			}
			game:GetService("ReplicatedStorage").Remotes.OpenEgg:InvokeServer(unpack(args))
		end
	end)
	autoopen:Toggle("Quirky Star", false, function(v)
		getgenv().quirkystaregg = v
		while true do
			wait()
			if not getgenv().quirkystaregg then
				return
			end
			local args = {
				[1] = "Quirky Star",
				[2] = false,
				[3] = false
			}
			game:GetService("ReplicatedStorage").Remotes.OpenEgg:InvokeServer(unpack(args))
		end
	end)
	autoopen:Toggle("Crazy Star", false, function(v)
		getgenv().crazystaregg = v
		while true do
			wait()
			if not getgenv().crazystaregg then
				return
			end
			local args = {
				[1] = "Crazy Star",
				[2] = false,
				[3] = false
			}
			game:GetService("ReplicatedStorage").Remotes.OpenEgg:InvokeServer(unpack(args))
		end
	end)
	autoopen:Toggle("Hunter Star", false, function(v)
		getgenv().hunterstaregg = v
		while true do
			wait()
			if not getgenv().hunterstaregg then
				return
			end
			local args = {
				[1] = "Hunter Star",
				[2] = false,
				[3] = false
			}
			game:GetService("ReplicatedStorage").Remotes.OpenEgg:InvokeServer(unpack(args))
		end
	end)
	autoopen:Toggle("Fighting Star", false, function(v)
		getgenv().fightingstaregg = v
		while true do
			wait()
			if not getgenv().fightingstaregg then
				return
			end
			local args = {
				[1] = "Fighting Star",
				[2] = false,
				[3] = false
			}
			game:GetService("ReplicatedStorage").Remotes.OpenEgg:InvokeServer(unpack(args))
		end
	end)
	autoopen:Toggle("Sinful Star", false, function(v)
		getgenv().sinfulstaregg = v
		while true do
			wait()
			if not getgenv().sinfulstaregg then
				return
			end
			local args = {
				[1] = "Sinful Star",
				[2] = false,
				[3] = false
			}
			game:GetService("ReplicatedStorage").Remotes.OpenEgg:InvokeServer(unpack(args))
		end
	end)
	autoopen:Toggle("Fatest Star", false, function(v)
		getgenv().fatestaregg = v
		while true do
			wait()
			if not getgenv().fatestaregg then
				return
			end
			local args = {
				[1] = "Fate Star",
				[2] = false,
				[3] = false
			}
			game:GetService("ReplicatedStorage").Remotes.OpenEgg:InvokeServer(unpack(args))
		end
	end)
elseif game.PlaceId == 3101667897 then
	print("Loaded")
	wait()
	print("For help join discord.gg/8ps4575qtH")
	local Library = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()
	local Window = Library:Window("MudWare Reborn v4.4.2.3.1 - Legends Of Speed", Color3.fromRGB(95, 65, 10), Enum.KeyCode.RightShift)
        
        
        -- MAIN
	local main = Window:Tab("Main")
	main:Slider("Jump Power", 50, 300, 0, function(v)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
	end)
	main:Button("[F] Fly", function()
		local FlyKey = Enum.KeyCode.F
		local SpeedKey = Enum.KeyCode.LeftControl
		local SpeedKeyMultiplier = 3
		local FlightSpeed = 256
		local FlightAcceleration = 4
		local TurnSpeed = 16
		local UserInputService = game:GetService("UserInputService")
		local StarterGui = game:GetService("StarterGui")
		local RunService = game:GetService("RunService")
		local Players = game:GetService("Players")
		local User = Players.LocalPlayer
		local Camera = workspace.CurrentCamera
		local UserCharacter = nil
		local UserRootPart = nil
		local Connection = nil
		workspace.Changed:Connect(function()
			Camera = workspace.CurrentCamera
		end)
		local setCharacter = function(c)
			UserCharacter = c
			UserRootPart = c:WaitForChild("HumanoidRootPart")
		end
		User.CharacterAdded:Connect(setCharacter)
		if User.Character then
			setCharacter(User.Character)
		end
		local CurrentVelocity = Vector3.new(0, 0, 0)
		local Flight = function(delta)
			local BaseVelocity = Vector3.new(0, 0, 0)
			if not UserInputService:GetFocusedTextBox() then
				if UserInputService:IsKeyDown(Enum.KeyCode.W) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.LookVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.A) then
					BaseVelocity = BaseVelocity - (Camera.CFrame.RightVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.S) then
					BaseVelocity = BaseVelocity - (Camera.CFrame.LookVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.D) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.RightVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.UpVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(SpeedKey) then
					BaseVelocity = BaseVelocity * SpeedKeyMultiplier
				end
			end
			if UserRootPart then
				local car = UserRootPart:GetRootPart()
				if car.Anchored then
					return
				end
				if not isnetworkowner(car) then
					return
				end
				CurrentVelocity = CurrentVelocity:Lerp(
                    BaseVelocity,
                    math.clamp(delta * FlightAcceleration, 0, 1)
                )
				car.Velocity = CurrentVelocity + Vector3.new(0, 2, 0)
				if car ~= UserRootPart then
					car.RotVelocity = Vector3.new(0, 0, 0)
					car.CFrame = car.CFrame:Lerp(CFrame.lookAt(
                        car.Position,
                        car.Position + CurrentVelocity + Camera.CFrame.LookVector
                    ), math.clamp(delta * TurnSpeed, 0, 1))
				end
			end
		end
		UserInputService.InputBegan:Connect(function(userInput, gameProcessed)
			if gameProcessed then
				return
			end
			if userInput.KeyCode == FlyKey then
				if Connection then
					Connection:Disconnect()
					Connection = nil
				else
					CurrentVelocity = UserRootPart.Velocity
					Connection = RunService.Heartbeat:Connect(Flight)
				end
			end
		end)
	end)
	main:Button("Anti AFK", function()
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
			vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
			wait(1)
			vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		end)
	end)
	main:Toggle("Auto Rebirth", false, function(v)
		getgenv().autorebirth = v
		while true do
			wait()
			if not getgenv().autorebirth then
				return
			end
			local args = {
				[1] = "rebirthRequest"
			}
			game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer(unpack(args))
		end
	end)
	main:Button("Collect All Chests", function()
		local args = {
			[1] = "Magma Chest"
		}
		game:GetService("ReplicatedStorage").rEvents.checkChestRemote:InvokeServer(unpack(args))
		wait(0.3)
		local args2 = {
			[1] = "Enchanted Chest"
		}
		game:GetService("ReplicatedStorage").rEvents.checkChestRemote:InvokeServer(unpack(args2))
		wait(0.3)
		local args3 = {
			[1] = "Golden Chest"
		}
		game:GetService("ReplicatedStorage").rEvents.checkChestRemote:InvokeServer(unpack(args3))
		wait(0.3)
		local args4 = {
			[1] = "groupRewards"
		}
		game:GetService("ReplicatedStorage").rEvents.groupRemote:InvokeServer(unpack(args4))
	end)
        
        
        -- autofarm
	local autofarm = Window:Tab("Autofarm")
	autofarm:Toggle("Main City: Yellow Orbs", false, function(v)
		getgenv().cityyelloworbs = v
		while true do
			wait()
			if not getgenv().cityyelloworbs then
				return
			end
			local args = {
				[1] = "collectOrb",
				[2] = "Yellow Orb",
				[3] = "City"
			}
			game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Main City: Orange Orbs", false, function(v)
		getgenv().cityorangeorb = v
		while true do
			wait()
			if not getgenv().cityorangeorb then
				return
			end
			local args = {
				[1] = "collectOrb",
				[2] = "Orange Orb",
				[3] = "City"
			}
			game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Main City: Blue Orbs", false, function(v)
		getgenv().cityblueorb = v
		while true do
			wait()
			if not getgenv().cityblueorb then
				return
			end
			local args = {
				[1] = "collectOrb",
				[2] = "Blue Orb",
				[3] = "City"
			}
			game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Main City: Red Orbs", false, function(v)
		getgenv().cityredorbs = v
		while true do
			wait()
			if not getgenv().cityredorbs then
				return
			end
			local args = {
				[1] = "collectOrb",
				[2] = "Red Orb",
				[3] = "City"
			}
			game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Main City: Gems", false, function(v)
		getgenv().citygems = v
		while true do
			wait()
			if not getgenv().citygems then
				return
			end
			local args = {
				[1] = "collectOrb",
				[2] = "Gem",
				[3] = "City"
			}
			game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Snow City: Yellow Orbs", false, function(v)
		getgenv().snowyelloworb = v
		while true do
			wait()
			if not getgenv().snowyelloworb then
				return
			end
			local args = {
				[1] = "collectOrb",
				[2] = "Yellow Orb",
				[3] = "Snow City"
			}
			game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Snow City: Orange Orbs", false, function(v)
		getgenv().snoworangeorb = v
		while true do
			wait()
			if not getgenv().snoworangeorb then
				return
			end
			local args = {
				[1] = "collectOrb",
				[2] = "Orange Orb",
				[3] = "Snow City"
			}
			game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Snow City: Blue Orbs", false, function(v)
		getgenv().snowblueorb = v
		while true do
			wait()
			if not getgenv().snowblueorb then
				return
			end
			local args = {
				[1] = "collectOrb",
				[2] = "Blue Orb",
				[3] = "Snow City"
			}
			game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Snow City: Red Orbs", false, function(v)
		getgenv().snowredorb = v
		while true do
			wait()
			if not getgenv().snowredorb then
				return
			end
			local args = {
				[1] = "collectOrb",
				[2] = "Red Orb",
				[3] = "Snow City"
			}
			game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Snow City: Gems", false, function(v)
		getgenv().snowgem = v
		while true do
			wait()
			if not getgenv().snowgem then
				return
			end
			local args = {
				[1] = "collectOrb",
				[2] = "Gem",
				[3] = "Snow City"
			}
			game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Magma City: Yellow Orbs", false, function(v)
		getgenv().magmayellow = v
		while true do
			wait()
			if not getgenv().magmayellow then
				return
			end
			local args = {
				[1] = "collectOrb",
				[2] = "Yellow Orb",
				[3] = "Magma City"
			}
			game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Magma City: Orange Orbs", false, function(v)
		getgenv().magmaorange = v
		while true do
			wait()
			if not getgenv().magmaorange then
				return
			end
			local args = {
				[1] = "collectOrb",
				[2] = "Orange Orb",
				[3] = "Magma City"
			}
			game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Magma City: Blue Orbs", false, function(v)
		getgenv().magmablue = v
		while true do
			wait()
			if not getgenv().magmablue then
				return
			end
			local args = {
				[1] = "collectOrb",
				[2] = "Blue Orb",
				[3] = "Magma City"
			}
			game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Magma City: Red Orbs", false, function(v)
		getgenv().magmared = v
		while true do
			wait()
			if not getgenv().magmared then
				return
			end
			local args = {
				[1] = "collectOrb",
				[2] = "Red Orb",
				[3] = "Magma City"
			}
			game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Magma City: Gems", false, function(v)
		getgenv().magmagem = v
		while true do
			wait()
			if not getgenv().magmagem then
				return
			end
			local args = {
				[1] = "collectOrb",
				[2] = "Gem",
				[3] = "Magma City"
			}
			game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Legens Highways: Yellow Orbs", false, function(v)
		getgenv().legendsyellow = v
		while true do
			wait()
			if not getgenv().legendsyellow then
				return
			end
			local args = {
				[1] = "collectOrb",
				[2] = "Yellow Orb",
				[3] = "Legends Highway"
			}
			game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Legens Highways: Orange Orbs", false, function(v)
		getgenv().legendsorange = v
		while true do
			wait()
			if not getgenv().legendsorange then
				return
			end
			local args = {
				[1] = "collectOrb",
				[2] = "Orange Orb",
				[3] = "Legends Highway"
			}
			game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Legens Highways: Orange Orbs", false, function(v)
		getgenv().legendsorange = v
		while true do
			wait()
			if not getgenv().legendsorange then
				return
			end
			local args = {
				[1] = "collectOrb",
				[2] = "Orange Orb",
				[3] = "Legends Highway"
			}
			game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Legens Highways: Red Orbs", false, function(v)
		getgenv().legendsred = v
		while true do
			wait()
			if not getgenv().legendsred then
				return
			end
			local args = {
				[1] = "collectOrb",
				[2] = "Red Orb",
				[3] = "Legends Highway"
			}
			game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Legens Highways: Gems", false, function(v)
		getgenv().legendsgem = v
		while true do
			wait()
			if not getgenv().legendsgem then
				return
			end
			local args = {
				[1] = "collectOrb",
				[2] = "Gem",
				[3] = "Legends Highway"
			}
			game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
		end
	end)
        
        -- teleports
	local teleports = Window:Tab("Teleports")
	teleports:Button("Main City", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-53, 1, -40)
	end)
	teleports:Button("Snow City", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-144.473, 1.05, 2567.395)
	end)
	teleports:Button("Magma City", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2468.636, 1.1, 4712.829)
	end)
	teleports:Button("Legends Highway", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3673.715, 68.58, 5590.854)
	end)
        
        -- autoopen
	local autoopen = Window:Tab("Auto Open")
	autoopen:Toggle("Red Crystal", false, function(v)
		getgenv().redcrystal = v
		while true do
			wait(2)
			if not getgenv().redcrystal then
				return
			end
			local args = {
				[1] = "openCrystal",
				[2] = "Red Crystal"
			}
			game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
		end
	end)
	autoopen:Toggle("Blue Crystal", false, function(v)
		getgenv().bluecrystal = v
		while true do
			wait(2)
			if not getgenv().bluecrystal then
				return
			end
			local args = {
				[1] = "openCrystal",
				[2] = "Blue Crystal"
			}
			game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
		end
	end)
	autoopen:Toggle("Purple Crystal", false, function(v)
		getgenv().purplecrystal = v
		while true do
			wait(2)
			if not getgenv().purplecrystal then
				return
			end
			local args = {
				[1] = "openCrystal",
				[2] = "Purple Crystal"
			}
			game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
		end
	end)
	autoopen:Toggle("Yellow Crystal", false, function(v)
		getgenv().yellowcrystal = v
		while true do
			wait(2)
			if not getgenv().yellowcrystal then
				return
			end
			local args = {
				[1] = "openCrystal",
				[2] = "Yellow Crystal"
			}
			game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
		end
	end)
	autoopen:Toggle("Lightning Crystal", false, function(v)
		getgenv().lightningcrystal = v
		while true do
			wait(2)
			if not getgenv().lightningcrystal then
				return
			end
			local args = {
				[1] = "openCrystal",
				[2] = "Lightning Crystal"
			}
			game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
		end
	end)
	autoopen:Toggle("Snow Crystal", false, function(v)
		getgenv().snowcrystal = v
		while true do
			wait(2)
			if not getgenv().snowcrystal then
				return
			end
			local args = {
				[1] = "openCrystal",
				[2] = "Snow Crystal"
			}
			game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
		end
	end)
	autoopen:Toggle("Inferno Crystal", false, function(v)
		getgenv().infernocrystal = v
		while true do
			wait(2)
			if not getgenv().infernocrystal then
				return
			end
			local args = {
				[1] = "openCrystal",
				[2] = "Inferno Crystal"
			}
			game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
		end
	end)
	autoopen:Toggle("Lava Crystal", false, function(v)
		getgenv().lavacrystal = v
		while true do
			wait(2)
			if not getgenv().lavacrystal then
				return
			end
			local args = {
				[1] = "openCrystal",
				[2] = "Lava Crystal"
			}
			game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
		end
	end)
	autoopen:Toggle("Electro Crystal", false, function(v)
		getgenv().electrocrystal = v
		while true do
			wait(2)
			if not getgenv().electrocrystal then
				return
			end
			local args = {
				[1] = "openCrystal",
				[2] = "Electro Legends Crystal"
			}
			game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
		end
	end)
elseif game.PlaceId == 7989049516 then
	print("Loaded")
	wait()
	print("For help join discord.gg/8ps4575qtH")
	local Library = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()
	local Window = Library:Window("MudWare Reborn v4.4.2.3.1 - Clicker Simulator!", Color3.fromRGB(95, 65, 10), Enum.KeyCode.RightShift)
        
        
        -- MAIN
	local main = Window:Tab("Main")
	main:Slider("Walkspeed", 16, 150, 0, function(v)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
	end)
	main:Slider("Jump Power", 50, 300, 0, function(v)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
	end)
	main:Button("[F] Fly", function()
		local FlyKey = Enum.KeyCode.F
		local SpeedKey = Enum.KeyCode.LeftControl
		local SpeedKeyMultiplier = 3
		local FlightSpeed = 256
		local FlightAcceleration = 4
		local TurnSpeed = 16
		local UserInputService = game:GetService("UserInputService")
		local StarterGui = game:GetService("StarterGui")
		local RunService = game:GetService("RunService")
		local Players = game:GetService("Players")
		local User = Players.LocalPlayer
		local Camera = workspace.CurrentCamera
		local UserCharacter = nil
		local UserRootPart = nil
		local Connection = nil
		workspace.Changed:Connect(function()
			Camera = workspace.CurrentCamera
		end)
		local setCharacter = function(c)
			UserCharacter = c
			UserRootPart = c:WaitForChild("HumanoidRootPart")
		end
		User.CharacterAdded:Connect(setCharacter)
		if User.Character then
			setCharacter(User.Character)
		end
		local CurrentVelocity = Vector3.new(0, 0, 0)
		local Flight = function(delta)
			local BaseVelocity = Vector3.new(0, 0, 0)
			if not UserInputService:GetFocusedTextBox() then
				if UserInputService:IsKeyDown(Enum.KeyCode.W) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.LookVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.A) then
					BaseVelocity = BaseVelocity - (Camera.CFrame.RightVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.S) then
					BaseVelocity = BaseVelocity - (Camera.CFrame.LookVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.D) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.RightVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.UpVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(SpeedKey) then
					BaseVelocity = BaseVelocity * SpeedKeyMultiplier
				end
			end
			if UserRootPart then
				local car = UserRootPart:GetRootPart()
				if car.Anchored then
					return
				end
				if not isnetworkowner(car) then
					return
				end
				CurrentVelocity = CurrentVelocity:Lerp(
                    BaseVelocity,
                    math.clamp(delta * FlightAcceleration, 0, 1)
                )
				car.Velocity = CurrentVelocity + Vector3.new(0, 2, 0)
				if car ~= UserRootPart then
					car.RotVelocity = Vector3.new(0, 0, 0)
					car.CFrame = car.CFrame:Lerp(CFrame.lookAt(
                        car.Position,
                        car.Position + CurrentVelocity + Camera.CFrame.LookVector
                    ), math.clamp(delta * TurnSpeed, 0, 1))
				end
			end
		end
		UserInputService.InputBegan:Connect(function(userInput, gameProcessed)
			if gameProcessed then
				return
			end
			if userInput.KeyCode == FlyKey then
				if Connection then
					Connection:Disconnect()
					Connection = nil
				else
					CurrentVelocity = UserRootPart.Velocity
					Connection = RunService.Heartbeat:Connect(Flight)
				end
			end
		end)
	end)
	main:Toggle("God Mod", false, function(state)
		if state then
			print("god mod: on")
			game.Players.LocalPlayer.SessionData.InSafezone.Value = true
		else
			print("god mod: off")
			game.Players.LocalPlayer.SessionData.InSafezone.Value = false
		end
	end)
	main:Button("Anti AFK", function()
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
			vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
			wait(1)
			vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		end)
	end)
        
        -- autofarm
	local autofarm = Window:Tab("Autofarm")
	autofarm:Toggle("Autofarm", false, function(v)
		local _speed = 500 -- lower if you are getting tp'd back (shouldn't happen)
		function tp(...)
			local plr = game.Players.LocalPlayer
			local args = {
				...
			}
			if typeof(args[1]) == "number" and args[2] and args[3] then
				args = Vector3.new(args[1], args[2], args[3])
			elseif typeof(args[1]) == "Vector3" then
				args = args[1]
			elseif typeof(args[1]) == "CFrame" then
				args = args[1].Position
			end
			local dist = (plr.Character.HumanoidRootPart.Position - args).Magnitude
			game:GetService("TweenService"):Create(
            plr.Character.HumanoidRootPart,
            TweenInfo.new(dist / _speed, Enum.EasingStyle.Linear),
            {
				CFrame = CFrame.new(args)
			}
        ):Play()
		end
		tp(CFrame.new(79.145, 659.729, -26.764))
		local BuildPart = Instance.new("Part", game.Workspace)
		BuildPart.Size = Vector3.new(30.987, 1, 29.217)
		BuildPart.Position = Vector3.new(79.145, 659.729, -26.764)
		BuildPart.Anchored = true
		BuildPart.CanCollide = false
		game.Players.LocalPlayer.Settings["Auto Punch"].Value = true
		wait(1.3)
		BuildPart.CanCollide = true
		getgenv().autofarm = v
		while true do
			wait()
			if not getgenv().autofarm then
				game.Players.LocalPlayer.Settings["Auto Punch"].Value = false
				wait(0.5)
				tp(CFrame.new(34.513, 5.433, -56.303))
				BuildPart:Destroy()
				return
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(79.851, 665.55, -27.597)
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.3"].knit.Services.PlayerService.RE.Punch:FireServer()
		end
		wait(0.1)
	end)
	autofarm:Toggle("Autorebirth", false, function(v)
		_G.autorebirth = state
		while true do
			wait()
			if not _G.autorebirth then
				game.Players.LocalPlayer.Settings["Auto Rebirth"].Value = false
				return
			end
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.3"].knit.Services.PlayerService.RE.Rebirth:FireServer()
			game.Players.LocalPlayer.Settings["Auto Rebirth"].Value = true
		end
	end)
	autofarm:Toggle("Auto Equip Best Pets", false, function(v)
		getgenv().autoequipbest = v
		while true do
			wait()
			if not getgenv().autoequipbest then
				return
			end
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.3"].knit.Services.PetService.RE.UnequipAll:FireServer()
			wait()
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.3"].knit.Services.PetService.RE.EquipBest:FireServer()
		end
	end)
        
        -- autoopen
	local autoopen = Window:Tab("AutoOpen")
	autoopen:Toggle("Common Egg", false, function(v)
		getgenv().commonegg = v
		while true do
			wait()
			if not getgenv().commonegg then
				return
			end
			local args = {
				[1] = "CommonEgg",
				[2] = false
			}
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.3"].knit.Services.PetService.RF.Hatch:InvokeServer(unpack(args))
		end
	end)
	autoopen:Toggle("Uncommon Egg", false, function(v)
		getgenv().uncommonegg = v
		while true do
			wait()
			if not getgenv().uncommonegg then
				return
			end
			local args = {
				[1] = "UncommonEgg",
				[2] = false
			}
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.3"].knit.Services.PetService.RF.Hatch:InvokeServer(unpack(args))
		end
	end)
	autoopen:Toggle("Rare Egg", false, function(v)
		getgenv().rareegg = v
		while true do
			wait()
			if not getgenv().rareegg then
				return
			end
			local args = {
				[1] = "RareEgg",
				[2] = false
			}
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.3"].knit.Services.PetService.RF.Hatch:InvokeServer(unpack(args))
		end
	end)
elseif game.PlaceId == 2248408710 then
	print("Loaded")
	wait()
	print("For help join discord.gg/8ps4575qtH")
	local Library = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()
	local Window = Library:Window("MudWare Reborn v4.4.2.3.1 - Destruction Simulator", Color3.fromRGB(95, 65, 10), Enum.KeyCode.RightShift)
        
        
        -- MAIN
	local main = Window:Tab("Main")
	main:Slider("Walkspeed", 16, 150, 0, function(v)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
	end)
	main:Button("[F] Fly", function()
		local FlyKey = Enum.KeyCode.F
		local SpeedKey = Enum.KeyCode.LeftControl
		local SpeedKeyMultiplier = 3
		local FlightSpeed = 256
		local FlightAcceleration = 4
		local TurnSpeed = 16
		local UserInputService = game:GetService("UserInputService")
		local StarterGui = game:GetService("StarterGui")
		local RunService = game:GetService("RunService")
		local Players = game:GetService("Players")
		local User = Players.LocalPlayer
		local Camera = workspace.CurrentCamera
		local UserCharacter = nil
		local UserRootPart = nil
		local Connection = nil
		workspace.Changed:Connect(function()
			Camera = workspace.CurrentCamera
		end)
		local setCharacter = function(c)
			UserCharacter = c
			UserRootPart = c:WaitForChild("HumanoidRootPart")
		end
		User.CharacterAdded:Connect(setCharacter)
		if User.Character then
			setCharacter(User.Character)
		end
		local CurrentVelocity = Vector3.new(0, 0, 0)
		local Flight = function(delta)
			local BaseVelocity = Vector3.new(0, 0, 0)
			if not UserInputService:GetFocusedTextBox() then
				if UserInputService:IsKeyDown(Enum.KeyCode.W) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.LookVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.A) then
					BaseVelocity = BaseVelocity - (Camera.CFrame.RightVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.S) then
					BaseVelocity = BaseVelocity - (Camera.CFrame.LookVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.D) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.RightVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.UpVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(SpeedKey) then
					BaseVelocity = BaseVelocity * SpeedKeyMultiplier
				end
			end
			if UserRootPart then
				local car = UserRootPart:GetRootPart()
				if car.Anchored then
					return
				end
				if not isnetworkowner(car) then
					return
				end
				CurrentVelocity = CurrentVelocity:Lerp(
                    BaseVelocity,
                    math.clamp(delta * FlightAcceleration, 0, 1)
                )
				car.Velocity = CurrentVelocity + Vector3.new(0, 2, 0)
				if car ~= UserRootPart then
					car.RotVelocity = Vector3.new(0, 0, 0)
					car.CFrame = car.CFrame:Lerp(CFrame.lookAt(
                        car.Position,
                        car.Position + CurrentVelocity + Camera.CFrame.LookVector
                    ), math.clamp(delta * TurnSpeed, 0, 1))
				end
			end
		end
		UserInputService.InputBegan:Connect(function(userInput, gameProcessed)
			if gameProcessed then
				return
			end
			if userInput.KeyCode == FlyKey then
				if Connection then
					Connection:Disconnect()
					Connection = nil
				else
					CurrentVelocity = UserRootPart.Velocity
					Connection = RunService.Heartbeat:Connect(Flight)
				end
			end
		end)
	end)
        
        -- autofarm
	local autofarm = Window:Tab("Autofarm")
	autofarm:Button("Max Level", function()
		local args = {
			[1] = "Levels",
			[2] = 600,
			[3] = 6
		}
		game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
		wait(0.1)
		game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
		wait(0.1)
		game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
		wait(0.1)
		game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
		wait(0.1)
		game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
		wait(0.1)
		game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
		wait(0.1)
		game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
		wait(0.1)
		game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
		wait(0.1)
		game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
		wait(0.1)
		game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
		wait(0.1)
		game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
		wait(0.1)
		game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
		wait(0.1)
		game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
		wait(0.1)
		game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
		wait(0.1)
		game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
		wait(0.1)
		game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
		wait(0.1)
		game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
		wait(0.1)
		game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
		wait(0.1)
		game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
		wait(0.1)
	end)
	autofarm:Toggle("Inf Coins", false, function(v)
		getgenv().infcoins = v
		while true do
			wait(0.2)
			if not getgenv().infcoins then
				return
			end
			local args = {
				[1] = "Coins",
				[2] = 600,
				[3] = 10000
			}
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
		end
	end)
	autofarm:Toggle("Inf Coins Advanced", false, function(v)
		getgenv().advanced = v
		while true do
			wait()
			if not getgenv().advanced then
				return
			end
			local args = {
				[1] = "Coins",
				[2] = 600,
				[3] = 99999999
			}
			game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
		end
	end)
elseif game.PlaceId == 3527629287 then
	print("Loaded")
	wait()
	print("For help join discord.gg/8ps4575qtH")
	local Library = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()
	local Window = Library:Window("MudWare Reborn v4.4.2.3.1 - Big Paintball", Color3.fromRGB(95, 65, 10), Enum.KeyCode.RightShift)
	Function = {
		Noclip = false,
	}
	local RunServiceStepped
	RunServiceStepped = game:GetService("RunService").Stepped:connect(function()
		if Function["Noclip"] == true then
			game.Players.LocalPlayer.Character.Head.CanCollide = false
			game.Players.LocalPlayer.Character.LowerTorso.CanCollide = false
			game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
			game.Players.LocalPlayer.Character.UpperTorso.CanCollide = false
			game.Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
		end
	end)
            
            -- MAIN
	local main = Window:Tab("Main")
	main:Toggle("Speedhack", false, function(v)
		getgenv().speedhack = v
		while wait() do
			if getgenv().speedhack then
				game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 150
			else
				game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 16
			end
		end
	end)
	main:Toggle("SuperJump", false, function(v)
		getgenv().superjump = v
		while wait() do
			if not getgenv().superjump then
				game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
				return
			end
			game.Players.LocalPlayer.Character.Humanoid.JumpPower = 250
		end
	end)
	main:Button("[F] Fly", function()
		local FlyKey = Enum.KeyCode.F
		local SpeedKey = Enum.KeyCode.LeftControl
		local SpeedKeyMultiplier = 3
		local FlightSpeed = 256
		local FlightAcceleration = 4
		local TurnSpeed = 16
		local UserInputService = game:GetService("UserInputService")
		local StarterGui = game:GetService("StarterGui")
		local RunService = game:GetService("RunService")
		local Players = game:GetService("Players")
		local User = Players.LocalPlayer
		local Camera = workspace.CurrentCamera
		local UserCharacter = nil
		local UserRootPart = nil
		local Connection = nil
		workspace.Changed:Connect(function()
			Camera = workspace.CurrentCamera
		end)
		local setCharacter = function(c)
			UserCharacter = c
			UserRootPart = c:WaitForChild("HumanoidRootPart")
		end
		User.CharacterAdded:Connect(setCharacter)
		if User.Character then
			setCharacter(User.Character)
		end
		local CurrentVelocity = Vector3.new(0, 0, 0)
		local Flight = function(delta)
			local BaseVelocity = Vector3.new(0, 0, 0)
			if not UserInputService:GetFocusedTextBox() then
				if UserInputService:IsKeyDown(Enum.KeyCode.W) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.LookVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.A) then
					BaseVelocity = BaseVelocity - (Camera.CFrame.RightVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.S) then
					BaseVelocity = BaseVelocity - (Camera.CFrame.LookVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.D) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.RightVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
					BaseVelocity = BaseVelocity + (Camera.CFrame.UpVector * FlightSpeed)
				end
				if UserInputService:IsKeyDown(SpeedKey) then
					BaseVelocity = BaseVelocity * SpeedKeyMultiplier
				end
			end
			if UserRootPart then
				local car = UserRootPart:GetRootPart()
				if car.Anchored then
					return
				end
				if not isnetworkowner(car) then
					return
				end
				CurrentVelocity = CurrentVelocity:Lerp(
                        BaseVelocity,
                        math.clamp(delta * FlightAcceleration, 0, 1)
                    )
				car.Velocity = CurrentVelocity + Vector3.new(0, 2, 0)
				if car ~= UserRootPart then
					car.RotVelocity = Vector3.new(0, 0, 0)
					car.CFrame = car.CFrame:Lerp(CFrame.lookAt(
                            car.Position,
                            car.Position + CurrentVelocity + Camera.CFrame.LookVector
                        ), math.clamp(delta * TurnSpeed, 0, 1))
				end
			end
		end
		UserInputService.InputBegan:Connect(function(userInput, gameProcessed)
			if gameProcessed then
				return
			end
			if userInput.KeyCode == FlyKey then
				if Connection then
					Connection:Disconnect()
					Connection = nil
				else
					CurrentVelocity = UserRootPart.Velocity
					Connection = RunService.Heartbeat:Connect(Flight)
				end
			end
		end)
	end)
	main:Toggle("Noclip", false, function(state)
		if state then
			Function["Noclip"] = true
		else
			Function["Noclip"] = false
		end
	end)
	main:Button("Give All Guns", function()
		local library = require(game:GetService("ReplicatedStorage").Framework.Library)
		local env = getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.Scripts.Game["First Person Controller"])
		local unlock_all = true
		local old_fire = library.Network.Fire
		library.Network.Fire = newcclosure(function(self, ...)
			local args = {
				...
			}
			if unlock_all and tostring(self) == "Request Respawn" then
				args[1] = "1"
			end
			return old_fire(self, unpack(args))
		end)
		local old_own = env.DoesOwnGun
		env.DoesOwnGun = function(...)
			return (unlock_all and true) or old_own(...)
		end
		local old_own_gun = library.GunCmds.DoesOwnGun
		library.GunCmds.DoesOwnGun = newcclosure(function(self, ...)
			return (unlock_all and true) or old_own_gun(self, ...)
		end)
		for _, gun in next, library.Directory.Guns do
			gun["offsale"] = false
		end
	end)
            
            -- Aimbot
	local aimbot = Window:Tab("Aimbot")
	aimbot:Toggle("Silent Aim", false, function(state)
		getgenv().aimbot = state
		while true do
			wait()
			if not getgenv().aimbot then
				return
			end
			local TARGET = GetNearestPlayerToMouse()
			if (TARGET ~= false) then
				local AIM = TARGET.Character:FindFirstChild("Head")
				if AIM then
					CC.CoordinateFrame = CFrame.new(CC.CoordinateFrame.p, AIM.CFrame.p)
				end
			end
		end
	end)
            
            
            -- Guns
	local guns = Window:Tab("Guns")
	guns:Button("Inf Ammo", function()
		function modify(str, val)
			for i, v in pairs(getgc(true)) do
				if type(v) == "table" and rawget(v, str) then
					v[str] = val
				end
			end
		end
		modify("LoadedAmmo", math.huge)
	end)
	guns:Toggle("No wait", false, function(state)
		if state then
			for i, v in pairs(getgc(true)) do
				if type(v) == "table" and rawget(v, "velocity") then
					v.automatic = true
				end
			end
		else
			for i, v in pairs(getgc(true)) do
				if type(v) == "table" and rawget(v, "velocity") then
					v.automatic = false
				end
			end
		end
	end)
	guns:Toggle("Rapid Fire", false, function(state)
		function modify(str, val)
			for i, v in pairs(getgc(true)) do
				if type(v) == "table" and rawget(v, str) then
					v[str] = val
				end
			end
		end
		if state then
			modify("firerate", 0)
			modify("burstDelay", 0)
		else
			modify("firerate", 1)
			modify("burstDelay", 1)
		end
	end)
	guns:Toggle("No Recoil", false, function(state)
		function modify(str, val)
			for i, v in pairs(getgc(true)) do
				if type(v) == "table" and rawget(v, str) then
					v[str] = val
				end
			end
		end
		if state then
			modify("velocity", 1000000)
		else
			modify("velocity", 0)
		end
	end)
            
            -- ESP
	local esp = Window:Tab("ESP")
	esp:Button("Box", function()
		_G.TeamCheck = true
		local lplr = game.Players.LocalPlayer
		local camera = game:GetService("Workspace").CurrentCamera
		local CurrentCamera = workspace.CurrentCamera
		local worldToViewportPoint = CurrentCamera.worldToViewportPoint
		local HeadOff = Vector3.new(0, 0.5, 0)
		local LegOff = Vector3.new(0, 3, 0)
		for i, v in pairs(game.Players:GetChildren()) do
			local BoxOutline = Drawing.new("Square")
			BoxOutline.Visible = false
			BoxOutline.Color = Color3.new(255, 0, 0)
			BoxOutline.Thickness = 3
			BoxOutline.Transparency = 1
			BoxOutline.Filled = false
			local Box = Drawing.new("Square")
			Box.Visible = false
			Box.Color = Color3.new(255, 0, 0)
			Box.Thickness = 1
			Box.Transparency = 1
			Box.Filled = false
			Box.Transparency = 1
			function boxesp()
				game:GetService("RunService").RenderStepped:Connect(function()
					if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
						local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
						local RootPart = v.Character.HumanoidRootPart
						local Head = v.Character.Head
						local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
						local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + HeadOff)
						local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)
						if onScreen then
							BoxOutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
							BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
							BoxOutline.Visible = true
							Box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
							Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
							Box.Visible = true
							if _G.TeamCheck and v.TeamColor == lplr.TeamColor then
								Box.Visible = false
								BoxOutline.Visible = false
							else
								Box.Visible = true
								BoxOutline.Visible = false
							end
						else
							BoxOutline.Visible = false
							Box.Visible = false
						end
					else
						BoxOutline.Visible = false
						Box.Visible = false
					end
				end)
			end
			coroutine.wrap(boxesp)()
		end
		game.Players.PlayerAdded:Connect(function(v)
			local BoxOutline = Drawing.new("Square")
			BoxOutline.Visible = false
			BoxOutline.Color = Color3.new(255, 0, 0)
			BoxOutline.Thickness = 3
			BoxOutline.Transparency = 1
			BoxOutline.Filled = false
			local Box = Drawing.new("Square")
			Box.Visible = false
			Box.Color = Color3.new(255, 0, 0)
			Box.Thickness = 1
			Box.Transparency = 1
			Box.Filled = false
			Box.Transparency = 1
			function boxesp()
				game:GetService("RunService").RenderStepped:Connect(function()
					if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
						local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
						local RootPart = v.Character.HumanoidRootPart
						local Head = v.Character.Head
						local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
						local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + HeadOff)
						local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)
						if onScreen then
							BoxOutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
							BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
							BoxOutline.Visible = true
							Box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
							Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
							Box.Visible = true
							if _G.TeamCheck and v.TeamColor == lplr.TeamColor then
								Box.Visible = false
								BoxOutline.Visible = false
							else
								Box.Visible = true
								BoxOutline.Visible = false
							end
						else
							BoxOutline.Visible = false
							Box.Visible = false
						end
					else
						BoxOutline.Visible = false
						Box.Visible = false
					end
				end)
			end
			coroutine.wrap(boxesp)()
		end)
	end)
	esp:Button("Tracers", function()
		_G.TeamCheck = true
		_G.Tracers = true
		local lp = game.Players.LocalPlayer
		local camera = game:GetService("Workspace").CurrentCamera
		local CurrentCamera = workspace.CurrentCamera
		local worldToViewportPoint = CurrentCamera.worldToViewportPoint
		for i, v in pairs(game.Players:GetChildren()) do
			local Tracer = Drawing.new("Line")
			Tracer.Visible = false
			Tracer.Color = Color3.new(255, 0, 0)
			Tracer.Thickness = 1
			Tracer.Transparency = 1
			function traces()
				game:GetService("RunService").RenderStepped:Connect(function()
					if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lp and v.Character.Humanoid.Health > 0 then
						local Vector, OnScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
						if OnScreen then
							Tracer.From  = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
							Tracer.To = Vector2.new(Vector.X, Vector.Y)
							if _G.TeamCheck and v.TeamColor == lp.TeamColor then
								Tracer.Visible = false
							else
								Tracer.Visible = true
							end
						else
							Tracer.Visible = false
						end
					else
						Tracer.Visible = false
					end
					if not _G.Tracers == true then
						Tracers.Visible = false
					end
				end)
			end
			coroutine.wrap(traces)()
		end
		game.Players.PlayerAdded:Connect(function(v)
			local Tracer = Drawing.new("Line")
			Tracer.Visible = false
			Tracer.Color = Color3.new(255, 0, 0)
			Tracer.Thickness = 1
			Tracer.Transparency = 1
			function traces()
				game:GetService("RunService").RenderStepped:Connect(function()
					if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lp and v.Character.Humanoid.Health > 0 then
						local Vector, OnScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
						if OnScreen then
							Tracer.From  = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
							Tracer.To = Vector2.new(Vector.X, Vector.Y)
							if _G.TeamCheck and v.TeamColor == lp.TeamColor then
								Tracer.Visible = false
							else
								Tracer.Visible = true
							end
						else
							Tracer.Visible = false
						end
					else
						Tracer.Visible = false
					end
					if _G.Tracers == false then
						Tracer.Visible = false
					end
				end)
			end
			coroutine.wrap(traces)()
		end)
	end)
	esp:Toggle("No TeamCheck(FFA)", false, function(state)
		if state then
			_G.TeamCheck = false
		else
			_G.TeamCheck = true
		end
	end)
            
            -- AUTO
	local auto = Window:Tab("Auto")
	auto:Toggle("Auto Drone", false, function(v)
		getgenv().autodrone = v
		while true do
			wait()
			if not getgenv().autodrone then
				return
			end
			local args = {
				[1] = {}
			}
			workspace.__THINGS.__REMOTES:FindFirstChild("activate drone"):FireServer(unpack(args))
		end
	end)
	auto:Toggle("Auto Nuke", false, function(v)
		getgenv().autonuke = v
		while true do
			wait()
			if not getgenv().autonuke then
				return
			end
			local args = {
				[1] = {}
			}
			workspace.__THINGS.__REMOTES:FindFirstChild("activate nuke"):FireServer(unpack(args))
		end
	end)
elseif game.PlaceId == 621129760 then
	print("Loaded")
	wait()
	print("For help join discord.gg/8ps4575qtH")
	local Library = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()
	local Window = Library:Window("MudWare Reborn v4.4.2.3.1 - Big Paintball", Color3.fromRGB(95, 65, 10), Enum.KeyCode.RightShift)
                
                -- MAIN
	local main = Window:Tab("Main")
	main:Button("Aimbot", function()
		local Camera = game:GetService("Workspace").CurrentCamera
		local Players = game:GetService("Players")
		local LocalPlayer = game:GetService("Players").LocalPlayer
		local function GetClosestPlayer()
			local ClosestPlayer = nil
			local FarthestDistance = 100
			for i, v in pairs(Players.GetPlayers(Players)) do
				if v ~= LocalPlayer and v.Character and v.Character.FindFirstChild(v.Character, "HumanoidRootPart") then
					local DistanceFromPlayer = (LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
					if DistanceFromPlayer < FarthestDistance then
						FarthestDistance = DistanceFromPlayer
						ClosestPlayer = v
					end
				end
			end
			if ClosestPlayer then
				return ClosestPlayer
			end
		end
		local GameMetaTable = getrawmetatable(game)
		local OldGameMetaTableNamecall = GameMetaTable.__namecall
		setreadonly(GameMetaTable, false)
		GameMetaTable.__namecall = newcclosure(function(object, ...)
			local NamecallMethod = getnamecallmethod()
			local Arguments = {
				...
			}
			if tostring(NamecallMethod) == "FindPartOnRayWithIgnoreList" then
				local ClosestPlayer = GetClosestPlayer()
				if ClosestPlayer and ClosestPlayer.Character then
					Arguments[1] = Ray.new(Camera.CFrame.Position, (ClosestPlayer.Character.Head.Position - Camera.CFrame.Position).Unit * (Camera.CFrame.Position - ClosestPlayer.Character.Head.Position).Magnitude)
				end
			end
			return OldGameMetaTableNamecall(object, unpack(Arguments))
		end)
		setreadonly(GameMetaTable, true)
	end)
	main:Toggle("Freeze LocalPlayer", false, function(state)
		if state then
			game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
		else
			game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
		end
	end)
	main:Button("Fast quit(if admins)", function()
		while true do
			wait()
			getgenv().silentaim_settings = {
				fov = 0,
				hitbox = "Head",
				fovcircle = true,
			}
                            -- Services
			local Players = game:GetService("Players")
			local RunService = game:GetService("RunService")
                            -- Player
			local Player = Players.LocalPlayer
			local Mouse = Player:GetMouse()
			local CurrentCamera = workspace.CurrentCamera
			local function GetClosest(Fov)
				local Target, Closest = nil, Fov or math.huge
				for i, v in pairs(Players:GetPlayers()) do
					if (v.Character and v ~= Player and v.Character:FindFirstChild(getgenv().silentaim_settings.hitbox)) then
						local Position, OnScreen = CurrentCamera:WorldToScreenPoint(v.Character[getgenv().silentaim_settings.hitbox].Position)
						local Distance = (Vector2.new(Position.X, Position.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
						if (Distance < Closest and OnScreen) then
							Closest = Distance
							Target = v
						end
					end
				end
				return Target
			end
			local Target
			local CircleInline = Drawing.new("Circle")
			local CircleOutline = Drawing.new("Circle")
			RunService.Stepped:Connect(function()
				CircleInline.Radius = getgenv().silentaim_settings.fov
				CircleInline.Thickness = 2
				CircleInline.Position = Vector2.new(Mouse.X, Mouse.Y + 36)
				CircleInline.Transparency = 1
				CircleInline.Color = Color3.fromRGB(255, 255, 255)
				CircleInline.Visible = getgenv().silentaim_settings.fovcircle
				CircleInline.ZIndex = 2
				CircleOutline.Radius = getgenv().silentaim_settings.fov
				CircleOutline.Thickness = 4
				CircleOutline.Position = Vector2.new(Mouse.X, Mouse.Y + 36)
				CircleOutline.Transparency = 1
				CircleOutline.Color = Color3.new()
				CircleOutline.Visible = getgenv().silentaim_settings.fovcircle
				CircleOutline.ZIndex = 1
				Target = GetClosest(getgenv().silentaim_settings.fov)
			end)
			local Old;
			Old = hookmetamethod(game, "__namecall", function(Self, ...)
				local Args = {
					...
				}
				if (not checkcaller() and getnamecallmethod() == "FindPartOnRayWithIgnoreList") then
					if (table.find(Args[2], workspace.WorldIgnore.Ignore) and Target and Target.Character) then
						local Origin = Args[1].Origin
						Args[1] = Ray.new(Origin, Target.Character[getgenv().silentaim_settings.hitbox].Position - Origin)
					end
				end
				return Old(Self, unpack(Args))
			end)
		end
	end)
                
                -- ESP
	local esp = Window:Tab("ESP")
	esp:Button("box", function()
		_G.TeamCheck = false
		local lplr = game.Players.LocalPlayer
		local camera = game:GetService("Workspace").CurrentCamera
		local CurrentCamera = workspace.CurrentCamera
		local worldToViewportPoint = CurrentCamera.worldToViewportPoint
		local HeadOff = Vector3.new(0, 0.5, 0)
		local LegOff = Vector3.new(0, 3, 0)
		for i, v in pairs(game.Players:GetChildren()) do
			local BoxOutline = Drawing.new("Square")
			BoxOutline.Visible = false
			BoxOutline.Color = Color3.new(255, 0, 0)
			BoxOutline.Thickness = 3
			BoxOutline.Transparency = 1
			BoxOutline.Filled = false
			local Box = Drawing.new("Square")
			Box.Visible = false
			Box.Color = Color3.new(255, 0, 0)
			Box.Thickness = 1
			Box.Transparency = 1
			Box.Filled = false
			Box.Transparency = 1
			function boxesp()
				game:GetService("RunService").RenderStepped:Connect(function()
					if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
						local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
						local RootPart = v.Character.HumanoidRootPart
						local Head = v.Character.Head
						local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
						local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + HeadOff)
						local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)
						if onScreen then
							BoxOutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
							BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
							BoxOutline.Visible = true
							Box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
							Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
							Box.Visible = true
							if _G.TeamCheck and v.TeamColor == lplr.TeamColor then
								Box.Visible = false
								BoxOutline.Visible = false
							else
								Box.Visible = true
								BoxOutline.Visible = false
							end
						else
							BoxOutline.Visible = false
							Box.Visible = false
						end
					else
						BoxOutline.Visible = false
						Box.Visible = false
					end
				end)
			end
			coroutine.wrap(boxesp)()
		end
		game.Players.PlayerAdded:Connect(function(v)
			local BoxOutline = Drawing.new("Square")
			BoxOutline.Visible = false
			BoxOutline.Color = Color3.new(255, 0, 0)
			BoxOutline.Thickness = 3
			BoxOutline.Transparency = 1
			BoxOutline.Filled = false
			local Box = Drawing.new("Square")
			Box.Visible = false
			Box.Color = Color3.new(255, 0, 0)
			Box.Thickness = 1
			Box.Transparency = 1
			Box.Filled = false
			Box.Transparency = 1
			function boxesp()
				game:GetService("RunService").RenderStepped:Connect(function()
					if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
						local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
						local RootPart = v.Character.HumanoidRootPart
						local Head = v.Character.Head
						local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
						local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + HeadOff)
						local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)
						if onScreen then
							BoxOutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
							BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
							BoxOutline.Visible = true
							Box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
							Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
							Box.Visible = true
							if _G.TeamCheck and v.TeamColor == lplr.TeamColor then
								Box.Visible = false
								BoxOutline.Visible = false
							else
								Box.Visible = true
								BoxOutline.Visible = false
							end
						else
							BoxOutline.Visible = false
							Box.Visible = false
						end
					else
						BoxOutline.Visible = false
						Box.Visible = false
					end
				end)
			end
			coroutine.wrap(boxesp)()
		end)
	end)
	esp:Button("tracers", function()
		_G.TeamCheck = false
		_G.Tracers = true
		local lp = game.Players.LocalPlayer
		local camera = game:GetService("Workspace").CurrentCamera
		local CurrentCamera = workspace.CurrentCamera
		local worldToViewportPoint = CurrentCamera.worldToViewportPoint
		for i, v in pairs(game.Players:GetChildren()) do
			local Tracer = Drawing.new("Line")
			Tracer.Visible = false
			Tracer.Color = Color3.new(255, 0, 0)
			Tracer.Thickness = 1
			Tracer.Transparency = 1
			function traces()
				game:GetService("RunService").RenderStepped:Connect(function()
					if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lp and v.Character.Humanoid.Health > 0 then
						local Vector, OnScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
						if OnScreen then
							Tracer.From  = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
							Tracer.To = Vector2.new(Vector.X, Vector.Y)
							if _G.TeamCheck and v.TeamColor == lp.TeamColor then
								Tracer.Visible = false
							else
								Tracer.Visible = true
							end
						else
							Tracer.Visible = false
						end
					else
						Tracer.Visible = false
					end
					if not _G.Tracers == true then
						Tracers.Visible = false
					end
				end)
			end
			coroutine.wrap(traces)()
		end
		game.Players.PlayerAdded:Connect(function(v)
			local Tracer = Drawing.new("Line")
			Tracer.Visible = false
			Tracer.Color = Color3.new(255, 0, 0)
			Tracer.Thickness = 1
			Tracer.Transparency = 1
			function traces()
				game:GetService("RunService").RenderStepped:Connect(function()
					if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lp and v.Character.Humanoid.Health > 0 then
						local Vector, OnScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
						if OnScreen then
							Tracer.From  = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
							Tracer.To = Vector2.new(Vector.X, Vector.Y)
							if _G.TeamCheck and v.TeamColor == lp.TeamColor then
								Tracer.Visible = false
							else
								Tracer.Visible = true
							end
						else
							Tracer.Visible = false
						end
					else
						Tracer.Visible = false
					end
					if _G.Tracers == false then
						Tracer.Visible = false
					end
				end)
			end
			coroutine.wrap(traces)()
		end)
	end)
else
	game.Players.LocalPlayer:Kick("This game is not supported.")
end
