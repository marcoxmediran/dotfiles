local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

-- Colors
local bg = "rgba(48, 10, 36, 0.80)"
config.colors = {
	foreground = "#eeeeec",
	background = "#300a24",
	cursor_bg = "#bbbbbb",
	cursor_border = "#bbbbbb",
	cursor_fg = "#ffffff",
	selection_bg = "#b5d5ff",
	selection_fg = "#000000",

	ansi = { "#2e3436", "#cc0000", "#4e9a06", "#c4a000", "#3465a4", "#75507b", "#06989a", "#d3d7cf" },
	brights = { "#555753", "#ef2929", "#8ae234", "#fce94f", "#729fcf", "#ad7fa8", "#34e2e2", "#eeeeec" },

	tab_bar = {
		background = bg,
		active_tab = {
			bg_color = bg,
			fg_color = "#eeeeec",
			italic = true,
		},
		inactive_tab = {
			bg_color = bg,
			fg_color = "#555753",
			italic = true,
		},
		new_tab = {
			bg_color = bg,
			fg_color = "#eeeeec",
			italic = true,
		},
	},
}
config.force_reverse_video_cursor = true

-- Font
config.font = wezterm.font({
	family = "JetBrainsMono Nerd Font",
	weight = "Medium",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})
config.font_size = 16.0

-- Window
config.use_fancy_tab_bar = false
config.window_padding = { left = 12, right = 12, top = 12, bottom = 12 }
config.window_close_confirmation = "NeverPrompt"
if wezterm.target_triple == "x86_64-apple-darwin" or wezterm.target_triple == "aarch64-apple-darwin" then
	config.window_background_opacity = 0.80
	config.macos_window_background_blur = 64
	config.text_background_opacity = 1.0
	config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
elseif wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.window_background_opacity = 0
	config.win32_system_backdrop = "Mica"
end

-- Bindings
config.keys = {
	-- activate pane selection mode with the default alphabet (labels are "a", "s", "d", "f" and so on)
	{
		key = "=",
		mods = "CTRL",
		action = act.PaneSelect,
	},
	-- show the pane selection mode, but have it swap the active and selected panes
	{
		key = "-",
		mods = "CTRL",
		action = act.PaneSelect({
			mode = "SwapWithActive",
		}),
	},
}

-- and finally, return the configuration to wezterm
return config
