local MainUtils = loadstring(game:HttpGet("https://raw.githubusercontent.com/xxypher/Rlm-script/refs/heads/main/Utils/Utils.lua"))()

local Maid = getgenv().Require("/Utils/Maid.lua")
local Commands = getgenv().Require("/Commands.lua")

_G.Unload = function()
    Maid:DoCleaning()
end