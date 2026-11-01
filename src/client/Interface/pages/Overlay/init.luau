-- React Library
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)

local ReactReflex = require(ReplicatedStorage.Packages["react-reflex"])
local useSelector = ReactReflex.useSelector


-- Components
local components = script.Parent.Parent.components
local Cash = require(components.Cash.Cash)


-- Get Player User ID to reference into reflex state
local player = game.Players.LocalPlayer
local userId = if player then tostring(player.UserId) else 0


local function Overlay()

    -- Define Selectors for Componenet Props
    local cash = useSelector(function(state)
        local resources = state.resources and state.resources[userId]
        return resources and resources.cash or 0
    end)


    return React.createElement(React.Fragment, nil, {
        Cash = React.createElement(Cash, { cash = cash }),
    })

end

return Overlay