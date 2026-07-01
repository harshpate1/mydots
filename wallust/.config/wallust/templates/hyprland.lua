hl.config({
    general = {
        col = {
            active_border   = "rgba({{color13 | strip}}FF)",
            inactive_border = "rgba({{background | strip}}80)",
        },
    },
    misc = {
        background_color = "rgba({{background | strip}}FF)",
    },
})

hl.window_rule({
    match        = { pin = 1 },
    border_color = "rgba({{foreground | strip}}AA) rgba({{foreground | strip}}77)",
})