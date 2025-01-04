local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

-- Colors
config.colors = {
	foreground = "#D4BE98",
	background = "#1D2021",
	cursor_bg = "#D4BE98",
	cursor_border = "#D4BE98",
	cursor_fg = "#1D2021",
	selection_bg = "#D4BE98",
	selection_fg = "#3C3836",

	ansi = { "#1d2021", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
	brights = { "#eddeb5", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },

	tab_bar = {
		background = "rgba(29, 32, 33, 0.80)",
		active_tab = {
			bg_color = "rgba(29, 32, 33, 0.80)",
			fg_color = "#d4be98",
			italic = true,
		},
		inactive_tab = {
			bg_color = "rgba(29, 32, 33, 0.80)",
			fg_color = "#7c6f64",
			italic = true,
		},
		new_tab = {
			bg_color = "rgba(29, 32, 33, 0.80)",
			fg_color = "#d4be98",
			italic = true,
		},
	},
}

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
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.window_close_confirmation = "NeverPrompt"
if wezterm.target_triple == "x86_64-apple-darwin" or "aarch64-apple-darwin" then
	config.window_background_opacity = 0.80
	config.macos_window_background_blur = 64
	config.text_background_opacity = 1.0
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
