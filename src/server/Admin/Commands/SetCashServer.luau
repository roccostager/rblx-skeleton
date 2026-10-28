local ReplicatedStorage = game:GetService("ReplicatedStorage")
local State = require(ReplicatedStorage.Shared.State)


return function(context, player, amount)
    State.setCash(tostring(player.userId), amount)
end