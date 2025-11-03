local rs = game:GetService("ReplicatedStorage")
local cs = game:GetService("CollectionService")
local ts = game:GetService("TweenService")
local remote = rs:WaitForChild("GoldenShells")

remote.OnClientEvent:Connect(function(shells,status)
	if status=="join" then
		for i=1,#shells do
			if shells[i] then
				if workspace:WaitForChild("GoldenShells"):FindFirstChild("GoldenShell"..i) then
					workspace:WaitForChild("GoldenShells"):WaitForChild("GoldenShell"..i):Destroy()
				end
			end
		end
	elseif status=="collect" then
		local collected=0
		for i=1,#shells do
			if shells[i] then
				collected+=1
			end
		end
		local gs = game.Players.LocalPlayer.PlayerGui.PlayerScreenGui.GoldenShells
		local size1 = gs.Size
		gs.Size=UDim2.new(0,0,0,0)
		gs.TextLabel.Text = collected.."/10"
		gs.Visible=true
		ts:Create(gs,TweenInfo.new(0.2),{Size=size1}):Play()
		wait(1)
		ts:Create(gs,TweenInfo.new(0.2),{Size=UDim2.new(0,0,0,0)}):Play()
		wait(.2)
		gs.Visible=false
		gs.Size = size1
		collected,gs,size1=nil
	elseif status=="done" then
		local gs = game.Players.LocalPlayer.PlayerGui.PlayerScreenGui.GoldenShellsDone
		local size1 = gs.Size
		gs.Size=UDim2.new(0,0,0,0)
		gs.Visible=true
		ts:Create(gs,TweenInfo.new(0.2),{Size=size1}):Play()
		game:GetService("SoundService"):WaitForChild("Tada"):Play()
		wait(3)
		ts:Create(gs,TweenInfo.new(0.2),{Size=UDim2.new(0,0,0,0)}):Play()
		wait(.2)
		gs.Visible=false
		gs.Size = size1
		gs,size1=nil
	end
end)

wait(3)
for _,v in pairs(cs:GetTagged("GoldenShell")) do
	if v:WaitForChild("ProximityPrompt") then
		v.ProximityPrompt.Triggered:Connect(function()
			ts:Create(v,TweenInfo.new(0.5),{Transparency = 1}):Play()
			v.Firework:Play()
			for o,p in pairs(v:GetDescendants()) do
				if p:IsA("ParticleEmitter") then
					if p.Name=="ParticleEmitter" then
						p:Emit()
					else
						p.Enabled=false
					end
				end
			end
			remote:FireServer(v:FindFirstChild("Value").Value)
			wait(2.5)
			v:Destroy()
		end)
	end
end

