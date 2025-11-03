local players = game:GetService("Players")
local player = players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local rs = game:GetService("ReplicatedStorage")
local be = rs:WaitForChild("windowtoggler")
local blurandanim = rs:WaitForChild("blurandanim")
local closemenu = rs:WaitForChild("closemenu")
local BlurFX = workspace.CurrentCamera:WaitForChild("MenuBlur")
local menuopened = false
local debounce=false
local function screenGuiToggler(target)
	for _, screenGui in ipairs(playerGui:GetDescendants()) do
		if screenGui.Name== "PANEL" then
			screenGui.Value=false
		end
	end
	target.Value=true
	for _, screenGui in ipairs(playerGui:GetDescendants()) do
		if screenGui.Name=="PANEL" and screenGui.Value==false then
			screenGui.Parent.Visible=false
		end		
	end
end

be.OnInvoke = function (target)
	if debounce==false then
		screenGuiToggler(target)
	end
end 

blurandanim.OnInvoke = function (target)
	if target.Visible then
		if debounce==false then
			debounce=true
			menuopened=false
			local Properties1 = {Size = 0}
			local Info1 = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut) 
			local T1 = game:GetService("TweenService"):Create(BlurFX, Info1, Properties1)
			T1:Play()

			local DefaultFoV = 70

			local Properties = {FieldOfView = DefaultFoV}
			local Info = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut) 
			local T = game:GetService("TweenService"):Create(game.Workspace.CurrentCamera, Info, Properties)
			T:Play()
			local size
			if target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.DailyRewards then
				size=UDim2.fromScale(0.8,0.8)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.DiamondTrader then
				size=UDim2.fromScale(0.8,0.8)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Glitching then
				size=UDim2.fromScale(0.9,0.9)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Inventory then
				size=UDim2.fromScale(0.72,0.908)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.NinjaShark then
				size=UDim2.fromScale(0.85,0.85)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.NinjaSharkFailed then
				size=UDim2.fromScale(0.85,0.85)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.NinjaSharkKilled then
				size=UDim2.fromScale(0.85,0.85)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.OnlineRewards then
				size=UDim2.fromScale(0.8,0.8)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Pets then
				size=UDim2.fromScale(0.9,0.9)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Quests then
				size=UDim2.fromScale(0.85,0.85)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.SellPanel then
				size=UDim2.fromScale(0.7,0.7)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Settings then
				size=UDim2.fromScale(0.45,0.9)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Shop then
				size=UDim2.fromScale(0.85,0.85)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Teleport then
				size=UDim2.fromScale(0.85,0.85)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.TradeChoose then
				size=UDim2.fromScale(0.9,0.9)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.TradeProgress then
				size=UDim2.fromScale(0.9,0.9)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.TradeReceive then
				size=UDim2.fromScale(0.6,0.6)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.ZoneBuying then
				size=UDim2.fromScale(0.7,0.7)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.AutoFarm then
				size=UDim2.fromScale(0.7,0.7)
			end

			local Info2 = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut) 
			game:GetService("TweenService"):Create(target,Info2,{Size=UDim2.new(0,0,0,0)}):Play()
			task.delay(.25,function()
				target.Visible = false
				target.Size = size
				debounce=false
			end)
			Properties,Properties1,Info,Info1,Info2,T,T1,DefaultFoV=nil
		end
		
	else
		if debounce==false then
			debounce=true
			screenGuiToggler(target.PANEL)
			local size
			if target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.DailyRewards then
				size=UDim2.fromScale(0.8,0.8)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.DiamondTrader then
				size=UDim2.fromScale(0.8,0.8)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Glitching then
				size=UDim2.fromScale(0.9,0.9)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Inventory then
				size=UDim2.fromScale(0.72,0.908)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.NinjaShark then
				size=UDim2.fromScale(0.85,0.85)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.NinjaSharkFailed then
				size=UDim2.fromScale(0.85,0.85)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.NinjaSharkKilled then
				size=UDim2.fromScale(0.85,0.85)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.OnlineRewards then
				size=UDim2.fromScale(0.8,0.8)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Pets then
				size=UDim2.fromScale(0.9,0.9)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Quests then
				size=UDim2.fromScale(0.85,0.85)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.SellPanel then
				size=UDim2.fromScale(0.7,0.7)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Settings then
				size=UDim2.fromScale(0.45,0.9)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Shop then
				size=UDim2.fromScale(0.85,0.85)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Teleport then
				size=UDim2.fromScale(0.85,0.85)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.TradeChoose then
				size=UDim2.fromScale(0.9,0.9)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.TradeProgress then
				size=UDim2.fromScale(0.9,0.9)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.TradeReceive then
				size=UDim2.fromScale(0.6,0.6)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.ZoneBuying then
				size=UDim2.fromScale(0.7,0.7)
			elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.AutoFarm then
				size=UDim2.fromScale(0.7,0.7)
			end
			target.Size=size
			local Properties1 = {Size = 18}
			local Info1 = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut) 
			local T1 = game:GetService("TweenService"):Create(BlurFX, Info1, Properties1)
			T1:Play()

			if menuopened then

			else
				menuopened=true
				local DefaultFoV = game.Workspace.CurrentCamera.FieldOfView

				local Properties = {FieldOfView = DefaultFoV + 10}
				local Info = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut) 
				local T = game:GetService("TweenService"):Create(game.Workspace.CurrentCamera, Info, Properties)
				T:Play()
				Properties,Info,DefaultFoV=nil
			end
			
			local pos = UDim2.new(0.5,0,0.5,0)
			target.Position = UDim2.new(target.Position.X.Scale,0,target.Position.Y.Scale+0.2,0) 

			target.Visible = true
			local Info2 = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut) 
			game:GetService("TweenService"):Create(target,Info2,{Position=UDim2.new(target.Position.X.Scale,0,target.Position.Y.Scale-0.225,0)}):Play()
			task.delay(.15,function()
				local Info3 = TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut) 
				game:GetService("TweenService"):Create(target,Info3,{Position=pos}):Play()
				debounce=false
				Info3=nil
			end)
			Properties1,Info1,Info2,T1=nil

		end
		
	end
	
