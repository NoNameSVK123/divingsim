local CollectionService = game:GetService("CollectionService")
local player = game:GetService("Players").LocalPlayer 
local mouse = player:GetMouse()
local TS = game:GetService("TweenService")
local SS = game:GetService("SoundService")
local RS = game:GetService("ReplicatedStorage")
local remote = RS:WaitForChild("SeaBoost")
local remote2 = RS:WaitForChild("SeaBoostPOPSadd")
local fireworkSound = SS:WaitForChild("Firework")
local popSound = SS:WaitForChild("Pop")
local debounce = false
local cf

mouse.Move:Connect(function()
	if not mouse.Target then 
		script.Highlight.Adornee=nil return end
	
	if CollectionService:HasTag(mouse.Target,"SeaBoost") then
		script.Highlight.Adornee=mouse.Target
		return 
	elseif CollectionService:HasTag(mouse.Target.Parent,"SeaBoost") then
		script.Highlight.Adornee=mouse.Target.Parent
		return
	end
	
	script.Highlight.Adornee=nil
end)

local function oo()
	do
		for _,part in CollectionService:GetTagged("TsunamiWaveContents") do
			part.Touched:Connect(function(hit)
				if hit.Parent==game.Players.LocalPlayer.Character then
					local cur = part.Currency.Value
					local amo = part.Amount.Value

					remote2:FireServer(cur)

					popSound:Play()
					part:Destroy()
					cur,amo=nil
				end
			end)
		end
	end
end

local function bum(originCFrame,object,amount)
	do
		for i=1, amount do
			local clonedObject = object:Clone()
			clonedObject.Name = "Popup"
			clonedObject.CFrame = originCFrame
			clonedObject.Parent = workspace.Popups


			local randomX = {math.random(-10,-5),math.random(5,10)}
			local randomZ = {math.random(-10,-5),math.random(5,10)}

			local velocity = Vector3.new(randomX[math.random(1,2)], math.random(30,100),randomZ[math.random(1,2)])

			clonedObject.AssemblyLinearVelocity = velocity

			clonedObject,randomX,randomZ,velocity=nil
		end
		oo()
	end
end

function claimBoost(boost)
	if boost=="CoinBoost" then
		remote:FireServer(boost)
		local poppart=RS:WaitForChild("Popups"):WaitForChild("coinPop")
		local amount=20
		task.delay(.6,function()
			bum(cf,poppart,amount)
			amount=nil
		end)
	elseif boost=="DamageBoost" then
		remote:FireServer(boost)
	elseif boost=="DiamondBoost" then
		remote:FireServer(boost)
		local poppart=RS:WaitForChild("Popups"):WaitForChild("diamondPop")
		local amount=5
		task.delay(.6,function()
			bum(cf,poppart,amount)
			amount=nil
		end)
	elseif boost=="MonsterBoost" then
		remote:FireServer(boost)
		local poppart=RS:WaitForChild("Popups"):WaitForChild("diamondPop")
		local amount=1
		local poppart1=RS:WaitForChild("Popups"):WaitForChild("coinPop")
		local amount1=3
		task.delay(.6,function()
			bum(cf,poppart,amount)
			bum(cf,poppart1,amount1)
			amount,poppart1,amount1=nil
		end)
	elseif boost=="OxygenBoost" then
		remote:FireServer(boost)
	elseif boost=="TransformBoost" then
		remote:FireServer(boost)
	elseif boost=="PresentBoost" then
		remote:FireServer(boost)
		local poppart=RS:WaitForChild("Popups"):WaitForChild("diamondPop")
		local amount=5
		local poppart1=RS:WaitForChild("Popups"):WaitForChild("coinPop")
		local amount1=20
		task.delay(.6,function()
			bum(cf,poppart,amount)
			bum(cf,poppart1,amount1)
			amount,poppart1,amount1=nil 
		end)
	elseif boost=="SpeedBoost" then
		remote:FireServer(boost)
	end	
end

function comeClose(part)
	do
		local cframe = part.CFrame
		local magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude
		while part do
			if magnitude<20 then
				for i=1,25 do
					part.CFrame = cframe:Lerp(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame,i/25)
					wait()
				end
			end
			wait()
		end
		cframe,magnitude=nil
	end
end

wait(10)
while wait(1) do
	do
		for _,v in pairs(CollectionService:GetTagged("SeaBoost")) do
			if v:FindFirstChild("ClickDetector") then
				v.ClickDetector.MouseClick:Connect(function()
					v.ClickDetector:Destroy()
					if debounce==false then
						debounce=true
						cf=v.CFrame
						claimBoost(v.Name)
						debounce=false
						local claimSound = v:FindFirstChild("SeaBoostClaim")
						claimSound:Play()
						TS:Create(v,TweenInfo.new(1,Enum.EasingStyle.Circular),{Position=Vector3.new(v.Position.X,v.Position.Y+5,v.Position.Z)}):Play()
						wait(.6)
						TS:Create(v,TweenInfo.new(.6),{Transparency=1}):Play()
						fireworkSound:Play()
						for u,f in pairs(v.Attachment:GetChildren()) do
							if f:IsA("ParticleEmitter") then
								f:Emit()
							end
						end
						wait(2.5)
						v:Destroy()
						claimSound=nil
					end
				end)
			end	
		end
		for _,part in CollectionService:GetTagged("TsunamiWaveContents") do
			task.spawn(function()
				comeClose(part)
			end)
		end
	end
end