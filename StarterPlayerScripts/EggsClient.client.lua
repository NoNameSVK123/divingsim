game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)

local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local eggs = ReplicatedStorage:WaitForChild("Eggs")

local pets = ReplicatedStorage:WaitForChild("Pets")
local remoteEvent = ReplicatedStorage:WaitForChild("HatchEgg")
local player = Players.LocalPlayer
local EggSystem = player:WaitForChild("PlayerGui"):WaitForChild("EggSystem")
local ConfettiSystem = player:WaitForChild("PlayerGui"):WaitForChild("ConfettiGui")
local eggViewport = EggSystem:WaitForChild("EggViewport")
local eggViewportRight = EggSystem:WaitForChild("EggViewportRight")
local eggViewportLeft = EggSystem:WaitForChild("EggViewportLeft")
local eggViewportOne = EggSystem:WaitForChild("EggViewportOne")
local eggViewportTwo = EggSystem:WaitForChild("EggViewportTwo")
local eggViewportThree = EggSystem:WaitForChild("EggViewportThree")
local eggViewportFour = EggSystem:WaitForChild("EggViewportFour")
local eggViewportFive = EggSystem:WaitForChild("EggViewportFive")
local eggViewportSix = EggSystem:WaitForChild("EggViewportSix")
local eggViewportSeven = EggSystem:WaitForChild("EggViewportSeven")
local eggViewportEight = EggSystem:WaitForChild("EggViewportEight")
local remoteEvent2 = ReplicatedStorage:WaitForChild("PetLoad")
local remoteEvent3 = ReplicatedStorage:WaitForChild("EquipPet")
local remoteEvent4 = ReplicatedStorage:WaitForChild("OnJoinPetEquip")
local remoteEvent5 = ReplicatedStorage:WaitForChild("TradePetInventoryAdd")
local eggCrunch = script.Parent.EggCrunch
local tadaa = script.Parent.Tadaa
local gui = game.Players.LocalPlayer.PlayerGui:WaitForChild("ConfettiGui")
local CreateConfetti = require(gui:WaitForChild("ConfettiCreator"))
local origin = EggSystem:WaitForChild("ConfettiSpot").Position
local origin2 = EggSystem:WaitForChild("ConfettiSpot2").Position
local origin3 = EggSystem:WaitForChild("ConfettiSpot3").Position

local BlurFX = workspace.CurrentCamera:WaitForChild("MenuBlur")

local function resort()
	local order = 1
	for _,name in pairs(player.PlayerGui.PlayerScreenGui.Panels.Pets.ScrollingFrame:GetChildren()) do
		if name.Name ~= "UIGridLayout" then
			if name.NumberRarity.Value==7 then
				name.LayoutOrder=order
				order+=1
			end
		end
	end
	for _,name in pairs(player.PlayerGui.PlayerScreenGui.Panels.Pets.ScrollingFrame:GetChildren()) do
		if name.Name ~= "UIGridLayout" then
			if name.NumberRarity.Value==6 then
				name.LayoutOrder=order
				order+=1
			end
		end
	end
	for _,name in pairs(player.PlayerGui.PlayerScreenGui.Panels.Pets.ScrollingFrame:GetChildren()) do
		if name.Name ~= "UIGridLayout" then
			if name.NumberRarity.Value==5 then
				name.LayoutOrder=order
				order+=1
			end
		end
	end
	for _,name in pairs(player.PlayerGui.PlayerScreenGui.Panels.Pets.ScrollingFrame:GetChildren()) do
		if name.Name ~= "UIGridLayout" then
			if name.NumberRarity.Value==4 then
				name.LayoutOrder=order
				order+=1
			end
		end
	end
	for _,name in pairs(player.PlayerGui.PlayerScreenGui.Panels.Pets.ScrollingFrame:GetChildren()) do
		if name.Name ~= "UIGridLayout" then
			if name.NumberRarity.Value==3 then
				name.LayoutOrder=order
				order+=1
			end
		end
	end
	for _,name in pairs(player.PlayerGui.PlayerScreenGui.Panels.Pets.ScrollingFrame:GetChildren()) do
		if name.Name ~= "UIGridLayout" then
			if name.NumberRarity.Value==2 then
				name.LayoutOrder=order
				order+=1
			end
		end
	end
	for _,name in pairs(player.PlayerGui.PlayerScreenGui.Panels.Pets.ScrollingFrame:GetChildren()) do
		if name.Name ~= "UIGridLayout" then
			if name.NumberRarity.Value==1 then
				name.LayoutOrder=order
				order+=1		
			end
		end
	end
	order=nil
end

remoteEvent3.OnClientEvent:Connect(function()
	task.wait(.3)
	resort()
end)

remoteEvent4.OnClientEvent:Connect(function(fish)
	task.wait(1)
	for _,name in pairs(player.PlayerGui.PlayerScreenGui.Panels.Pets:WaitForChild("ScrollingFrame"):GetChildren()) do
		if name.Name ~= "UIGridLayout" then
			if tostring(name)==tostring(fish) then
				if name.Equipped.Visible==false then
					name.Equipped.Visible=true
					name:WaitForChild("NumberRarity").Value=7
					resort()
					break
				end
			end
		end
	end
end)

