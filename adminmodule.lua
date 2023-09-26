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
