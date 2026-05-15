{ self, inputs, ... }:

{
    flake.homeModules = {
        flatpak = { config, ... }:
            {
                imports = [
                    inputs.nix-flatpak.homeManagerModules.nix-flatpak
                ];

                services.flatpak = {
                    enable = true;
                    update.onActivation = true;
                    uninstallUnmanaged = true;
                    uninstallUnused = true;
                    update.auto = {
                        enable = true;
                        onCalendar = "daily";
                    };
                    
                    remotes = [
                        {
                            name = "flathub";
                            location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
                        }
                    ];

                    packages = [
                        "runtime/org.gnome.Platform/x86_64/49"
                        "com.github.tchx84.Flatseal"
                        "org.vinegarhq.Sober"
                        "io.github.celluloid_player.Celluloid"
                        "com.interversehq.qView"
                        "org.gnome.gitlab.YaLTeR.VideoTrimmer"
                        "com.usebottles.bottles"
                    ];

                    overrides = {
                        "org.vinegarhq.Sober".Context = {
                            sockets = [
                                "!wayland"
                                "x11"
                            ];

                            filesystems = [
                                "xdg-run/app/com.discordapp.Discord:create;xdg-run/discord-ipc-0;"
                            ];
                        };

                        "com.usebottles.bottles".Context = {
                            sockets = [
                                "x11"
                                "!wayland"
                                "!fallback-x11"
                            ];
                        };
                    };
                };

                systemd.user = {
                    services.flatpack-managed-install = {
                        unitConfig.StartLimitInterval = 0;
                        serviceConfig.TimeoutStartSec = "30m";
                    };
                };
            };
    };
}
