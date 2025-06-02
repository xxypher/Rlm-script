local MainUtils = loadstring(game:HttpGet("https://raw.githubusercontent.com/xxypher/Rlm-script/refs/heads/main/Utils/Utils.lua"))()
local PlayerInfo = MainUtils.PlayerInfo

local Commands = {}

local Maid = getgenv().Require("/Utils/Maid.lua")
local ControlModule = getgenv().Require("/Utils/basics/ControlModule.lua")
local Library = getgenv().Require("/UILibrary.lua")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer

function pullToGround()

    if Maid.fly and UserInputService:IsKeyDown(Enum.KeyCode.Space) then
        if Maid.downwardsVelocity ~= nil then
            Maid.downwardsVelocity:Destroy()
        end
    end

    if Maid.downwardsVelocity ~= nil then
        return
    end

    Maid.downwardsVelocity = (Maid.downwardsVelocity and Maid.flyBV.downwardsVelocity and Maid.downwardsVelocity) or Instance.new("BodyVelocity")

    Maid.downwardsVelocity.MaxForce = Vector3.new(0,20000,0)
    Maid.downwardsVelocity.P = 1250
    Maid.downwardsVelocity.Velocity = Vector3.new(0,-Library.flags.downwardsVelocitySpeed,0)
    Maid.downwardsVelocity.Parent = PlayerInfo.HumanoidRootPart
end

Commands.Fly = function(State)
    if (not State) then
        Maid.fly = nil
        Maid.downwardsVelocity = nil
        Maid.flyBV = nil  
        return
    end

    Maid.fly = RunService.Heartbeat:Connect(function(deltaTime)
        if (not PlayerInfo.HumanoidRootPart) then
            return
        end

        local camera = workspace.CurrentCamera

        Maid.flyBV = (Maid.flyBV and Maid.flyBV.Parent and Maid.flyBV) or Instance.new('BodyVelocity')

        Maid.flyBV.Parent = PlayerInfo.HumanoidRootPart;
        Maid.flyBV.MaxForce = Vector3.new(math.huge, math.huge, math.huge);
        Maid.flyBV.Velocity = camera.CFrame:VectorToWorldSpace(ControlModule:GetMoveVector() * Library.flags.flySpeed);

        pullToGround()
        RunService.Heartbeat:Wait()
    end)
end

return Commands