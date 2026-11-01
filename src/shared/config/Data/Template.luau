local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Types = require(ReplicatedStorage.Shared.State.Types)


local Template = {
    resources = {
        cash = 0,
    },
} :: {
    resources: Types.ResourceData,
}
export type DataProfile = typeof(Template)
return Template