{ self, inputs, ... }:

{
    flake.homeModules = {
        fastfetch = { ... }:
            {
                programs.fastfetch = {
                    enable = true;
                    settings = {
                        logo = {
                            source = "${self}/assets/fastfetch/girlwcat.webp";
                            type = "auto";
                            width = 28;
                            height = 16;
                            padding = {
                                top = 1;
                                right = 3;
                            };
                        };

                        display = {
                            separator = "    ";
                            color = {
                                keys = "magenta";
                                title = "magenta";
                            };

                            key.width = 18;
                        };

                        modules = [
                            "title"
                            {
                                type = "custom";
                                format = "╭────────────── system ──────────────╮";
                            }

                            {
                                type = "os";
                                key = "󰣇  os";
                            }

                            {
                                type = "kernel";
                                key = "󰒔  kernel";
                            }

                            {
                                type = "uptime";
                                key = "󰔚  uptime";
                            }

                            {
                                type = "packages";
                                key = "󰏖  packages";
                            }

                            {
                                type = "custom";
                                format = "├────────────── session ─────────────┤";
                            }

                            {
                                type = "shell";
                                key = "󰆍  shell";
                            }

                            {
                                type = "wm";
                                key = "󰖲  compositor";
                            }

                            {
                                type = "terminal";
                                key = "󰄛  terminal";
                            }

                            {
                                type = "custom";
                                format = "├───────────── hardware ─────────────┤";
                            }

                            {
                                type = "cpu";
                                key = "󰻠  cpu";
                            }

                            {
                                type = "gpu";
                                key = "󰢮  gpu";
                            }

                            {
                                type = "memory";
                                key = "󰍛  memory";
                            }

                            {
                                type = "disk";
                                key = "󰋊  storage";
                            }

                            {
                                type = "custom";
                                format = "╰────────────────────────────────────╯";
                            }

                            "break"
                            "colors"
                        ];
                    };
                };
            };
    };
}