end 

closemenu.OnInvoke = function (target)
	if debounce==false then
		debounce=true
		menuopened=false
		local Properties1 = {Size = 0}
		local Info1 = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut) 
		local T1 = game:GetService("TweenService"):Create(BlurFX, Info1, Properties1)
		T1:Play()

		local DefaultFoV = 70

		local Properties = {FieldOfView = DefaultFoV}
		local Info = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut) 
		local T = game:GetService("TweenService"):Create(game.Workspace.CurrentCamera, Info, Properties)
		T:Play()
		local size
		if target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.DailyRewards then
			size=UDim2.fromScale(0.8,0.8)
		elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.DiamondTrader then
			size=UDim2.fromScale(0.8,0.8)
		elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Glitching then
			size=UDim2.fromScale(0.9,0.9)
		elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Inventory then
			size=UDim2.fromScale(0.72,0.908)
		elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.NinjaShark then
			size=UDim2.fromScale(0.85,0.85)
		elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.NinjaSharkFailed then
			size=UDim2.fromScale(0.85,0.85)
		elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.NinjaSharkKilled then
			size=UDim2.fromScale(0.85,0.85)
		elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.OnlineRewards then
			size=UDim2.fromScale(0.8,0.8)
		elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Pets then
			size=UDim2.fromScale(0.9,0.9)
		elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Quests then
			size=UDim2.fromScale(0.85,0.85)
		elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.SellPanel then
			size=UDim2.fromScale(0.7,0.7)
		elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Settings then
			size=UDim2.fromScale(0.45,0.9)
		elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Shop then
			size=UDim2.fromScale(0.85,0.85)
		elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Teleport then
			size=UDim2.fromScale(0.85,0.85)
		elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.TradeChoose then
			size=UDim2.fromScale(0.9,0.9)
		elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.TradeProgress then
			size=UDim2.fromScale(0.9,0.9)
		elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.TradeReceive then
			size=UDim2.fromScale(0.6,0.6)
		elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.ZoneBuying then
			size=UDim2.fromScale(0.7,0.7)
		elseif target==game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.AutoFarm then
			size=UDim2.fromScale(0.7,0.7)
		end


		local Info2 = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut) 
		game:GetService("TweenService"):Create(target,Info2,{Size=UDim2.new(0,0,0,0)}):Play()
		task.delay(.25,function()
			target.Visible = false
			target.Size = size
			debounce=false
		end)
		Properties1,Info1,Info2,T1,DefaultFoV=nil
	end
	
end


while wait(1) do
	for _, screenGui in ipairs(playerGui:GetDescendants()) do
		if screenGui.Name== "PANEL" and screenGui.Value==true and screenGui.Parent.Visible==false then
			screenGui.Value=false

		end
	end
end