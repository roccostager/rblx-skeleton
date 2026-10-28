local ServerScriptService = game:GetService("ServerScriptService")
local Cmdr = require(ServerScriptService.ServerPackages.cmdr)


Cmdr:RegisterDefaultCommands()
Cmdr:RegisterCommandsIn(script.Commands)


Cmdr:RegisterHook("BeforeRun" , function(context)
    if context.Executor.UserId ~= game.CreatorId then
        return "No Permissions."
    end
    return
end)