--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local library = loadstring(game:HttpGet("https://gist.githubusercontent.com/xNico013/22d6491ee1aa72bff4b81033d13ce853/raw/f4d0435df3ecc1165b92c2bd9a15ea12f3866e8d/Turtle%2520Hub"))()
local Tab1 = library:Window("Scripts")

game.StarterGui:SetCore("SendNotification", {
   Title = "Credits";
   Text = "Made By ameicaa, Press tab For Open/Close Gui";
   Icon = "";
   Duration = "6";
})

Tab1:Label("Brookhaven ChatSoundTrigger", Color3.fromRGB(127, 143, 166))

Tab1:Button("SoundChatTalkTrigger", function()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- Lista de palavras a serem ignoradas
local ignoredWords = {
	["oi"] = true,
	["hi"] = true,
	["hola"] = true,
	["😭"] = true,
	["💩"] = true,
	["😡"] = true,
	["😁"] = true,
	["🤮"] = true,
	["🤢"] = true,
	["😨"] = true,
	["😱"] = true,
	["🏳️‍🌈"] = true,
	["🤣"] = true,
	["😢"] = true,
	["😠"] = true,
	["😂"] = true,
	["poop"] = true,
	["/scream"] = true,
	["bye"] = true,
	["bye bye"] = true,
	["meow"] = true,
	["uwu"] = true,
  ["lol"] = true,
	[":d"] = true -- convert to lowercase below
}

local function playSound()
	wait(0.4)
	local soundId = 169507047
	local volume = 1
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://" .. soundId
	sound.Volume = volume
	sound.Looped = false
	sound.Parent = player:WaitForChild("PlayerGui")
	sound:Play()

	delay(3, function()
		sound:Destroy()
	end)
end

-- Função para lidar com o envio da mensagem no chat
local function onChatted(msg)
	local msgLower = msg:lower()
	if not ignoredWords[msgLower] then
		playSound()
		local args = {
			[1] = workspace,
			[2] = 169507047,
			[3] = 1
		}
		ReplicatedStorage:WaitForChild("RE"):FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))
	end
end

-- Conecta o evento Chatted de todos os jogadores que entrarem
Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(onChatted)
end)

-- Também conecta para jogadores que já estão na partida
for _, plr in ipairs(Players:GetPlayers()) do
	plr.Chatted:Connect(onChatted)
end
end)

Tab1:Button("SoundChatOiTrigger", function()
game.StarterGui:SetCore("SendNotification", {
   Title = "Note";
   Text = "Players should type: Hola or Hi or Oi for sounds.";
   Icon = "";
   Duration = "6";
})

-- Script Name: PingOiX

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

local function playSound()
	wait(0.4)
	local soundId = 1665689294
	local volume = 1
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://" .. soundId
	sound.Volume = volume
	sound.Looped = false
	sound.Parent = player:WaitForChild("PlayerGui")
	sound:Play()

	-- Aguarda 3 segundos antes de destruir o som
	delay(3, function()
		sound:Destroy()
	end)
end

local function onChatted(msg)
	local msgLower = msg:lower()
	if msgLower == "oi" or msgLower == "hola" or msgLower == "hi" then
		playSound()
		local args = {
			[1] = workspace,
			[2] = 1665689294,
			[3] = 1
		}
		ReplicatedStorage:WaitForChild("RE"):FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))
	end
end

-- Conecta o evento Chatted para novos jogadores
Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(onChatted)
end)

-- Conecta também para jogadores já presentes
for _, plr in ipairs(Players:GetPlayers()) do
	plr.Chatted:Connect(onChatted)
end
end)

Tab1:Button("SoundChatAngryTrigger", function()
game.StarterGui:SetCore("SendNotification", {
   Title = "Note";
   Text = "Players should type: 😡 or 😠 for sounds.";
   Icon = "";
   Duration = "6";
})

-- Script Name: PingOiX

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

local function playSound()
	wait(0.4)
	local soundId = 154157312
	local volume = 1
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://" .. soundId
	sound.Volume = volume
	sound.Looped = false
	sound.Parent = player:WaitForChild("PlayerGui")
	sound:Play()

	-- Aguarda 3 segundos antes de destruir o som
	delay(3, function()
		sound:Destroy()
	end)
end

local function onChatted(msg)
	local msgLower = msg:lower()
	if msgLower == "😠" or msgLower == "😡" or msgLower == "GRR" then
		playSound()
		local args = {
			[1] = workspace,
			[2] = 154157312,
			[3] = 1
		}
		ReplicatedStorage:WaitForChild("RE"):FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))
	end
end

-- Conecta o evento Chatted para novos jogadores
Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(onChatted)
end)

