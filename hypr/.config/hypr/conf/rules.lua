--  ___ _           _   _
-- | __| |___  __ _| |_(_)_ _  __ _
-- | _|| / _ \/ _` |  _| | ' \/ _` |
-- |_| |_\___/\__,_|\__|_|_||_\__, |
--                            |___/

-- Pavucontrol
hl.window_rule({
	name = "pavucontrol",
	match = { class = "org.pulseaudio.pavucontrol" },
	float = true,
	center = true,
	size = "700 600",
})

-- Waypaper
hl.window_rule({
	name = "waypaper",
	match = { class = "waypaper" },
	float = true,
	center = true,
	pin = true,
	size = "900 700",
})

-- Blueman Manager
hl.window_rule({
	name = "blueman-manager",
	match = { class = "blueman-manager" },
	float = true,
	center = true,
	size = "800 600",
})

-- nwg-look
hl.window_rule({
	name = "nwg-look",
	match = { class = "nwg-look" },
	float = true,
	center = true,
	size = "700 600",
})

-- Calligraphy
hl.window_rule({
	name = "calligraphy",
	match = { class = "dev.geopjr.Calligraphy" },
	float = true,
	center = true,
	size = "700 600",
})

-- kvantum manager
hl.window_rule({
	name = "kvantummanager",
	match = { class = "kvantummanager" },
	float = true,
	center = true,
	size = "700 600",
})

-- qt5ct
hl.window_rule({
	name = "qt5ct",
	match = { class = "qt5ct" },
	float = true,
	center = true,
	size = "700 600",
})

-- qt6ct
hl.window_rule({
	name = "qt6ct",
	match = { class = "qt6ct" },
	float = true,
	center = true,
	size = "700 600",
})

-- qalculate
hl.window_rule({
	name = "qalculate-gtk",
	match = { class = "qalculate-gtk" },
	float = true,
	center = true,
	size = "700 600",
})

-- kdeconnect
hl.window_rule({
	name = "kdeconnect",
	match = { class = "org.kde.kdeconnect.app" },
	float = true,
	center = true,
	size = "700 600",
})

-- Hyprland Share Picker
hl.window_rule({
	name = "hyprland-share-picker",
	match = { class = "hyprland-share-picker" },
	float = true,
	pin = true,
	center = true,
	size = "600 400",
})

-- GTK File and Folder Picker
hl.window_rule({
	name = "xdg-desktop-portal-gtk",
	match = { class = "xdg-desktop-portal-gtk" },
	float = true,
	center = false,
	size = "800 600",
})

-- KDE File Picker
hl.window_rule({
	name = "org.freedesktop.impl.portal.desktop.kde",
	match = { class = "org.freedesktop.impl.portal.desktop.kde" },
	float = true,
	center = false,
	size = "800 600",
})

-- Picture-in-Picture
hl.window_rule({
	name = "Picture-in-Picture",
	match = {
		title = [[^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$]],
	},
	float = true,
	pin = true,
	focus_on_activate = false,
	no_initial_focus = true,
	suppress_event = "activate",
})

-- Xpad
hl.window_rule({
	name = "Xpad",
	match = { class = "xpad" },
	float = true,
	center = false,
	size = "800 600",
})

-- Blanket
hl.window_rule({
	name = "Blanket",
	match = { class = "com.rafaelmardojai.Blanket" },
	float = true,
	center = false,
	size = "600 900",
})

---------------------------------------------------------------------------------------

--  ___     _ _
-- | __|  _| | |___ __ _ _ ___ ___ _ _
-- | _| || | | (_-</ _| '_/ -_) -_) ' \
-- |_| \_,_|_|_/__/\__|_| \___\___|_||_|

-- steam
hl.window_rule({
	name = "Counter-Strike 2",
	match = { class = "cs2" },
	immediate = true,
	fullscreen = true,
})

---------------------------------------------------------------------------------------

--  _
-- | |   __ _ _  _ ___ _ _ ___
-- | |__/ _` | || / -_) '_(_-<
-- |____\__,_|\_, \___|_| /__/
--            |__/

hl.layer_rule({
	match = { namespace = "waybar" },
	blur = true,
	ignore_alpha = 0.3,
	blur_popups = true,
})

hl.layer_rule({
	match = { namespace = "swaync-control-center" },
	blur = true,
	ignore_alpha = 0.3,
	-- animation slide right
})

hl.layer_rule({
	match = { namespace = "swaync-notification-window" },
	blur = true,
	ignore_alpha = 0.3,
	-- animation slide right
})

hl.layer_rule({
	match = { namespace = "rofi" },
	blur = true,
	ignore_alpha = 0.5,
	-- animation popin 50%
})

---------------------------------------------------------------------------------------
