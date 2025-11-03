local char = script.Parent;
local hum = char:WaitForChild("Humanoid")


hum.StateChanged:Connect(function(oldState, newState)
	hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
	hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
end)