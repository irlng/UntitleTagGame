function SendWarn(msg)
	local msgs = "[Exploit] : \"" .. tostring(msg) .. "\"."
	warn(msgs)
end

if _G.RunningESP == true then
	_G.RunningESP = nil
	SendWarn("Reloading the script")
end

if _G.DisableESP == true then return end

wait(1)

local Players = game:GetService("Players")
local speaker = Players.LocalPlayer
local RunService = game:GetService("RunService")

_G.RunningESP = true

local Padded
local Cadded

local function CreateESP(plr : Player)
	local succes, errmsg = pcall(function()
		if not plr:FindFirstChild("PlayerRole") then SendWarn("Cannot find [PlayerRole] inside of (" .. tostring(plr.Name) .. ")") return end

		if plr.Character.HumanoidRootPart:FindFirstChild("ESP") then
			if plr.PlayerRole.Value == "Runner" then
				plr.Character.HumanoidRootPart.ESP.Color3 = _G.RoleColors.Runner
			end

			if plr.PlayerRole.Value == "Survivor" then
				plr.Character.HumanoidRootPart.ESP.Color3 = _G.RoleColors.Survivor
			end

			if plr.PlayerRole.Value == "Frozen" then
				plr.Character.HumanoidRootPart.ESP.Color3 = _G.RoleColors.Frozen
			end

			if plr.PlayerRole.Value == "CompTagger" then
				plr.Character.HumanoidRootPart.ESP.Color3 = _G.RoleColors.CompetitiveTagger
			end

			if plr.PlayerRole.Value == "Tagger" then
				plr.Character.HumanoidRootPart.ESP.Color3 = _G.RoleColors.Tagger
			end

			if plr.PlayerRole.Value == "FreezeTagger" then
				plr.Character.HumanoidRootPart.ESP.Color3 = _G.RoleColors.FreezeTagger
			end

			if plr.PlayerRole.Value == "BombTagger" then
				plr.Character.HumanoidRootPart.ESP.Color3 = _G.RoleColors.BombTagger
			end

			if plr.PlayerRole.Value == "FFATagger" then
				plr.Character.HumanoidRootPart.ESP.Color3 = _G.RoleColors.FFATagger
			end

			if plr.PlayerRole.Value == "Infected" then
				plr.Character.HumanoidRootPart.ESP.Color3 = _G.RoleColors.Infected
			end

			if plr.PlayerRole.Value == "Slasher" then
				plr.Character.HumanoidRootPart.ESP.Color3 = _G.RoleColors.Slasher
			end

			if plr.PlayerRole.Value == "PatientZero" then
				plr.Character.HumanoidRootPart.ESP.Color3 = _G.RoleColors.PatientZero
			end

			if plr.PlayerRole.Value == "Dead" then
				plr.Character.HumanoidRootPart.ESP.Color3 = _G.RoleColors.Dead
			end

			if plr.PlayerRole.Value == "" or plr.PlayerRole.Value == nil then
				plr.Character.HumanoidRootPart.ESP.Color3 = _G.RoleColors.NoRole
			end

		else
			local ESP = Instance.new("BoxHandleAdornment")
			ESP.Name = "ESP"
			ESP.Transparency = 0.2
			ESP.Color3 = Color3.fromRGB(17, 255, 0)
			ESP.ZIndex = 10
			ESP.AlwaysOnTop = true
			ESP.SizeRelativeOffset = Vector3.new(0, 1.5, 0)
			ESP.Size = Vector3.new(2, 2, 2)

			ESP.Adornee = plr.Character.HumanoidRootPart
			ESP.Parent = plr.Character.HumanoidRootPart

			if plr.PlayerRole.Value == "Runner" then
				ESP.Color3 = _G.RoleColors.Runner
			end

			if plr.PlayerRole.Value == "Survivor" then
				ESP.Color3 = _G.RoleColors.Survivor
			end

			if plr.PlayerRole.Value == "Frozen" then
				ESP.Color3 = _G.RoleColors.Frozen
			end

			if plr.PlayerRole.Value == "CompTagger" then
				ESP.Color3 = _G.RoleColors.CompetitiveTagger
			end

			if plr.PlayerRole.Value == "Tagger" then
				ESP.Color3 = _G.RoleColors.Tagger
			end

			if plr.PlayerRole.Value == "FreezeTagger" then
				ESP.Color3 = _G.RoleColors.FreezeTagger
			end

			if plr.PlayerRole.Value == "BombTagger" then
				ESP.Color3 = _G.RoleColors.BombTagger
			end

			if plr.PlayerRole.Value == "FFATagger" then
				ESP.Color3 = _G.RoleColors.FFATagger
			end

			if plr.PlayerRole.Value == "Infected" then
				ESP.Color3 = _G.RoleColors.Infected
			end

			if plr.PlayerRole.Value == "Slasher" then
				ESP.Color3 = _G.RoleColors.Slasher
			end

			if plr.PlayerRole.Value == "PatientZero" then
				ESP.Color3 = _G.RoleColors.PatientZero
			end

			if plr.PlayerRole.Value == "Dead" then
				ESP.Color3 = _G.RoleColors.Dead
			end

			if plr.PlayerRole.Value == "" or plr.PlayerRole.Value == nil then
				ESP.Color3 = _G.RoleColors.NoRole
			end
		end
	end)

	if not succes then
		warn("[Error] : \"" .. tostring(errmsg) .. "\".")
	end
end

for _, v in pairs(Players:GetPlayers()) do
	if v ~= speaker then
		CreateESP(v)
	end
end

Padded = Players.PlayerAdded:Connect(function(plr)
	Cadded = plr.CharacterAdded:Connect(function(char)
		if plr ~= speaker then
			CreateESP(plr)
		end
	end)
end)

while true do
	if _G.RunningESP == true then
		for _, v in pairs(Players:GetChildren()) do
			if v ~= speaker then
				CreateESP(v)
			end
		end
	elseif _G.RunningESP == nil then
		if Cadded then
			Cadded:Disconnect()
		end	
		if Padded then
			Padded:Disconnect()
		end

		for _, v in pairs(Players:GetPlayers()) do
			if v ~= speaker then
				if v.Character ~= nil then
					for _, v in pairs(v.Character:GetDescendants()) do
						if v:IsA("BoxHandleAdornment") then
							v:Destroy()
						end
					end
				end
			end
		end

		break
	end

	wait(.5)
end