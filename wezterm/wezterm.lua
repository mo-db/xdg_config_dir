-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()


config.audible_bell = "Disabled"
config.font = wezterm.font("IBM Plex Mono", { weight = 'Medium' })
config.font_size = 16
config.window_padding = {
	left = "0cell",
	right = "0cell",
	top = "0cell",
	bottom = "0cell",
}

-- change theme when switching light or dark mode in OS
local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Kanagawa (Gogh)'
  else
    return 'One Light (Gogh)'
  end
end

config.color_scheme = scheme_for_appearance(get_appearance())

-- Custom colors for tab_bar
BG = '#181820'
A_TAB_BG = '#43436c'
A_TAB_FG = '#c5c9c5'
I_TAB_BG = '#32324f'
I_TAB_FG = '#62627c'

config.window_frame = {
  font = wezterm.font { family = 'IBM Plex Mono', weight = 'Medium' },
  font_size = 12.0,
  active_titlebar_bg = BG,
  inactive_titlebar_bg = BG,
}

config.colors = {
  tab_bar = {
    background = BG,
    active_tab = {
      bg_color = A_TAB_BG,
      fg_color = A_TAB_FG,
      intensity = 'Normal',
      underline = 'None',
      italic = false,
      strikethrough = false,
    },
    inactive_tab = {
      bg_color = I_TAB_BG,
      fg_color = I_TAB_FG,
    },
    inactive_tab_hover = {
      bg_color = A_TAB_BG,
      fg_color = A_TAB_FG,
      italic = true,
    },
    new_tab = {
      bg_color = BG,
      fg_color = A_TAB_FG,
    },
    new_tab_hover = {
      bg_color = BG,
      fg_color = A_TAB_FG,
      italic = true,
    },
  },
}

config.native_macos_fullscreen_mode = true
config.keys = {
  {
    key = 'h',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'j',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'k',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key = 'h',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitPane {
      direction = 'Left',
      size = { Percent = 35 },
    },
  },
  {
    key = 'l',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitPane {
      direction = 'Right',
      size = { Percent = 35 },
    },
  },
  {
    key = 'j',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitPane {
      direction = 'Up',
      size = { Percent = 25 },
    },
  },
  {
    key = 'k',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitPane {
      direction = 'Down',
      size = { Percent = 25 },
    },
  },
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = 't',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = 't',
    mods = 'SHIFT|ALT',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
}

-- and finally, return the configuration to wezterm
return config