-- Conecta também para jogadores já presentes
for _, plr in ipairs(Players:GetPlayers()) do
	plr.Chatted:Connect(onChatted)
end
end)

Tab1:Button("SoundChatLaughTrigger", function()
game.StarterGui:SetCore("SendNotification", {
   Title = "Note";
   Text = "Players should type: 🤣 or 😂 or Lol for sounds.";
   Icon = "";
   Duration = "6";
})

-- Script Name: PingOiX

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

local function playSound()
	wait(0.4)
	local soundId = 154157543
	local volume = 1
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://" .. soundId
	sound.Volume = volume
	sound.Looped = false
	sound.Parent = player:WaitForChild("PlayerGui")
	sound:Play()

	-- Aguarda 3 segundos antes de destruir o som
	delay(3, function()
		sound:Destroy()
	end)
end

local function onChatted(msg)
	local msgLower = msg:lower()
	if msgLower == "😂" or msgLower == "lol" or msgLower == "🤣" then
		playSound()
		local args = {
			[1] = workspace,
			[2] = 154157543,
			[3] = 1
		}
		ReplicatedStorage:WaitForChild("RE"):FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))
	end
end

-- Conecta o evento Chatted para novos jogadores
Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(onChatted)
end)

-- Conecta também para jogadores já presentes
for _, plr in ipairs(Players:GetPlayers()) do
	plr.Chatted:Connect(onChatted)
end
end)

Tab1:Button("SoundChatCryTrigger", function()
game.StarterGui:SetCore("SendNotification", {
   Title = "Note";
   Text = "Players should type: 😭 or 😢 for sounds.";
   Icon = "";
   Duration = "6";
})

-- Script Name: PingOiX

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

local function playSound()
	wait(0.4)
	local soundId = 154146535
	local volume = 1
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://" .. soundId
	sound.Volume = volume
	sound.Looped = false
	sound.Parent = player:WaitForChild("PlayerGui")
	sound:Play()

	-- Aguarda 3 segundos antes de destruir o som
	delay(3, function()
		sound:Destroy()
	end)
end

local function onChatted(msg)
	local msgLower = msg:lower()
	if msgLower == "😢" or msgLower == "8ehde733^" or msgLower == "😭" then
		playSound()
		local args = {
			[1] = workspace,
			[2] = 154146535,
			[3] = 1
		}
		ReplicatedStorage:WaitForChild("RE"):FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))
	end
end

-- Conecta o evento Chatted para novos jogadores
Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(onChatted)
end)

-- Conecta também para jogadores já presentes
for _, plr in ipairs(Players:GetPlayers()) do
	plr.Chatted:Connect(onChatted)
end
end)

Tab1:Button("SoundChatScaredTrigger", function()
game.StarterGui:SetCore("SendNotification", {
   Title = "Note";
   Text = "Players should type: 😱 or 😨 for sounds.";
   Icon = "";
   Duration = "6";
})

-- Script Name: PingOiX

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

local function playSound()
	wait(0.4)
	local soundId = 5138834283
	local volume = 1
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://" .. soundId
	sound.Volume = volume
	sound.Looped = false
	sound.Parent = player:WaitForChild("PlayerGui")
	sound:Play()

	-- Aguarda 3 segundos antes de destruir o som
	delay(3, function()
		sound:Destroy()
	end)
end

local function onChatted(msg)
	local msgLower = msg:lower()
	if msgLower == "😱" or msgLower == "😨" or msgLower == "ur2idueiddjwi38r" then
		playSound()
		local args = {
			[1] = workspace,
			[2] = 5138834283,
			[3] = 1
		}
		ReplicatedStorage:WaitForChild("RE"):FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))
	end
end

-- Conecta o evento Chatted para novos jogadores
Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(onChatted)
end)

-- Conecta também para jogadores já presentes
for _, plr in ipairs(Players:GetPlayers()) do
	plr.Chatted:Connect(onChatted)
end
end)

Tab1:Button("SoundChatByeTrigger", function()
game.StarterGui:SetCore("SendNotification", {
   Title = "Note";
   Text = "Players should type: bye or bye bye for sounds.";
   Icon = "";
   Duration = "6";
})

-- Script Name: PingOiX

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

local function playSound()
	wait(0.4)
	local soundId = 154157386
	local volume = 1
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://" .. soundId
	sound.Volume = volume
	sound.Looped = false
	sound.Parent = player:WaitForChild("PlayerGui")
	sound:Play()

	-- Aguarda 3 segundos antes de destruir o som
	delay(3, function()
		sound:Destroy()
	end)
end

local function onChatted(msg)
	local msgLower = msg:lower()
	if msgLower == "bye" or msgLower == "bye bye" or msgLower == "8wjdhw" then
		playSound()
		local args = {
			[1] = workspace,
			[2] = 154157386,
			[3] = 1
		}
		ReplicatedStorage:WaitForChild("RE"):FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))
	end
