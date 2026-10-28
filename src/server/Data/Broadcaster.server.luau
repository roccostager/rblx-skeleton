local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Reflex = require(ReplicatedStorage.Packages.reflex)
local State = require(ReplicatedStorage.Shared.State)
local producers = require(ReplicatedStorage.Shared.State.Producers)

local syncRE: RemoteEvent = ReplicatedStorage.Events.ReflexSync


-- Create Broadcaster Middleware
local broadcaster = Reflex.createBroadcaster({
    producers = producers,
    dispatch = function(player: Player, actions)
        syncRE:FireClient(player, actions)
    end,
    -- Initial State Filtering
    beforeHydrate = function(player: Player, state)
        local userId = tostring(player.UserId)
        local filteredState = table.clone(state)

        if state.resources then
            filteredState.resources = {
                [userId] = state.resources[userId],
            }
        end

        return filteredState
    end,
    -- Continuous Action Filtering
    beforeDispatch = function(player: Player, action)
        local userId = tostring(player.UserId)
        local targetUserId = action.arguments[1]

        if targetUserId and typeof(targetUserId) == "string" then
            if targetUserId == userId then
                return action
            else
                return nil
            end
        end

        return action
    end
})

-- Initial State Hydration for Client
syncRE.OnServerEvent:Connect(function(player: Player)
    broadcaster:start(player)
end)

State:applyMiddleware(broadcaster.middleware)