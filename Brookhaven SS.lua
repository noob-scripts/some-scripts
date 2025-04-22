--[[
    Well this script was cracked by me (Wild Wide)
    So this script was made by ameicaa,
    He probably skidded of a old brookhaven script and then made a version working for 2025
    Also looking at the source code, you can see its made by an AI (probably ChatGPT)
    Hes Brazilian/Portuguese
    Original (Obfuscated): https://github.com/ameicaa/Brookhaven-script-by-ameicaa/blob/main/Brookhaven%20Script%20by%20ameicaa
]]

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

Tab1:Label("Server-Side Play Music", Color3.fromRGB(127, 143, 166))

Tab1:Box("FE Play Sound", function(text, focuslost)
  if focuslost then
     local player = game.Players.LocalPlayer
local function playSound()
    wait(0.4)
    local soundId = text
    local volume = 1
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. soundId
    sound.Volume = volume
    sound.Looped = false
    sound.Parent = player:WaitForChild("PlayerGui")
    sound:Play()

    -- Aguarda 3 segundos antes de destruir o som
    
end

playSound()
local args = {
    [1] = workspace,
    [2] = text,
    [3] = 1
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))
end
end)

Tab1:Button("FE Scare All Players", function()
local player = game.Players.LocalPlayer
local function playSound()
    wait(0.4)
    local soundId = 528621365
    local volume = 1
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. soundId
    sound.Volume = volume
    sound.Looped = false
    sound.Parent = player:WaitForChild("PlayerGui")
    sound:Play()

    -- Aguarda 3 segundos antes de destruir o som
    

   end

playSound()
local args = {
    [1] = workspace,
    [2] = 528621365,
    [3] = 1
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))
end)

Tab1:Label("Brookhaven Model Scripts", Color3.fromRGB(127, 143, 166))

