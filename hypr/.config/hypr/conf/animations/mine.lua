hl.config({
    animations = {
        enabled = true,
    },
})

-- Example for bezier ```hl.curve( NAME, { type = "bezier", points = { {X0, Y0}, {X1, Y1} } })```

hl.curve("md3_decel",   {type = "bezier", points = { {0.05, 0.7},   {0.1, 1}        } })
hl.curve("md3_accel",   {type = "bezier", points = { {0.3, 0},      {0.08, 0.15}    } })
hl.curve("menu_decel",  {type = "bezier", points = { {0.1, 1},      {0, 1}          } })
hl.curve("menu_accel",  {type = "bezier", points = { {0.38, 0.04},  {1, 0.07}       } })
hl.curve("linear",      {type = "bezier", points = { {0, 0},        {1, 1}          } })
hl.curve("easeIn",      {type = "bezier", points = { {0.42, 0.0},   {1, 1}          } })
hl.curve("easeOut",     {type = "bezier", points = { {0.0, 0.0},    {0.58, 1}       } })
hl.curve("balanced",    {type = "bezier", points = { {0.2, 0.1},    {0.3, 1}        } })
hl.curve("smooth",      {type = "bezier", points = { {0.25, 0.1},   {0.25, 1}       } })
hl.curve("crisp",       {type = "bezier", points = { {0.3, 0},      {0.4, 1}        } })
hl.curve("flow",        {type = "bezier", points = { {0.15, 0},     {0.35, 1}       } })

-- Example for Animation ```hl.animation({ leaf = STRING, enabled = BOOLEAN, speed = FLOAT, curve = STRING[, style = STRING] })```

hl.animation({leaf = "windows", enabled = true, speed = 3, bezier = "md3_decel", style = "popin 60%"})
hl.animation({leaf = "windowsIn", enabled = true, speed = 3, bezier = "md3_decel", style = "slide"})
hl.animation({leaf = "windowsOut", enabled = true, speed = 3, bezier = "md3_accel", style = "popin 60%"})
hl.animation({leaf = "windowsMove", enabled = true, speed = 3, bezier = "flow"})

-- Fade Animation
hl.animation({leaf = "fadeLayers", enabled = true, speed = 2, bezier = "smooth"})

-- Layer Animation
hl.animation({leaf = "layers", enabled = true, speed = 2, bezier = "balanced"})
hl.animation({leaf = "layersIn", enabled = true, speed = 2, bezier = "smooth", style = "slide"})
hl.animation({leaf = "layersOut", enabled = true, speed = 1, bezier = "crisp", style = "slide"})

-- Border Animations - responsive feedback
hl.animation({leaf = "border", enabled = true, speed = 4, bezier = "balanced"})

-- Workspaces
hl.animation({leaf = "workspaces", enabled = true, speed = 4, bezier = "flow", style = "slide"})

-- Fade
hl.animation({leaf = "fade", enabled = true, speed = 3, bezier = "menu_decel"})