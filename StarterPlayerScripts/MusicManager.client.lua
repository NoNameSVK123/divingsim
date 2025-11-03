local ss = game:GetService("SoundService")
local m1 = ss:WaitForChild("Music")
local m2 = ss:WaitForChild("Music2")

m1.Ended:Connect(function()
	local m = math.random(1,2)
	if m==1 then
		m1:Play() 
	else
		m2:Play()
	end
	m=nil
end)

m2.Ended:Connect(function()
	local m = math.random(1,2)
	if m==1 then
		m1:Play() 
	else
		m2:Play()
	end
	m=nil
end) 