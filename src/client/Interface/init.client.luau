local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)

local player = game.Players.LocalPlayer
local playerGui: PlayerGui = player:WaitForChild("PlayerGui")
local App = require(script.App)


-- Create Mounting Interface (ScreenGUI)
local interface = Instance.new("ScreenGui")
interface.ResetOnSpawn = false
interface.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
interface.Parent = playerGui

local root = ReactRoblox.createRoot(interface)
root:render(React.createElement(App), interface)