local UIS = game:GetService("UserInputService")
local CAS = game:GetService("ContextActionService")
local TweenService = game:GetService("TweenService")
local REPLICATEDSTORAGE = game:GetService("ReplicatedStorage")

local jumpHANDLER = {}

local jumpCHARGER = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("JumpCharger")
local charge = false
local percentage=jumpCHARGER:WaitForChild("BG"):WaitForChild("Percentage")
local TweenInfoSize = TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
local TweenInfoColor = TweenInfo.new(.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)  
local jumpAnim = script:WaitForChild("Jump")
--CAS:UnbindAction("jumpAction")
local Player = game.Players.LocalPlayer
if Player.Character==nil then
	Player.CharacterAdded:Wait()
end
local character = Player.Character
local humanoid = character:WaitForChild("Humanoid")
local jumpAnimTrack = humanoid.Animator:LoadAnimation(jumpAnim)
local REMOTES = REPLICATEDSTORAGE:WaitForChild("REMOTES")
local VoidKillEvent = REMOTES:WaitForChild("VoidKill")
local charging = false
local JumpButton = require(script:WaitForChild("JumpButton"))


function jumpHANDLER.HumanoidJump(power)
	task.defer(function()
		local jumppower=power
		local character = game:GetService("Players").LocalPlayer.Character
		local humanoid = character:WaitForChild("Humanoid")
		game:GetService("Players").LocalPlayer:FindFirstChild("jump").Value = true
		if power<20 then
			jumppower=30
			power=20
		elseif power<=50 then
		else
			power=50+(power/10)
		end
		humanoid.JumpPower=jumppower/1.5
		character:WaitForChild("Trail").Enabled = true
		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		
		-- you need to define the player first
		local HRP = character.HumanoidRootPart

		local Part = HRP -- the part to move

		local Attachment = Instance.new("Attachment", Part) -- the attachment used in Linearvelocity

		local LV = Instance.new("LinearVelocity", Attachment) -- creating the linear velocity
		LV.MaxForce = math.huge -- no need to worry about this
		--LV.VectorVelocity = (HRP.CFrame.lookVector * power)+ (HRP.CFrame.UpVector * jumppower/30) -- change 100 with how fast you want the projectile to go
		LV.Attachment0 = Attachment -- setting the attachment
		--task.delay(.35, function()
		--	LV.VectorVelocity = (HRP.CFrame.lookVector * power)- (HRP.CFrame.UpVector * jumppower/2)
		--end)
		game.Debris:AddItem(Attachment, .5) -- deletes the moving part after 2 second


		local time = 0 -- Variable to track time
		local amplitude = 10 -- The maximum velocity in studs/second
		local frequency = 1 -- How often the wave oscillates per second
		local vector = (HRP.CFrame.lookVector * power)
		local upvector = (HRP.CFrame.UpVector * jumppower/12.5)
		
		local HB = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
			time = time + deltaTime -- Increment time by the frame's delta time
			local oscillation = math.cos(time * frequency * 2 * math.pi) * amplitude
			LV.VectorVelocity = vector+upvector*oscillation -- Oscillate on the X-axis
		end)
		
		humanoid.StateChanged:Connect(function(old,new)
			if new == Enum.HumanoidStateType.Landed then
				HB:Disconnect()
				LV:Destroy()
			end
		end)
		--POZRIET POZNAMKU V ZOSITE  HRP.CFrame.UpVector * jumppower/30 (HRP.CFrame.UpVector * jumppower/30)
		
		--local LookVector = character.HumanoidRootPart.CFrame.LookVector
		--character.HumanoidRootPart.AssemblyLinearVelocity = (LookVector) * power*1.5
		
	
		task.wait()
		humanoid.JumpPower=0
		
		humanoid.StateChanged:Connect(function(old,new)
			if new == Enum.HumanoidStateType.Landed then
				charging = false
				humanoid.WalkSpeed = 20
				character:WaitForChild("HumanoidRootPart"):WaitForChild("Running").Volume=0.65
				game:GetService("Players").LocalPlayer:FindFirstChild("jump").Value=false
				character:WaitForChild("Trail").Enabled = false
			end
		end)
	end)