local function loadInventory(pets)
	local rarity
	local slot
	for _,name in pairs(pets) do
		slot = player.PlayerGui.PlayerScreenGui.Panels.Pets.Slot:Clone()
		slot.Parent = player.PlayerGui.PlayerScreenGui.Panels.Pets.ScrollingFrame
		slot.Name = name
		slot.PetName.Text = tostring(name)
		if tostring(name)=="Blue Fish" then
			rarity="Common"
		elseif tostring(name)=="Mr. Turtle" then
			rarity="Common"
		elseif tostring(name)=="Lemon Fish" then
			rarity="Common"
		elseif tostring(name)=="Sea Grass Fish" then
			rarity="Common"
		elseif tostring(name)=="Nemo" then
			rarity="Uncommon"
		elseif tostring(name)=="Dottyfish" then
			rarity="Rare"
		elseif tostring(name)=="Lava Fish" then
			rarity="Common"
		elseif tostring(name)=="Turtle" then
			rarity="Uncommon"
		elseif tostring(name)=="Shroomyfish" then
			rarity="Rare"
		elseif tostring(name)=="Crusty Crab" then
			rarity="Epic"
		elseif tostring(name)=="Fiery Fly" then
			rarity="Legendary"
		elseif tostring(name)=="Big Fish" then
			rarity="Uncommon"
		elseif tostring(name)=="Stingray" then
			rarity="Rare"
		elseif tostring(name)=="Luminar Fish" then
			rarity="Epic"
		elseif tostring(name)=="Dark Deeper" then
			rarity="Legendary"
		elseif tostring(name)=="Withered Hydra" then
			rarity="Mythic"
		elseif tostring(name)=="Golden Fish" then
			rarity="Uncommon"
		elseif tostring(name)=="Dolphin" then
			rarity="Rare"
		elseif tostring(name)=="King Octopus" then
			rarity="Epic"
		elseif tostring(name)=="Shadow Glide" then
			rarity="Legendary"
		elseif tostring(name)=="Tsunami Spirit" then
			rarity="Mythic"
		elseif tostring(name)=="Virus Spike" then
			rarity="Uncommon"
		elseif tostring(name)=="Tech Dolphin" then
			rarity="Rare"
		elseif tostring(name)=="Kraken" then
			rarity="Epic"
		elseif tostring(name)=="Sushi Shrimp" then
			rarity="Legendary"
		elseif tostring(name)=="Serpentide" then
			rarity="Mythic"
		elseif tostring(name)=="Seahorse" then
			rarity="Rare"
		elseif tostring(name)=="Blobfish"  then
			rarity="Epic"
		elseif tostring(name)=="Neon Turtle" then
			rarity="Legendary"
		elseif tostring(name)=="Vulcanic Blaze" then
			rarity="Legendary"
		elseif tostring(name)=="Neon Hydra" then
			rarity="Mythic"
		elseif tostring(name)=="Glitched Neon Turtle" then
			rarity="Legendary"
			slot.Glitched.Value=true
		elseif tostring(name)=="Glitched Blobfish" then
			rarity="Epic"
			slot.Glitched.Value=true
		elseif tostring(name)=="Glitched Battle Octopus" then
			rarity="Legendary"
			slot.Glitched.Value=true
		elseif tostring(name)=="Glitched Axolotl" then
			rarity="Epic"
			slot.Glitched.Value=true
		elseif tostring(name)=="Glitched Crusty Crab" then
			rarity="Epic"
			slot.Glitched.Value=true
		elseif tostring(name)=="Glitched Dark Deeper" then
			rarity="Legendary"
			slot.Glitched.Value=true
		elseif tostring(name)=="Glitched Ethereal Wraithwing" then
			rarity="Mythic"
			slot.Glitched.Value=true
		elseif tostring(name)=="Glitched Fiery Fly" then
			rarity="Legendary"
			slot.Glitched.Value=true
		elseif tostring(name)=="Glitched King Octopus" then
			rarity="Epic"
			slot.Glitched.Value=true
		elseif tostring(name)=="Glitched Kraken" then
			rarity="Epic"
			slot.Glitched.Value=true
		elseif tostring(name)=="Glitched Luminar Fish" then
			rarity="Epic"
			slot.Glitched.Value=true
		elseif tostring(name)=="Glitched Neon Hydra" then
			rarity="Mythic"
			slot.Glitched.Value=true
		elseif tostring(name)=="Glitched Piranha" then
			rarity="Mythic"
			slot.Glitched.Value=true
		elseif tostring(name)=="Glitched Serpentide" then
			rarity="Mythic"
			slot.Glitched.Value=true
		elseif tostring(name)=="Glitched Shadow Glide" then
			rarity="Legendary"
			slot.Glitched.Value=true
		elseif tostring(name)=="Glitched Sun Beholder" then
			rarity="Legendary"
			slot.Glitched.Value=true
		elseif tostring(name)=="Glitched Sushi Shrimp" then
			rarity="Legendary"
			slot.Glitched.Value=true
		elseif tostring(name)=="Glitched Tsunami Spirit" then
			rarity="Mythic"
			slot.Glitched.Value=true
		elseif tostring(name)=="Glitched Vulcanic Blaze" then
			rarity="Legendary"
			slot.Glitched.Value=true
		elseif tostring(name)=="Glitched Withered Hydra" then
			rarity="Epic"
			slot.Glitched.Value=true
		elseif tostring(name)=="Galaxy Axolotl" then
			rarity="Epic"
			slot.Galaxy.Value=true
		elseif tostring(name)=="Galaxy Hydra" then
			rarity="Mythic"
			slot.Galaxy.Value=true
		elseif tostring(name)=="Galaxy Luminar Fish" then
			rarity="Epic"
			slot.Galaxy.Value=true
		elseif tostring(name)=="Galaxy Shadow Glide" then
			rarity="Legendary"
			slot.Galaxy.Value=true
		elseif tostring(name)=="Surf Dolphin" then
			rarity="Epic"
			slot.Galaxy.Value=true
		elseif tostring(name)=="Horseshoe" then
			rarity="Rare"
		elseif tostring(name)=="Axolotl" then
			rarity="Epic"
		elseif tostring(name)=="Battle Octopus" then
			rarity="Legendary"
		elseif tostring(name)=="Sun Beholder" then
			rarity="Legendary"
		elseif tostring(name)=="Ethereal Wraithwing" then
			rarity="Mythic"
		elseif tostring(name)=="Walrus" then
			rarity="Rare"
		elseif tostring(name)=="Piranha" then
			rarity="Mythic"
		elseif tostring(name)=="Surf Dolphin" then
			rarity="Epic"
		elseif tostring(name)=="Christmas Crab" then
			rarity="Epic"
		end
		slot.RarityTrade.Value=rarity
		slot.Rarity:FindFirstChild(rarity).Visible=true
		if slot.Pets:FindFirstChild(tostring(name))==nil then
		else
			slot.Pets:FindFirstChild(tostring(name)).Visible=true
		end
		slot.Visible=true
		if rarity=="Common" then
			slot.NumberRarity.Value = 1
		elseif rarity=="Uncommon" then
			slot.NumberRarity.Value = 2
		elseif rarity=="Rare" then
			slot.NumberRarity.Value = 3
		elseif rarity=="Epic" then
			slot.NumberRarity.Value = 4
		elseif rarity=="Legendary" then
			slot.NumberRarity.Value = 5
		elseif rarity=="Mythic" then
			slot.NumberRarity.Value = 6
		end
		slot.BasicRarity.Value = slot.NumberRarity.Value
		
	end

	
	resort()

end

remoteEvent2.OnClientEvent:Connect(loadInventory)


local function addToInventory(petName,rarity,glitch,galaxy)
	local slot = player.PlayerGui.PlayerScreenGui.Panels.Pets.Slot:Clone()
	slot.Parent = player.PlayerGui.PlayerScreenGui.Panels.Pets.ScrollingFrame
	slot.PetName.Text = petName
	slot.Rarity:FindFirstChild(rarity).Visible=true
	slot.Pets:FindFirstChild(petName).Visible=true
	slot.Visible=true
	slot.Name = petName
	if rarity=="Common" then
		slot.NumberRarity.Value = 1
	elseif rarity=="Uncommon" then
		slot.NumberRarity.Value = 2
	elseif rarity=="Rare" then
		slot.NumberRarity.Value = 3
	elseif rarity=="Epic" then
		slot.NumberRarity.Value = 4
	elseif rarity=="Legendary" then
		slot.NumberRarity.Value = 5
	elseif rarity=="Mythic" then
		slot.NumberRarity.Value = 6
	end
	if glitch==1 then
		slot.Glitched.Value = true
	end
	if galaxy==1 then
		slot.Galaxy.Value = true
	end
	slot.BasicRarity.Value = slot.NumberRarity.Value
	resort()
	rarity,slot=nil
end



local function hatchEggLeft(fasthatch,eggName, chosenPet)
	for _,v in pairs(player:WaitForChild("PlayerGui"):GetChildren()) do
		if v:IsA("ScreenGui") and v ~= EggSystem and v ~= ConfettiSystem then
			v.Enabled = false
		end
	end
	EggSystem.Enabled = true
	for _,v in pairs(eggViewportLeft:GetChildren()) do
		if v:IsA("Camera") or v:IsA("BasePart") or v:IsA("Model") then
			v:Destroy()
		end
	end
	eggViewportLeft.Size = UDim2.fromScale(0,0)
	local eggMesh = eggs:FindFirstChild(eggName):Clone()
	eggMesh.Parent = eggViewportLeft
	eggMesh.CFrame = CFrame.new(0,0,0)
	local camera = Instance.new("Camera")
	camera.Parent = eggViewportLeft
	camera.CFrame = CFrame.new(0,0,4)
	eggViewportLeft.CurrentCamera = camera
	TweenService:Create(eggViewportLeft, TweenInfo.new(0.7), {Size = UDim2.new(0.28, 0,0.49, 0)}):Play()
	task.wait(0.7)
	if fasthatch==false then
		for i = 1,4 do
			TweenService:Create(eggViewportLeft, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 20}):Play()
			eggCrunch:Play()
			task.wait(0.3)
			TweenService:Create(eggViewportLeft, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = -20}):Play()
			eggCrunch:Play()
			task.wait(0.3)
		end
		TweenService:Create(eggViewportLeft, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 0}):Play()
		eggCrunch:Play()
		task.wait(0.3)
	end
	if fasthatch then
		eggCrunch:Play()
	end
	TweenService:Create(eggViewportLeft, TweenInfo.new(0.7), {Size = UDim2.fromScale(0,0)}):Play()
	task.wait(0.7)
	for _,v in pairs(eggViewportLeft:GetChildren()) do
		if v:IsA("Camera") or v:IsA("BasePart") or v:IsA("Model") then
			v:Destroy()
		end
	end
	local petModel = pets:FindFirstChild(chosenPet.petName):Clone()
	petModel:PivotTo(CFrame.new(0,0,0))
	for _,v in pairs(petModel:GetChildren())  do
		if v:IsA("MeshPart") then
			v.Transparency=0
		end
	end
	petModel.Parent = eggViewportLeft
	local cameraPets = Instance.new("Camera")
	cameraPets.Parent = eggViewportLeft
	cameraPets.CFrame = CFrame.new(0,0,-3.3) * CFrame.Angles(0, math.rad(180), 0)
	eggViewportLeft.CurrentCamera = cameraPets
	TweenService:Create(eggViewportLeft, TweenInfo.new(0.7), {Size = UDim2.new(0.28, 0,0.49, 0)}):Play()
	EggSystem.PetBgLeft.Visible=true
	eggViewportLeft.NameLabel.Text = chosenPet.petName
	eggViewportLeft.NameLabel.Visible = true
	eggViewportLeft.RarityLabel.Text = chosenPet.Rarity
	eggViewportLeft.RarityLabel.Visible = true
	task.wait(3)
	TweenService:Create(eggViewportLeft, TweenInfo.new(0.3), {Size = UDim2.fromScale(0,0)}):Play()
	task.wait(0.3)
	EggSystem.PetBgLeft.Visible=false
	eggViewportLeft.NameLabel.Visible = false
	eggViewportLeft.RarityLabel.Visible = false
	player:WaitForChild("PlayerGui").PlayerScreenGui.Enabled=true
	EggSystem.Enabled = false
	local galaxy=0
	if chosenPet.petName=="Galaxy Axolotl" or chosenPet.petName=="Galaxy Luminar Fish" or chosenPet.petName=="Galaxy Shadow Glide" or chosenPet.petName=="Galaxy Hydra" then
		galaxy = 1
	end
	addToInventory(chosenPet.petName,chosenPet.Rarity,0,galaxy)
	eggMesh,camera,cameraPets,petModel,galaxy=nil
