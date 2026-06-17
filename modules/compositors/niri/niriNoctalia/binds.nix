{ self, inputs, ... }:

{
    flake.homeModules = {
        niriNoctaliaBinds = { config, pkgs, lib, ... }:
            {
                programs.niri = {
                    settings.binds = {
                        "Mod+T".action.spawn = lib.getExe pkgs.kitty;
                        "Mod+Q".action.close-window = {};
                        "Mod+Tab".action.toggle-overview = {};
                        "Mod+Right".action.focus-column-right = {};
                        "Mod+Left".action.focus-column-left = {};
                        "Mod+Up".action.focus-workspace-up = {};
                        "Mod+Down".action.focus-workspace-down = {};
                        "Mod+F".action.fullscreen-window = {};
                        "Mod+W".action.spawn = [ "zen-twilight" ];
                        "Mod+E".action.spawn = lib.getExe pkgs.kdePackages.dolphin;
                        "Mod+C".action.spawn = lib.getExe pkgs.vscode;
                        "Mod+S".action.spawn = [ "spotify" ];
                        "Mod+Space".action.spawn = [ "noctalia" "msg" "panel-toggle" "launcher" ];
                        "Mod+L".action.spawn = [ "noctalia" "msg" "session" "lock" ];
                    };
                };
            };
    };
}
