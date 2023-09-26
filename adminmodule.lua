local Players = game:GetService("Players")

-- Define a list of admin user IDs
local adminUserIDs = {
    -- Add user IDs of admins here
    162080939,  -- Replace with actual user IDs
    987654321,
}

-- Function to check if a player is an admin
local function isAdmin(player)
    return table.find(adminUserIDs, player.UserId) ~= nil
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

-- Function to handle player chat and check for admin commands
local function onPlayerChat(player, message)
    if isAdmin(player) then
        if message:lower():sub(1, 5) == ".kill" then
            local playerNameToKill = message:sub(7)
            local targetPlayer = Players:FindFirstChild(playerNameToKill)
            killPlayer(targetPlayer)
        elseif message:lower():sub(1, 5) == ".kick" then
            local playerNameToKick = message:sub(7)
            local targetPlayer = Players:FindFirstChild(playerNameToKick)
            kickPlayer(player, targetPlayer)
        elseif message:lower():sub(1, 7) == ".freeze" then
            local playerNameToFreeze = message:sub(9)
            local targetPlayer = Players:FindFirstChild(playerNameToFreeze)
            freezePlayer(targetPlayer)
        elseif message:lower():sub(1, 9) == ".unfreeze" then
            local playerNameToUnfreeze = message:sub(11)
            local targetPlayer = Players:FindFirstChild(playerNameToUnfreeze)
            unfreezePlayer(targetPlayer)
        -- Add more admin commands here
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


