local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Reflex = require(ReplicatedStorage.Packages.reflex)

local TableUtils = require(ReplicatedStorage.Shared.utils.TableUtils)
local Types = require(script.Parent.Parent.Types)
export type ResourceState = {
    [string]: Types.ResourceData,  -- [userId] = data
}
local initialState: ResourceState = {}


local profileProducer = Reflex.createProducer(initialState, {
    profileLoaded = function(state: ResourceState, userId: string, data: Types.DataProfile)
        local nextState = table.clone(state)
        local cloneData = TableUtils.simpleDeepCopy(data)
        nextState[userId] = cloneData.resources
        return nextState
    end,
    profileUnloaded = function(state: ResourceState, userId: string)
        local nextState = table.clone(state)
        nextState[userId] = nil
        return nextState
    end,

    setCash = function(state: ResourceState, userId: string, amount: number)
        local userProfile = state[userId]
        if not userProfile then return state end

        local nextState = table.clone(state)
        nextState[userId] = table.clone(userProfile)
        nextState[userId].cash = amount
        return nextState
    end,
    addCash = function(state: ResourceState, userId: string, change: number)
        local userProfile = state[userId]
        if not userProfile then return state end

        local nextState = table.clone(state)
        nextState[userId] = table.clone(userProfile)
        nextState[userId].cash += change
        return nextState
    end,
})
export type ResourceSlice = typeof(profileProducer)


return profileProducer