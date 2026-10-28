return {
    Name = "setcash",
    Aliases = {"cash"},
    Description = "Sets a player's cash.",
    Group = "DefaultAdmin",

    Args = {
        {
            Type = "player",
            Name = "player",
            Description = "Player to set cash for.",
        },
        {
            Type = "number",
            Name = "amount",
            Description = "Amount to set cash to.",
        },
    },
}