Tab1:Button("UnMesh All Players", function()
-- Script de Voo sem GUI
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local Flying = false
local Speed = 50  -- Velocidade de voo
local FlightHeight = 10  -- Altura do voo

-- Função para ativar/desativar o voo
local function toggleFlight()
    if not Flying then
        Flying = true
        local BodyVelocity = Instance.new("BodyVelocity")
        BodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
        BodyVelocity.Velocity = Vector3.new(0, 0, 0)
        BodyVelocity.Parent = Character:WaitForChild("HumanoidRootPart")

        local BodyGyro = Instance.new("BodyGyro")
        BodyGyro.MaxTorque = Vector3.new(400000, 400000, 400000)
        BodyGyro.CFrame = Character.HumanoidRootPart.CFrame
        BodyGyro.Parent = Character:WaitForChild("HumanoidRootPart")

        -- Função de controle de voo
        local userInputService = game:GetService("UserInputService")
        local flyingDirection = Vector3.new(0, 0, 0)

        userInputService.InputChanged:Connect(function(input)
            if Flying then
                if input.UserInputType == Enum.UserInputType.Keyboard then
                    if input.KeyCode == Enum.KeyCode.W then
                        flyingDirection = Vector3.new(0, 0, -Speed)
                    elseif input.KeyCode == Enum.KeyCode.S then
                        flyingDirection = Vector3.new(0, 0, Speed)
                    elseif input.KeyCode == Enum.KeyCode.A then
                        flyingDirection = Vector3.new(-Speed, 0, 0)
                    elseif input.KeyCode == Enum.KeyCode.D then
                        flyingDirection = Vector3.new(Speed, 0, 0)
                    elseif input.KeyCode == Enum.KeyCode.Space then
                        flyingDirection = Vector3.new(0, Speed, 0)
                    elseif input.KeyCode == Enum.KeyCode.LeftControl then
                        flyingDirection = Vector3.new(0, -Speed, 0)
                    end
                end
                BodyVelocity.Velocity = flyingDirection
                BodyGyro.CFrame = Character.HumanoidRootPart.CFrame
            end
        end)

        -- Manter a altura
        game:GetService("RunService").Heartbeat:Connect(function()
            if Flying then
                BodyVelocity.Velocity = flyingDirection
                BodyGyro.CFrame = Character.HumanoidRootPart.CFrame
            end
        end)
    end
end

-- Acionar o voo automaticamente
toggleFlight()

local args = {
    [1] = "RolePlayName",
    [2] = ""
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eTex1t"):FireServer(unpack(args))

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local camera = game.Workspace.CurrentCamera
local currentTarget = nil


local function changeTarget()
    local others = {}
    
    
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player then
            table.insert(others, p)
        end
    end
    
    
    if #others > 0 then
        currentTarget = others[math.random(1, #others)]
        camera.CameraSubject = currentTarget.Character:FindFirstChild("Humanoid")
    end
end


Players.PlayerRemoving:Connect(function(leavingPlayer)
    if leavingPlayer == currentTarget then
        changeTarget()  
    end
end)


player.CharacterAdded:Connect(function(character)
    
    camera.CameraSubject = player.Character:FindFirstChild("Humanoid")
    currentTarget = nil  
end)


changeTarget()

local args = {
    [1] = 18658051550
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))

local args = {
    [1] = "CharacterSizeDown",
    [2] = 1
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer(unpack(args))

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer(unpack(args))

-- Tempo entre os teletransportes (em segundos)
local intervalo = 0

-- O jogador que será teleportado
local jogadorAlvo = game.Players.LocalPlayer  -- Seu personagem, caso queira usar um jogador específico

-- Variável para controlar o loop
local loopAtivo = true

-- Função que teleporta o jogador para a frente de outro jogador aleatório
local function teleportToFrontOfRandomPlayer()
    -- Verifica se o jogador alvo tem um personagem válido
    if jogadorAlvo.Character and jogadorAlvo.Character:FindFirstChild("HumanoidRootPart") then
        local humanoidRootPart = jogadorAlvo.Character:FindFirstChild("HumanoidRootPart")
        
        -- Procura por outros jogadores no servidor
        local jogadores = game.Players:GetPlayers()
        local outrosJogadores = {}
        
        -- Exclui o jogador alvo da lista
        for _, jogador in ipairs(jogadores) do
            if jogador ~= jogadorAlvo and jogador.Character and jogador.Character:FindFirstChild("HumanoidRootPart") then
                table.insert(outrosJogadores, jogador)
            end
        end
        
        -- Se houver jogadores para teleportar
        if #outrosJogadores > 0 then
            local jogadorAleatorio = outrosJogadores[math.random(1, #outrosJogadores)]
            local destino = jogadorAleatorio.Character:FindFirstChild("HumanoidRootPart")
            
            -- Teleporta o jogador alvo para a frente do jogador aleatório
            if destino then
                -- Obtém a posição do jogador aleatório e calcula a posição à frente dele
                local novaPosicao = destino.Position + destino.CFrame.LookVector * 0  -- 3 studs à frente do jogador aleatório
                
                -- Teleporta o jogador alvo para a nova posição
                humanoidRootPart.CFrame = CFrame.new(novaPosicao)
            end
        end
    end
end

-- Função para lidar com a reinicialização do personagem
local function onCharacterAdded(character)
    -- Quando o personagem for adicionado, reativa o loop de teletransporte
    loopAtivo = false
end

-- Função que para o loop quando o personagem for resetado
local function onCharacterRemoving()
    -- Quando o personagem for removido (morto ou resetado), desativa o loop
    loopAtivo = false
end

-- Conecta os eventos de morte e adição do personagem
jogadorAlvo.CharacterAdded:Connect(onCharacterAdded)
jogadorAlvo.CharacterRemoving:Connect(onCharacterRemoving)

-- Loop que chama a função a cada intervalo
while true do
    if loopAtivo then
        teleportToFrontOfRandomPlayer()  -- Teleporta o jogador alvo para a frente de outro jogador
    end
    wait(intervalo)  -- Espera o tempo definido antes de teleportar novamente
end
end)

Tab1:Button("StopUnMesh", function()
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ResetCharacterAppearance"):FireServer()

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()


if character then
    character:BreakJoints()
end

-- Defina as coordenadas desejadas
local destino = Vector3.new(432.58, -76.65, 97.99)  -- Altere os valores conforme necessário

-- Função para teletransportar o personagem
local function teleportarPersonagem()
    local jogador = game.Players.LocalPlayer  -- Obtém o jogador que está executando o script
    
    -- Verifica se o jogador está na partida
    if jogador and jogador.Character then
        local personagem = jogador.Character
        local humanoide = personagem:FindFirstChild("Humanoid")
        
        if humanoide then
            -- Teleporta o personagem para as coordenadas especificadas
            personagem:SetPrimaryPartCFrame(CFrame.new(destino))
        end
    end
end

-- Chama a função de teleporte
teleportarPersonagem()    
end)

Tab1:Button("Blown All Bombs Server", function()
local Players = game:GetService("Players")
local RE = game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Blo1wBomb1sServe1r")

for _, player in ipairs(Players:GetPlayers()) do
    local args = {
        [1] = "Bomb" .. player.Name
    }
    RE:FireServer(unpack(args))
end
end)

Tab1:Button("Horse Spam", function()
local args = {
    [1] = "HorseDismount"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Hors1eRemot1e"):FireServer(unpack(args))
local args = {
    [1] = "PickingCar",
    [2] = "Horse"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))

local args = {
    [1] = "PlayerReadyForHorse"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Hors1eRemot1e"):FireServer(unpack(args))
local args = {
    [1] = "PickingCar",
    [2] = "Horse"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
local args = {
    [1] = "PlayerReadyForHorse"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Hors1eRemot1e"):FireServer(unpack(args))
local args = {
    [1] = "PickingCar",
    [2] = "Horse"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
local args = {
    [1] = "PlayerReadyForHorse"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Hors1eRemot1e"):FireServer(unpack(args))
local args = {
    [1] = "PickingCar",
    [2] = "Horse"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
local args = {
    [1] = "PlayerReadyForHorse"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Hors1eRemot1e"):FireServer(unpack(args))
local args = {
    [1] = "PickingCar",
    [2] = "Horse"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))

local tempoLimite = 1.7 -- Defina o tempo em segundos

local inicio = tick() -- Marca o início do tempo

while tick() - inicio < tempoLimite do
    local args = {
        [1] = "CharacterSizeDown",
        [2] = 1
    }

    game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer(unpack(args))

    local personagem = game.Players.LocalPlayer.Character
    local altura = 2 -- Defina a altura para onde o personagem será teletransportado

    -- Verificar se o personagem existe
    if personagem then
        local posicaoAtual = personagem.HumanoidRootPart.Position
        local novaPosicao = Vector3.new(posicaoAtual.X, posicaoAtual.Y + altura, posicaoAtual.Z)
        
        -- Criar um CFrame com a nova posição e com a rotação voltada para cima
        local novaCFrame = CFrame.new(novaPosicao) * CFrame.Angles(math.rad(90), 0, 0)
        
        -- Teletransportar o personagem
        personagem:SetPrimaryPartCFrame(novaCFrame)
    end

    local args = {
        [1] = "HorseDismount"
    }

    game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Hors1eRemot1e"):FireServer(unpack(args))

    local args = {
        [1] = "PickingCar",
        [2] = "Horse"
    }

    game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))

    local args = {
        [1] = "CharacterSizeUp",
        [2] = 1
    }

    game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer(unpack(args))

    -- Aguardar 1 segundo antes de repetir
    wait(0.2) -- Pode ser ajustado para o intervalo de tempo entre as repetições
end
local args = {
    [1] = "DeleteAllVehicles"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
local args = {
    [1] = "DeleteAllVehicles"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
local args = {
    [1] = "DeleteAllVehicles"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
local args = {
    [1] = "DeleteAllVehicles"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
local args = {
    [1] = "DeleteAllVehicles"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
local args = {
    [1] = "DeleteAllVehicles"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))

-- Após 2 segundos, destruir o script
script:

Destroy()
end)

Tab1:Label("Anti Byfron", Color3.fromRGB(127, 143, 166))

Tab1:Button("AntiKickV1", function()
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local PLACE_ID = game.PlaceId
local jobId = game.JobId

-- Verifica se o jogador foi desconectado por erro
game:GetService("GuiService").ErrorMessageChanged:Connect(function()
    -- Aguarda um pouco antes de tentar reconectar
    wait(0)
    pcall(function()
        -- Tenta teleportar de volta ao mesmo servidor
        TeleportService:TeleportToPlaceInstance(PLACE_ID, jobId, player)
    end)
end)

game.StarterGui:SetCore("SendNotification", {
   Title = "Actived!";
   Text = "You are protected from kicks.";
   Icon = "";
   Duration = "6";
})
end)

Tab1:Label("Character Scripts", Color3.fromRGB(127, 143, 166))

Tab1:Button("Big Character", function()
local args = {
    [1] = {
        [1] = 81881085814072,
        [2] = 79115019295211,
        [3] = 106740492797177,
        [4] = 81153927159685,
        [5] = 88668275797583,
        [6] = 115379341593655
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack(args))
end)

Tab1:Button("Big Head", function()
local args = {
    [1] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 115379341593655
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack(args))
end)

Tab1:Button("Naked Avatar", function()
local args = {
    [1] = 17584071085
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
local args = {
    [1] = 4626346449
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end)

local Tab2 = library:Window("Spawn Cars")

Tab2:Label("Car Upgrade", Color3.fromRGB(127, 143, 166))

Tab2:Button("Rainbow Bike", function()
while true do
    local args = {
        [1] = "NoMotorColor",
        [2] = Color3.new(0.002243518829345703, 1, 0)
    }
    game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sCa1r"):FireServer(unpack(args))
    
    wait(1) -- Espera 1 segundo antes de continuar (ajuste o tempo conforme necessário)

    local args = {
        [1] = "NoMotorColor",
        [2] = Color3.new(0.1159353256225586, 0, 1)
    }
    game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sCa1r"):FireServer(unpack(args))
    
    wait(1)

    local args = {
        [1] = "NoMotorColor",
        [2] = Color3.new(0.956802487373352, 1, 0)
    }
    game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sCa1r"):FireServer(unpack(args))
    
    wait(1)

    local args = {
        [1] = "NoMotorColor",
        [2] = Color3.new(0.812100887298584, 0, 1)
    }
    game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sCa1r"):FireServer(unpack(args))
    
    wait(1)

    local args = {
        [1] = "NoMotorColor",
        [2] = Color3.new(1, 0.5107977986335754, 0.08215612173080444)
    }
    game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sCa1r"):FireServer(unpack(args))
    
    wait(1) -- Espera 1 segundo antes de repetir tudo
end
end)

Tab2:Label("Instant Spawn Cars", Color3.fromRGB(127, 143, 166))

Tab2:Button("Cadillac", function()
local args = {
    [1] = "PickingCar",
    [2] = "Cadillac"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
end)






Tab2:Button("VWBus", function()
local args = {
    [1] = "PickingCar",
    [2] = "VWBus"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
end)

Tab2:Button("PoliceMotorcycle", function()
local args = {
    [1] = "PickingCar",
    [2] = "PoliceMotorcycle"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
end)

Tab2:Button("Bus", function()
local args = {
    [1] = "PickingCar",
    [2] = "Bus"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
end)

Tab2:Button("Tank", function()
local args = {
    [1] = "PickingCar",
    [2] = "Tank"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
end)

Tab2:Button("Smart Car", function()
local args = {
    [1] = "PickingCar",
    [2] = "SmartCar"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
end)

Tab2:Button("GoKart", function()
local args = {
    [1] = "PickingCar",
    [2] = "GoKart"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
end)

Tab2:Button("SchoolBus", function()
local args = {
    [1] = "PickingCar",
    [2] = "SchoolBus"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
end)

Tab2:Button("TowTruck", function()
local args = {
    [1] = "PickingCar",
    [2] = "TowTruck"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
end)

Tab2:Label("Car Settings", Color3.fromRGB(127, 143, 166))

Tab2:Box("Music Car", function(text, focuslost)
  if focuslost then
local args = {
    [1] = "PickingCarMusicText",
    [2] = text
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sCa1r"):FireServer(
