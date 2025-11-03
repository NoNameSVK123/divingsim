local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("EggChances")
local TweenService = game:GetService("TweenService")

remoteEvent.OnClientEvent:Connect(function(unlocked)
	do
		local ocean = 0
		local lunar = 0
		local atlantis = 0
		local onyx = 0
		local shadowjade = 0
		local prism = 0
		local blackdusk = 0
		local luminous = 0 
		if table.find(unlocked,"Nemo") then
			ocean=1
			if table.find(unlocked,"Dottyfish") then
				ocean=3
			end
		elseif table.find(unlocked,"Dottyfish") then
			ocean=2
		end

		if ocean>0 then
			if game.Workspace.EggsToScript:FindFirstChild("Basic Egg") then
				game.Workspace.EggsToScript:WaitForChild("Basic Egg").BillboardGui:FindFirstChild("Ocean"..ocean).Visible=true	
			end
		end

		if table.find(unlocked,"Crusty Crab") then
			lunar=1
			if table.find(unlocked,"Fiery Fly") then
				lunar=3
			end
		elseif table.find(unlocked,"Fiery Fly") then
			lunar=2
		end

		if lunar>0 then
			if game.Workspace.EggsToScript:FindFirstChild("Lunar Egg") then
				game.Workspace.EggsToScript:WaitForChild("Lunar Egg").BillboardGui:FindFirstChild("Lunar"..lunar).Visible=true	
			end
		end

		if table.find(unlocked,"Dark Deeper") then
			atlantis=1
			if table.find(unlocked,"Withered Hydra") then
				atlantis=3
			end
		elseif table.find(unlocked,"Withered Hydra") then
			atlantis=2
		end

		if atlantis>0 then
			if game.Workspace.EggsToScript:FindFirstChild("Atlantis Egg") then
				game.Workspace.EggsToScript:WaitForChild("Atlantis Egg").BillboardGui:FindFirstChild("Atlantis"..atlantis).Visible=true	
			end
		end

		if table.find(unlocked,"Shadow Glide") then
			onyx=1
			if table.find(unlocked,"Tsunami Spirit") then
				onyx=3
			end
		elseif table.find(unlocked,"Tsunami Spirit") then
			onyx=2
		end

		if onyx>0 then
			if game.Workspace.EggsToScript:FindFirstChild("Onyx Egg") then
				game.Workspace.EggsToScript:WaitForChild("Onyx Egg").BillboardGui:FindFirstChild("Onyx"..onyx).Visible=true	
			end
		end

		if table.find(unlocked,"Sushi Shrimp") then
			shadowjade=1
			if table.find(unlocked,"Serpentide") then
				shadowjade=3
			end
		elseif table.find(unlocked,"Serpentide") then
			shadowjade=2
		end

		if shadowjade>0 then
			if game.Workspace.EggsToScript:FindFirstChild("Shadowjade Egg") then
				game.Workspace.EggsToScript:WaitForChild("Shadowjade Egg").BillboardGui:FindFirstChild("Shadowjade"..shadowjade).Visible=true
			end	
		end

		if table.find(unlocked,"Vulcanic Blaze") then
			prism=1
			if table.find(unlocked,"Neon Hydra") then
				prism=3
			end
		elseif table.find(unlocked,"Neon Hydra") then
			prism=2
		end

		if prism>0 then
			if game.Workspace.EggsToScript:FindFirstChild("Prism Egg") then
				game.Workspace.EggsToScript:WaitForChild("Prism Egg").BillboardGui:FindFirstChild("Prism"..prism).Visible=true
			end	
		end

		if table.find(unlocked,"Sun Beholder") then
			blackdusk=1
			if table.find(unlocked,"Ethereal Wraithwing") then
				blackdusk=3
			end
		elseif table.find(unlocked,"Ethereal Wraithwing") then
			blackdusk=2
		end

		if blackdusk>0 then
			if game.Workspace.EggsToScript:FindFirstChild("Blackdusk Egg") then
				game.Workspace.EggsToScript:WaitForChild("Blackdusk Egg").BillboardGui:FindFirstChild("Blackdusk"..blackdusk).Visible=true
			end	
		end

		if table.find(unlocked,"Piranha") then
			luminous=1
		end

		if luminous>0 then
			if game.Workspace.EggsToScript:FindFirstChild("Luminous Egg") then
				game.Workspace.EggsToScript:WaitForChild("Luminous Egg").BillboardGui:FindFirstChild("Luminous"..luminous).Visible=true
			end	
		end

		ocean,lunar,atlantis,onyx,shadowjade,prism,blackdusk,luminous=nil
	end
end)

local function scaleFocusedEgg()
	do
		local character = game.Players.LocalPlayer.Character
		local eggToHatch 
		local magnitude
		local minMagnitude = 30
		local magnitude2
		local minMagnitude2 = 100
		for _,v in pairs(workspace:WaitForChild("EggsToScript"):GetChildren()) do
			magnitude = (v.Position - character:WaitForChild("HumanoidRootPart").Position).Magnitude
			if magnitude<minMagnitude then
				minMagnitude=magnitude
				eggToHatch=v
			end
		end

		if eggToHatch~=nil then
			TweenService:Create(eggToHatch.BillboardGui,TweenInfo.new(0.5,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{ Size = UDim2.new(27,0,15,0)}):Play()
		end
		for _,v in pairs(workspace:WaitForChild("EggsToScript"):GetChildren()) do
			magnitude2 = (v.Position - character:WaitForChild("HumanoidRootPart").Position).Magnitude
			if magnitude2<minMagnitude2 then
				if v~=eggToHatch then
					if v~=nil then
						if v:FindFirstChild("BillboardGui") then
							TweenService:Create(v.BillboardGui,TweenInfo.new(0.5,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{ Size = UDim2.new(18,0,10,0)}):Play()						
						end
					end
				end
			end
		end
		character,eggToHatch,magnitude,minMagnitude,magnitude2,minMagnitude2=nil

	end
end


while wait() do
	do
		remoteEvent:FireServer()
		scaleFocusedEgg()
	end
end