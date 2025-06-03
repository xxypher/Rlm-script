
local MainUtils = loadstring(game:HttpGet("https://raw.githubusercontent.com/xxypher/Rlm-script/refs/heads/main/Utils/Utils.lua"))()

-- Services

local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ScriptContext = game:GetService("ScriptContext")

-- Requires

local Maid = getgenv().Require("/Utils/Maid.lua")
local library = getgenv().Require("/UILibrary.lua")

-- Info

local Decimals = 4
local Clock = os.clock()
local Time = (string.format("%."..tostring(Decimals).."f", os.clock() - Clock))
local PlaceId = game.PlaceId
local Version = "1"

-- 

_G.Debug = _G.Debug or false

library:init()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local PlayerInfo = MainUtils.PlayerInfo

do
    function pullToGround()
        if (not Maid.fly) then
            return
        end
        if Maid.fly and UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            if Maid.flyDownBV ~= nil then
                Maid.flyDownBV:Destroy()
            end

            Maid.flyUpBV = Maid.flyDownBV or MainUtils.Create("upBV", "BodyVelocity")

            Maid.flyUpBV.MaxForce = Vector3.new(0,20000,0)
            Maid.flyUpBV.P = 1250
            Maid.flyUpBV.Velocity = Vector3.new(0,library.flags.upwardVelocitySpeed,0)
            Maid.flyUpBV.Parent = PlayerInfo.HumanoidRootPart
        return
        end

        Maid.flyDownBV = Maid.flyDownBV or MainUtils.Create("downBV", "BodyVelocity")

        local Speed = Vector3.new(0,-library.flags.downwardsVelocitySpeed,0)
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
        Speed = Speed * 1.5
        end

        Maid.flyDownBV.MaxForce = Vector3.new(0,20000,0)
        Maid.flyDownBV.P = 1250
        Maid.flyDownBV.Velocity = Speed
        Maid.flyDownBV.Parent = PlayerInfo.HumanoidRootPart
    end

    function Fly(State)
        if (not State) then
            Maid.fly:Disconnect()
            Maid.fly = nil
            Maid.flyDownBV = nil
            Maid.flyUpBV = nil
            Maid.flyBV = nil  
            return
        end

        Maid.fly = RunService.Heartbeat:Connect(function(deltaTime)
            if (not PlayerInfo.HumanoidRootPart) then
                return
            end

            local camera = workspace.CurrentCamera
            local MoveDirection = Vector3.new(0, 0, 0)

            Maid.flyBV = (Maid.flyBV and Maid.flyBV.Parent and Maid.flyBV) or MainUtils.Create("flyBV", "BodyVelocity")


            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                MoveDirection = MoveDirection + camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                MoveDirection = MoveDirection - camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                MoveDirection = MoveDirection - camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                MoveDirection = MoveDirection + camera.CFrame.RightVector
            end
    
            Maid.flyBV.Parent = PlayerInfo.HumanoidRootPart;
            Maid.flyBV.MaxForce = Vector3.new(math.huge, 0, math.huge);
            Maid.flyBV.Velocity = MoveDirection * 100

            pullToGround()
            RunService.Heartbeat:Wait()
        end)
    end
end

do
    local Window1  = library.NewWindow({
        MarketplaceService:GetProductInfo(game.PlaceId).Name, -- Mainwindow Text
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
    Main:AddToggle({
        text = "Fly",
        state = false,
        tooltip = "Enable Fly",
        flag = "fly",
        risky = false,
        callback = function(v)
        Fly(v)
        end
    }):AddBind({
        enabled = true,
        text = "Fly Bind",
        tooltip = "Enable Fly",
        mode = "toggle",
        bind = "none",
        flag = "FlyToggleKey",
        state = false,
        nomouse = false,
        risky = false,
        noindicator = false,
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
        bindflag = "ToggleKey_1",
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
end



library:SendNotification(("Loaded In "..tostring(Time)), 6)
library:SendNotification(("You are running version: "..Version), 6)

ScriptContext.Error:Connect(function(Message, Trace, Script)
    library:SendNotification(("Script error encountered:".. Message), 3, Color3.new(1,0,0))
end)