end

local function hatchEggRight(fasthatch,eggName, chosenPet)
	for _,v in pairs(player:WaitForChild("PlayerGui"):GetChildren()) do
		if v:IsA("ScreenGui") and v ~= EggSystem and v ~= ConfettiSystem then
			v.Enabled = false
		end
	end
	EggSystem.Enabled = true
	for _,v in pairs(eggViewportRight:GetChildren()) do
		if v:IsA("Camera") or v:IsA("BasePart") or v:IsA("Model") then
			v:Destroy()
		end
	end
	eggViewportRight.Size = UDim2.fromScale(0,0)
	local eggMesh = eggs:FindFirstChild(eggName):Clone()
	eggMesh.Parent = eggViewportRight
	eggMesh.CFrame = CFrame.new(0,0,0)
	local camera = Instance.new("Camera")
	camera.Parent = eggViewportRight
	camera.CFrame = CFrame.new(0,0,4)
	eggViewportRight.CurrentCamera = camera
	TweenService:Create(eggViewportRight, TweenInfo.new(0.7), {Size = UDim2.new(0.28, 0,0.49, 0)}):Play()
	task.wait(0.7)
	if fasthatch==false then
		for i = 1,2 do
			TweenService:Create(eggViewportRight, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 20}):Play()
			eggCrunch:Play()
			task.wait(0.3)
			TweenService:Create(eggViewportRight, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = -20}):Play()
			eggCrunch:Play()
			task.wait(0.3)
		end
		TweenService:Create(eggViewportRight, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 0}):Play()
		eggCrunch:Play()
		task.wait(0.3)
	end
	if fasthatch then
		eggCrunch:Play()
	end
	TweenService:Create(eggViewportRight, TweenInfo.new(0.7), {Size = UDim2.fromScale(0,0)}):Play()
	task.wait(0.7)
	for _,v in pairs(eggViewportRight:GetChildren()) do
		if v:IsA("Camera") or v:IsA("BasePart") or v:IsA("Model") then
			v:Destroy()
		end
	end
	local petModel = pets:FindFirstChild(chosenPet.petName):Clone()
	petModel:PivotTo(CFrame.new(0,0,0))
	for _,v in pairs(petModel:GetChildren())  do
		if v:IsA("MeshPart") then
			v.Transparency=0
		end
	end
	petModel.Parent = eggViewportRight
	local cameraPets = Instance.new("Camera")
	cameraPets.Parent = eggViewportRight
	cameraPets.CFrame = CFrame.new(0,0,-3.3) * CFrame.Angles(0, math.rad(180), 0)
	eggViewportRight.CurrentCamera = cameraPets
	TweenService:Create(eggViewportRight, TweenInfo.new(0.7), {Size = UDim2.new(0.28, 0,0.49, 0)}):Play()
	EggSystem.PetBgRight.Visible=true 
	eggViewportRight.NameLabel.Text = chosenPet.petName
	eggViewportRight.NameLabel.Visible = true
	eggViewportRight.RarityLabel.Text = chosenPet.Rarity
	eggViewportRight.RarityLabel.Visible = true
	task.wait(3)
	TweenService:Create(eggViewportRight, TweenInfo.new(0.3), {Size = UDim2.fromScale(0,0)}):Play()
	task.wait(0.3)
	EggSystem.PetBgRight.Visible=false
	eggViewportRight.NameLabel.Visible = false
	eggViewportRight.RarityLabel.Visible = false
	player:WaitForChild("PlayerGui").PlayerScreenGui.Enabled=true
	EggSystem.Enabled = false
	local galaxy=0
	if chosenPet.petName=="Galaxy Axolotl" or chosenPet.petName=="Galaxy Luminar Fish" or chosenPet.petName=="Galaxy Shadow Glide" or chosenPet.petName=="Galaxy Hydra" then
		galaxy = 1
	end
	addToInventory(chosenPet.petName,chosenPet.Rarity,0,galaxy)
	eggMesh,camera,cameraPets,petModel,galaxy=nil
end

--odtadial 

local function hatchEggOne(fasthatch,eggName, chosenPet)
	for _,v in pairs(player:WaitForChild("PlayerGui"):GetChildren()) do
		if v:IsA("ScreenGui") and v ~= EggSystem and v ~= ConfettiSystem then
			v.Enabled = false
		end
	end
	EggSystem.Enabled = true
	for _,v in pairs(eggViewportOne:GetChildren()) do
		if v:IsA("Camera") or v:IsA("BasePart") or v:IsA("Model") then
			v:Destroy()
		end
	end
	eggViewportOne.Size = UDim2.fromScale(0,0)
	local eggMesh = eggs:FindFirstChild(eggName):Clone()
	eggMesh.Parent = eggViewportOne
	eggMesh.CFrame = CFrame.new(0,0,0)
	local camera = Instance.new("Camera")
	camera.Parent = eggViewportOne
	camera.CFrame = CFrame.new(0,0,4)
	eggViewportOne.CurrentCamera = camera
	TweenService:Create(eggViewportOne, TweenInfo.new(0.7), {Size = UDim2.new(0.28, 0,0.49, 0)}):Play()
	task.wait(0.7)
	if fasthatch==false then
		for i = 1,2 do
			TweenService:Create(eggViewportOne, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 20}):Play()
			eggCrunch:Play()
			task.wait(0.3)
			TweenService:Create(eggViewportOne, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = -20}):Play()
			eggCrunch:Play()
			task.wait(0.3)
		end
		TweenService:Create(eggViewportOne, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 0}):Play()
		eggCrunch:Play()
		task.wait(0.3)
	end
	if fasthatch then
		eggCrunch:Play()
	end
	TweenService:Create(eggViewportOne, TweenInfo.new(0.7), {Size = UDim2.fromScale(0,0)}):Play()
	task.wait(0.7)
	for _,v in pairs(eggViewportOne:GetChildren()) do
		if v:IsA("Camera") or v:IsA("BasePart") or v:IsA("Model") then
			v:Destroy()
		end
	end
	local petModel = pets:FindFirstChild(chosenPet.petName):Clone()
	tadaa:Play()
	petModel:PivotTo(CFrame.new(0,0,0))
	for _,v in pairs(petModel:GetChildren())  do
		if v:IsA("MeshPart") then
			v.Transparency=0
		end
	end
	petModel.Parent = eggViewportOne
	local cameraPets = Instance.new("Camera")
	cameraPets.Parent = eggViewportOne
	cameraPets.CFrame = CFrame.new(0,0,-3.3) * CFrame.Angles(0, math.rad(180), 0)
	eggViewportOne.CurrentCamera = cameraPets
	TweenService:Create(eggViewportOne, TweenInfo.new(0.7), {Size = UDim2.new(0.28, 0,0.49, 0)}):Play()
	coroutine.wrap(function()
		CreateConfetti(origin,10,{Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 119, 0), Color3.fromRGB(255, 234, 0), Color3.fromRGB(47, 255, 0), Color3.fromRGB(0, 255, 247), Color3.fromRGB(0, 4, 255), Color3.fromRGB(140, 0, 255), Color3.fromRGB(255, 0, 212)},30,40,400,2000,15,30,50,100,0,0)

		CreateConfetti(origin2,10,{Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 119, 0), Color3.fromRGB(255, 234, 0), Color3.fromRGB(47, 255, 0), Color3.fromRGB(0, 255, 247), Color3.fromRGB(0, 4, 255), Color3.fromRGB(140, 0, 255), Color3.fromRGB(255, 0, 212)},30,40,400,2000,15,30,50,100,0,0)

		CreateConfetti(origin3,10,{Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 119, 0), Color3.fromRGB(255, 234, 0), Color3.fromRGB(47, 255, 0), Color3.fromRGB(0, 255, 247), Color3.fromRGB(0, 4, 255), Color3.fromRGB(140, 0, 255), Color3.fromRGB(255, 0, 212)},30,40,400,2000,15,30,50,100,0,0)
	end)()
	EggSystem.PetBgOne.Visible=true 
	eggViewportOne.NameLabel.Text = chosenPet.petName
	eggViewportOne.NameLabel.Visible = true
	eggViewportOne.RarityLabel.Text = chosenPet.Rarity
	eggViewportOne.RarityLabel.Visible = true
	task.wait(3)
	TweenService:Create(eggViewportOne, TweenInfo.new(0.3), {Size = UDim2.fromScale(0,0)}):Play()
	task.wait(0.3)
	EggSystem.PetBgOne.Visible=false
	eggViewportOne.NameLabel.Visible = false
	eggViewportOne.RarityLabel.Visible = false
	player:WaitForChild("PlayerGui").PlayerScreenGui.Enabled=true
	EggSystem.Enabled = false
	local galaxy=0
	if chosenPet.petName=="Galaxy Axolotl" or chosenPet.petName=="Galaxy Luminar Fish" or chosenPet.petName=="Galaxy Shadow Glide" or chosenPet.petName=="Galaxy Hydra" then
		galaxy = 1
	end
	addToInventory(chosenPet.petName,chosenPet.Rarity,0,galaxy)
	eggMesh,camera,cameraPets,petModel,galaxy=nil
