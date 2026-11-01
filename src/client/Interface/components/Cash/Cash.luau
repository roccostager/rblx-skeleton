local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)


type Props = { cash: number }
local function Cash(props: Props)

    return React.createElement("TextLabel", {
        Size = UDim2.new(0.2, 0, 0.05, 0),
        TextScaled = true,
        Text = string.format("$%d", props.cash),
        Position = UDim2.fromScale(0.5, 0.5),
    })

end

return Cash