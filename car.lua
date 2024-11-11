local Global = getgenv and getgenv() or shared
local IsR15
local Playr = game:GetService("Players")
local Run = game:GetService("RunService")
local Core = game:GetService("CoreGui")
local LocalPlayer = Playr.LocalPlayer
local Character = LocalPlayer.Character
local UserInputService = game:GetService("UserInputService")

if LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
	IsR15 = true
else
	IsR15 = false
end

local CarR15 = function()
	loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/ZendeyReanimate.lua", true))()
	Global.Velocity = -25
	Global.AutoReclaim = true
	Global.PermaDeath = false
	Global.Notifications = false
	Global.ShowReal = true
	wait(1)

	Float_Height = "-1.85"
	LocalPlayer.Character.Humanoid.WalkSpeed = 70
	LocalPlayer.Character.Humanoid.JumpPower = 0.0001
	AnimationId = "129342287"
	local a = Instance.new("Animation")
	a.AnimationId = "rbxassetid://" .. AnimationId
	local a = LocalPlayer.Character.Humanoid:LoadAnimation(a)
	a:Play()
	a:AdjustSpeed(1)
	for a, a in pairs(LocalPlayer.Character:GetDescendants()) do
		if a.ClassName == "Part" then
			a.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
		end
	end
	local a = 1
	G = game
	_ = wait
	p = G:GetService("Players").LocalPlayer.Character
	p:FindFirstChild("Humanoid").HipHeight = Float_Height
	_(1.5)
	t = 0.4
	for a = 1, a do
		repeat
			p:FindFirstChild("Humanoid").HipHeight = Float_Height
			_(t)
			p:FindFirstChild("Humanoid").HipHeight = Float_Height
			_(t)
		until p:FindFirstChild("Humanoid").Health == 0
	end
end

local CarR6 = function()
	Float_Height = "-1.03"
	LocalPlayer.Character.Humanoid.WalkSpeed = 70
	LocalPlayer.Character.Humanoid.JumpPower = 0.0001
	AnimationId = "129342287"
	local a = Instance.new("Animation")
	a.AnimationId = "rbxassetid://" .. AnimationId
	local a = LocalPlayer.Character.Humanoid:LoadAnimation(a)
	a:Play()
	a:AdjustSpeed(1)
	for a, a in pairs(LocalPlayer.Character:GetDescendants()) do
		if a.ClassName == "Part" then
			a.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
		end
	end
	local a = 1
	G = game
	_ = wait
	p = G:GetService("Players").LocalPlayer.Character
	p:FindFirstChild("Humanoid").HipHeight = Float_Height
	_(1.5)
	t = 0.4
	for a = 1, a do
		repeat
			p:FindFirstChild("Humanoid").HipHeight = Float_Height
			_(t)
			p:FindFirstChild("Humanoid").HipHeight = Float_Height
			_(t)
		until p:FindFirstChild("Humanoid").Health == 0
	end
end

local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua"))()

local Gui = Rayfield:CreateWindow({
	Name = "Void-Drift",
	LoadingTitle = "Void-Drift",
	LoadingSubtitle = "by VoidSupress",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "VoidSaver",
		FileName = "DriftConfig",
	},
	Discord = {
		Enabled = false,
		Invite = "",
		RememberJoins = true,
	},
	KeySystem = true,
	KeySettings = {
		Title = "Void",
		Subtitle = "Key System",
		Note = "apenas amigos do void :3",
		FileName = "VoidKey",
		SaveKey = true,
		GrabKeyFromSite = false,
		Key = "VoidOnTop",
	},
})

if IsR15 == true then
	Rayfield:Notify({
		Title = "Note",
		Content = "Because you are in R15 custom Hype / Float height wont work because of technical issues.",
		Duration = 6.5,
		Image = 11745872952,
		Actions = {
			Ignore = {
				Name = "Okay!",
				Callback = function()
					print(".")
				end,
			},
		},
	})
end

local Tab = Gui:CreateTab("Main")

local Info = Tab:CreateSection("Info")
local Label = Tab:CreateLabel("Enjoy! :3")

local Tuning = Tab:CreateSection("Tuning")
local WalkSpeed = Tab:CreateSlider({
	Name = "Speed",
	Range = { 0, 500 },
	Increment = 5,
	Suffix = "Speed",
	CurrentValue = 35,
	Flag = "SpeedUwU",
	Callback = function(Value)
		LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end,
})

