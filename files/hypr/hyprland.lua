Terminal = "alacritty"
FileManager = "nautilus"
Menu = "rofi -show drun"
Browser = "firefox"
Logout = "wlogout"
Steam = "steam"
Chat = "discord"
Email = "org.mozilla.thunderbird_esr"

hl.on("hyprland.start", function ()
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("waybar")
    hl.exec_cmd("dunst")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("udiskie")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
end)

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "auto"
})

require("environment")
require("keybindings")
require("macchiato")
require("monitors")
require("power_hungry")
require("windowrules")
require("workspaces")

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 10,
        border_size = 3,
        col = {
            active_border = Sapphire,
            inactive_border = Overlay0,
        },
        layout = "dwindle",
        allow_tearing = false,
    },
    -- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
    dwindle = {
        preserve_split = true, -- You probably want this
    },
    -- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
    master = {
        new_status = "master",
    },
    -- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
    scrolling = {
        fullscreen_on_one_column = true,
    },
    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
        vrr = 3
    },
    -- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/XWayland/ for more
    -- So that xwayland programs are not pixelated.
    xwayland = {
        force_zero_scaling = true
    },
    -- Default for VFR is true
    -- debug = {
        -- vfr = true,
    -- },
})

hl.gesture({
    fingers = 4,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})
