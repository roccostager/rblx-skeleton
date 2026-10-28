local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)

local State = require(ReplicatedStorage.Shared.State)
local ReactReflex = require(ReplicatedStorage.Packages["react-reflex"])
local ReflexProvider = ReactReflex.ReflexProvider

local Cash = require(script.Parent.components.Cash)


local function App()

    return React.createElement(ReflexProvider, {
        producer = State,
    }, {
        Cash = React.createElement(Cash)
    })

end

return App