-- Configuration
local mainMod = "SUPER" -- Sets "Windows" key as main modifier

--    _             _ _         _   _
--   /_\  _ __ _ __| (_)__ __ _| |_(_)___ _ _  ___
--  / _ \| '_ \ '_ \ | / _/ _` |  _| / _ \ ' \(_-<
-- /_/ \_\ .__/ .__/_|_\__\__,_|\__|_\___/_||_/__/
--       |_|  |_|

-------------------------------------

local terminal = "kitty"
local fileManager = "thunar"
local browser = "helium-browser"

-------------------------------------

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal)) -- Open the terminal
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser)) -- Open the browser
hl.bind(mainMod .. " + CTRL + B", hl.dsp.exec_cmd("zen-browser")) -- Open the alt browser
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager)) -- Open the filemanager
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("kitty -e yazi")) -- Open the filemanager
hl.bind(
	mainMod .. " + A",
	hl.dsp.exec_cmd(
		"rofi -modi emoji -show emoji -emoji-format '{emoji}' -p 'emoji' -theme '~/.config/rofi/emoji.rasi'"
	)
) -- Open the emoji picker
hl.bind(
	mainMod .. " + V",
	hl.dsp.exec_cmd(
		"rofi -modi clipboard:/home/harsh/.local/bin/cliphist-rofi-img -show clipboard -show-icons -theme '~/.config/rofi/clipboard.rasi'"
	)
) -- Open the clipboard
hl.bind("XF86Calculator", hl.dsp.exec_cmd("qalculate-gtk")) -- Open the calculator
hl.bind(mainMod .. " + XF86Calculator", hl.dsp.exec_cmd("xpad")) -- Open xpad
hl.bind(mainMod .. "+ XF86Launch2", hl.dsp.exec_cmd("$HOME/.local/bin/powermenu.sh")) -- open powermenu
hl.bind("XF86Launch2", hl.dsp.exec_cmd("hyprlock")) -- execute hyprlock
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output -m eDP-1 -o ~/Pictures/Screenshots")) -- capture fullscreen
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m window -o ~/Pictures/Screenshots")) -- capture a window
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region --raw | satty --filename -")) -- select and capture for regional screenshot with satty for annotation
hl.bind(
	mainMod .. " + W",
	hl.dsp.exec_cmd(
		"rofi -modi 'wallset:/home/harsh/.local/bin/wallset' -show wallset -theme ~/.config/rofi/wallpaper.rasi"
	)
) -- open wallpaper menu
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("/home/harsh/.local/bin/night-mode.sh")) -- enable night mode
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("/home/harsh/.local/bin/GameMode")) -- enable game mode
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
) -- exit hyprland to display manager
hl.bind(
	mainMod .. " + SPACE",
	hl.dsp.exec_cmd(
		"pkill rofi || true && rofi -show drun -modi drun,filebrowser,window -theme '~/.config/rofi/launcher.rasi'"
	)
) -- launch app menu
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("kitty -e rmpc")) -- launch rmpc music player
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("/home/harsh/.local/bin/rofi-search.sh")) -- launch rofi internet search

-- Waybar Related
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("/home/harsh/.local/bin/refresh-waybar-swaync.sh"))
hl.bind(mainMod .. " + CTRL + ALT + B", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))
hl.bind(mainMod .. " + CTRL + B", hl.dsp.exec_cmd("/home/harsh/.local/bin/WaybarStyles.sh"))
hl.bind(mainMod .. " + ALT + B", hl.dsp.exec_cmd("/home/harsh/.local/bin/WaybarLayout.sh"))

---------------------------------------------------------------------------------------

--  __  __      _ _   _              _ _
-- |  \/  |_  _| | |_(_)_ __  ___ __| (_)__ _
-- | |\/| | || | |  _| | '  \/ -_) _` | / _` |
-- |_|  |_|\_,_|_|\__|_|_|_|_\___\__,_|_\__,_|

-- Laptop multimedia keys for volume and LCD brightness
-- Volume (with OSD)
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("swayosd-client --output-volume raise"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("swayosd-client --output-volume lower"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"),
	{ locked = true, repeating = true }
)

-- Mic mute (OSD supported)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)

-- Brightness (with OSD)
hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd("swayosd-client --brightness raise"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd("swayosd-client --brightness lower"),
	{ locked = true, repeating = true }
)

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

---------------------------------------------------------------------------------------

-- __      ___         _
-- \ \    / (_)_ _  __| |_____ __ _____
--  \ \/\/ /| | ' \/ _` / _ \ V  V (_-<
--   \_/\_/ |_|_||_\__,_\___/\_/\_//__/

hl.bind(mainMod .. " + C", hl.dsp.window.close()) -- Kill active window
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" })) -- Toggle Floating
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move windows with mainMod + arrow keys
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

---------------------------------------------------------------------------------------
