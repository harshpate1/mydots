--  __  __ _
-- |  \/  (_)___ __
-- | |\/| | (_-</ _|
-- |_|  |_|_/__/\__|

hl.config({
	misc = {
		disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background. :(
		disable_splash_rendering = true, -- disables the Hyprland splash rendering. (requires a monitor reload to take effect)
		initial_workspace_tracking = 1, -- if enabled, windows will open on the workspace they were invoked on. 0 - disabled, 1 - single-shot, 2 - persistent (all children too)
		on_focus_under_fullscreen = 2, -- if there is a fullscreen or maximized window, decide whether a tiled window requested to focus should replace it, stay behind or disable the fullscreen/maximized state. 0 - ignore focus request (keep focus on fullscreen window), 1 - takes over, 2 - unfullscreen/unmaximize [0/1/2]
		allow_session_lock_restore = true, -- if true, will allow you to restart a lockscreen app in case it crashes
		vrr = 1, -- controls the VRR (Adaptive Sync) of your monitors. 0 - off, 1 - on, 2 - fullscreen only, 3 - fullscreen with video or game content type [0/1/2/3]
		focus_on_activate = false, -- Whether Hyprland should focus an app that requests to be focused (an activate request)
	},
})

