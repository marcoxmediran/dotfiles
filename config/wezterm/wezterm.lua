local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font
local default_font = wezterm.font({
	family = "JetBrainsMono Nerd Font",
	weight = "Medium",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})
local default_font_size = 13.0
config.font = default_font
config.font_size = default_font_size

-- Colors
local bg = "#111111"
config.colors = {
	foreground = "#D4BE98",
	background = bg,
	cursor_bg = "#D4BE98",
	cursor_border = "#D4BE98",
	cursor_fg = "#1D2021",
	selection_bg = "#D4BE98",
	selection_fg = "#3C3836",

	ansi = { "#1d2021", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
	brights = { "#eddeb5", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
}
config.force_reverse_video_cursor = true

-- Tab Bar
config.enable_tab_bar = false
config.window_frame = {
	font = default_font,
	font_size = default_font_size,

	active_titlebar_bg = bg,
	inactive_titlebar_bg = bg,
}

-- Window
config.initial_cols = 128
config.initial_rows = 32
config.window_padding = { left = 12, right = 12, top = 4, bottom = 4 }
config.window_close_confirmation = "NeverPrompt"

-- and finally, return the configuration to wezterm
return config