end

local function hatchEggTwo(fasthatch,eggName, chosenPet)
	for _,v in pairs(player:WaitForChild("PlayerGui"):GetChildren()) do
		if v:IsA("ScreenGui") and v ~= EggSystem and v ~= ConfettiSystem then
			v.Enabled = false
		end
	end
	EggSystem.Enabled = true
	for _,v in pairs(eggViewportTwo:GetChildren()) do
		if v:IsA("Camera") or v:IsA("BasePart") or v:IsA("Model") then
			v:Destroy()
		end
	end
	eggViewportTwo.Size = UDim2.fromScale(0,0)
	local eggMesh = eggs:FindFirstChild(eggName):Clone()
	eggMesh.Parent = eggViewportTwo
	eggMesh.CFrame = CFrame.new(0,0,0)
	local camera = Instance.new("Camera")
	camera.Parent = eggViewportTwo
	camera.CFrame = CFrame.new(0,0,4)
	eggViewportTwo.CurrentCamera = camera
	TweenService:Create(eggViewportTwo, TweenInfo.new(0.7), {Size = UDim2.new(0.28, 0,0.49, 0)}):Play()
	task.wait(0.7)
	if fasthatch==false then
		for i = 1,2 do
			TweenService:Create(eggViewportTwo, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 20}):Play()
			eggCrunch:Play()
			task.wait(0.3)
			TweenService:Create(eggViewportTwo, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = -20}):Play()
			eggCrunch:Play()
			task.wait(0.3)
		end
		TweenService:Create(eggViewportTwo, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 0}):Play()
		eggCrunch:Play()
		task.wait(0.3)
	end
	if fasthatch then
		eggCrunch:Play()
	end
	TweenService:Create(eggViewportTwo, TweenInfo.new(0.7), {Size = UDim2.fromScale(0,0)}):Play()
	task.wait(0.7)
	for _,v in pairs(eggViewportTwo:GetChildren()) do
		if v:IsA("Camera") or v:IsA("BasePart") or v:IsA("Model") then
			v:Destroy()
		end
	end
	local petModel = pets:FindFirstChild(chosenPet.petName):Clone()
	petModel:PivotTo(CFrame.new(0,0,0))
	for _,v in pairs(petModel:GetChildren())  do
		if v:IsA("MeshPart") then
			v.Transparency=0
		end
	end
	petModel.Parent = eggViewportTwo
	local cameraPets = Instance.new("Camera")
	cameraPets.Parent = eggViewportTwo
	cameraPets.CFrame = CFrame.new(0,0,-3.3) * CFrame.Angles(0, math.rad(180), 0)
	eggViewportTwo.CurrentCamera = cameraPets
	TweenService:Create(eggViewportTwo, TweenInfo.new(0.7), {Size = UDim2.new(0.28, 0,0.49, 0)}):Play()
	EggSystem.PetBgTwo.Visible=true 
	eggViewportTwo.NameLabel.Text = chosenPet.petName
	eggViewportTwo.NameLabel.Visible = true
	eggViewportTwo.RarityLabel.Text = chosenPet.Rarity
	eggViewportTwo.RarityLabel.Visible = true
	task.wait(3)
	TweenService:Create(eggViewportTwo, TweenInfo.new(0.3), {Size = UDim2.fromScale(0,0)}):Play()
	task.wait(0.3)
	EggSystem.PetBgTwo.Visible=false
	eggViewportTwo.NameLabel.Visible = false
	eggViewportTwo.RarityLabel.Visible = false
	player:WaitForChild("PlayerGui").PlayerScreenGui.Enabled=true
	EggSystem.Enabled = false
	local galaxy=0
	if chosenPet.petName=="Galaxy Axolotl" or chosenPet.petName=="Galaxy Luminar Fish" or chosenPet.petName=="Galaxy Shadow Glide" or chosenPet.petName=="Galaxy Hydra" then
		galaxy = 1
	end
	addToInventory(chosenPet.petName,chosenPet.Rarity,0,galaxy)
	eggMesh,camera,cameraPets,petModel,galaxy=nil
end
local function hatchEggThree(fasthatch,eggName, chosenPet)
	for _,v in pairs(player:WaitForChild("PlayerGui"):GetChildren()) do
		if v:IsA("ScreenGui") and v ~= EggSystem and v ~= ConfettiSystem then
			v.Enabled = false
		end
	end
	EggSystem.Enabled = true
	for _,v in pairs(eggViewportThree:GetChildren()) do
		if v:IsA("Camera") or v:IsA("BasePart") or v:IsA("Model") then
			v:Destroy()
		end
	end
	eggViewportThree.Size = UDim2.fromScale(0,0)
	local eggMesh = eggs:FindFirstChild(eggName):Clone()
	eggMesh.Parent = eggViewportThree
	eggMesh.CFrame = CFrame.new(0,0,0)
	local camera = Instance.new("Camera")
	camera.Parent = eggViewportThree
	camera.CFrame = CFrame.new(0,0,4)
	eggViewportThree.CurrentCamera = camera
	TweenService:Create(eggViewportThree, TweenInfo.new(0.7), {Size = UDim2.new(0.28, 0,0.49, 0)}):Play()
	task.wait(0.7)
	if fasthatch==false then
		for i = 1,2 do
			TweenService:Create(eggViewportThree, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 20}):Play()
			eggCrunch:Play()
			task.wait(0.3)
			TweenService:Create(eggViewportThree, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = -20}):Play()
			eggCrunch:Play()
			task.wait(0.3)
		end
		TweenService:Create(eggViewportThree, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 0}):Play()
		eggCrunch:Play()
		task.wait(0.3)
	end
	if fasthatch then
		eggCrunch:Play()
	end
	TweenService:Create(eggViewportThree, TweenInfo.new(0.7), {Size = UDim2.fromScale(0,0)}):Play()
	task.wait(0.7)
	for _,v in pairs(eggViewportThree:GetChildren()) do
		if v:IsA("Camera") or v:IsA("BasePart") or v:IsA("Model") then
			v:Destroy()
		end
	end
	local petModel = pets:FindFirstChild(chosenPet.petName):Clone()
	petModel:PivotTo(CFrame.new(0,0,0))
	for _,v in pairs(petModel:GetChildren())  do
		if v:IsA("MeshPart") then
			v.Transparency=0
		end
	end
	petModel.Parent = eggViewportThree
	local cameraPets = Instance.new("Camera")
	cameraPets.Parent = eggViewportThree
	cameraPets.CFrame = CFrame.new(0,0,-3.3) * CFrame.Angles(0, math.rad(180), 0)
	eggViewportThree.CurrentCamera = cameraPets
	TweenService:Create(eggViewportThree, TweenInfo.new(0.7), {Size = UDim2.new(0.28, 0,0.49, 0)}):Play()
	EggSystem.PetBgThree.Visible=true 
	eggViewportThree.NameLabel.Text = chosenPet.petName
	eggViewportThree.NameLabel.Visible = true
	eggViewportThree.RarityLabel.Text = chosenPet.Rarity
	eggViewportThree.RarityLabel.Visible = true
	task.wait(3)
	TweenService:Create(eggViewportThree, TweenInfo.new(0.3), {Size = UDim2.fromScale(0,0)}):Play()
	task.wait(0.3)
	EggSystem.PetBgThree.Visible=false
	eggViewportThree.NameLabel.Visible = false
	eggViewportThree.RarityLabel.Visible = false
	player:WaitForChild("PlayerGui").PlayerScreenGui.Enabled=true
	EggSystem.Enabled = false
	local galaxy=0
	if chosenPet.petName=="Galaxy Axolotl" or chosenPet.petName=="Galaxy Luminar Fish" or chosenPet.petName=="Galaxy Shadow Glide" or chosenPet.petName=="Galaxy Hydra" then
		galaxy = 1
	end
	addToInventory(chosenPet.petName,chosenPet.Rarity,0,galaxy)
	eggMesh,camera,cameraPets,petModel,galaxy=nil
