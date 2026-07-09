local theme = require("catppuccin-mocha")

------------------
---- MONITORS ----
------------------

hl.monitor({
  output   = "",
  mode     = "preferred",
  position = "auto",
  scale    = "auto",
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "alacritty"
local menu        = "fuzzel"
local browser     = "firefox"
local notes       = "iotas"
local webapp      = "~/.config/hypr/webapp.sh"
local conapp      = "~/.config/hypr/conapp.sh"
local clipopts    = "~/.config/hypr/clipopts.sh"
local quitopts    = "~/.config/hypr/quitopts.sh"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function ()
  hl.exec_cmd("swaybg -i ~/Desktop/toh-wallpaper.jpg")
  hl.exec_cmd("wl-paste --watch cliphist store")
  hl.exec_cmd("ironbar")
  hl.exec_cmd("mako")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_THEME", "breeze_cursors")
hl.env("XCURSOR_SIZE", "24")

hl.env("HYPRCURSOR_THEME", "breeze_cursors")
hl.env("HYPRCURSOR_SIZE", "24")

-----------------------
----- PERMISSIONS -----
-----------------------

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
  general = {
    gaps_in  = 4,
    gaps_out = 4,

    border_size = 2,

    col = {
      active_border   = { colors = {theme.lavender, theme.mauve}, angle = 45 },
      inactive_border = theme.overlay0,
    },

    resize_on_border = false,

    allow_tearing = false,

    layout = "dwindle",
  },

  decoration = {
    rounding       = 8,
    rounding_power = 2,

    active_opacity   = 1.0,
    inactive_opacity = 1.0,

    shadow = {
      enabled      = true,
      range        = 4,
      render_power = 3,
      color        = theme.base,
    },

    blur = {
      enabled   = true,
      size      = 3,
      passes    = 1,
      vibrancy  = 0.1696,
    },
  },

  animations = {
    enabled = true,
  },
})

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

hl.config({
  dwindle = {
    preserve_split = true,
  },
})

hl.config({
  master = {
    new_status = "master",
  },
})

hl.config({
  scrolling = {
    fullscreen_on_one_column = true,
  },
})

----------------
----  MISC  ----
----------------

hl.config({
  misc = {
    force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
  },
})

---------------
---- INPUT ----
---------------

hl.config({
  input = {
    kb_layout  = "us",
    kb_variant = "",
    kb_model   = "",
    kb_options = "",
    kb_rules   = "",

    follow_mouse = 1,

    sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

    touchpad = {
      natural_scroll = false,
    },
  },
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace"
})

---------------------
---- KEYBINDINGS ----
---------------------

hl.bind("SUPER + M", hl.dsp.exec_cmd(notes))
hl.bind("SUPER + T", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + W", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + R", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind("SUPER + K", hl.dsp.window.close())
hl.bind("SUPER + Q", hl.dsp.exec_cmd(quitopts))
hl.bind("SUPER + S", hl.dsp.exec_cmd(webapp))
hl.bind("SUPER + C", hl.dsp.exec_cmd(conapp))
hl.bind("SUPER + F", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + V", hl.dsp.exec_cmd(clipopts))
-- hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
-- hl.bind("SUPER + P", hl.dsp.window.pseudo())
-- hl.bind("SUPER + J", hl.dsp.layout("togglesplit"))

hl.bind("SUPER + left",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up",    hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down",  hl.dsp.focus({ direction = "down" }))

for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i}))
  hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind("SUPER + MINUS",         hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + MINUS", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
  name  = "suppress-maximize-events",
  match = { class = ".*" },

  suppress_event = "maximize",
})

hl.window_rule({
  name  = "fix-xwayland-drags",
  match = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },
  no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
  name  = "move-hyprland-run",
  match = { class = "hyprland-run" },

  move  = "20 monitor_h-120",
  float = true,
})

hl.window_rule({
  match = {
    class = "Alacritty",
  },
  opacity = "0.85 0.8 0.1",
})

hl.window_rule({
  match = {
    class = "firefox",
  },
  workspace = "2",
})
	
hl.window_rule({
  match = {
    class = "org.gnome.World.Iotas",
  },
  workspace = "3",
})
