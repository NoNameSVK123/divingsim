local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("UnlockZone")
local TweenService = game:GetService("TweenService")
local ss = game:GetService("SoundService")
wait(3)
local CameraShaker = require(script.Parent.CameraShaker)
local camera = workspace.CurrentCamera

local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
	camera.CFrame = camera.CFrame * shakeCf
end)


function firework()
	game:GetService("SoundService"):WaitForChild("RewardClaim"):Play()
	for i=1,5 do 
		local part = ReplicatedStorage:WaitForChild("EffectStuff"):WaitForChild("FireworkPart"):Clone()
		part.Position = game.Players.LocalPlayer.Character.PrimaryPart.Position
		part.Parent = workspace
		part:WaitForChild("Firework"):Play()
		for _,v in pairs(part:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				v:Emit()
			end
		end
		game.Debris:AddItem(part,3)
		wait(1)
		part=nil
	end
end


remoteEvent.OnClientEvent:Connect(function(zone,status)
	local notfound = true
	if status=="join" then
		while notfound do
			if workspace:WaitForChild("ZoneWalls"):FindFirstChild("WallTo"..zone) then
				notfound=false
				workspace:WaitForChild("ZoneWalls"):WaitForChild("WallTo"..zone):Destroy()
			end
			if game.Players.LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Quests.TabButtons:FindFirstChild("Zone"..zone) then
				game.Players.LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Quests.TabButtons:FindFirstChild("Zone"..zone).Visible=true			
			end
			if game.Players.LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Teleport.ZoneButtons:FindFirstChild("Zone"..zone) then
				game.Players.LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Teleport.ZoneButtons:FindFirstChild("Zone"..zone).LockImage.Visible=false
				game.Players.LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Teleport.ZoneButtons:FindFirstChild("Zone"..zone).Image.Frame.Visible=false			
			end
			if game.Players.LocalPlayer.PlayerGui.PlayerScreenGui.Panels.AutoFarm:FindFirstChild("ZoneButton"..zone) then
				game.Players.LocalPlayer.PlayerGui.PlayerScreenGui.Panels.AutoFarm:FindFirstChild("ZoneButton"..zone).Visible=true			
			end
			wait(1)
		end
	else
		while notfound do
			if workspace:WaitForChild("ZoneWalls"):FindFirstChild("WallTo"..zone) then
				notfound=false
				ss:WaitForChild("Bubbling"):Play()
				task.spawn(function()
					firework()
				end)
				for _,v in pairs(workspace:WaitForChild("ZoneWalls"):WaitForChild("WallTo"..zone):WaitForChild("brokenbarrier"):GetChildren()) do
					v:FindFirstChild("ParticleEmitter").Enabled=true
					TweenService:Create(v,TweenInfo.new(1.4),{Transparency = 0}):Play()
				end
				camShake:Start()

				camShake:Shake(CameraShaker.Presets.Vibration)
				wait(1.4)

				workspace:WaitForChild("ZoneWalls"):WaitForChild("WallTo"..zone).Transparency=1
				workspace:WaitForChild("ZoneWalls"):WaitForChild("WallTo"..zone).Beam.Enabled=false
				game.Players.LocalPlayer.PlayerGui:WaitForChild("WallTo"..zone).Enabled=false
				workspace:WaitForChild("ZoneWalls"):WaitForChild("WallTo"..zone).CanCollide=false
				workspace:WaitForChild("ZoneWalls"):WaitForChild("WallTo"..zone).CanTouch=false
				workspace:WaitForChild("ZoneWalls"):WaitForChild("WallTo"..zone).CanQuery=false

				for _,v in pairs(workspace:WaitForChild("ZoneWalls"):WaitForChild("WallTo"..zone):WaitForChild("brokenbarrier"):GetChildren()) do
					v:FindFirstChild("ParticleEmitter").Enabled=true
					TweenService:Create(v,TweenInfo.new(1.4),{Transparency = 1}):Play()
				end
				wait(1.4)
				for _,v in pairs(workspace:WaitForChild("ZoneWalls"):WaitForChild("WallTo"..zone):WaitForChild("brokenbarrier"):GetChildren()) do
					v:Destroy()
				end
				ss:WaitForChild("Firework"):Play()
				workspace:WaitForChild("ZoneWalls"):WaitForChild("WallTo"..zone):Destroy()
			end
			if game.Players.LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Quests.TabButtons:FindFirstChild("Zone"..zone) then
				game.Players.LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Quests.TabButtons:FindFirstChild("Zone"..zone).Visible=true			
			end
			if game.Players.LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Teleport.ZoneButtons:FindFirstChild("Zone"..zone) then
				game.Players.LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Teleport.ZoneButtons:FindFirstChild("Zone"..zone).LockImage.Visible=false
				game.Players.LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Teleport.ZoneButtons:FindFirstChild("Zone"..zone).Image.Frame.Visible=false			
			end
			if game.Players.LocalPlayer.PlayerGui.PlayerScreenGui.Panels.AutoFarm:FindFirstChild("ZoneButton"..zone) then
				game.Players.LocalPlayer.PlayerGui.PlayerScreenGui.Panels.AutoFarm:FindFirstChild("ZoneButton"..zone).Visible=true			
			end
			wait(1)
		end
	end
end)