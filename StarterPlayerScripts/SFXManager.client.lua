local rs = game:GetService("ReplicatedStorage")
local re = rs:WaitForChild("DrinkActivationSound")
local soundservice = game:GetService("SoundService")
local drinkEffectSound = soundservice:WaitForChild("Aktivacia boostu")
local beachsounds = soundservice:WaitForChild("BeachSounds")
local splash = soundservice:WaitForChild("WaterSplash")
local toSplash = true

re.OnClientEvent:Connect(function()
	drinkEffectSound:Play()
end)

local function onSplash()
	if toSplash then
		toSplash=false
		splash:Play()
	end
end

game:GetService("RunService").RenderStepped:Connect(function()
	do
		if game.Players.LocalPlayer.Character then
			if game.Players.LocalPlayer.Character.PrimaryPart then
				if game.Players.LocalPlayer.Character.PrimaryPart.Position.Y>200 then
					toSplash=true
					beachsounds.Volume=0.035
				else
					onSplash()
					beachsounds.Volume=0
				end
			end
		end
	end
end)