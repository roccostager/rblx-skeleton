local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)

local UiLabs = require(ReplicatedStorage.Packages["ui-labs"])
local CreateReactStory = UiLabs.CreateReactStory


-- Cash Component
local Cash = require(script.Parent.Cash)


local story = CreateReactStory({
    react = React,
    reactRoblox = ReactRoblox,
    controls = {
        cash = UiLabs.Slider(0, 0, 1000000000, 1)
    }
}, function(props)
    return React.createElement(Cash, { cash = props.controls.cash })
end)
return story