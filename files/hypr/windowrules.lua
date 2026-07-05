-- For Steam's Pop-up windows
hl.window_rule({
    name = "steam",
    match = {
        title = "^(steam)$",
        class = "^(steam)$"
    },

    stay_focused = true,
})

-- For the GNOME Calculator
hl.window_rule({
    name = "calculator",
    match = {
        title = "^(Calculator)$",
        class = "^(org.gnome.Calculator)$",
    },

    float = true,
})
