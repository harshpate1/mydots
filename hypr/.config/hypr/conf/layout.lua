--  _                       _
-- | |   __ _ _  _ ___ _  _| |_
-- | |__/ _` | || / _ \ || |  _|
-- |____\__,_|\_, \___/\_,_|\__|
--            |__/

hl.config({
	dwindle = {
		preserve_split = true,
	},
})

hl.config({
	master = {
		new_status = "master",
	},
}) -- -----------------------------------------------------
-- Laptop Layouts & Swipe Gestures
-- -----------------------------------------------------

hl.config({
	dwindle = {
		preserve_split = true,
	},

	master = {
		-- new_status = "master" -- Commented out due to compatibility reasons
	},

	binds = {
		workspace_back_and_forth = true,
		allow_workspace_cycles = true,
		pass_mouse_when_bound = false,
	},
})
