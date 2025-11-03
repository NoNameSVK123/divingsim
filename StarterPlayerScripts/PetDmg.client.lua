local players = game:GetService("Players")

local player = players.LocalPlayer
local ts = game:GetService("TweenService")

local damage

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("PetsAfterDestroy")
local remoteEvent2 = ReplicatedStorage:WaitForChild("DestroyShell")
local remoteEvent3 = ReplicatedStorage:WaitForChild("DamagePopup")
local remoteEvent4 = ReplicatedStorage:WaitForChild("HitSound")
local debounce = false
local boostDebounce = false
local boostDebouncerDebounce = false
--local soundservice = game:GetService("SoundService")
--local hitsound = soundservice:WaitForChild()
--local destroysound1 = soundservice:WaitForChild()
--local destroysound2 = soundservice:WaitForChild()
local hitsound


local soundservice = game:GetService("SoundService")
local hitsounds = {soundservice:WaitForChild("Hit1"),soundservice:WaitForChild("Hit2")}
local function sound(loc)
	remoteEvent4:FireServer(loc)
end

local function bum(originCFrame,object,amount)
	for i=1, amount do
		local clonedObject = object:Clone()
		clonedObject.CFrame = originCFrame*CFrame.new(0,5,0)
		clonedObject.Parent = workspace.Popups


		local randomX = {math.random(-10,-5),math.random(5,10)}
		local randomZ = {math.random(-10,-5),math.random(5,10)}

		local velocity = Vector3.new(randomX[math.random(1,2)], math.random(30,100),randomZ[math.random(1,2)])

		clonedObject.AssemblyLinearVelocity = velocity
		
		task.delay(20,function()
			if clonedObject==nil then
			else
				clonedObject:Destroy()
			end
		end)
	end
end


function boostSpawn(cf)
	if boostDebounce==false then
		boostDebounce=true
		local roll = math.random(1,100)
		local amount=1
		local poppart
		if roll==100 then
			poppart=ReplicatedStorage:WaitForChild("ShellBoostDrops"):WaitForChild("PresentBoost")
		elseif roll>90 and roll<95 then
			poppart=ReplicatedStorage:WaitForChild("ShellBoostDrops"):WaitForChild("TransformBoost")
		elseif roll>75 and roll<85 then
			poppart=ReplicatedStorage:WaitForChild("ShellBoostDrops"):WaitForChild("CoinBoost")
		elseif roll>20 and roll<25 then
			poppart=ReplicatedStorage:WaitForChild("ShellBoostDrops"):WaitForChild("DiamondBoost")
		elseif roll>10 and roll<15 then
			poppart=ReplicatedStorage:WaitForChild("ShellBoostDrops"):WaitForChild("DamageBoost")
		elseif roll>0 and roll<10 then
			poppart=ReplicatedStorage:WaitForChild("ShellBoostDrops"):WaitForChild("MonsterBoost")
		elseif roll>40 and roll<46 then
			poppart=ReplicatedStorage:WaitForChild("ShellBoostDrops"):WaitForChild("OxygenBoost")
		elseif roll>30 and roll<35 then
			poppart=ReplicatedStorage:WaitForChild("ShellBoostDrops"):WaitForChild("SpeedBoost")
		end
		if poppart then
			bum(cf,poppart,amount)
		end
		roll,amount,poppart=nil
	else
		if boostDebouncerDebounce==false then
			boostDebouncerDebounce=true
			task.delay(2.5,function()
				boostDebounce=false
				boostDebouncerDebounce=false
			end)
		end
	end
end

