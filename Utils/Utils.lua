local Utils = {}
local CachedScripts = {}

local Players = game:GetService("Players")
local Debris = game:GetService("Debris")
local CollectionService = game:GetService("CollectionService")
local HttpsService = game:GetService("HttpService")

local Tag = HttpsService:GenerateGUID(false)
print(Tag)

local Player = Players.LocalPlayer


function Utils.CustomRequire(path)
    if typeof(path) ~= "string" then
        return
    end    

    local url = "https://raw.githubusercontent.com/xxypher/Rlm-script/refs/heads/main"..path
    print(url)

    if CachedScripts[url] then
        return CachedScripts[url]
    end
    
    local scriptFunction, syntaxError = loadstring(game:HttpGet(url))()

    CachedScripts[url] = scriptFunction

    if (not scriptFunction) then
        warn(syntaxError)
        warn(url)
        return
    end

    return scriptFunction  
end

function Utils.Create(name, itemType, parent,time)
    if (not itemType) then return end
    if (not name) then
        name = itemType
    end

    local item = Instance.new(itemType) 
    item.Name = name
    item.Parent = parent
    if time and typeof(item) == "number" then
        Debris:AddItem(item, time)
    end

    CollectionService:AddTag(item, Tag)

    if item:IsA("BodyMover") then
        item:AddTag("AllowedBM")
    end

    return item
end

getgenv().Require = Utils.CustomRequire


Utils.PlayerInfo = {
    Tag = Tag,

    Player = Player,
    Character = Player.Character or Player.CharacterAdded:Wait(),
    Humanoid = Player.Character and Player.Character:FindFirstChild("Humanoid"),
    HumanoidRootPart = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart"),
    Torso = Player.Character and Player.Character:FindFirstChild("Torso"),
}



return Utils