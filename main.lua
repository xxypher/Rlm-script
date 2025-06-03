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

Main:AddSlider({
    enabled = true,
    text = "Fly speed",
    tooltip = "Set the fly speed",
    flag = "flySpeed",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0,
    max = 200,
    increment = 0.1,
    risky = false,
    callback = function(v)
        
    end
})

local Fly =  Main:AddToggle({
    text = "Fly",
    state = false,
    tooltip = "Enable Fly",
    flag = "fly",
    risky = false,
    callback = function(v)
       print(library.flags.fly)
    end
})
Fly:AddBind({
    enabled = true,
    text = "Fly",
    tooltip = "tooltip1",
    mode = "toggle",
    bind = "none",
    state = false,
    nomouse = false,
    risky = false,
    noindicator = false,
    callback = function(v)
       print(library.flags.fly)
    end,
    keycallback = function(v)
        print("keycallback",v)
    end
})

Main:AddSlider({
    enabled = true,
    text = "Fly fall speed",
    tooltip = "Set the fly speed",
    flag = "downwardsVelocitySpeed",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0,
    max = 100,
    increment = 0.1,
    risky = false,
    callback = function(v)
        print(library.flags.downwardsVelocitySpeed)
    end
})
Main:AddSlider({
    enabled = true,
    text = "Fly up speed",
    tooltip = "Set the fly speed",
    flag = "upwardVelocitySpeed",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0,
    max = 100,
    increment = 0.1,
    risky = false,
    callback = function(v)
        print(library.flags.upwardVelocitySpeed)
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
       
    end
})

Main:AddToggle({
    text = "Toggle1",
    flag = "Toggle_1",
    callback = function(v)
       
    end
}):AddColor({
    text = "Color1",
    color = Color3.fromRGB(255, 255, 255),
    flag = "Color_1",
    callback = function(v)
        
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
        
    end,
    keycallback = function(v)
        
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
        
    end
})


local Decimals = 4
local Clock = os.clock()
local Time = (string.format("%."..tostring(Decimals).."f", os.clock() - Clock))
library:SendNotification(("Loaded In "..tostring(Time)), 6)