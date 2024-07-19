-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

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

config.audible_bell = "Disabled"
config.font = wezterm.font("IBM Plex Mono", { weight = 'Medium' })
config.font_size = 17
config.window_padding = {
	left = "0cell",
	right = "0cell",
	top = "0cell",
	bottom = "0cell",
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
