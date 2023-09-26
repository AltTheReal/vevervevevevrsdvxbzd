local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")

-- Define a list of admin user IDs
local adminUserIDs = {
    -- Add user IDs of admins here
    241669388,  -- Replace with actual user IDs
    3510980398,
    291336342,
    4845457551,
}

-- Define the owner's user ID
local ownerUserID = 162080939 -- Replace with your user ID

-- Define a blacklist of client IDs
local blacklist = {
    -- Add client IDs to blacklist here
    "blacklisted_client_id_1",
    "blacklisted_client_id_2",
}

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
            player:MoveTo(game:GetService("TeleportService"):ReserveServer(placeID, player))
        end)
        if not success then
            warn("Teleport failed:", errorMsg)
        end
    end
end

-- Function to handle player chat and check for admin commands
local function onPlayerChat(player, message)
    local lowerMessage = message:lower()
    local words = {}
    for word in lowerMessage:gmatch("%S+") do
        table.insert(words, word)
    end

    if isAllowed(player) then
        local command = words[1]
        local commandArgs = {}
        for i = 2, #words do
            table.insert(commandArgs, words[i])
        end

        if command == ".kill" then
            local playerNameToKill = table.concat(commandArgs, " ")
            local targetPlayer = Players:FindFirstChild(playerNameToKill, true)
            killPlayer(targetPlayer)
        elseif command == ".kick" then
            local playerNameToKick = table.concat(commandArgs, " ")
            local targetPlayer = Players:FindFirstChild(playerNameToKick, true)
            kickPlayer(player, targetPlayer)
        elseif command == ".freeze" then
            local playerNameToFreeze = table.concat(commandArgs, " ")
            local targetPlayer = Players:FindFirstChild(playerNameToFreeze, true)
            freezePlayer(targetPlayer)
        elseif command == ".unfreeze" then
            local playerNameToUnfreeze = table.concat(commandArgs, " ")
            local targetPlayer = Players:FindFirstChild(playerNameToUnfreeze, true)
            unfreezePlayer(targetPlayer)
        elseif command == ".fling" then
            local playerNameToFling = table.concat(commandArgs, " ")
            local targetPlayer = Players:FindFirstChild(playerNameToFling, true)
            flingPlayer(targetPlayer)
        elseif command == ".bring" then
            local playerNameToBring = table.concat(commandArgs, " ")
            local targetPlayer = Players:FindFirstChild(playerNameToBring, true)
            bringPlayer(targetPlayer, player)
        elseif command == ".bringall" then
            for _, playerToBring in ipairs(Players:GetPlayers()) do
                if playerToBring ~= player then
                    bringPlayer(playerToBring, player)
                end
            end
        elseif command == ".rickroll" then
            teleportPlayerToPlace(player, 5459473186) -- Rickroll place ID
        elseif command == ".bkfl" then
            local playerNameToTeleport = table.concat(commandArgs, " ")
            local targetPlayer = Players:FindFirstChild(playerNameToTeleport, true)
            teleportPlayerToPlace(targetPlayer, 7550873531) -- Replace with the desired place ID
        else
            player:Kick("Unknown command or you don't have permission to use it.")
        end
    elseif isBlacklisted(player) then
        player:Kick("You have been blacklisted from this script. Contact TheRealGamer903#7339 or join the server here: https://discord.gg/FaJ3f3N7Az")
    else
        player:Kick("You don't have permission to use admin commands.")
    end
end

-- Function to check if a player is blacklisted based on their client ID
local function isBlacklisted(player)
    local clientId = game:GetService("RbxAnalyticsService"):GetClientId()
    for _, id in ipairs(blacklist) do
        if clientId == id then
            return true
        end
    end
    return false
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
