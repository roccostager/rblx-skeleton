local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)

local ReactReflex = require(ReplicatedStorage.Packages["react-reflex"])
local useSelector = ReactReflex.useSelector


local player = game.Players.LocalPlayer
local userId = tostring(player.UserId)


local function Cash()

    local coins = useSelector(function(state)
        local resources = state.resources and state.resources[userId]
        return resources and resources.cash or 0
    end)

    return React.createElement("TextLabel", {
        Size = UDim2.new(0.2, 0, 0.05, 0),
        TextScaled = true,
        Text = string.format("$%d", coins),
    })

end

return Cash