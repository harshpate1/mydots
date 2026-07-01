hl.config({
	decoration = {
		rounding = 0,
		active_opacity = 1.0,
		inactive_opacity = 0.9,
		fullscreen_opacity = 1.0,
		rounding_power = 3,

		shadow = {
			enabled = true,
			range = 5,
			render_power = 2,
			color = "rgba(1a1a1aee)",
		},

		blur = {
			enabled = true,
			size = 6,
            noise = 0.03,
			passes = 2,
			new_optimizations = true,
			ignore_opacity = true,
			xray = true,
			vibrancy = 0.1696,
            special = false,
            popups = true,
            input_methods = true,
            input_methods_ignorealpha = 0.8
		},
	},
})