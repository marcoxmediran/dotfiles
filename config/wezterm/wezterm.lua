local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

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

  tab_bar = {
    inactive_tab_edge = bg,
    background = bg,
    active_tab = {
      bg_color = bg,
      fg_color = "#d4be98",
      italic = true,
    },
    inactive_tab = {
      bg_color = bg,
      fg_color = "#7c6f64",
      italic = true,
    },
    new_tab = {
      bg_color = bg,
      fg_color = "#d4be98",
      italic = true,
    },
  },
}
config.force_reverse_video_cursor = true

-- Tab Bar
config.window_frame = {
  font = default_font,
  font_size = default_font_size,

  active_titlebar_bg = bg,
  inactive_titlebar_bg = bg,
}

-- Window
config.window_padding = { left = 12, right = 12, top = 4, bottom = 4}
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
if wezterm.target_triple == "x86_64-apple-darwin" or wezterm.target_triple == "aarch64-apple-darwin" then
  config.integrated_title_button_style = "MacOsNative"
elseif wezterm.target_triple == "x86_64-pc-windows-msvc" then
  config.integrated_title_button_style = "Windows"
elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
  config.integrated_title_button_style = "Gnome"
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
  {
    key = "{",
    mods = "SHIFT|ALT",
    action = act.MoveTabRelative(-1),
  },
  {
    key = "}",
    mods = "SHIFT|ALT",
    action = act.MoveTabRelative(1),
  },
}

-- and finally, return the configuration to wezterm
return config
