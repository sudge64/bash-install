hl.config({
    decoration = {
        rounding = 10,
        --blur = {
            --enabled = true,
            --size = 3,
            --passes = 1,
        --},

        --shadow = {
            --enabled = true,
            --range = 4,
            --render_power = 3,
            --color = Base,
        --},
    },

    animations = {
        enabled = true,
    }
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 1,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 1, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 1, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 0.05,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 0.75, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 1, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 1, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 1,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 0.05, spring = "easy" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 0.05, spring = "easy" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 0.05, spring = "easy" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 1,    bezier = "quick" })

    -- bezier = myBezier, 0.05, 0.9, 0.1, 1.05
    -- bezier = liner, 1, 1, 1, 1

    -- animation = windows, 1, 3, myBezier
    -- animation = windowsOut, 1, 3, default, popin 80%
    -- #animation = border, 1, 10, default
    -- #animation = borderangle, 1, 8, default
    -- animation = fade, 1, 3, default
    -- animation = workspaces, 1, 3, default
