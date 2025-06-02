local PlaceId = game.PlaceId
local MainUtils = loadstring(game:HttpGet("https://raw.githubusercontent.com/xxypher/Rlm-script/refs/heads/main/Utils/Utils.lua"))()

-- Services

local MarkerPlaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")

-- Requires

local Maid = getgenv().Require("/Utils/Maid.lua")
local Commands = getgenv().Require("/Commands.lua")
local library = getgenv().Require("/UILibrary.lua")

-- Info

local Player = Players.LocalPlayer

   

local ValueText = "Value Is Now :"

library:init()

local Window1  = library.NewWindow({
    title = "Untitled Hub | "..MarkerPlaceService:GetProductInfo(game.PlaceId).Name, -- Mainwindow Text
    size = UDim2.new(0, 510, 0.6, 6
)})

local Tab1 = Window1:AddTab("  Tab1  ")
local SettingsTab = library:CreateSettingsTab(Window1)

--Tab1:SetText("Text")

local Main = Tab1:AddSection("Main", 1)
--Section1:SetText("Text")


Main:AddToggle({
    text = "Fly",
    state = false,
    tooltip = "Enable Fly",
    flag = "Toggle_1",
    risky = false,
    callback = function(v)
        print(ValueText, v)
    end
}):AddBind({
    enabled = true,
    text = "Keybind1",
    tooltip = "tooltip1",
    mode = "toggle",
    bind = "None",
    flag = "ToggleKey_1",
    state = false,
    nomouse = false,
    risky = false,
    noindicator = false,
    callback = function(v)
        print(ValueText, v)
    end,
    keycallback = function(v)
        print(ValueText, v)
    end
})

Main:AddBox({
    enabled = true,
    name = "TextBox1",
    flag = "TextBox_1",
    input = "PlaceHolder1",
    focused = false,
    risky = false,
    callback = function(v)
        print(ValueText, v)
    end
})

Main:AddToggle({
    text = "Toggle1",
    flag = "Toggle_1",
    callback = function(v)
        print(ValueText, v)
    end
}):AddColor({
    text = "Color1",
    color = Color3.fromRGB(255, 255, 255),
    flag = "Color_1",
    callback = function(v)
        print(ValueText, v)
    end
})

Main:AddBind({
    enabled = true,
    text = "Keybind1",
    tooltip = "tooltip1",
    mode = "toggle",
    bind = "None",
    flag = "ToggleKey_1",
    state = false,
    nomouse = false,
    risky = false,
    noindicator = false,
    callback = function(v)
        print(ValueText, v)
    end,
    keycallback = function(v)
        print(ValueText, v)
    end
})

Main:AddSeparator({
    enabled = true,
    text = "Separator1"
})

Main:AddButton({
    enabled = true,
    text = "Button1",
    tooltip = "tooltip1",
    confirm = true,
    risky = false,
    callback = function()
        print("Pressed!")
    end
})

-- Button1:SetText("Text")

Main:AddSlider({
    enabled = true,
    text = "Slider1",
    tooltip = "tooltip1",
    flag = "Slider_1",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0,
    max = 100,
    increment = 0.1,
    risky = false,
    callback = function(v)
        print(ValueText, v)
    end
})

--Slider_1:SetValue(100)

Main:AddList({
    enabled = true,
    text = "Selection", 
    tooltip = "tooltip1",
    selected = "",
    multi = false,
    open = false,
    max = 4,
    values = {"1", "2", "3"},
    risky = false,
    callback = function(v)
        print(ValueText, v)
    end
})

Main:AddColor({
    enabled = true,
    text = "Color1",
    tooltip = "tooltip1",
    color = Color3.fromRGB(255, 255, 255),
    flag = "Color_1",
    trans = 0,
    open = false,
    risky = true,
    callback = function(v)
        print(ValueText, v)
    end
})
