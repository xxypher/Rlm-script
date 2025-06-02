local Utils = {}
local CachedScripts = {}

local Players = game:GetService("Players")
local Player = Players.LocalPlayer


local function CustomRequire(path)
    if typeof(path) ~= "string" then
        return
    end    

    local url = "https://raw.githubusercontent.com/xxypher/Rlm-script/refs/heads/main"..path

    if CachedScripts[url] then
        return CachedScripts[url]
    end
    
    local scriptFunction, syntaxError = loadstring(game:HttpGet(url))

    CachedScripts[url] = scriptFunction

    if (not scriptFunction) then
        warn(syntaxError)
        warn(url)
        return
    end

    return scriptFunction  
end

getgenv().Require = CustomRequire


Utils.PlayerInfo = {
    Player = Player,
    Character = Player.Character or Player.CharacterAdded:Wait(),
    Humanoid = Player.Character and Player.Character:FindFirstChild("Humanoid"),
    HumanoidRootPart = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart"),
    Torso = Player.Character and Player.Character:FindFirstChild("Torso"),
}



return Utils