end


VoidKillEvent.OnClientEvent:Connect(function()
	charging=false
end)


function jumpHANDLER.jump()
	local character = game:GetService("Players").LocalPlayer.Character
	local humanoid = character:WaitForChild("Humanoid")
	if not charging and game:GetService("Players").LocalPlayer:FindFirstChild("frozen").Value==false then
		charging = true
		if game:GetService("Players").LocalPlayer:FindFirstChild("hook").Value==false then
			if game:GetService("Players").LocalPlayer:FindFirstChild("jump").Value==false then
				if not jumpAnimTrack.IsPlaying then 
					task.defer(function()
						jumpAnimTrack = humanoid.Animator:LoadAnimation(jumpAnim)
						jumpAnimTrack:Play()
					end)
				end
				humanoid.WalkSpeed = 3
				character:WaitForChild("HumanoidRootPart"):WaitForChild("Running").Volume=0
				
				game:GetService("Players").LocalPlayer:FindFirstChild("charge").Value=true
				while game:GetService("Players").LocalPlayer:FindFirstChild("charge").Value do
					percentage.Value+=9
					if percentage.Value>100 then
						percentage.Value=100
					end
					local Size = {Size = UDim2.new(percentage.Value/100,0,1,0)}
					local Color
					if percentage.Value<33 then
						Color = {BackgroundColor3  = Color3.new(0.333333, 1, 0)}
					elseif percentage.Value<66 then
						Color = {BackgroundColor3  = Color3.new(1, 1, 0)}
					else
						Color = {BackgroundColor3  = Color3.new(0.666667, 0, 0)}
					end
					TweenService:Create(jumpCHARGER:WaitForChild("BG"):WaitForChild("ChargeFrame"), TweenInfoColor, Color):Play()
					TweenService:Create(jumpCHARGER:WaitForChild("BG"):WaitForChild("ChargeFrame"), TweenInfoSize, Size):Play()
					--jumpCHARGER.BG.ChargeFrame.Size = UDim2.new(percentage.Value/100,0,1,0)
					task.wait(.1)
				end
			end
		end
	end
end

function jumpHANDLER.stopJump()
	local character = game:GetService("Players").LocalPlayer.Character
	local humanoid = character:WaitForChild("Humanoid")
	if game:GetService("Players").LocalPlayer:FindFirstChild("hook").Value==false then
		if game:GetService("Players").LocalPlayer:FindFirstChild("jump").Value==false and game:GetService("Players").LocalPlayer:FindFirstChild("frozen").Value==false then
			if jumpAnimTrack.IsPlaying then 
				task.defer(function()
					jumpAnimTrack:Stop()
				end)
			end
			jumpHANDLER.HumanoidJump(percentage.Value)
			game:GetService("Players").LocalPlayer:FindFirstChild("charge").Value=false
			percentage.Value=0
			local Size = {Size = UDim2.new(0,0,1,0)}
			local Color = {BackgroundColor3  = Color3.new(0.333333, 1, 0)}
			TweenService:Create(jumpCHARGER:WaitForChild("BG"):WaitForChild("ChargeFrame"), TweenInfoColor, Color):Play()
			TweenService:Create(jumpCHARGER:WaitForChild("BG"):WaitForChild("ChargeFrame"), TweenInfoSize, Size):Play()
		end
	end
end


UIS.InputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.Space then
		task.defer(function()
			jumpHANDLER.stopJump()
		end)
	end
end)

JumpButton.OnRelease:Connect(function()
	task.defer(function()
		jumpHANDLER.stopJump()
	end)
end)

UIS.JumpRequest:Connect(function()
	humanoid.JumpPower=0
	task.defer(function()
		jumpHANDLER.jump()
	end)
end)

Player.CharacterAdded:Connect(function()
	Player:WaitForChild("jump").Value = false
end)

return jumpHANDLER
