game.Players.LocalPlayer.CharacterAdded:Connect(function()
	game.Players.LocalPlayer.Character:WaitForChild("Humanoid").NameDisplayDistance=0
end)