end

-- Conecta o evento Chatted para novos jogadores
Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(onChatted)
end)

-- Conecta também para jogadores já presentes
for _, plr in ipairs(Players:GetPlayers()) do
	plr.Chatted:Connect(onChatted)
end
end)

Tab1:Button("SoundChatMoanTrigger", function()
game.StarterGui:SetCore("SendNotification", {
   Title = "Note";
   Text = "Players should type: /scream for sounds.";
   Icon = "";
   Duration = "6";
})

-- Script Name: PingOiX

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

local function playSound()
	wait(0.4)
	local soundId = 134211073313990
	local volume = 1
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://" .. soundId
	sound.Volume = volume
	sound.Looped = false
	sound.Parent = player:WaitForChild("PlayerGui")
	sound:Play()

	-- Aguarda 3 segundos antes de destruir o som
	delay(3, function()
		sound:Destroy()
	end)
end

local function onChatted(msg)
	local msgLower = msg:lower()
	if msgLower == "/scream" or msgLower == "82jsjsair7fnwuwvdnxd8" or msgLower == "8ehdhwlwd" then
		playSound()
		local args = {
			[1] = workspace,
			[2] = 134211073313990,
			[3] = 1
		}
		ReplicatedStorage:WaitForChild("RE"):FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))
	end
end

-- Conecta o evento Chatted para novos jogadores
Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(onChatted)
end)

-- Conecta também para jogadores já presentes
for _, plr in ipairs(Players:GetPlayers()) do
	plr.Chatted:Connect(onChatted)
end
end)

Tab1:Button("SoundChatGayTrigger", function()
game.StarterGui:SetCore("SendNotification", {
   Title = "Note";
   Text = "Players should type: 🏳️‍🌈 for sounds.";
   Icon = "";
   Duration = "6";
})

-- Script Name: PingOiX

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

local function playSound()
	wait(0.4)
	local soundId = 138420499694743
	local volume = 1
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://" .. soundId
	sound.Volume = volume
	sound.Looped = false
	sound.Parent = player:WaitForChild("PlayerGui")
	sound:Play()

	-- Aguarda 3 segundos antes de destruir o som
	delay(3, function()
		sound:Destroy()
	end)
end

local function onChatted(msg)
	local msgLower = msg:lower()
	if msgLower == "🏳️‍🌈" or msgLower == "38snehdbdbak" or msgLower == "8rsnnfjand20" then
		playSound()
		local args = {
			[1] = workspace,
			[2] = 138420499694743,
			[3] = 1
		}
		ReplicatedStorage:WaitForChild("RE"):FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))
	end
end

-- Conecta o evento Chatted para novos jogadores
Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(onChatted)
end)

-- Conecta também para jogadores já presentes
for _, plr in ipairs(Players:GetPlayers()) do
	plr.Chatted:Connect(onChatted)
end
end)

Tab1:Button("SoundChatPoopTrigger", function()
game.StarterGui:SetCore("SendNotification", {
   Title = "Note";
   Text = "Players should type: 💩 or poop for sounds.";
   Icon = "";
   Duration = "6";
})

-- Script Name: PingOiX

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

local function playSound()
	wait(0.4)
	local soundId = 8152780685
	local volume = 1
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://" .. soundId
	sound.Volume = volume
	sound.Looped = false
	sound.Parent = player:WaitForChild("PlayerGui")
	sound:Play()

	-- Aguarda 3 segundos antes de destruir o som
	delay(3, function()
		sound:Destroy()
	end)
end

local function onChatted(msg)
	local msgLower = msg:lower()
	if msgLower == "💩" or msgLower == "poop" or msgLower == "eiisjd8w8she028" then
		playSound()
		local args = {
			[1] = workspace,
			[2] = 8152780685,
			[3] = 1
		}
		ReplicatedStorage:WaitForChild("RE"):FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))
	end
end

-- Conecta o evento Chatted para novos jogadores
Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(onChatted)
end)

-- Conecta também para jogadores já presentes
for _, plr in ipairs(Players:GetPlayers()) do
	plr.Chatted:Connect(onChatted)
end
end)