end
local function hatchEggFour(fasthatch,eggName, chosenPet)
	for _,v in pairs(player:WaitForChild("PlayerGui"):GetChildren()) do
		if v:IsA("ScreenGui") and v ~= EggSystem and v ~= ConfettiSystem then
			v.Enabled = false
		end
	end
	EggSystem.Enabled = true
	for _,v in pairs(eggViewportFour:GetChildren()) do
		if v:IsA("Camera") or v:IsA("BasePart") or v:IsA("Model") then
			v:Destroy()
		end
	end
	eggViewportFour.Size = UDim2.fromScale(0,0)
	local eggMesh = eggs:FindFirstChild(eggName):Clone()
	eggMesh.Parent = eggViewportFour
	eggMesh.CFrame = CFrame.new(0,0,0)
	local camera = Instance.new("Camera")
	camera.Parent = eggViewportFour
	camera.CFrame = CFrame.new(0,0,4)
	eggViewportFour.CurrentCamera = camera
	TweenService:Create(eggViewportFour, TweenInfo.new(0.7), {Size = UDim2.new(0.28, 0,0.49, 0)}):Play()
	task.wait(0.7)
	if fasthatch==false then
		for i = 1,2 do
			TweenService:Create(eggViewportFour, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 20}):Play()
			eggCrunch:Play()
			task.wait(0.3)
			TweenService:Create(eggViewportFour, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = -20}):Play()
			eggCrunch:Play()
			task.wait(0.3)
		end
		TweenService:Create(eggViewportFour, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 0}):Play()
		eggCrunch:Play()
		task.wait(0.3)
	end
	if fasthatch then
		eggCrunch:Play()
	end
	TweenService:Create(eggViewportFour, TweenInfo.new(0.7), {Size = UDim2.fromScale(0,0)}):Play()
	task.wait(0.7)
	for _,v in pairs(eggViewportFour:GetChildren()) do
		if v:IsA("Camera") or v:IsA("BasePart") or v:IsA("Model") then
			v:Destroy()
		end
	end
	local petModel = pets:FindFirstChild(chosenPet.petName):Clone()
	petModel:PivotTo(CFrame.new(0,0,0))
	for _,v in pairs(petModel:GetChildren())  do
		if v:IsA("MeshPart") then
			v.Transparency=0
		end
	end
	petModel.Parent = eggViewportFour
	local cameraPets = Instance.new("Camera")
	cameraPets.Parent = eggViewportFour
	cameraPets.CFrame = CFrame.new(0,0,-3.3) * CFrame.Angles(0, math.rad(180), 0)
	eggViewportFour.CurrentCamera = cameraPets
	TweenService:Create(eggViewportFour, TweenInfo.new(0.7), {Size = UDim2.new(0.28, 0,0.49, 0)}):Play()
	EggSystem.PetBgFour.Visible=true 
	eggViewportFour.NameLabel.Text = chosenPet.petName
	eggViewportFour.NameLabel.Visible = true
	eggViewportFour.RarityLabel.Text = chosenPet.Rarity
	eggViewportFour.RarityLabel.Visible = true
	task.wait(3)
	TweenService:Create(eggViewportFour, TweenInfo.new(0.3), {Size = UDim2.fromScale(0,0)}):Play()
	task.wait(0.3)
	EggSystem.PetBgFour.Visible=false
	eggViewportFour.NameLabel.Visible = false
	eggViewportFour.RarityLabel.Visible = false
	player:WaitForChild("PlayerGui").PlayerScreenGui.Enabled=true
	EggSystem.Enabled = false
	local galaxy=0
	if chosenPet.petName=="Galaxy Axolotl" or chosenPet.petName=="Galaxy Luminar Fish" or chosenPet.petName=="Galaxy Shadow Glide" or chosenPet.petName=="Galaxy Hydra" then
		galaxy = 1
	end
	addToInventory(chosenPet.petName,chosenPet.Rarity,0,galaxy)
	BlurFX.Size=0
end

local function hatchEggFive(fasthatch,eggName, chosenPet)
	for _,v in pairs(player:WaitForChild("PlayerGui"):GetChildren()) do
		if v:IsA("ScreenGui") and v ~= EggSystem and v ~= ConfettiSystem then
			v.Enabled = false
		end
	end
	EggSystem.Enabled = true
	for _,v in pairs(eggViewportFive:GetChildren()) do
		if v:IsA("Camera") or v:IsA("BasePart") or v:IsA("Model") then
			v:Destroy()
		end
	end
	eggViewportFive.Size = UDim2.fromScale(0,0)
	local eggMesh = eggs:FindFirstChild(eggName):Clone()
	eggMesh.Parent = eggViewportFive
	eggMesh.CFrame = CFrame.new(0,0,0)
	local camera = Instance.new("Camera")
	camera.Parent = eggViewportFive
	camera.CFrame = CFrame.new(0,0,4)
	eggViewportFive.CurrentCamera = camera
	TweenService:Create(eggViewportFive, TweenInfo.new(0.7), {Size = UDim2.new(0.28, 0,0.49, 0)}):Play()
	task.wait(0.7)
	if fasthatch==false then
		for i = 1,2 do
			TweenService:Create(eggViewportFive, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 20}):Play()
			eggCrunch:Play()
			task.wait(0.3)
			TweenService:Create(eggViewportFive, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = -20}):Play()
			eggCrunch:Play()
			task.wait(0.3)
		end
		TweenService:Create(eggViewportFive, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 0}):Play()
		eggCrunch:Play()
		task.wait(0.3)
	end
	if fasthatch then
		eggCrunch:Play()
	end
	TweenService:Create(eggViewportFive, TweenInfo.new(0.7), {Size = UDim2.fromScale(0,0)}):Play()
	task.wait(0.7)
	for _,v in pairs(eggViewportFive:GetChildren()) do
		if v:IsA("Camera") or v:IsA("BasePart") or v:IsA("Model") then
			v:Destroy()
		end
	end
	local petModel = pets:FindFirstChild(chosenPet.petName):Clone()
	petModel:PivotTo(CFrame.new(0,0,0))
	for _,v in pairs(petModel:GetChildren())  do
		if v:IsA("MeshPart") then
			v.Transparency=0
		end
	end 
	petModel.Parent = eggViewportFive
	local cameraPets = Instance.new("Camera")
	cameraPets.Parent = eggViewportFive
	cameraPets.CFrame = CFrame.new(0,0,-3.3) * CFrame.Angles(0, math.rad(180), 0)
	eggViewportFive.CurrentCamera = cameraPets
	TweenService:Create(eggViewportFive, TweenInfo.new(0.7), {Size = UDim2.new(0.28, 0,0.49, 0)}):Play()
	EggSystem.PetBgFive.Visible=true 
	eggViewportFive.NameLabel.Text = chosenPet.petName
	eggViewportFive.NameLabel.Visible = true
	eggViewportFive.RarityLabel.Text = chosenPet.Rarity
	eggViewportFive.RarityLabel.Visible = true
	task.wait(3)
	TweenService:Create(eggViewportFive, TweenInfo.new(0.3), {Size = UDim2.fromScale(0,0)}):Play()
	task.wait(0.3)
	EggSystem.PetBgFive.Visible=false
	eggViewportFive.NameLabel.Visible = false
	eggViewportFive.RarityLabel.Visible = false
	player:WaitForChild("PlayerGui").PlayerScreenGui.Enabled=true
	EggSystem.Enabled = false
	local galaxy=0
	if chosenPet.petName=="Galaxy Axolotl" or chosenPet.petName=="Galaxy Luminar Fish" or chosenPet.petName=="Galaxy Shadow Glide" or chosenPet.petName=="Galaxy Hydra" then
		galaxy = 1
	end
	addToInventory(chosenPet.petName,chosenPet.Rarity,0,galaxy)
	eggMesh,camera,cameraPets,petModel,galaxy=nil
