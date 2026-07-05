hl.window_rule({
    name = "kitty-1",
    match = {
        class = "kitty"
    },

    workspace = 1,
})

hl.window_rule({
    name = "alacritty-1",
    match = {
        class = "Alacritty"
    },

    workspace = 1,
})

hl.window_rule({
    name = "nautilus-2",
    match = {
        class = "org.gnome.Nautilus"
    },

    workspace = 2,
})

hl.window_rule({
    name = "firefox-3",
    match = {
        class = "firefox"
    },

    workspace = 3,
})

hl.window_rule({
    name = "steam-5",
    match = {
        class = "^([Ss]team)$",
        title = "^((?!notificationtoasts_2_desktop).)*$",
    },

    workspace = 5,
})

hl.window_rule({
    name = "discord-6",
    match = {
        class = "discord"
    },

    workspace = 6,
})

hl.window_rule({
    name = "thunderbird-7",
    match = {
        class = "org.mozilla.thunderbird_esr"
    },

    workspace = 7,
})

hl.window_rule({
    name = "obs-8",
    match = {
        class = "com.obsproject.Studio"
    },

    workspace = 8,
})

hl.window_rule({
    name = "localsend-9",
    match = {
        class = "localsend"
    },

    workspace = 9,
})

