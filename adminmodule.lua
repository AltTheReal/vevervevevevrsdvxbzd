local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")

-- Define a list of admin user IDs
local adminUserIDs = {
    241669388,
    3510980398,
    291336342,
    4845457551,
    3449798604,
}

-- Define the owner's user ID
local ownerUserID = 162080939

-- Define the place ID for rejoining
local PlaceId = game.PlaceId 

-- Function to check if a player is an admin or the owner
local function isAllowed(player)
    local isAdmin = false
    local isOwner = player.UserId == ownerUserID

    for _, adminID in ipairs(adminUserIDs) do
        if player.UserId == adminID then
            isAdmin = true
            break
        end
    end

    return isAdmin or isOwner
end

-- Function to kill a player
local function killPlayer(player)
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Dead)
    end
end

-- Function to kick a player
local function kickPlayer(player, targetPlayer)
    if targetPlayer and targetPlayer ~= player then
        targetPlayer:Kick("You have been kicked by an admin.")
    end
end

-- Function to crash a player
local function crashPlayer(player)
    local character = player.Character
    if character then
        local workspace = game:GetService("Workspace")

        for i = 1, 100000000 do
            local part = Instance.new("Part")
            part.Size = Vector3.new(10000000, 100000, 100000)
            part.Position = character:WaitForChild("HumanoidRootPart").Position + Vector3.new(0, i * 100, 0)
            part.Anchored = true
            part.Parent = workspace
        end
    else
        print("Invalid character for crashing.")
    end
end

-- Function to freeze a player
local function freezePlayer(player)
    local character = player.Character
    if character then
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if rootPart then
            rootPart.Anchored = true
        end
    end
end

-- Function to unfreeze a player
local function unfreezePlayer(player)
    local character = player.Character
    if character then
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if rootPart then
            rootPart.Anchored = false
        end
    end
end

-- Function to teleport a player to a place by ID
local function teleportPlayerToPlace(player, placeID)
    if player and placeID then
        local success, errorMsg = pcall(function()
            player:MoveTo(TeleportService:Teleport(placeID, player))
        end)
        if not success then
            warn("Teleport failed:", errorMsg)
        end
    end
end

-- Function to fling a player
local function flingPlayer(player)
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        local rootPart = character:FindFirstChild("HumanoidRootPart")

        if humanoid and rootPart then
            -- Calculate the fling direction
            local flingDirection = Vector3.new(math.random(), 1, math.random()).unit

            -- Create a BodyVelocity object
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Velocity = flingDirection * 5000 -- Adjust the force as needed
            bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
            bodyVelocity.P = 50000 -- Adjust the P value as needed

            -- Apply the BodyVelocity to the HumanoidRootPart
            bodyVelocity.Parent = rootPart

            -- Remove the BodyVelocity after a short delay
            wait(0.5) -- Adjust the delay as needed
            bodyVelocity:Destroy()
        else
            print("Invalid character parts for flinging.")
        end
    else
        print("Invalid character for flinging.")
    end
end

-- Function to bring a player to another player
local function bringPlayer(playerToBring, destinationPlayer)
    local characterToBring = playerToBring.Character
    local destinationCharacter = destinationPlayer.Character

    if characterToBring and destinationCharacter then
        local humanoidToBring = characterToBring:FindFirstChildOfClass("Humanoid")
        local rootPartToBring = characterToBring:FindFirstChild("HumanoidRootPart")

        local rootPartDestination = destinationCharacter:FindFirstChild("HumanoidRootPart")

        if humanoidToBring and rootPartToBring and rootPartDestination then
            rootPartToBring.CFrame = rootPartDestination.CFrame * CFrame.new(0, 5, 0) -- Adjust the offset if needed
        else
            print("Invalid character parts for bringing.")
        end
    else
        print("Invalid characters for bringing.")
    end
end

