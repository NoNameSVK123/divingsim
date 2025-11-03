local player = game:GetService("Players").LocalPlayer
local MarketplaceService = game:GetService("MarketplaceService")

player.PlayerGui:WaitForChild("DblCoinsGPsign").button.MouseButton1Click:Connect(function()
	MarketplaceService:PromptGamePassPurchase(player, 225901728)
end)

player.PlayerGui:WaitForChild("MorePetsGPsign").button.MouseButton1Click:Connect(function()
	MarketplaceService:PromptGamePassPurchase(player, 225902661)
end)

player.PlayerGui:WaitForChild("DblDmgGPsign").button.MouseButton1Click:Connect(function()
	MarketplaceService:PromptGamePassPurchase(player, 225898434)
end)

player.PlayerGui:WaitForChild("EightHatchGPsign").button.MouseButton1Click:Connect(function()
	MarketplaceService:PromptGamePassPurchase(player, 225900607)
end)