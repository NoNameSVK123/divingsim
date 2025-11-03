local rs = game:GetService("ReplicatedStorage")
local remote = rs:WaitForChild("SellArrow")
local remote2 = rs:WaitForChild("TutorialArrows")
local isPointing = false
local ss = game:GetService("SoundService")

remote2.OnClientEvent:Connect(function(tutorialState)
	if tutorialState==1 then
		local arrow = rs:WaitForChild("SomeItems"):WaitForChild("ArrowBeam"):Clone()
		arrow:WaitForChild("PlayerPart").Position=game.Players.LocalPlayer.Character.PrimaryPart.Position
		arrow:WaitForChild("GoalPart").Position=Vector3.new(-380, 160, 35)
		local weld = Instance.new("WeldConstraint")
		weld.Part1=arrow.PlayerPart
		weld.Part0=game.Players.LocalPlayer.Character.PrimaryPart
		weld.Parent=arrow.PlayerPart
		arrow.Parent=workspace.Arrows
		local char=game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
		local hrp=char:WaitForChild("HumanoidRootPart")
		local done = false
		while done==false do
			if hrp.Position.Y<165 then
				done=true
			end
			task.wait(.1)
		end
		arrow:Destroy()
		remote2:FireServer(tutorialState+1)
	elseif tutorialState==2 then
		local arrow = rs:WaitForChild("SomeItems"):WaitForChild("ArrowBeam"):Clone()
		arrow:WaitForChild("PlayerPart").Position=game.Players.LocalPlayer.Character.PrimaryPart.Position
		arrow:WaitForChild("GoalPart").Position=Vector3.new(-99, 232.858, 42.6)
		local weld = Instance.new("WeldConstraint")
		weld.Part1=arrow.PlayerPart
		weld.Part0=game.Players.LocalPlayer.Character.PrimaryPart
		weld.Parent=arrow.PlayerPart
		arrow.Parent=workspace.Arrows
		local char=game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
		local hrp=char:WaitForChild("HumanoidRootPart")
		local done = false
		while done==false do
			local magnitude = (hrp.Position - Vector3.new(-99, 232.858, 42.6)).Magnitude
			if magnitude<10 then
				done=true
			end
			task.wait(.1)
		end
		arrow:Destroy()
		remote2:FireServer(tutorialState+1)
	elseif tutorialState==3 then
		local arrow = rs:WaitForChild("SomeItems"):WaitForChild("ArrowBeam"):Clone()
		arrow:WaitForChild("PlayerPart").Position=game.Players.LocalPlayer.Character.PrimaryPart.Position
		arrow:WaitForChild("GoalPart").Position=Vector3.new(-126, 233.68, 110.2)
		local weld = Instance.new("WeldConstraint")
		weld.Part1=arrow.PlayerPart
		weld.Part0=game.Players.LocalPlayer.Character.PrimaryPart
		weld.Parent=arrow.PlayerPart
		arrow.Parent=workspace.Arrows
		local char=game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
		local hrp=char:WaitForChild("HumanoidRootPart")
		local done = false
		while done==false do
			local magnitude = (hrp.Position - Vector3.new(-126, 233.68, 110.2)).Magnitude
			if magnitude<10 then
				done=true
			end
			task.wait(.1)
		end
		arrow:Destroy()
		remote2:FireServer(tutorialState+1)
	elseif tutorialState==4 then
		local arrow = rs:WaitForChild("SomeItems"):WaitForChild("ArrowBeam"):Clone()
		arrow:WaitForChild("PlayerPart").Position=game.Players.LocalPlayer.Character.PrimaryPart.Position
		arrow:WaitForChild("GoalPart").Position=Vector3.new(-139.2, 207.68, 234)
		local weld = Instance.new("WeldConstraint")
		weld.Part1=arrow.PlayerPart
		weld.Part0=game.Players.LocalPlayer.Character.PrimaryPart
		weld.Parent=arrow.PlayerPart
		arrow.Parent=workspace.Arrows
		local char=game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
		local hrp=char:WaitForChild("HumanoidRootPart")
		local done = false
		while done==false do
			local magnitude = (hrp.Position - Vector3.new(-139.2, 207.68, 234)).Magnitude
			if magnitude<10 then
				done=true
			end
			task.wait(.1)
		end
		arrow:Destroy()
		remote2:FireServer(tutorialState+1)
	end
end)

remote.OnClientEvent:Connect(function(status)
	if status then
		if isPointing==false then
			isPointing=true
			ss:WaitForChild("Aktivacia boostu"):Play()
			game.Players.LocalPlayer.PlayerGui.PlayerScreenGui.SellArrow.Visible=true
			local arrow = rs:WaitForChild("SomeItems"):WaitForChild("ArrowBeam"):Clone()
			arrow:WaitForChild("PlayerPart").Position=game.Players.LocalPlayer.Character.PrimaryPart.Position
			arrow:WaitForChild("GoalPart").Position=Vector3.new(-99, 232.858, 42.6)
			local weld = Instance.new("WeldConstraint")
			weld.Part1=arrow.PlayerPart
			weld.Part0=game.Players.LocalPlayer.Character.PrimaryPart
			weld.Parent=arrow.PlayerPart
			arrow.Parent=workspace.Arrows
			weld,arrow=nil
		end	
	else
		if isPointing then
			isPointing=false
			game.Players.LocalPlayer.PlayerGui.PlayerScreenGui.SellArrow.Visible=false
			for _,v in workspace.Arrows:GetChildren() do
				v:Destroy()
			end
		end
	end
end)