local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("I Love anime", "DarkTheme")
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