end

local function hatchEggSix(fasthatch,eggName, chosenPet)
	for _,v in pairs(player:WaitForChild("PlayerGui"):GetChildren()) do
		if v:IsA("ScreenGui") and v ~= EggSystem and v ~= ConfettiSystem then
			v.Enabled = false
		end
	end
	EggSystem.Enabled = true
	for _,v in pairs(eggViewportSix:GetChildren()) do
		if v:IsA("Camera") or v:IsA("BasePart") or v:IsA("Model") then
			v:Destroy()
		end
	end
	eggViewportSix.Size = UDim2.fromScale(0,0)
	local eggMesh = eggs:FindFirstChild(eggName):Clone()
	eggMesh.Parent = eggViewportSix
	eggMesh.CFrame = CFrame.new(0,0,0)
	local camera = Instance.new("Camera")
	camera.Parent = eggViewportSix
	camera.CFrame = CFrame.new(0,0,4)
	eggViewportSix.CurrentCamera = camera
	TweenService:Create(eggViewportSix, TweenInfo.new(0.7), {Size = UDim2.new(0.28, 0,0.49, 0)}):Play()
	task.wait(0.7)
	if fasthatch==false then
		for i = 1,2 do
			TweenService:Create(eggViewportSix, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 20}):Play()
			eggCrunch:Play()
			task.wait(0.3)
			TweenService:Create(eggViewportSix, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = -20}):Play()
			eggCrunch:Play()
			task.wait(0.3)
		end
		TweenService:Create(eggViewportSix, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 0}):Play()
		eggCrunch:Play()
		task.wait(0.3)
	end
	if fasthatch then
		eggCrunch:Play()
	end
	TweenService:Create(eggViewportSix, TweenInfo.new(0.7), {Size = UDim2.fromScale(0,0)}):Play()
	task.wait(0.7)
	for _,v in pairs(eggViewportSix:GetChildren()) do
		if v:IsA("Camera") or v:IsA("BasePart") or v:IsA("Model") then
			v:Destroy()
		end
	end
	local petModel = pets:FindFirstChild(chosenPet.petName):Clone()
	petModel:PivotTo(CFrame.new(0,0,0))
	for _,v in pairs(petModel:GetChildren())  do
		if v:IsA("MeshPart") then
			v.Transparency=0
		end
	end
	petModel.Parent = eggViewportSix
	local cameraPets = Instance.new("Camera")
	cameraPets.Parent = eggViewportSix
	cameraPets.CFrame = CFrame.new(0,0,-3.3) * CFrame.Angles(0, math.rad(180), 0)
	eggViewportSix.CurrentCamera = cameraPets
	TweenService:Create(eggViewportSix, TweenInfo.new(0.7), {Size = UDim2.new(0.28, 0,0.49, 0)}):Play()
	EggSystem.PetBgSix.Visible=true 
	eggViewportSix.NameLabel.Text = chosenPet.petName
	eggViewportSix.NameLabel.Visible = true
	eggViewportSix.RarityLabel.Text = chosenPet.Rarity
	eggViewportSix.RarityLabel.Visible = true
	task.wait(3)
	TweenService:Create(eggViewportSix, TweenInfo.new(0.3), {Size = UDim2.fromScale(0,0)}):Play()
	task.wait(0.3)
	EggSystem.PetBgSix.Visible=false
	eggViewportSix.NameLabel.Visible = false
	eggViewportSix.RarityLabel.Visible = false
	player:WaitForChild("PlayerGui").PlayerScreenGui.Enabled=true
	EggSystem.Enabled = false
	local galaxy=0
	if chosenPet.petName=="Galaxy Axolotl" or chosenPet.petName=="Galaxy Luminar Fish" or chosenPet.petName=="Galaxy Shadow Glide" or chosenPet.petName=="Galaxy Hydra" then
		galaxy = 1
	end
	addToInventory(chosenPet.petName,chosenPet.Rarity,0,galaxy)
	eggMesh,camera,cameraPets,petModel,galaxy=nil
end

local function hatchEggSeven(fasthatch,eggName, chosenPet)
	for _,v in pairs(player:WaitForChild("PlayerGui"):GetChildren()) do
		if v:IsA("ScreenGui") and v ~= EggSystem and v ~= ConfettiSystem then
			v.Enabled = false
		end
	end
	EggSystem.Enabled = true
	for _,v in pairs(eggViewportSeven:GetChildren()) do
		if v:IsA("Camera") or v:IsA("BasePart") or v:IsA("Model") then
			v:Destroy()
		end
	end
	eggViewportSeven.Size = UDim2.fromScale(0,0)
	local eggMesh = eggs:FindFirstChild(eggName):Clone()
	eggMesh.Parent = eggViewportSeven
	eggMesh.CFrame = CFrame.new(0,0,0)
	local camera = Instance.new("Camera")
	camera.Parent = eggViewportSeven
	camera.CFrame = CFrame.new(0,0,4)
	eggViewportSeven.CurrentCamera = camera
	TweenService:Create(eggViewportSeven, TweenInfo.new(0.7), {Size = UDim2.new(0.28, 0,0.49, 0)}):Play()
	task.wait(0.7)
	if fasthatch==false then
		for i = 1,2 do
			TweenService:Create(eggViewportSeven, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 20}):Play()
			eggCrunch:Play()
			task.wait(0.3)
			TweenService:Create(eggViewportSeven, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = -20}):Play()
			eggCrunch:Play()
			task.wait(0.3)
		end
		TweenService:Create(eggViewportSeven, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 0}):Play()
		eggCrunch:Play()
		task.wait(0.3)
	end
	if fasthatch then
		eggCrunch:Play()
	end
	TweenService:Create(eggViewportSeven, TweenInfo.new(0.7), {Size = UDim2.fromScale(0,0)}):Play()
	task.wait(0.7)
	for _,v in pairs(eggViewportSeven:GetChildren()) do
		if v:IsA("Camera") or v:IsA("BasePart") or v:IsA("Model") then
			v:Destroy()
		end
	end
	local petModel = pets:FindFirstChild(chosenPet.petName):Clone()
	petModel:PivotTo(CFrame.new(0,0,0))
	for _,v in pairs(petModel:GetChildren())  do
		if v:IsA("MeshPart") then
			v.Transparency=0
		end
	end 
	petModel.Parent = eggViewportSeven
	local cameraPets = Instance.new("Camera")
	cameraPets.Parent = eggViewportSeven
	cameraPets.CFrame = CFrame.new(0,0,-3.3) * CFrame.Angles(0, math.rad(180), 0)
	eggViewportSeven.CurrentCamera = cameraPets
	TweenService:Create(eggViewportSeven, TweenInfo.new(0.7), {Size = UDim2.new(0.28, 0,0.49, 0)}):Play()
	EggSystem.PetBgSeven.Visible=true 
	eggViewportSeven.NameLabel.Text = chosenPet.petName
	eggViewportSeven.NameLabel.Visible = true
	eggViewportSeven.RarityLabel.Text = chosenPet.Rarity
	eggViewportSeven.RarityLabel.Visible = true
	task.wait(3)
	TweenService:Create(eggViewportSeven, TweenInfo.new(0.3), {Size = UDim2.fromScale(0,0)}):Play()
	task.wait(0.3)
	EggSystem.PetBgSeven.Visible=false
	eggViewportSeven.NameLabel.Visible = false
	eggViewportSeven.RarityLabel.Visible = false
	player:WaitForChild("PlayerGui").PlayerScreenGui.Enabled=true
	EggSystem.Enabled = false
	local galaxy=0
	if chosenPet.petName=="Galaxy Axolotl" or chosenPet.petName=="Galaxy Luminar Fish" or chosenPet.petName=="Galaxy Shadow Glide" or chosenPet.petName=="Galaxy Hydra" then
		galaxy = 1
	end
	addToInventory(chosenPet.petName,chosenPet.Rarity,0,galaxy)
	eggMesh,camera,cameraPets,petModel,galaxy=nil
