local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local Main = script.Parent:WaitForChild("JyAntiCheat.lua")


while wait() do
	if script.Parent:FindFirstChild("JyAntiCheat.lua") == nil then
		LocalPlayer:Kick("Wait lol really?")
	elseif Main.Disabled then
		Main.Disabled = false
	end
end
