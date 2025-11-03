local CollectionService = game:GetService("CollectionService")
local i=0

task.wait(5)
while wait(1) do
	for _,part in CollectionService:GetTagged("EggChances") do
		

		local MidPart = part.Parent
		local player = game.Players.LocalPlayer
		local char = player.Character or player.CharacterAdded:Wait()
		local HumanoidRootPart = char:WaitForChild("HumanoidRootPart")
		local magnitude = (HumanoidRootPart.Position - MidPart.Position).Magnitude
		if magnitude <= 20 then
			part.Enabled =true
		else
			part.Enabled = false
		end
		MidPart,player,char,HumanoidRootPart,magnitude=nil


	end
end