-- Function to rejoin a player
local function rejoinPlayer(player)
    if player then
        local playerUserId = player.UserId
        local success, errorMsg = pcall(function()
            Players.LocalPlayer:Kick("\nRejoining...")
            wait()
            TeleportService:Teleport(PlaceId, player)
        end)
        if not success then
            warn("Rejoin failed:", errorMsg)
        end
    end
end

-- Function to handle player chat and check for admin commands
local function onPlayerChat(player, message)
    if isAllowed(player) then
        local lowerMessage = message:lower()
        local words = {}
        for word in lowerMessage:gmatch("%S+") do
            table.insert(words, word)
        end

        local command = words[1]
        local commandArgs = {}
        for i = 2, #words do
            table.insert(commandArgs, words[i])
        end

        local function findPlayerByName(playerName)
            local partialMatch = string.sub(playerName:lower(), 1, 3)
            for _, p in ipairs(Players:GetPlayers()) do
                if p.Name:lower():sub(1, 3) == partialMatch then
                    return p
                end
            end
            return nil
        end

        if command == ".rj" then
            local playerNameToRejoin = table.concat(commandArgs, " ")
            local targetPlayer = findPlayerByName(playerNameToRejoin)
            if targetPlayer then
                rejoinPlayer(targetPlayer)
            else
                print("Player not found.")
            end
        elseif command == ".kill" then
            local playerNameToKill = table.concat(commandArgs, " ")
            local targetPlayer = findPlayerByName(playerNameToKill)
            if targetPlayer then
                killPlayer(targetPlayer)
            else
                print("Player not found.")
            end
        elseif command == ".crash" then
            local playerNameToCrash = table.concat(commandArgs, " ")
            local targetPlayer = findPlayerByName(playerNameToCrash)
            if targetPlayer then
                crashPlayer(targetPlayer)
            else
                print("Player not found.")
            end
        elseif command == ".kick" then
            local playerNameToKick = table.concat(commandArgs, " ")
            local targetPlayer = findPlayerByName(playerNameToKick)
            if targetPlayer then
                kickPlayer(player, targetPlayer)
            else
                print("Player not found.")
            end
        elseif command == ".freeze" then
            local playerNameToFreeze = table.concat(commandArgs, " ")
            local targetPlayer = findPlayerByName(playerNameToFreeze)
            if targetPlayer then
                freezePlayer(targetPlayer)
            else
                print("Player not found.")
            end
        elseif command == ".unfreeze" then
            local playerNameToUnfreeze = table.concat(commandArgs, " ")
            local targetPlayer = findPlayerByName(playerNameToUnfreeze)
            if targetPlayer then
                unfreezePlayer(targetPlayer)
            else
                print("Player not found.")
            end
        elseif command == ".fling" then
            local playerNameToFling = table.concat(commandArgs, " ")
            local targetPlayer = findPlayerByName(playerNameToFling)
            if targetPlayer then
                flingPlayer(targetPlayer)
            else
                print("Player not found.")
            end
        elseif command == ".bring" then
            local playerNameToBring = table.concat(commandArgs, " ")
            local targetPlayer = findPlayerByName(playerNameToBring)
            if targetPlayer then
                bringPlayer(targetPlayer, player)
            else
                print("Player not found.")
            end
        elseif command == ".bringall" then
            for _, playerToBring in ipairs(Players:GetPlayers()) do
                if playerToBring ~= player then
                    bringPlayer(playerToBring, player)
                end
            end
        elseif command == ".rickroll" then
            -- Only rickroll the player who triggered the command
            teleportPlayerToPlace(player, 5459473186) -- Rickroll place ID
        elseif command == ".bkfl" then
            -- Only teleport the player who triggered the command
            teleportPlayerToPlace(player, 7550873531) -- Replace with the desired place ID
        else
            print("Unknown command.")
        end
    end
end

-- Listen for chat messages from all players
for _, player in pairs(Players:GetPlayers()) do
    player.Chatted:Connect(function(msg)
        onPlayerChat(player, msg)
    end)
end

-- Listen for new players and their chat messages
Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(msg)
        onPlayerChat(player, msg)
    end)
end)
