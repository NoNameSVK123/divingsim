local CollectionService = game:GetService("CollectionService")
local zonebuying = game.Players.LocalPlayer.PlayerGui:WaitForChild("PlayerScreenGui"):WaitForChild("Panels"):WaitForChild("ZoneBuying")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("UnlockZone")
local debounce = false
local debounce2 = false 
local TweenService = game:GetService("TweenService")

local function scaleUp(target)
	local hoversize = UDim2.new(target.Size.Width.Scale * 1.10, 0, target.Size.Height.Scale * 1.10, 0)
	target:TweenSize(hoversize,Enum.EasingDirection.Out,Enum.EasingStyle.Sine,.15,true)
end

local function scaleDown(target)
	local startsize = UDim2.new(target.Size.Width.Scale, 0, target.Size.Height.Scale, 0)
	target:TweenSize(startsize,Enum.EasingDirection.Out,Enum.EasingStyle.Sine,.15,true)
end


while wait() do

	for _, button in CollectionService:GetTagged("zoneBuyButton") do
		button.MouseButton1Click:Connect(function()
				if debounce==false then
				debounce=true
				local bt = workspace.ZoneWalls:WaitForChild(button.Parent.Parent.Name)
				local coincost = bt:WaitForChild("CoinPrice").Value
				local gemcost = bt:WaitForChild("GemPrice").Value
				local zone = bt.Zone.Value
					zonebuying.CostCoins.Value = coincost
					zonebuying.CostGems.Value = gemcost 

				zonebuying.Frame1.Visible=true

					zonebuying.Frame2.Visible=false 
					game:GetService("ReplicatedStorage"):WaitForChild("blurandanim"):Invoke(game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.ZoneBuying)
					game:GetService("ReplicatedStorage"):WaitForChild("windowtoggler"):Invoke(game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.ZoneBuying.PANEL)
					local curr = ""

					zonebuying.Frame1.CoinButton.MouseButton1Click:Connect(function()
					zonebuying.Frame2.Question.Text="Unlock this zone for "..workspace.ZoneWalls:WaitForChild(button.Parent.Parent.Name):WaitForChild("CoinPrice").Value.." coins?"

						zonebuying.Frame1.Visible=false
						zonebuying.Frame2.Visible=true

						curr = "coins"

					end)

					zonebuying.Frame1.GemButton.MouseButton1Click:Connect(function()
						zonebuying.Frame2.Question.Text="Unlock this zone for "..gemcost.." gems?"

						zonebuying.Frame1.Visible=false
						zonebuying.Frame2.Visible=true

						curr = "gems"

					end)

					zonebuying.Frame2.NoButton.MouseButton1Click:Connect(function()
						game:GetService("ReplicatedStorage"):WaitForChild("closemenu"):Invoke(game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.ZoneBuying)
						wait(3)
						debounce=false
					end)

					zonebuying.Frame2.YesButton.MouseButton1Click:Connect(function()
						if debounce2==false then
							debounce2=true
							game:GetService("ReplicatedStorage"):WaitForChild("closemenu"):Invoke(game:GetService("Players").LocalPlayer.PlayerGui.PlayerScreenGui.Panels.ZoneBuying)
							if curr=="coins" then
								remoteEvent:FireServer("coins",coincost,zone)
							else
								remoteEvent:FireServer("gems",gemcost,zone)
							end
							wait(3)
							debounce=false
							debounce2=false
						end			
					end)

					wait(60)

				debounce=false
				bt,coincost,gemcost,zone,curr=nil

				end
			
		end)
		
		button.MouseEnter:Connect(function()
			scaleUp(button)
		end)
		
		button.MouseLeave:Connect(function()
			scaleDown(button)
		end)
	end
end