--   ___        _
--  / __|___ __| |_ _  _ _ _ ___
-- | (_ / -_|_-<  _| || | '_/ -_)
--  \___\___/__/\__|\_,_|_| \___|

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- Scrolling
hl.gesture({
	fingers = 3,
	direction = "vertical",
	action = "scroll_move",
	scale = 0.9,
})

-- Fullscreen on
hl.gesture({
	fingers = 4,
	direction = "pinchout",
	action = function()
		hl.dispatch(hl.dsp.window.fullscreen({ action = "set" }))
	end,
})

-- Fullscreen off
hl.gesture({
	fingers = 4,
	direction = "pinchin",
	action = function()
		hl.dispatch(hl.dsp.window.fullscreen({ action = "unset" }))
	end,
})

