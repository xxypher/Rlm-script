local MainUtils = loadstring(game:HttpGet("https://raw.githubusercontent.com/xxypher/Rlm-script/refs/heads/main/Utils/Utils.lua"))()
local PlayerInfo = MainUtils.PlayerInfo

local Commands = {}

local Maid = getgenv().Require("/Utils/Maid.lua")
local Library = getgenv().Require("/UILibrary.lua")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer

function pullToGround()

    if Maid.fly and UserInputService:IsKeyDown(Enum.KeyCode.Space) then
        if Maid.flyDownBV ~= nil then
            Maid.flyDownBV:Destroy()
        end

        Maid.flyUpBV = (Maid.flyUpBV and Maid.flyUpBV and Maid.flyUpBV) or MainUtils.Create("upBV", "BodyVelocity")

        Maid.flyUpBV.MaxForce = Vector3.new(0,20000,0)
        Maid.flyUpBV.P = 1250
        Maid.flyUpBV.Velocity = Vector3.new(0,Library.flags.upwardVelocitySpeed,0)
        Maid.flyUpBV.Parent = PlayerInfo.HumanoidRootPart
    end

    Maid.flyDownBV = (Maid.flyDownBV and Maid.flyBV.flyDownBV and Maid.flyDownBV) or MainUtils.Create("downBV", "BodyVelocity")

    Maid.flyDownBV.MaxForce = Vector3.new(0,20000,0)
    Maid.flyDownBV.P = 1250
    Maid.flyDownBV.Velocity = Vector3.new(0,-Library.flags.downwardsVelocitySpeed,0)
    Maid.flyDownBV.Parent = PlayerInfo.HumanoidRootPart
end

Commands.Fly = function(State)
    if (not State) then
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
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            MoveDirection = MoveDirection + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            MoveDirection = MoveDirection - Vector3.new(0, 1, 0)
        end

        Maid.flyBV.Parent = PlayerInfo.HumanoidRootPart;
        Maid.flyBV.MaxForce = Vector3.new(math.huge, math.huge, math.huge);
        Maid.flyBV.Velocity = MoveDirection * 100

        pullToGround()
        RunService.Heartbeat:Wait()
    end)
end

return Commands