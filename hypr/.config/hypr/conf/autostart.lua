--    _       _          _            _
--   /_\ _  _| |_ ___ __| |_ __ _ _ _| |_
--  / _ \ || |  _/ _ (_-<  _/ _` | '_|  _|
-- /_/ \_\_,_|\__\___/__/\__\__,_|_|  \__|

hl.on("hyprland.start", function()
	-- load cursor
	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 20")
	-- start kde connect
	hl.exec_cmd("kdeconnectd")
	-- start hypridle
	hl.exec_cmd("hypridle")
	-- start swayosd
	hl.exec_cmd("swayosd-server")
	-- start clipboard
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	-- load hyprpm
	hl.exec_cmd("hyprpm reload")
	-- start playerctl daemon
	hl.exec_cmd("playerctld daemon")
	-- start udiskie
	hl.exec_cmd("udiskie")
	-- start wallpaper system
	hl.exec_cmd("awww-daemon")
	-- launch waybar and swaync
	hl.exec_cmd("waybar")
	hl.exec_cmd("swaync")
	-- start auth agent
	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
	-- Environment for xdg-desktop-portal-hyprland
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	-- launch logseq
	hl.exec_cmd("/home/harsh/Applications/Logseq-linux-x64-0.10.15.AppImage")
end)
