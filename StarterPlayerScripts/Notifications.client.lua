local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ts = game:GetService("TweenService")
local remote = ReplicatedStorage:WaitForChild("ExclusiveClaimed")
local ss = game:GetService("SoundService")

remote.OnClientEvent:Connect(function(status)
	if status==1 then
		ss:WaitForChild("Tada"):Play()
		local label = game.Players.LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Popups.ClaimedSuccessfully:Clone()
		label.Parent=game.Players.LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Popups
		label.Visible=true

		local goal = {}
		goal.Position = UDim2.new(0.499, 0,0.356, 0)

		ts:Create(label,TweenInfo.new(3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),goal):Play()
		task.wait(3)
		label:Destroy()
		label,goal=nil
	else
		ss:WaitForChild("Pop"):Play()
		local label = game.Players.LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Popups.AlreadyClaimed:Clone()
		label.Parent=game.Players.LocalPlayer.PlayerGui.PlayerScreenGui.Panels.Popups
		label.Visible=true

		local goal = {}
		goal.Position = UDim2.new(0.499, 0,0.356, 0)

		ts:Create(label,TweenInfo.new(3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),goal):Play()
		task.wait(3)
		label:Destroy()
		label,goal=nil
	end
end)