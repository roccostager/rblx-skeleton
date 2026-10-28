local ProfileStore = require(script.ProfileStore)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local State = require(ReplicatedStorage.Shared.State)
local Template = require(script.Template)

local Players = game:GetService("Players")
local PlayerStore = ProfileStore.New("dev", Template)
local Profiles: {[Player]: typeof(PlayerStore:StartSessionAsync())} = {}


local function PlayerAdded(player: Player)

    -- Read User Id (as string)
    local userId = tostring(player.UserId)

    -- Start Profile Session
    local profile = PlayerStore:StartSessionAsync(userId, {
        Cancel = function()
            return player.Parent ~= Players
        end,
    })

    -- Handling New Profile Session OR failure to start
    if profile ~= nil then
        
        profile:AddUserId(player.UserId)  -- GDPR compliance
        profile:Reconcile()  -- Fill in missing variables from Template

        if player.Parent == Players then
            
            -- Hydrate State (hydrates all Slices w/ same-named method)
            State.profileLoaded(userId, profile.Data)

            -- Clean Up when session ends
            profile.OnSessionEnd:Connect(function()
                State.profileUnloaded(userId)
            end)

            -- Sync State back into Profile.Data before saving
            profile.OnSave:Connect(function()
                local state = State:getState()
                profile.Data = {
                    resources = state.resources[userId],
                }
            end)

            Profiles[player] = profile

        else
            -- Player left before profile session started
            player:Kick("Profile Session End. Please Rejoin.")
        end

    else
        -- Should only happen when Roblox server shuts down
        player:Kick("Profile Load Fail. Please Rejoin.")
    end

end


Players.PlayerAdded:Connect(PlayerAdded)
for _, player in Players:GetPlayers() do
    task.spawn(PlayerAdded, player)
end

Players.PlayerRemoving:Connect(function(player: Player, exitReason: Enum.PlayerExitReason)
    local profile = Profiles[player]
    if profile ~= nil then
        profile:EndSession()
    end
end)