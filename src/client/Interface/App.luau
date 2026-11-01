local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)

local State = require(ReplicatedStorage.Shared.State)
local ReactReflex = require(ReplicatedStorage.Packages["react-reflex"])
local ReflexProvider = ReactReflex.ReflexProvider

local Overlay = require(script.Parent.pages.Overlay)


local function App()

    return React.createElement(ReflexProvider, {
        producer = State,
    }, {
        Overlay = React.createElement(Overlay)
    })

end

return App