Tab1:Button("SoundChatMeowTrigger", function()
game.StarterGui:SetCore("SendNotification", {
   Title = "Note";
   Text = "Players should type: meow for sounds.";
   Icon = "";
   Duration = "6";
})

-- Script Name: PingOiX

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

local function playSound()
	wait(0.4)
	local soundId = 7148585764
	local volume = 1
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://" .. soundId
	sound.Volume = volume
	sound.Looped = false
	sound.Parent = player:WaitForChild("PlayerGui")
	sound:Play()

	-- Aguarda 3 segundos antes de destruir o som
	delay(3, function()
		sound:Destroy()
	end)
end

local function onChatted(msg)
	local msgLower = msg:lower()
	if msgLower == "meow" or msgLower == "iwisndahd" or msgLower == "eiisjd8w8she028" then
		playSound()
		local args = {
			[1] = workspace,
			[2] = 7148585764,
			[3] = 1
		}
		ReplicatedStorage:WaitForChild("RE"):FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))
	end
end

-- Conecta o evento Chatted para novos jogadores
Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(onChatted)
end)

-- Conecta também para jogadores já presentes
for _, plr in ipairs(Players:GetPlayers()) do
	plr.Chatted:Connect(onChatted)
end
end)

Tab1:Button("SoundChatUwuTrigger", function()
game.StarterGui:SetCore("SendNotification", {
   Title = "Note";
   Text = "Players should type: uwu for sounds.";
   Icon = "";
   Duration = "6";
})

-- Script Name: PingOiX

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

local function playSound()
	wait(0.4)
	local soundId = 8679659744
	local volume = 1
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://" .. soundId
	sound.Volume = volume
	sound.Looped = false
	sound.Parent = player:WaitForChild("PlayerGui")
	sound:Play()

	-- Aguarda 3 segundos antes de destruir o som
	delay(3, function()
		sound:Destroy()
	end)
end

local function onChatted(msg)
	local msgLower = msg:lower()
	if msgLower == "uwu" or msgLower == "e8idnejqs92" or msgLower == "eiisjd8w8she028" then
		playSound()
		local args = {
			[1] = workspace,
			[2] = 8679659744,
			[3] = 1
		}
		ReplicatedStorage:WaitForChild("RE"):FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))
	end
end

-- Conecta o evento Chatted para novos jogadores
Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(onChatted)
end)

-- Conecta também para jogadores já presentes
for _, plr in ipairs(Players:GetPlayers()) do
	plr.Chatted:Connect(onChatted)
end
end)

Tab1:Button("SoundChatHappyTrigger", function()
game.StarterGui:SetCore("SendNotification", {
   Title = "Note";
   Text = "Players should type: :D or 😁 for sounds.";
   Icon = "";
   Duration = "6";
})

-- Script Name: PingOiX

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

local function playSound()
	wait(0.4)
	local soundId = 154157524
	local volume = 1
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://" .. soundId
	sound.Volume = volume
	sound.Looped = false
	sound.Parent = player:WaitForChild("PlayerGui")
	sound:Play()

	-- Aguarda 3 segundos antes de destruir o som
	delay(3, function()
		sound:Destroy()
	end)
end

local function onChatted(msg)
	local msgLower = msg:lower()
	if msgLower == ":D" or msgLower == "😁" or msgLower == "eiisjd8w8she028" then
		playSound()
		local args = {
			[1] = workspace,
			[2] = 154157524,
			[3] = 1
		}
		ReplicatedStorage:WaitForChild("RE"):FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))
	end
end

-- Conecta o evento Chatted para novos jogadores
Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(onChatted)
end)

-- Conecta também para jogadores já presentes
for _, plr in ipairs(Players:GetPlayers()) do
	plr.Chatted:Connect(onChatted)
end
end)

Tab1:Button("SoundChatVomitTrigger", function()
game.StarterGui:SetCore("SendNotification", {
   Title = "Note";
   Text = "Players should type: 🤮 or 🤢 for sounds.";
   Icon = "";
   Duration = "6";
})

-- Script Name: PingOiX

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

local function playSound()
	wait(0.4)
	local soundId = 5518971385
	local volume = 1
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://" .. soundId
	sound.Volume = volume
	sound.Looped = false
	sound.Parent = player:WaitForChild("PlayerGui")
	sound:Play()

	-- Aguarda 3 segundos antes de destruir o som
	delay(3, function()
		sound:Destroy()
	end)
end

local function onChatted(msg)
	local msgLower = msg:lower()
	if msgLower == "🤢" or msgLower == "🤮" or msgLower == "eiisjd8w8she028" then
		playSound()
		local args = {
			[1] = workspace,
			[2] = 5518971385,
			[3] = 1
		}
		ReplicatedStorage:WaitForChild("RE"):FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))
	end
end

-- Conecta o evento Chatted para novos jogadores
Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(onChatted)
end)

-- Conecta também para jogadores já presentes
for _, plr in ipairs(Players:GetPlayers()) do
	plr.Chatted:Connect(onChatted)
end
end)

library:Keybind("Tab")