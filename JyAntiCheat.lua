--[[
Welcome to iExploit's anticheat!
WARNING: DO NOT RENAME THE ANTICHEAT OR YOU BROKE IT!

How to make it WORK:
1. Put "JyAntiCheat.lua" and "Anti" inside StarterPlayer > StarterCharacterScripts
2. Edit some of them if you'd like do not EDIT so badly

What can it do?
+ Anti-fly
+ Anti-btools
+ Anti-Godmode / Anti-Humanoid Remove
+ Anti-Script Disable
+ Script-Delete Kick
+ Anti-Esp
+ Anti-Fire/Sparkles/Smoke 
+ Anti-Inf jump
+ Anti-Noclip
+ Anti-MaxHealth/Health
+ Anti-Inject

Enjoy.

]]

local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

repeat task.wait() until LocalPlayer
repeat task.wait() until LocalPlayer.Character

local Character = LocalPlayer.Character
local Backpack = LocalPlayer:WaitForChild("Backpack")


Backpack.ChildAdded:connect(function(Obj)
	if Obj:IsA("HopperBin") then -- Anti-Btools
		LocalPlayer:Kick("Btools Hack")
	end
end)
task.wait(1)

Character.ChildRemoved:connect(function(Obj)
	if Obj:IsA("Humanoid") then -- Anti-God Mode
		LocalPlayer:Kick("God mode Hack")
	end
end)

local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

Character:WaitForChild("HumanoidRootPart").ChildAdded:connect(function(Obj)
	if Obj:IsA("Smoke") or Obj:IsA("Sparkles") or Obj:IsA ("Fire") then 
		LocalPlayer:Kick("Smoke, Sparkles, Fire | Hack's")
	end
end)

me = script.Parent:FindFirstChild("Humanoid")

TestCounter = 0
lastTime = 0


function checkstate(state)

	--anti-infinite jump
	if state == Enum.HumanoidStateType.Seated then
		if lastTime > os.time() - 1 then
			TestCounter = TestCounter + 1

			if TestCounter > 2 then
				--kill player
				me.Health = 0
				task.wait(1)
				game.Players.LocalPlayer:Kick("infinite Jump Hack's")
			end
		else
			lastTime = os.time()
			TestCounter = 0
		end
	end

	--antifly
	if state == Enum.HumanoidStateType.Flying then
		me.Health = 0
		game.Players.LocalPlayer:Kick("Flying Hack")
	end
	--antinoclip
	if state == Enum.HumanoidStateType.StrafingNoPhysics then
		me.Health = 0
		game.Players.LocalPlayer:Kick("Noclip Hack's")
	end

	--antispeed
	if me.WalkSpeed > 16 then -- change to any number if you want shift to run or running walkspeed
		me.Health = 0
		game.Players.LocalPlayer:Kick("No exploiting Walkspeed")
	end
end


me.StateChanged:Connect(checkstate)
task.wait(1)

local plr = game.Players.LocalPlayer
local char = plr.Character
local hum = char:WaitForChild("Humanoid")
hum.Changed:Connect(function()
	if hum.JumpPower ~= 50 then --jumppower
		plr:Kick("No exploiting JumpPower")
	end
end)

hum.Changed:Connect(function()
	if hum.MaxHealth ~= 100 then --Maxhealth
		plr:Kick("No exploiting Health")
	end
end)
task.wait(1)
local Gui = workspace.Camera
Gui.ChildAdded:connect(function(Obj) --AntiEsp (Fps Gui Cheat)
	if Obj:IsA("Folder") then
		game.Players.LocalPlayer:Kick("Esp")
	end end)

local Anti = script.Parent:WaitForChild("Anti")

function CheckTeleport()
	if HumanoidRootPart == nil then LocalPlayer:Kick("xD Teleport?") end

	local PositionFirst = HumanoidRootPart.Position

	delay(1, function()
		local PositionSecond = HumanoidRootPart.Position

		if (PositionSecond - PositionFirst).magnitude >= 140 then LocalPlayer:Kick("Teleport Hack's") end
	end)
end

while task.wait() do
	if Anti.Disabled then
		Anti.Disabled = false
	
	elseif script.Parent:FindFirstChild("Anti") == nil then LocalPlayer:Kick("U cant move or delete me xD") end

	CheckTeleport()
end

-- Anti-Inject

local Event = Instance.new("RemoteEvent", game.ReplicatedStorage)

Event.OnServerEvent:connect(function(player, serverExecution)
	player:Kick("Inject Detected")
end)