end

local function hatchEggEight(fasthatch,eggName, chosenPet)
	for _,v in pairs(player:WaitForChild("PlayerGui"):GetChildren()) do
		if v:IsA("ScreenGui") and v ~= EggSystem and v ~= ConfettiSystem then
			v.Enabled = false
		end
	end
	EggSystem.Enabled = true
	for _,v in pairs(eggViewportEight:GetChildren()) do
		if v:IsA("Camera") or v:IsA("BasePart") or v:IsA("Model") then
			v:Destroy()
		end
	end
	eggViewportEight.Size = UDim2.fromScale(0,0)
	local eggMesh = eggs:FindFirstChild(eggName):Clone()
	eggMesh.Parent = eggViewportEight
	eggMesh.CFrame = CFrame.new(0,0,0)
	local camera = Instance.new("Camera")
	camera.Parent = eggViewportEight
	camera.CFrame = CFrame.new(0,0,4)
	eggViewportEight.CurrentCamera = camera
	TweenService:Create(eggViewportEight, TweenInfo.new(0.7), {Size = UDim2.new(0.28, 0,0.49, 0)}):Play()
	task.wait(0.7)
	if fasthatch==false then
		for i = 1,2 do
			TweenService:Create(eggViewportEight, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 20}):Play()
			eggCrunch:Play()
			task.wait(0.3)
			TweenService:Create(eggViewportEight, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = -20}):Play()
			eggCrunch:Play()
			task.wait(0.3)
		end
		TweenService:Create(eggViewportEight, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 0}):Play()
		eggCrunch:Play()
		task.wait(0.3)
	end
	if fasthatch then
		eggCrunch:Play()
	end
	TweenService:Create(eggViewportEight, TweenInfo.new(0.7), {Size = UDim2.fromScale(0,0)}):Play()
	task.wait(0.7)
	for _,v in pairs(eggViewportEight:GetChildren()) do
		if v:IsA("Camera") or v:IsA("BasePart") or v:IsA("Model") then
			v:Destroy()
		end
	end
	local petModel = pets:FindFirstChild(chosenPet.petName):Clone()
	petModel:PivotTo(CFrame.new(0,0,0))
	for _,v in pairs(petModel:GetChildren())  do
		if v:IsA("MeshPart") then
			v.Transparency=0
		end
	end
	petModel.Parent = eggViewportEight
	local cameraPets = Instance.new("Camera")
	cameraPets.Parent = eggViewportEight
	cameraPets.CFrame = CFrame.new(0,0,-3.3) * CFrame.Angles(0, math.rad(180), 0)
	eggViewportEight.CurrentCamera = cameraPets
	TweenService:Create(eggViewportEight, TweenInfo.new(0.7), {Size = UDim2.new(0.28, 0,0.49, 0)}):Play()
	EggSystem.PetBgEight.Visible=true 
	eggViewportEight.NameLabel.Text = chosenPet.petName
	eggViewportEight.NameLabel.Visible = true
	eggViewportEight.RarityLabel.Text = chosenPet.Rarity
	eggViewportEight.RarityLabel.Visible = true
	task.wait(3)
	TweenService:Create(eggViewportEight, TweenInfo.new(0.3), {Size = UDim2.fromScale(0,0)}):Play()
	task.wait(0.3)
	EggSystem.PetBgEight.Visible=false
	eggViewportEight.NameLabel.Visible = false
	eggViewportEight.RarityLabel.Visible = false
	player:WaitForChild("PlayerGui").PlayerScreenGui.Enabled=true
	EggSystem.Enabled = false
	local galaxy=0
	if chosenPet.petName=="Galaxy Axolotl" or chosenPet.petName=="Galaxy Luminar Fish" or chosenPet.petName=="Galaxy Shadow Glide" or chosenPet.petName=="Galaxy Hydra" then
		galaxy = 1
	end
	addToInventory(chosenPet.petName,chosenPet.Rarity,0,galaxy)
	eggMesh,camera,cameraPets,petModel,galaxy=nil
end

remoteEvent5.OnClientEvent:Connect(function(pet,rarity,glitch)
	addToInventory(pet,rarity,glitch)
end)

