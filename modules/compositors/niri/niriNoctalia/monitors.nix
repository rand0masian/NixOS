{ self, inputs, ... }:

{
    flake.homeModules = {
        niriNoctaliaMonitors = { config, ... }:
            {
                programs.niri = {
                    settings.outputs = {
                        "DP-3" = {
                            mode = { width = 2560; height = 1440; };
                            position = { x = 0; y = 0; };
                        };

                        "DP-2" = {
                            mode = { width = 1920; height = 1080; };
                            position = { x = 2560; y = 0; };
                        };

                        "HDMI-A-1" = {
                            mode = { width = 1920; height = 1080; };
                            position = { x = 320; y = -1080; };
                        };
                    };
                };
            };
    };
}
