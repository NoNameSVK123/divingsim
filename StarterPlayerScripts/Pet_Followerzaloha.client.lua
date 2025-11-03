local runService = game:GetService("RunService")

local playerPets = workspace:WaitForChild("PetSystem"):WaitForChild("PlayerPets")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local remoteEvent6 = ReplicatedStorage:WaitForChild("PetFix")

local circle = math.pi * 2
local maxPetsPerRow = 2 --how many pets can be in one row
local distancebetweenColumns = 5 --gap between columns
local distanceBetweenRows = 5 --gap between rows
local behindPlayerDistance = 6 --distance from player
local floatHeight = 3 --height above the ground
local smoothness = 8
local petsound
local function getPosition(angle, radius)
	local x = math.cos(angle) * radius
	local z = math.sin(angle) * radius
	return x, z
end
local debounce=false
local soundservice = game:GetService("SoundService")
local petsounds = {soundservice:WaitForChild("PetSound1"),soundservice:WaitForChild("PetSound2"),soundservice:WaitForChild("PetSound3")}

local function sound(pet)
	if debounce==false then
		debounce=true
		game:GetService("ReplicatedStorage"):WaitForChild("MoveSound"):FireServer(petsound,pet)
		wait(0.2)
		debounce=false
	end
end


function GridPositionGen(numOfPets, petIndex, playerHrp) :Vector3

	--lua for loop starts at 1
	petIndex -= 1
	local temp = maxPetsPerRow
	if numOfPets < maxPetsPerRow then
		maxPetsPerRow = numOfPets
	end

	local horizontalOffset = 0

	if petIndex - maxPetsPerRow*math.floor(numOfPets/maxPetsPerRow) < 0 then
		horizontalOffset = (petIndex%maxPetsPerRow * distancebetweenColumns) - ((maxPetsPerRow-1)*distancebetweenColumns)/2
	else
		maxPetsPerRow = numOfPets - maxPetsPerRow*math.floor(numOfPets/maxPetsPerRow)
		horizontalOffset = petIndex%maxPetsPerRow * distancebetweenColumns - ((maxPetsPerRow-1)*distancebetweenColumns)/2
		maxPetsPerRow = temp
	end

	local backwardsOffset = playerHrp.Position - playerHrp.CFrame.LookVector*behindPlayerDistance - playerHrp.CFrame.LookVector*distanceBetweenRows*(math.floor(petIndex/maxPetsPerRow))

	local offset = backwardsOffset + playerHrp.CFrame.RightVector*horizontalOffset

	maxPetsPerRow = temp

	return offset

end

function CheckForFloor(offset:Vector3, filter:{Instance})

	--raycast from the offset downwards to detect the floor
	local rayParams = RaycastParams.new()
	rayParams.FilterDescendantsInstances = filter
	local ray = workspace:Raycast(offset + Vector3.new(0, 5, 0), Vector3.new(0, -9999, 0), rayParams)

	if ray then 
		--If the ray hit a floor it will return the Y coord + floatHeight
		return ray.Position.Y + floatHeight
	else
		--If the ray didn't hit a floor is will return nil and print a warning
		warn("no floor detected")
		return
	end

end

