local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "kill arua", HidePremium = false, SaveConfig = false, IntroEnabled = true})
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
local Whitelist_table = {};
local OpKillAuraTable = {};


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

--Aimbot locals
local CurrentlyLocked
local Aiming = false

--Quickspeed locals
local OnOff = false
local keydetected 

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

local Tab = Window:MakeTab({
	Name = "main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local DupeTab = Window:MakeTab({
	Name = "Dupe",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Stuff"

Tab:AddToggle({
    Name = 'kill arua',
    Callback = function()
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
Tab:AddButton({
    Name = 'Infinite Yield', 
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source', true))()
    end
})

Tab:AddButton({
    Name = "AC Bypass",
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

DupeTab:AddButton({
    Name = 'Stop data(dupe)',
    Callback = function(Value)
        RemoteEvents['SetSettings']:FireServer(Workspace)
    end
})




