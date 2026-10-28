return {
    Name = "addcash",
    Aliases = {"givecash"},
    Description = "Gives cash to a player.",
    Group = "DefaultAdmin",

    Args = {
        {
            Type = "player",
            Name = "player",
            Description = "Player receiving cash.",
        },
        {
            Type = "number",
            Name = "amount",
            Description = "Amount of cash to give.",
        },
    },
}