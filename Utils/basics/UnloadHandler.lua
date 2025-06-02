local MainUtils = loadstring(game:HttpGet("https://raw.githubusercontent.com/xxypher/Rlm-script/refs/heads/main/Utils/Utils.lua"))()

local Maid = getgenv().Require("/Utils/Maid.lua")
local Commands = getgenv().Require("/Commands.lua")

_G.Unload = function()
    Maid:DoCleaning()

    local Descendants = workspace:GetDescendants()

    for _, Item in Descendants do
        if Item:HasTag(MainUtils.PlayerInfo.Tag) then
            Item:Destroy()
        end
    end
end