local function positionPets(character, folder, dt) 
	petsound = math.random(1,3)
	for i, pet in pairs(folder:GetChildren()) do
		if pet:IsA("Model") then
			local hrp = character:WaitForChild("HumanoidRootPart")
			local radius = 4+#folder:GetChildren()
			local angle = i * (circle / #folder:GetChildren())
			local x, z = getPosition(angle, radius)
			local _, characterSize = character:GetBoundingBox()
			local _, petSize = pet:GetBoundingBox()
			local offset = GridPositionGen(#folder:GetChildren(), i, hrp)

			local offsetY = - characterSize.Y/2 + petSize.Y/2
			local verticalPos =  CheckForFloor(offset, {character, folder}) or hrp.CFrame.Position.Y 

			offset = Vector3.new(offset.X, verticalPos, offset.Z)
			local sin = (math.sin(15 * time() + 1.6)/.5)+1
			local cos = math.cos(7 * time() + 1)/4

			local c = CFrame.new(offset, offset + hrp.CFrame.LookVector)

			if pet:FindFirstChild("Attack").Value ~= nil then
				if pet:FindFirstChild("Walks") then
					if pet:FindFirstChild("Attack").Value.PrimaryPart then
						local position = (pet:FindFirstChild("Attack").Value.PrimaryPart.CFrame * CFrame.new(x, 0, z)).p
						local lookAt = pet:FindFirstChild("Attack").Value.PrimaryPart.Position
						pet:SetPrimaryPartCFrame(pet.PrimaryPart.CFrame:Lerp(CFrame.new(position, lookAt) * CFrame.new(0, 1 +sin, 0) * CFrame.fromEulerAnglesXYZ(0,0,cos),0.1))
					else
						remoteEvent6:FireServer(pet:FindFirstChild("Attack").Value)
					end
				else
					if pet:FindFirstChild("Attack").Value.PrimaryPart then
						local position = (pet:FindFirstChild("Attack").Value.PrimaryPart.CFrame * CFrame.new(x, 0, z)).p
						local lookAt = pet:FindFirstChild("Attack").Value.PrimaryPart.Position
						pet:SetPrimaryPartCFrame(pet.PrimaryPart.CFrame:Lerp(CFrame.new(position, lookAt) * CFrame.new(0, 3+math.sin(time()*7)/2, 0) * CFrame.fromEulerAnglesXYZ(cos,0,0) ,0.1))
					else
						remoteEvent6:FireServer(pet:FindFirstChild("Attack").Value)
					end
				end 
			else
				if character.Humanoid.MoveDirection.Magnitude > 0 then
					if pet.PrimaryPart~=nil then
						coroutine.wrap(function()
							sound(pet.PrimaryPart)
						end)()
						if pet:FindFirstChild("Walks") then
							pet:SetPrimaryPartCFrame(pet.PrimaryPart.CFrame:Lerp(CFrame.new(offset, offset+ hrp.CFrame.LookVector)* CFrame.new(0, 1 +sin, 0) * CFrame.fromEulerAnglesXYZ(0,0,cos),smoothness*dt))
						else
							pet:SetPrimaryPartCFrame(pet.PrimaryPart.CFrame:Lerp(c * CFrame.new(0, 3+math.sin(time()*7)/2, 0) * CFrame.fromEulerAnglesXYZ(cos,0,0),smoothness*dt))
						end 			
					end
				else
					if pet.PrimaryPart~=nil then
						--petsounds[petsound]:Play()
						if pet:FindFirstChild("Walks") then 
							pet:SetPrimaryPartCFrame(pet.PrimaryPart.CFrame:Lerp(CFrame.new(offset, offset+ hrp.CFrame.LookVector),smoothness*dt))
						else
							pet:SetPrimaryPartCFrame(pet.PrimaryPart.CFrame:Lerp(c,smoothness*dt))
						end
					end			
				end
				if pet:WaitForChild("aligned").Value==false then
					pet:WaitForChild("aligned").Value=true
					soundservice:WaitForChild("PetSpawn"):Play()
					task.delay(1,function()
						for _,v in pairs(pet:FindFirstChild("spawnParticle"):GetChildren()) do
							v.Enabled=true
						end
						task.wait(1)
						if pet.Parent.Name==game:GetService("Players").LocalPlayer.Name then
							pet.spawnParticle:Destroy()
							for _,v in pairs(pet:GetDescendants())  do
								if v:isA("MeshPart") then
									v.Transparency=0
								end
								if v:isA("BillboardGui") then
									v.Enabled=true
								end
							end
						end		
					end)
				end
			end

		end
		
	end
end

runService.RenderStepped:Connect(function(dt)
	for _, PlrFolder in pairs(playerPets:GetChildren()) do
		local Player = game.Players:FindFirstChild(PlrFolder.Name) or nil
		if Player ~= nil then
			local character = Player.Character or nil
			if character ~= nil then
				positionPets(character, PlrFolder, dt)
			end
		end
 	end
end)