task.spawn(function()
	while task.wait(.25) do
			hitsound=math.random(1,3)
			for n,drop in pairs(workspace.PetSystem.Drops:WaitForChild("Area1"):GetChildren()) do
				if drop:FindFirstChild("Shell") then
					drop:WaitForChild("Shell"):WaitForChild("ParticleEmitter").Enabled=false
					drop:WaitForChild("Selected").Transparency=1
					drop:WaitForChild("SelectedFlying").Transparency=1
				end

			end
		for _,pet in pairs(workspace.PetSystem.PlayerPets:WaitForChild(player.Name):GetChildren()) do
			task.spawn(function()
				if pet:FindFirstChild("Damage") then
					damage=pet.Damage.Value
					if pet.DoubleDmg.Value then
						damage*=2
					end
					if pet.DrinkDmg.Value then
						damage*=2
					end
					if pet.BoostDmg.Value then
						damage*=2
					end
					if player:WaitForChild("Values"):WaitForChild("MoltenWand").Value==true then
						damage*=2
					end
					if pet.Attack.Value ~= nil then
						if pet.Attack.Value:FindFirstChild("Health") then
							if pet.Attack.Value.Health.Value<damage+1 then
								if debounce==false then
									debounce=true
									if pet.Attack.Value.Parent.Name~="Chests" and pet.Attack.Value.Name~="NinjaShark" then
										if pet.Attack.Value ~= nil and pet.Attack.Value:FindFirstChild("Shell") then
											boostSpawn(pet.Attack.Value:FindFirstChild("Shell").CFrame)
											task.spawn(function()
												local tween = game:GetService("TweenService"):Create(pet.Attack.Value.PrimaryPart,TweenInfo.new(0.1),{Size=Vector3.new(pet.Attack.Value.PrimaryPart.Size.X/1.2,pet.Attack.Value.PrimaryPart.Size.Y/1.2,pet.Attack.Value.PrimaryPart.Size.Z/1.2)})
												tween:Play()
												if pet.Attack.Value.PrimaryPart:FindFirstChild("Attachment") then
													pet.Attack.Value.PrimaryPart.Attachment.ParticleEmitter:Emit()
												end
												tween=nil
											end)
											local part = pet.Attack.Value.Shell
											local shl = pet.Attack.Value.Shell:Clone()
											shl.CanCollide = false
											shl.Size = Vector3.new(shl.Size.X/1.5,shl.Size.Y/1.5,shl.Size.Z/1.5)
											local cf = pet.Attack.Value.Shell.CFrame
											local popupDmg = damage
											local popupNo = math.random(1,8)
											remoteEvent3:FireServer(pet.Attack.Value.PrimaryPart.CFrame,ReplicatedStorage:WaitForChild("Popups"):FindFirstChild("damagePop"..popupNo),1,popupDmg)
											remoteEvent:FireServer(pet.Attack.Value)
											remoteEvent2:FireServer(part)
											sound(pet.Attack.Value)
											script.Parent.ShellDestroy:Play()
											script.Parent.ShellDestroy2:Play()
											local shine = ReplicatedStorage:WaitForChild("Shine"):WaitForChild("Shell"):Clone()
											shine:PivotTo(cf)
											--shl.Size = Vector3.new(0.125, 1.027, 1.249)
											shl.CFrame = cf
											shl.Parent = shine
											shine.Parent = workspace:WaitForChild("Shine")
											local goal = {}
											goal.Position = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position
											--ts:Create(shine,TweenInfo.new(0.4,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),goal):Play()
											--ts:Create(shine.Area,TweenInfo.new(0.4,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),goal):Play()
											--ts:Create(shine.Main,TweenInfo.new(0.4,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),goal):Play()
											--ts:Create(shine.Main2,TweenInfo.new(0.4,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),goal):Play()
											--ts:Create(shl,TweenInfo.new(0.4,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),goal):Play()
											local cframe = shine.CFrame
											task.spawn(function()
												for i=1,25 do
													shl.CFrame = cframe:Lerp(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame,i/25)
													shine.Area.CFrame = cframe:Lerp(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame,i/25)
													shine.Main.CFrame = cframe:Lerp(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame,i/25)
													shine.Main2.CFrame = cframe:Lerp(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame,i/25)
													task.wait()
												end
												shine:Destroy()
												debounce=false
												part,shl,cf,popupDmg,popupNo,shine,goal,cframe=nil
											end)
										end
									else
										local part = pet.Attack.Value.Shell
										remoteEvent:FireServer(pet.Attack.Value)
										remoteEvent2:FireServer(part)
										--task.delay(5.1,function()
										--	remoteEvent2:FireServer()
										--end)
										script.Parent.ShellDestroy:Play()
										script.Parent.ShellDestroy2:Play()
										debounce=false
										part=nil
									end
									--else
									--	while debounce==true do
									--		if debounce==false then

									--		end
									--	end
								end

								--local part = pet.Attack.Value.Shell
								--part.CanCollide=false
								--part.Parent.ClickDetector:Destroy()
								--	local goal = {}
								--	goal.Position = Vector3.new(part.Position.X, part.Position.Y-1, part.Position.Z)

								--	local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear)

								--	local tween = ts:Create(part, tweenInfo, goal)

								--	tween:Play()

								--	wait(0.5)
								--part.Parent:Destroy()
							else
								if pet:FindFirstChild("Attack") then 
									if pet.Attack.Value ~= nil and pet.Attack.Value:FindFirstChild("Shell") then	
										boostSpawn(pet.Attack.Value:FindFirstChild("Shell").CFrame)
										if pet.Attack.Value.Shell:FindFirstChild("ParticleEmitter") then
											pet.Attack.Value.Shell.ParticleEmitter.Enabled=true
										end
										pet.Attack.Value.HealthDisplay.Enabled=true
										--ShakePart(pet.Attack.Value.PrimaryPart)
										if pet.Attack.Value.PrimaryPart.anim.Value==false then
											pet.Attack.Value.PrimaryPart.anim.Value=true
											task.spawn(function()
												if pet.Attack.Value then
													local tween = game:GetService("TweenService"):Create(pet.Attack.Value.PrimaryPart,TweenInfo.new(0.1),{Size=Vector3.new(pet.Attack.Value.PrimaryPart.Size.X/1.2,pet.Attack.Value.PrimaryPart.Size.Y/1.2,pet.Attack.Value.PrimaryPart.Size.Z/1.2)})
													tween:Play()
													if pet.Attack.Value.PrimaryPart:FindFirstChild("Attachment") then
														pet.Attack.Value.PrimaryPart.Attachment.ParticleEmitter:Emit()
													end
													tween.Completed:Wait()
													tween=nil
												end
												if pet.Attack.Value then
													local tween = game:GetService("TweenService"):Create(pet.Attack.Value.PrimaryPart,TweenInfo.new(0.1),{Size=Vector3.new(pet.Attack.Value.PrimaryPart.Size.X*1.2,pet.Attack.Value.PrimaryPart.Size.Y*1.2,pet.Attack.Value.PrimaryPart.Size.Z*1.2)})
													tween:Play()
													tween.Completed:Wait()
													tween=nil
												end
												if pet.Attack.Value==nil then
												else
													pet.Attack.Value.PrimaryPart.anim.Value=false
												end
											end)
										end
										--if pet.Attack.Value:FindFirstChild("Selected") then
										--	pet.Attack.Value.Selected.Transparency=0
										--end
										--if pet.Attack.Value:FindFirstChild("SelectedFlying") then
										--	pet.Attack.Value.SelectedFlying.Transparency=0
										--end
										pet.Attack.Value.Health.Value = math.max(pet.Attack.Value.Health.Value - damage, 0)
										local popupDmg = damage
										local popupNo = math.random(1,8)
										remoteEvent3:FireServer(pet.Attack.Value.PrimaryPart.CFrame,ReplicatedStorage:WaitForChild("Popups"):FindFirstChild("damagePop"..popupNo),1,popupDmg)
										pet.Attack.Value.HealthDisplay.Background.HealthDisplayLabel.Text=pet.Attack.Value.Health.Value.."/"..pet.Attack.Value.MaxHealth.Value
										pet.Attack.Value.HealthDisplay.Background.Bar:TweenSize(UDim2.new(pet.Attack.Value.Health.Value/pet.Attack.Value.MaxHealth.Value,0,1,0),Enum.EasingDirection.Out,Enum.EasingStyle.Sine,.3,true)
										task.spawn(function()
											local size = UDim2.new(1, 0,-2, 0)
											local fakesize = UDim2.new(1.2, 0,-2.4, 0)
											if pet.Attack.Value then
												if pet.Attack.Value:FindFirstChild("HealthDisplay") then
													local tween = ts:Create(pet.Attack.Value.HealthDisplay.Background.HealthDisplayLabel,TweenInfo.new(0.1),{Size = fakesize})
													tween:Play()
													tween.Completed:Wait()
													tween=nil
												end
											end
											if pet.Attack.Value then
												if pet.Attack.Value:FindFirstChild("HealthDisplay") then
													local tween = ts:Create(pet.Attack.Value.HealthDisplay.Background.HealthDisplayLabel,TweenInfo.new(0.1),{Size = size})
													tween:Play()
													tween=nil
												end											
											end
											size,fakesize=nil
										end)
										local result = pet.Attack.Value.MaxHealth.Value/pet.Attack.Value.Health.Value
										if  result < 1 then
										elseif result <2 then
											pet.Attack.Value.HealthDisplay.Background.Bar.Max.Enabled=true
											pet.Attack.Value.HealthDisplay.Background.Bar.Mid.Enabled=false
											pet.Attack.Value.HealthDisplay.Background.Bar.Min.Enabled=false
										elseif result < 4 then
											pet.Attack.Value.HealthDisplay.Background.Bar.BackgroundColor3 = Color3.fromRGB(136, 255, 0)
											pet.Attack.Value.HealthDisplay.Background.Bar.Max.Enabled=false
											pet.Attack.Value.HealthDisplay.Background.Bar.Mid.Enabled=true
											pet.Attack.Value.HealthDisplay.Background.Bar.Min.Enabled=false	
										else
											pet.Attack.Value.HealthDisplay.Background.Bar.BackgroundColor3 = Color3.fromRGB(255, 64, 0)
											pet.Attack.Value.HealthDisplay.Background.Bar.Max.Enabled=false
											pet.Attack.Value.HealthDisplay.Background.Bar.Mid.Enabled=false
											pet.Attack.Value.HealthDisplay.Background.Bar.Min.Enabled=true	
										end
										sound(pet.Attack.Value)
										task.delay(0.3,function()
											if pet:FindFirstChild("Attack") then
												if pet.Attack.Value ~= nil and pet.Attack.Value:FindFirstChild("Shell") then
													if pet.Attack.Value.Shell:FindFirstChild("ParticleEmitter") then
														pet.Attack.Value.Shell.ParticleEmitter.Enabled=true
													end
												end
											end
										end)
										result=nil
										popupNo,popupDmg=nil
									end
								end
							end
						end
					end
				end	
			end)
			for z,x in pairs(workspace.PetSystem.Drops:GetChildren()) do
				task.spawn(function()
					for _,v in pairs(x:GetChildren()) do
						local found=false
						for a,b in pairs(workspace.PetSystem.PlayerPets:WaitForChild(player.Name):GetChildren()) do
							if b:IsA("Model") then
								if v==b:WaitForChild("Attack").Value then
									found=true
									break
								end
							end				
						end
						if found==false then
							--if v:FindFirstChild("Selected") then
							--	v:WaitForChild("Selected").Transparency=1
							--end
							--if v:FindFirstChild("SelectedFlying") then
							--	v:WaitForChild("SelectedFlying").Transparency=1
							--end
							if v:FindFirstChild("Shell") then
								if v:FindFirstChild("Shell"):FindFirstChild("ParticleEmitter") then
									v:WaitForChild("Shell"):WaitForChild("ParticleEmitter").Enabled=false
								end
							end
						end
						found=nil
					end		
				end)			
			end
		end					
	end
end)