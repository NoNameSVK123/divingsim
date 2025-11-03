wait(3)
local plr = game:GetService("Players").LocalPlayer
local char = plr.Character
local lighting = game:GetService("Lighting")
while wait(1) do
	do
		local folder
		if plr.Character then
			local hrp = char:WaitForChild("HumanoidRootPart")
			if hrp.CFrame.Y<200 then
				if hrp.CFrame.X>-480 then
					folder=game:GetService("Lighting").zone1
				elseif hrp.CFrame.X>-751 then
					folder=game:GetService("Lighting").zone2
				elseif hrp.CFrame.X>-1020 then
					folder=game:GetService("Lighting").zone3
				elseif hrp.CFrame.X>-1290 then
					folder=game:GetService("Lighting").zone4
				elseif hrp.CFrame.X>-1562 then
					folder=game:GetService("Lighting").zone5
				elseif hrp.CFrame.X>-1831 then
					folder=game:GetService("Lighting").zone6
				elseif hrp.CFrame.X>-2100 then
					folder=game:GetService("Lighting").zone7
				elseif hrp.CFrame.X>-2475 then
					folder=game:GetService("Lighting").zone8		
				end
			else
				folder=game:GetService("Lighting").Basic
			end
			--workspace.Terrain.WaterColor=lighting.Atmosphere.Color
			game:GetService("TweenService"):Create(workspace.Terrain,TweenInfo.new(3),{WaterColor = lighting.Atmosphere.Color}):Play()
			lighting.Atmosphere.Density=folder.Atmosphere.Density
			lighting.Atmosphere.Color=folder.Atmosphere.Color
			lighting.Atmosphere.Decay=folder.Atmosphere.Decay
			lighting.Atmosphere.Glare=folder.Atmosphere.Glare
			lighting.Atmosphere.Haze=folder.Atmosphere.Haze
			lighting.Lighting.Brightness=folder.Lighting.Brightness
			lighting.Lighting.Contrast=folder.Lighting.Contrast
			lighting.Lighting.Saturation=folder.Lighting.Saturation
			lighting.Lighting.TintColor=folder.Lighting.TintColor
			hrp=nil
		end
		folder=nil
	end
end