
while wait(1) do
	do
		for _,v in pairs(workspace.PetSystem.PlayerPets:WaitForChild(game:GetService("Players").LocalPlayer.Name):GetChildren()) do
			if v:IsA("Model") then
				local rarity = v.Rarity.Value
				local name = v.Name
				v:WaitForChild("Primary"):WaitForChild("BillboardGui"):WaitForChild("NameLabel").Text = name
				v:WaitForChild("Primary"):WaitForChild("BillboardGui"):WaitForChild("RarityLabel").Text = rarity
				local rarityText = v:WaitForChild("Primary"):WaitForChild("BillboardGui"):WaitForChild("RarityLabel")
				if rarityText.Text=="Common" then
					rarityText.UIStroke.Color = Color3.fromRGB(0, 0, 0)
				elseif rarityText.Text=="Uncommon" then
					rarityText.UIStroke.Color = Color3.fromRGB(0, 113, 0)
				elseif rarityText.Text=="Rare" then
					rarityText.UIStroke.Color = Color3.fromRGB(52, 140, 255)
				elseif rarityText.Text=="Epic" then
					rarityText.UIStroke.Color = Color3.fromRGB(56, 21, 109)
				elseif rarityText.Text=="Legendary" then
					rarityText.UIStroke.Color = Color3.fromRGB(255, 85, 0)
				elseif rarityText.Text=="Mythic" then
					rarityText.UIStroke.Color = Color3.fromRGB(255, 85, 255)
				end
				rarity,name=nil
			end
		end
	end
end