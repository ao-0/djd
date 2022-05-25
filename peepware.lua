-- peepware bypass
-- bypassed by the djs $$
-- join the cord: https://discord.gg/xcGrZjBaqd
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
	lib = game:HttpGet'https://raw.githubusercontent.com/ao-0/djd/main/backups/peepware_crack.lua'
	crack = hookfunction(game.HttpGet, function(L_3_arg0, L_4_arg1, ...)
		if tostring(L_4_arg1) == "https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua" then
			return lib
		end
		if tostring(L_4_arg1):find'NexIsHot' then
			return crack(L_3_arg0, L_4_arg1:gsub('NexIsHot', 'ao-0'), ...)
		end
		return crack(L_3_arg0, L_4_arg1, ...)
	end)
end
loadstring(game:HttpGet'https://raw.githubusercontent.com/ao-0/PeepWare/main/Login.lua')()
