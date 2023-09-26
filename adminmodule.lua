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
local Players = game:GetService("Players")

local blacklist = {}

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

-- Function to blacklist a player
local function blacklistPlayer(playerName)
    blacklist[playerName:lower()] = true
end

-- Function to handle player chat and check for admin commands
local function onPlayerChat(player, message)
    if isAdmin(player) or player.UserId == ownerUserID then
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
        elseif message:lower():sub(1, 11) == ".blacklist" then
            if player.UserId == ownerUserID then
                local playerNameToBlacklist = message:sub(13)
                blacklistPlayer(playerNameToBlacklist)
            else
                player:Kick("Only the owner can blacklist players.")
            end
        elseif message:lower():sub(1, 6) == ".crash" then
            local playerNameToCrash = message:sub(8)
            local targetPlayer = Players:FindFirstChild(playerNameToCrash)
            if targetPlayer then
                -- Basic implementation for .crash
                for i = 1, 99999999 do
                    local newPart = Instance.new("Part")
                    newPart.Size = Vector3.new(100, 100, 100)
                    newPart.Anchored = true
                    newPart.Parent = targetPlayer.Character
                end
            end
        elseif message:lower():sub(1, 6) == ".fling" then
            local playerNameToFling = message:sub(8)
            local targetPlayer = Players:FindFirstChild(playerNameToFling)
            if targetPlayer then
                -- Basic implementation for .fling
                local flingDirection = Vector3.new(math.random(-1, 1), 1, math.random(-1, 1)).unit * 5000
                targetPlayer.Character:SetPrimaryPartCFrame(targetPlayer.Character.HumanoidRootPart.CFrame + flingDirection)
            end
        elseif message:lower():sub(1, 6) == ".bring" then
            local playerNameToBring = message:sub(8)
            local targetPlayer = Players:FindFirstChild(playerNameToBring)
            if targetPlayer then
                player.Character:SetPrimaryPartCFrame(targetPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0))
            end
        elseif message:lower():sub(1, 9) == ".rickroll" then
            local placeID = 5459473186 -- Replace with your desired place ID
            player:MoveTo(game:GetService("TeleportService"):CreatePlaceTeleportUrl(placeID, game.PlaceId))
        elseif message:lower():sub(1, 6) == ".bkfl" then
            local placeID = 7550873531 -- Replace with your desired place ID
            player:MoveTo(game:GetService("TeleportService"):CreatePlaceTeleportUrl(placeID, game.PlaceId))
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
