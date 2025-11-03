

--local function chooseRandomShell(shellTable)
--	local chosenShell = nil
--	local randomNumber = math.random(1,1000)*.1
--	local weight = 0

--	for i,v in pairs(shellTable) do
--		weight += v.chance

--		if weight >= randomNumber then
--			chosenShell = v
--			break
--		end
--	end

--	return chosenShell
--end


--local function area1()
--	local spawned=0
--	local spawns = workspace:WaitForChild("PetSystem"):WaitForChild("DropSpawning"):WaitForChild("Area1"):GetChildren()
--	local shellData = require(workspace:WaitForChild("PetSystem"):WaitForChild("Area1Data"))
--	while spawned<15 do
--		local toSpawn=math.random(1,22)
--		local v = workspace:WaitForChild("PetSystem"):WaitForChild("DropSpawning"):WaitForChild("Area1"):WaitForChild("Spawn"..toSpawn)
--		if v.CanQuery==true then
--			v.CanQuery=false
--			local chosenShell = chooseRandomShell(shellData.areaShells)
--			local spawnedShell = game:GetService("ReplicatedStorage"):WaitForChild("Shells"):WaitForChild("Area1"):WaitForChild(chosenShell.shellName):Clone()
--			spawnedShell.Parent = workspace:WaitForChild("PetSystem"):WaitForChild("Drops"):WaitForChild("Area1")
--			spawnedShell.Spawn.Value = toSpawn
--			spawnedShell.PrimaryPart.Position = v.Position
--			spawned+=1
--		end
--	end
--end

--area1()
