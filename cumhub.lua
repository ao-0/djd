do
	local L_1_ = Instance.new("BindableFunction")
	function L_1_.OnInvoke(L_2_arg0)
		if L_2_arg0 == "Copy" then
			setclipboard('https://discord.gg/8ps4575qtH')
		end
	end
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "$$CATTUS$$";
		Text = "CRACKED BY CATTUS CRACKUS $$$, JOIN THE DISCORD FOR MORE";
		Duration = 5;
		Button1 = "Copy";
		Button2 = "No";
		Callback = L_1_
	})
	lib = game:HttpGet'https://raw.githubusercontent.com/ao-0/djd/main/backups/venyx.lua'
	req = request or syn.request or http_request or http.request
	old = hookfunction(req, function(L_3_arg0)
		if (L_3_arg0.Url:find"127.0.0.1") then
			return
		end;
		if (L_3_arg0.Url:find"websec.services") then
			return
		end;
		return old(L_3_arg0)
	end)
	clip = hookfunction(setclipboard, function(L_4_arg0)
		if L_4_arg0 == "https://discord.gg/qH4tSmcCXN" then
			return clip'https://discord.gg/8ps4575qtH'
		end
		return clip(L_4_arg0)
	end)
	crack = hookfunction(game.HttpGet, function(L_5_arg0, L_6_arg1, ...)
		if tostring(L_6_arg1) == "https://raw.githubusercontent.com/MaGiXxScripter/Cum-Hub/main/chat.lua" then
			return
		end
		if tostring(L_6_arg1) == "https://raw.githubusercontent.com/MaGiXxScripter/Cum-Hub/main/key" then
			return 'return "https://discord.gg/8ps4575qtH"'
		end
		if tostring(L_6_arg1) == "https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua" then
			return lib
		end
		if tostring(L_6_arg1):find'MaGiXxScripter' then
			return crack(L_5_arg0, L_6_arg1:gsub('MaGiXxScripter', 'ao-0'), ...)
		end
		return crack(L_5_arg0, L_6_arg1, ...)
	end)

end
loadstring(game:HttpGet'https://raw.githubusercontent.com/ao-0/djd/main/backups/cumhub%20loader.lua')()
game:GetService("CoreGui")["Cum Hub"].Main.TopBar.TextLabel.Text = "Cattuscrackused hub"
game:GetService("CoreGui")["Cum Hub"].Main.KeyFrame.TextBox.Text = "https://discord.gg/8ps4575qtH"
game:GetService("CoreGui")["Cum Hub"].Main.KeyFrame.TextBox.TextEditable = false
game:GetService("CoreGui")["Cum Hub"].Main.KeyFrame.TextBox.ClearTextOnFocus = false
game:GetService("CoreGui")["Cum Hub"].Main.TextButton.Text = "https://discord.gg/8ps4575qtH"
