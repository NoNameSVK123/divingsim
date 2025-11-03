game.Players.LocalPlayer.CharacterAdded:Connect(function()
	
	wait(10)
	local camera = workspace.CurrentCamera

	camera.CameraType = Enum.CameraType.Custom

	local controls = require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule):GetControls()
	controls:Enable()
	game:GetService("Players").LocalPlayer.HideOtherPets.Value=0
	camera,controls=nil
end)