local Grip = Tab:CreateSlider({
	Name = "Grip",
	Range = { 0, 1 },
	Increment = 0.05,
	Suffix = "Grip",
	CurrentValue = 0,
	Flag = "GripUwU",
	Callback = function(Value)
		for a, a in pairs(LocalPlayer.Character:GetDescendants()) do
			if a.ClassName == "Part" then
				a.CustomPhysicalProperties = PhysicalProperties.new(Value, 0, 0)
			end
		end
	end,
})

local HypeHeight = Tab:CreateSlider({
	Name = "Hype / Float Height",
	Range = { 0, 100 },
	Increment = 1,
	Suffix = "Height",
	CurrentValue = 0,
	Flag = "HeightUwU",
	Callback = function(Value)
		if IsR15 == false then
			local rgkijm = 2
			Float_Height = Value - rgkijm
			while true do
				wait(0.01)
				LocalPlayer.Character.Humanoid.HipHeight = Float_Height
				if LocalPlayer.Character.Humanoid.Health == 0 then
					break
				end
			end
		end
	end,
})

local Section = Tab:CreateSection("Main")

local enable = Tab:CreateButton({
	Name = "Enable",
	Callback = function()
		if IsR15 == true then
			coroutine.wrap(function()
				CarR15()
			end)()
			WalkSpeed:Set(35)
			Grip:Set(0)
		else
			coroutine.wrap(function()
				CarR6()
			end)()
			WalkSpeed:Set(35)
			Grip:Set(0)
		end
	end,
})

local disable = Tab:CreateButton({
	Name = "Disable",
	Callback = function()
		local PreviousPosition = LocalPlayer.Character.HumanoidRootPart.CFrame
		LocalPlayer.Character.Humanoid.Health = 0
		if LocalPlayer.Character:FindFirstChild("Head") then 
			LocalPlayer.Character.Head:Destroy() 
		end
		wait(6)
		LocalPlayer.Character:WaitForChild("HumanoidRootPart")
		LocalPlayer.Character.HumanoidRootPart.CFrame = PreviousPosition
	end,
})

local Settings = Gui:CreateTab("Settings")

if game.PlaceId == 9848789324 then
	local RagdollEngine = Settings:CreateButton({
		Name = "Ragdol Engine Script",
		Callback = function()
			loadstring(game:HttpGet('https://raw.githubusercontent.com/martinelcrac/cryptonichub/main/Ragdollengine.lua'))()
		end,
	})
end

local NoclipSection = Settings:CreateSection("Noclip Stuff")
local Clip
local Noclip = Settings:CreateToggle({
	Name = "Noclip",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		if Value == true then
			Clip = false
			wait(0.1)
			local function NoclipLoop()
				if Clip == false and LocalPlayer.Character ~= nil then
					for _, child in pairs(LocalPlayer.Character:GetDescendants()) do
						if child:IsA("BasePart") and child.CanCollide == true then
							child.CanCollide = false
						end
					end
				end
			end
			Noclipping = game:GetService("RunService").Stepped:Connect(NoclipLoop)
		else
			Noclipping:Disconnect()
			Clip = true
		end
	end,
})

local MusicPlayer = Settings:CreateSection("Music PLayer")

local MusicSound = Instance.new("Sound")
MusicSound.Parent = LocalPlayer.Character
MusicSound.Volume = .5

LocalPlayer.Character:WaitForChild("Humanoid").Died:Connect(function()
	MusicSound:Stop()
	MusicSound:Destroy()
end)

local SoundId = Settings:CreateInput({
   Name = "Sound ID",
   PlaceholderText = "Sound ID",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
		MusicSound.SoundId = "rbxassetid://"..Text
   end,
})

local StartMusic = Settings:CreateButton({
	Name = "Play",
	Callback = function()
		MusicSound.TimePosition = 0
		MusicSound.Playing = true
		MusicSound.Looped = true
		MusicSound:Play()
	end,
})

local StartMusic = Settings:CreateButton({
	Name = "Stop",
	Callback = function()
		MusicSound:Stop()
	end,
})


local Presets = Settings:CreateSection("Presets")

local DefaultPS = Settings:CreateButton({
	Name = "Default",
	Callback = function()
		WalkSpeed:Set(55)
		Grip:Set(0.05)
	end,
})

local RecommendedPS = Settings:CreateButton({
	Name = "Recommended",
	Callback = function()
		WalkSpeed:Set(50)
		Grip:Set(0.05)
	end,
})

local ExtremePS = Settings:CreateButton({
	Name = "Extreme",
	Callback = function()
		WalkSpeed:Set(500)
		Grip:Set(0.5)
	end,
})

local Closee = Settings:CreateSection("Close")
local DestroyGui = Settings:CreateButton({
	Name = "Destroy Void-Drift",
	Callback = function()
		Rayfield:Destroy()
	end,
 })