local function hatchEgg(eggName,fasthatch,action,chosenPet,chosenPet2,chosenPet3,chosenPet4,chosenPet5,chosenPet6,chosenPet7,chosenPet8)
	BlurFX.Size=18
	if action==1 then
		for _,v in pairs(player:WaitForChild("PlayerGui"):GetChildren()) do
			if v:IsA("ScreenGui") and v ~= EggSystem and v ~= ConfettiSystem then
				v.Enabled = false
			end
		end
		EggSystem.Enabled = true
		for _,v in pairs(eggViewport:GetChildren()) do
			if v:IsA("Camera") or v:IsA("BasePart") or v:IsA("Model") then
				v:Destroy()
			end
		end
		eggViewport.Size = UDim2.fromScale(0,0)
		local eggMesh = eggs:FindFirstChild(eggName):Clone()
		eggMesh.Parent = eggViewport
		eggMesh.CFrame = CFrame.new(0,0,0)
		local camera = Instance.new("Camera")
		camera.Parent = eggViewport
		camera.CFrame = CFrame.new(0,0,4)
		eggViewport.CurrentCamera = camera
		TweenService:Create(eggViewport, TweenInfo.new(0.7), {Size = UDim2.new(0.28, 0,0.49, 0)}):Play()
		task.wait(0.7)
		if fasthatch==false then
			for i = 1,2 do
				TweenService:Create(eggViewport, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 20}):Play()
				eggCrunch:Play()
				task.wait(0.3)
				TweenService:Create(eggViewport, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = -20}):Play()
				eggCrunch:Play()
				task.wait(0.3)
			end
			TweenService:Create(eggViewport, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 0}):Play()
			eggCrunch:Play()
			task.wait(0.3)
		end
		if fasthatch then
			eggCrunch:Play()
		end
		TweenService:Create(eggViewport, TweenInfo.new(0.7), {Size = UDim2.fromScale(0,0)}):Play()
		task.wait(0.7)
		for _,v in pairs(eggViewport:GetChildren()) do
			if v:IsA("Camera") or v:IsA("BasePart") or v:IsA("Model") then
				v:Destroy()
			end
		end	
		local petModel = pets:FindFirstChild(chosenPet.petName):Clone()
		tadaa:Play()
		petModel:PivotTo(CFrame.new(0,0,0))
		for _,v in pairs(petModel:GetChildren())  do
			if v:IsA("MeshPart") then
				v.Transparency=0
			end
		end
		petModel.Parent = eggViewport
		local cameraPets = Instance.new("Camera")
		cameraPets.Parent = eggViewport
		cameraPets.CFrame = CFrame.new(0,0,-3.3) * CFrame.Angles(0, math.rad(180), 0)
		eggViewport.CurrentCamera = cameraPets
		TweenService:Create(eggViewport, TweenInfo.new(0.7), {Size = UDim2.new(0.28, 0,0.49, 0)}):Play()
		coroutine.wrap(function()
			CreateConfetti(origin,10,{Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 119, 0), Color3.fromRGB(255, 234, 0), Color3.fromRGB(47, 255, 0), Color3.fromRGB(0, 255, 247), Color3.fromRGB(0, 4, 255), Color3.fromRGB(140, 0, 255), Color3.fromRGB(255, 0, 212)},30,40,400,2000,15,30,50,100,0,0)

			CreateConfetti(origin2,10,{Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 119, 0), Color3.fromRGB(255, 234, 0), Color3.fromRGB(47, 255, 0), Color3.fromRGB(0, 255, 247), Color3.fromRGB(0, 4, 255), Color3.fromRGB(140, 0, 255), Color3.fromRGB(255, 0, 212)},30,40,400,2000,15,30,50,100,0,0)

			CreateConfetti(origin3,10,{Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 119, 0), Color3.fromRGB(255, 234, 0), Color3.fromRGB(47, 255, 0), Color3.fromRGB(0, 255, 247), Color3.fromRGB(0, 4, 255), Color3.fromRGB(140, 0, 255), Color3.fromRGB(255, 0, 212)},30,40,400,2000,15,30,50,100,0,0)
		end)()
		EggSystem.PetBg.Visible=true
		eggViewport.NameLabel.Text = chosenPet.petName
		eggViewport.NameLabel.Visible = true
		eggViewport.RarityLabel.Text = chosenPet.Rarity
		eggViewport.RarityLabel.Visible = true
		task.wait(3)
		TweenService:Create(eggViewport, TweenInfo.new(0.3), {Size = UDim2.fromScale(0,0)}):Play()
		task.wait(0.3)
		EggSystem.PetBg.Visible=false
		eggViewport.NameLabel.Visible = false
		eggViewport.RarityLabel.Visible = false
		player:WaitForChild("PlayerGui").PlayerScreenGui.Enabled=true
		EggSystem.Enabled = false
		local galaxy=0
		if chosenPet.petName=="Galaxy Axolotl" or chosenPet.petName=="Galaxy Luminar Fish" or chosenPet.petName=="Galaxy Shadow Glide" or chosenPet.petName=="Galaxy Hydra" then
			galaxy = 1
		end
		addToInventory(chosenPet.petName,chosenPet.Rarity,0,galaxy)
		BlurFX.Size=0
	elseif action==3 then
		coroutine.wrap(function()
			hatchEggLeft(fasthatch,eggName, chosenPet2)
		end)()
		coroutine.wrap(function()
			hatchEggRight(fasthatch,eggName, chosenPet3)
		end)()
		for _,v in pairs(player:WaitForChild("PlayerGui"):GetChildren()) do
			if v:IsA("ScreenGui") and v ~= EggSystem and v ~= ConfettiSystem then
				v.Enabled = false
			end
		end
		EggSystem.Enabled = true
		for _,v in pairs(eggViewport:GetChildren()) do
			if v:IsA("Camera") or v:IsA("BasePart") or v:IsA("Model") then
				v:Destroy()
			end
		end
		eggViewport.Size = UDim2.fromScale(0,0)
		local eggMesh = eggs:FindFirstChild(eggName):Clone()
		eggMesh.Parent = eggViewport
		eggMesh.CFrame = CFrame.new(0,0,0)
		local camera = Instance.new("Camera")
		camera.Parent = eggViewport
		camera.CFrame = CFrame.new(0,0,4)
		eggViewport.CurrentCamera = camera
		TweenService:Create(eggViewport, TweenInfo.new(0.7), {Size = UDim2.new(0.28, 0,0.49, 0)}):Play()
		task.wait(0.7)
		if fasthatch==false then
			for i = 1,2 do
				TweenService:Create(eggViewport, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 20}):Play()
				eggCrunch:Play()
				task.wait(0.3)
				TweenService:Create(eggViewport, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = -20}):Play()
				eggCrunch:Play()
				task.wait(0.3)
			end
			TweenService:Create(eggViewport, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 0}):Play()
			eggCrunch:Play()
			task.wait(0.3)
		end
		if fasthatch then
			eggCrunch:Play()
		end
		TweenService:Create(eggViewport, TweenInfo.new(0.7), {Size = UDim2.fromScale(0,0)}):Play()
		task.wait(0.7)
		for _,v in pairs(eggViewport:GetChildren()) do
			if v:IsA("Camera") or v:IsA("BasePart") or v:IsA("Model") then
				v:Destroy()
			end
		end
		local petModel = pets:FindFirstChild(chosenPet.petName):Clone()
		tadaa:Play()
		petModel:PivotTo(CFrame.new(0,0,0))
		for _,v in pairs(petModel:GetChildren())  do
			if v:IsA("MeshPart") then
				v.Transparency=0
			end
		end
		petModel.Parent = eggViewport
		local cameraPets = Instance.new("Camera")
		cameraPets.Parent = eggViewport
		cameraPets.CFrame = CFrame.new(0,0,-3.3) * CFrame.Angles(0, math.rad(180), 0)
		eggViewport.CurrentCamera = cameraPets
		TweenService:Create(eggViewport, TweenInfo.new(0.7), {Size = UDim2.new(0.28, 0,0.49, 0)}):Play()
		coroutine.wrap(function()
			CreateConfetti(origin,10,{Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 119, 0), Color3.fromRGB(255, 234, 0), Color3.fromRGB(47, 255, 0), Color3.fromRGB(0, 255, 247), Color3.fromRGB(0, 4, 255), Color3.fromRGB(140, 0, 255), Color3.fromRGB(255, 0, 212)},30,40,400,2000,15,30,50,100,0,0)

			CreateConfetti(origin2,10,{Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 119, 0), Color3.fromRGB(255, 234, 0), Color3.fromRGB(47, 255, 0), Color3.fromRGB(0, 255, 247), Color3.fromRGB(0, 4, 255), Color3.fromRGB(140, 0, 255), Color3.fromRGB(255, 0, 212)},30,40,400,2000,15,30,50,100,0,0)

			CreateConfetti(origin3,10,{Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 119, 0), Color3.fromRGB(255, 234, 0), Color3.fromRGB(47, 255, 0), Color3.fromRGB(0, 255, 247), Color3.fromRGB(0, 4, 255), Color3.fromRGB(140, 0, 255), Color3.fromRGB(255, 0, 212)},30,40,400,2000,15,30,50,100,0,0)
		end)()
		EggSystem.PetBg.Visible=true
		eggViewport.NameLabel.Text = chosenPet.petName
		eggViewport.NameLabel.Visible = true
		eggViewport.RarityLabel.Text = chosenPet.Rarity
		eggViewport.RarityLabel.Visible = true
		task.wait(3)
		TweenService:Create(eggViewport, TweenInfo.new(0.3), {Size = UDim2.fromScale(0,0)}):Play()
		task.wait(0.3)
		EggSystem.PetBg.Visible=false
		eggViewport.NameLabel.Visible = false
		eggViewport.RarityLabel.Visible = false
		player:WaitForChild("PlayerGui").PlayerScreenGui.Enabled=true
		EggSystem.Enabled = false
		local galaxy=0
		if chosenPet.petName=="Galaxy Axolotl" or chosenPet.petName=="Galaxy Luminar Fish" or chosenPet.petName=="Galaxy Shadow Glide" or chosenPet.petName=="Galaxy Hydra" then
			galaxy = 1
		end
		addToInventory(chosenPet.petName,chosenPet.Rarity,0,galaxy)
		BlurFX.Size=0
		eggMesh,camera,cameraPets,petModel,galaxy=nil
	elseif action==8 then
		--print(chosenPet)
		--print(chosenPet2)
		--print(chosenPet3)
		--print(chosenPet4)
		--print(chosenPet5)
		--print(chosenPet6)
		--print(chosenPet7)
		--print(chosenPet8)
		coroutine.wrap(function()
			hatchEggOne(fasthatch,eggName, chosenPet)
		end)()
		coroutine.wrap(function()
			hatchEggTwo(fasthatch,eggName, chosenPet2)
		end)()
		coroutine.wrap(function()
			hatchEggThree(fasthatch,eggName, chosenPet3)
		end)()
		coroutine.wrap(function()
			hatchEggFour(fasthatch,eggName, chosenPet4)
		end)()
		coroutine.wrap(function()
			hatchEggFive(fasthatch,eggName, chosenPet5)
		end)()
		coroutine.wrap(function()
			hatchEggSix(fasthatch,eggName, chosenPet6)
		end)()
		coroutine.wrap(function()
			hatchEggSeven(fasthatch,eggName, chosenPet7)
		end)()
		coroutine.wrap(function()
			hatchEggEight(fasthatch,eggName, chosenPet8)
		end)()
	end
end

remoteEvent.OnClientEvent:Connect(hatchEgg)
