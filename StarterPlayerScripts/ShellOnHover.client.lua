local CollectionService = game:GetService("CollectionService")
local player = game:GetService("Players").LocalPlayer 
local mouse = player:GetMouse()

mouse.Move:Connect(function()
	if not mouse.Target then 
		script.Highlight.Adornee=nil return end
	
	if CollectionService:HasTag(mouse.Target,"ShellHover") then
		script.Highlight.Adornee=mouse.Target
		return 
	elseif CollectionService:HasTag(mouse.Target.Parent,"ShellHover") then
		script.Highlight.Adornee=mouse.Target.Parent
		return
	end
	
	script.Highlight.Adornee=nil
end)