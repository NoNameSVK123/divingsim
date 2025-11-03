
local threshval = 10
local crctval = 0.001
local startingdens = 1
local finaldens = 0


local function changeden(num,char)
	char:WaitForChild("HumanoidRootPart")
	local parts = char:GetDescendants()
	for _,desc in pairs(parts) do
		if desc:IsA("BasePart") then --and desc.name=="HumanoidRootPart" then
			--if desc.Name ~= "Handle" then
			desc.CustomPhysicalProperties = PhysicalProperties.new(0.9949999999999999,0.5,1,0.3,1)
			--end
		end	
	end
end

local function upden(num,char)
	startingdens = startingdens+num
	char:WaitForChild("HumanoidRootPart")
	local parts = char:GetDescendants()
	for _,desc in pairs(parts) do
		if desc:IsA("BasePart") then --and desc.name=="HumanoidRootPart" then
			--if desc.Name ~= "Handle" then
			desc.CustomPhysicalProperties = PhysicalProperties.new(startingdens,0.5,1,0.3,1)
			--end
		end	
	end
end

--------------------------------------------------------------------------------

local requirement = true
local run = game["Run Service"]
game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
	if requirement == false then
		changeden(finaldens,char)
	else
		local hum = char:WaitForChild("Humanoid")
		local rp = char:WaitForChild("HumanoidRootPart")
		changeden(startingdens,char)
		local time1 = tick() - 0
		local debounce = true
		local rpy = rp.Position.Y
		run.RenderStepped:Connect(function()
			if debounce == true and requirement == true then
				debounce = false	
				local curt = tick()
				local cury = rp.Position.Y
				local vel = ((cury-rpy)/(curt-time1))
				if vel>-10 and vel <10 and hum:GetState() == Enum.HumanoidStateType.Swimming then	
					local correctionval = (vel/math.abs(vel))*crctval
					if crctval> math.abs(vel)then
						requirement = false
						print("corrected velocity for ".. char.Name..". Final Density = "..startingdens)
						finaldens = startingdens
						crctval = 0
					end
					upden((vel/math.abs(vel))*crctval,char)
				end
				rpy = cury
				time1 = curt
				debounce = true
				if requirement == false then
					changeden(finaldens,char)
				end
			end	
		end)
	end	
end)