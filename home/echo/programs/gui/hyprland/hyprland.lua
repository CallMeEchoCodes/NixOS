local mod = "SUPER"

hl.config({
  general = {
    border_size = 0,
    col = {
      active_border = "0x00000000",
      inactive_border = "0x00000000",
    },
    gaps_out = 20
  },

  animations = { enabled = true },

  decoration = {
    rounding = 10,
    shadow = {
      color = "0x33000000",
      enabled = true,
      range = 15,
      render_power = 3
    }
  },

  dwindle = {
    preserve_split = true
  },

  ecosystem = {
    no_donation_nag = true
  },

  input = {
    accel_profile = "flat",
    float_switch_override_focus = true,
    follow_mouse = true,
    kb_layout = "us",
    sensitivity = touchpad and 0.5 or 2.0,
    touchpad = {
      disable_while_typing = false,
      natural_scroll = false
    }
  },

  misc = {
    animate_manual_resizes = true,
    animate_mouse_windowdragging = true,
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    enable_anr_dialog = false,
    key_press_enables_dpms = true,
    mouse_move_enables_dpms = true
  },

  xwayland = {
    force_zero_scaling = true,
    use_nearest_neighbor = true
  }
})

hl.curve("wind", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 10, bezier = "wind", style = "popin 40%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 20, bezier = "wind", style = "popin 60%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default", style = "slide" })

hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + SHIFT + S",
  hl.dsp.exec_cmd("screenshooter"))
hl.bind(mod .. " + SHIFT + C",
  hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd("kitty"))
hl.bind(mod .. " + R", hl.dsp.exec_cmd("vicinae toggle"))

for i = 1, 9 do
  hl.bind(mod .. " + " .. i, hl.dsp.focus({ workspace = i }))
  hl.bind(mod .. " +  SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + SHIFT + mouse:272", hl.dsp.window.resize(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.device({
  name = "wacom-co.-ltd.-wacom-one-pen-tablet-small",
  output = primary_monitor
})

for name, monitor in pairs(monitors) do
  hl.monitor({
    output = name,
    mode = monitor.width .. "x" .. monitor.height .. "@" .. monitor.refresh_rate,
    position = monitor.offset.x .. "x" .. monitor.offset.y,
    scale = monitor.scale
  })
end

hl.window_rule({ match = { title = "windowkill" }, no_blur = true })
hl.window_rule({ match = { title = "UNDERTALE" }, float = true })
hl.window_rule({ match = { title = "^$|^\\s$|^win\\d+$", class = "^jetbrains-.*$", float = true }, no_initial_focus = true })
