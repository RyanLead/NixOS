-- COLOURS -- (Tokyo Night, per wixdaq.github.io/Tokyo-Night-Website/ports.html)
local tokyonight = {
  background = "rgb(1a1b26)",
  surface = "rgb(24283b)",
  foreground = "rgb(a9b1d6)",
  dim = "rgb(565f89)",
  faint = "rgb(414868)",
  active = "rgb(7aa2f7)",
  red = "rgb(f7768e)",
}

-- MONITORS --
hl.monitor({
  output = "",
  mode = "2560x1440",
  position = "0x0",
  scale = "1",
})

-- DEFAULTS --
local terminal = "kitty"
local menu = "rofi -show drun"

-- AUTOSTART --
hl.on("hyprland.start", function()
  hl.dispatch(hl.dsp.exec_cmd("waybar"))
end)

-- ENVIRONMENT VARIABLES --
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- PERMISSIONS --
hl.config({
  ecosystem = {
    enforce_permissions = true,
  },
})

-- LOOK AND FEEL --
hl.config({
  general = {
    gaps_in = 2,
    gaps_out = 2,
    border_size = 0,

    col = {
      active_border = "rgba(7aa2f755)",
      inactive_border = "rgba(24283b33)",
      nogroup_border = "rgba(414868aa)",
      nogroup_border_active = "rgba(e0af68aa)",
    },
  },
  group = {
    col = {
      border_active = tokyonight.active,
      border_inactive = tokyonight.surface,
      border_locked_active = tokyonight.red,
      border_locked_inactive = tokyonight.dim,
    },
    groupbar = {
      col = {
        active = tokyonight.active,
        inactive = tokyonight.surface,
        locked_active = tokyonight.red,
        locked_inactive = tokyonight.dim,
      },
    },
  },
})

hl.config({
  decoration = {
    rounding = 0,
    active_opacity = 0.97,
    inactive_opacity = 0.90,
    shadow = {
      color = "rgba(00000099)",
      color_inactive = "rgba(00000055)",
    },
    blur = {
      enabled = true,
      size = 8,
      passes = 3,
      vibrancy = 0.15,
      new_optimizations = true,
      popups = true,
    },
  },

  animations = {
    enabled = true,
  },
})

-- LAYER RULES (blur through the bar / launcher / notifications) --
hl.layer_rule({ match = { namespace = "waybar" }, blur = true, ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "rofi" }, blur = true, ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "notifications" }, blur = true, ignore_alpha = 0.5 })

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

hl.config({
  scrolling = {
    fullscreen_on_one_column = true,
  },
})

-- MISC --
hl.config({
  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = true,
    vrr = 2,
  },
})

-- INPUT --
hl.config({
  input = {
    kb_layout = "us",
    kb_variant = "",
    kb_model = "",
    kb_options = "",
    kb_rules = "",

    follow_mouse = 1,
    sensitivity = -0.8,

    touchpad = {
      natural_scroll = false,
    },
  },
})

hl.device({
  name = "epic-mouse-v1",
  sensitivity = -0.8,
})

-- KEYBINDINGS --

local mainMod = "SUPER"

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + BACKSPACE", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [1-5]
for i = 1, 5 do
  hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume
hl.bind(
  "XF86AudioRaiseVolume",
  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioLowerVolume",
  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioMicMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true }
)

-- Requires playerctl
-- hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
-- hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- WINDOWS AND WORKSPACES --

local suppressMaximizeRule = hl.window_rule({
  name = "suppress-maximize-events",
  match = { class = ".*" },

  suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
  name = "steam-workspace",
  match = { class = "^(steam)$" },

  workspace = "4 silent",
})

hl.window_rule({
  name = "discord-workspace",
  match = { class = "^(discord)$" },

  workspace = "5 silent",
})

hl.window_rule({
  name = "fix-xwayland-drags",
  match = {
    class = "^$",
    title = "^$",
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false,
  },

  no_focus = true,
})
