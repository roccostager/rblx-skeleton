--[[ Sync.luau for .lune
This script syncs game directories to the filesystem.
Syncs from STUDIO --> filesystem
]]

print("Parsing game.rbxlx...")

local fs = require("@lune/fs")
local roblox = require("@lune/roblox")

local ROOT_PATH = "_objects"


-- Deserialise Roblox place file
local fileContents = fs.readFile("game.rbxlx")
local game = roblox.deserializePlace(fileContents)

-- Get Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")


-- Sync Success State
local syncSuccess = true

-- Extract ReplicatedStorage/Assets
local assetsFolder = ReplicatedStorage:FindFirstChild("Assets")
if assetsFolder then
    local assetsXml = roblox.serializeModel({ assetsFolder }, true)
    fs.writeFile(`{ROOT_PATH}/Assets.rbxmx`, assetsXml)
    print("✅ Synced ReplicatedStorage/Assets")
else
    syncSuccess = false
    print("❌ No 'Assets' folder found in ReplicatedStorage.")
end

-- Extract ReplicatedStorage/Events
local eventsFolder = ReplicatedStorage:FindFirstChild("Events")
if eventsFolder then
    local eventsXml = roblox.serializeModel({ eventsFolder }, true)
    fs.writeFile(`{ROOT_PATH}/Events.rbxmx`, eventsXml)
    print("✅ Synced ReplicatedStorage/Events")
else
    syncSuccess = false
    print("❌ No 'Events' folder found in ReplicatedStorage.")
end

-- Extract Workspace/World
local worldFolder = Workspace:FindFirstChild("World")
if worldFolder then
    local worldXml = roblox.serializeModel({ worldFolder }, true)
    fs.writeFile(`{ROOT_PATH}/World.rbxmx`, worldXml)
    print("✅ Synced Workspace/World")
else
    syncSuccess = false
    print("❌ No 'World' folder found in Workspace.")
end

-- Review Sync Success
if syncSuccess then
    print("Project Directories successfully synced to filesystem!")
else
    print("Sync Failed (either partially or fully)!")
end