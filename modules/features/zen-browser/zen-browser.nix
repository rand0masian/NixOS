{ self, inputs, ... }:

{
    flake.homeModules = {
        zen-browser = { config, pkgs, ... }:
            {
                imports = [
                    inputs.zen-browser.homeModules.twilight
                ];

                programs.zen-browser = {
                    enable = true;
                    profiles.default = {
                        settings = {
                            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
                            "gfx.webrender.all" = true;
                            "layers.acceleration.force-enabled" = true;
                            "widget.wayland.enable" = 1;
                            "media.ffmpeg.vaapi.enabled" = true;
                            "media.rdd-ffmpeg.enabled" = true;
                            "widget.dmabuf.force-enabled" = true;
                        };

                        userChrome = ''
                            @import "${pkgs.neo-zen}/share/neo-zen/userChrome.css";

                            * { transition: none !important; }
                            :root {
                                --zen-blur-radius: 0px !important;
                                --zen-element-transitions: 0s !important;
                            }

                            * {
                                backdrop-filter: none !important;
                                box-shadow: none !important;
                            }

                            #TabsToolbar, #nav-bar, #sidebar-box {
                                background-color: var(--zen-colors-tertiary) !important;
                                opacity: 1 !important;
                            }
                        '';

                        userContent = ''
                            @import "${pkgs.neo-zen}/share/neo-zen/userContent.css";
                        '';
                    };
                };
            };
    };
}
