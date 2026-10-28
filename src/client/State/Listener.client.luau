local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Reflex = require(ReplicatedStorage.Packages.reflex)

local State = require(ReplicatedStorage.Shared.State)
local syncRE: RemoteEvent = ReplicatedStorage.Events.ReflexSync


local receiver = Reflex.createBroadcastReceiver({
    start = function()
        syncRE:FireServer()
    end,
})

syncRE.OnClientEvent:Connect(function(actions)
    receiver:dispatch(actions)
end)

State:applyMiddleware(receiver.middleware)