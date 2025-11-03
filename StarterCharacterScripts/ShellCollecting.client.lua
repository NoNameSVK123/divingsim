--local CollectionService = game:GetService("CollectionService")
--local i=0


--	for _,part in pairs(game.Workspace.Shells:GetChildren()) do
--		local highlight =part:WaitForChild("Highlight")
--		local selected = false
--		part:WaitForChild("ProximityPrompt").Enabled=false

--		local MidPart = part
--		local player = game.Players.LocalPlayer
--		local char = player.Character or player.CharacterAdded:Wait()
--		local HumanoidRootPart = char:WaitForChild("HumanoidRootPart")
--		local hovered = false

--		part.ClickDetector.MouseHoverEnter:Connect(function()
--			hovered=true
--			part:WaitForChild("Highlight").OutlineColor = Color3.fromRGB(255,255,255)
--			local magnitude = (HumanoidRootPart.Position - MidPart.Position).Magnitude
--			if magnitude <= 30 then
--				part:WaitForChild("Highlight").OutlineTransparency=0
--			end
--		end)

--		part.ClickDetector.MouseHoverLeave:Connect(function()
--			hovered=false
--			local magnitude = (HumanoidRootPart.Position - MidPart.Position).Magnitude
--			if magnitude <= 30 then
--				part:WaitForChild("Highlight").OutlineColor = Color3.fromRGB(109, 109, 109)
--				if selected==false then
--					part:WaitForChild("Highlight").OutlineTransparency=1
--					part:WaitForChild("Highlight").FillTransparency=1
--				end
--			end
--		end)

--		part.ClickDetector.MouseClick:Connect(function()
--			if selected then
--				selected = false
--				part:WaitForChild("ProximityPrompt").Enabled=false
--				part:WaitForChild("Highlight").OutlineTransparency=1	
--				part:WaitForChild("Highlight").FillTransparency=1
--			else
--				selected = true
--				part:WaitForChild("Highlight").OutlineColor = Color3.fromRGB(109, 109, 109)
--				part:WaitForChild("Highlight").OutlineTransparency=0
--				part:WaitForChild("Highlight").FillTransparency=0.7
--			part:WaitForChild("ProximityPrompt").Enabled=true
--		end
		
--		part.ProximityPrompt.Triggered:Connect(function()
--			script.Parent.ShellCollect:Play()
--		end)
--		end)
--	end

