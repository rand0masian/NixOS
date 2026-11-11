{ ... }:

{
    wayland.windowManager = {
        hyprland.extraLuaFiles = {
            binds.content = ''
                local mod = "SUPER"
                local terminal = "kitty"

                hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
                hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

                hl.bind(mod .. " + SHIFT + LEFT", hl.dsp.window.resize({
                    x = -50,
                    y = 0,
                    relative = true,
                }), { repeating = true })

                hl.bind(mod .. " + SHIFT + RIGHT", hl.dsp.window.resize({
                    x = 50,
                    y = 0,
                    relative = true,
                }), { repeating = true })

                hl.bind(mod .. " + SHIFT + UP", hl.dsp.window.resize({
                    x = 0,
                    y = -50,
                    relative = true,
                }), { repeating = true })

                hl.bind(mod .. " + SHIFT + DOWN", hl.dsp.window.resize({
                    x = 0,
                    y = 50,
                    relative = true,
                }), { repeating = true })

                hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("serpantinum brightness lower"), {
                    locked = true,
                })

                hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("serpantinum brightness raise"), {
                    locked = true,
                })

                hl.bind("PRINT", hl.dsp.exec_cmd("serpantinum screenshot"))
                hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("serpantinum screenshot --edit"))
                hl.bind(mod .. " + PRINT", hl.dsp.exec_cmd("serpantinum screenshot --full"))
                hl.bind(mod .. " + SHIFT + PRINT", hl.dsp.exec_cmd("serpantinum screenshot --full --edit"))

                hl.bind("XF86PowerOff", hl.dsp.exec_cmd("serpantinum lock"), {
                    locked = true,
                })

                hl.bind(mod .. " + L", hl.dsp.exec_cmd("serpantinum lock"))

                hl.bind(mod .. " + SPACE", hl.dsp.exec_cmd("playerctl play-pause"))
                hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), {
                    locked = true,
                })

                hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), {
                    locked = true,
                })

                hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), {
                    locked = true,
                })

                hl.bind("XF86AudioMute", hl.dsp.exec_cmd("serpantinum volume mute-toggle"), {
                    locked = true,
                })

                hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("serpantinum volume mic-toggle"), {
                    locked = true,
                })

                hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("serpantinum volume lower"), {
                    repeating = true,
                    locked = true,
                })

                hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("serpantinum volume raise"), {
                    repeating = true,
                    locked = true,
                })

                hl.bind(mod .. " + CTRL + LEFT", hl.dsp.window.move({
                    direction = "left",
                }))

                hl.bind(mod .. " + CTRL + RIGHT", hl.dsp.window.move({
                    direction = "right",
                }))

                hl.bind(mod .. " + CTRL + UP", hl.dsp.window.move({
                    direction = "up",
                }))

                hl.bind(mod .. " + CTRL + DOWN", hl.dsp.window.move({
                    direction = "down",
                }))

                hl.bind(mod .. " + LEFT", hl.dsp.focus({
                    direction = "left",
                }))

                hl.bind(mod .. " + RIGHT", hl.dsp.focus({
                    direction = "right",
                }))

                hl.bind(mod .. " + UP", hl.dsp.focus({
                    direction = "up",
                }))

                hl.bind(mod .. " + DOWN", hl.dsp.focus({
                    direction = "down",
                }))

                hl.bind(mod .. " + Q", hl.dsp.window.close())

                hl.bind(mod .. " + SHIFT + F", hl.dsp.window.float({
                    action = "toggle",
                }))

                hl.bind(mod .. " + F", hl.dsp.window.fullscreen({
                    mode = "fullscreen",
                }))

                hl.bind(mod .. " + W", hl.dsp.exec_cmd("zen-twilight"))
                hl.bind(mod .. " + C", hl.dsp.exec_cmd("codium"))
                hl.bind(mod .. " + E", hl.dsp.exec_cmd("ski"))
                hl.bind(mod .. " + S", hl.dsp.exec_cmd("spotify"))
                hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd(terminal))

                hl.bind(mod .. " + R", hl.dsp.exec_cmd("serpantinum reload"))
                hl.bind(mod .. " + SHIFT + C", hl.dsp.exec_cmd("serpantinum msg toggle clipboard"))
                hl.bind(mod .. " + D", hl.dsp.exec_cmd("serpantinum msg toggle launcher"))
                hl.bind(mod .. " + M", hl.dsp.exec_cmd("serpantinum msg toggle music"))
                hl.bind(mod .. " + B", hl.dsp.exec_cmd("serpantinum msg toggle system"))
                hl.bind(mod .. " + SHIFT + W", hl.dsp.exec_cmd("serpantinum msg toggle wallpaper"))
                hl.bind(mod .. " + N", hl.dsp.exec_cmd("serpantinum msg toggle network"))
                hl.bind(mod .. " + V", hl.dsp.exec_cmd("serpantinum msg toggle volume"))
                hl.bind(mod .. " + H", hl.dsp.exec_cmd("serpantinum msg toggle settings"))
                hl.bind(mod .. " + A", hl.dsp.exec_cmd("serpantinum msg toggle autohide"))

                local workspaces = {
                    { key = "1", id = 1 },
                    { key = "2", id = 2 },
                    { key = "3", id = 3 },
                    { key = "4", id = 4 },
                    { key = "5", id = 5 },
                    { key = "6", id = 6 },
                    { key = "7", id = 7 },
                    { key = "8", id = 8 },
                    { key = "9", id = 9 },
                    { key = "0", id = 10 },
                }

                for _, workspace in ipairs(workspaces) do
                    hl.bind(mod .. " + " .. workspace.key, hl.dsp.exec_cmd(
                        "serpantinum msg workspace " .. workspace.id
                    ))

                    hl.bind(mod .. " + SHIFT + " .. workspace.key, hl.dsp.exec_cmd(
                        "serpantinum msg workspace " .. workspace.id .. " move"
                    ))
                end
            '';
        };
    };
}
