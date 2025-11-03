local const1 = 30
local const2 = 210
local const3 = 230
local color1
local color2
local color3

local function trojclenka()
	local y = game:GetService("Players").LocalPlayer.Character.PrimaryPart.Position.Y
	color1 = y*const1/200
	color2 = y*const2/200
	color3 = y*const3/200
end


while wait() do
	trojclenka()
	
	game.Workspace.Terrain.WaterColor = Color3.fromRGB(color1,color2,color3)
	
end