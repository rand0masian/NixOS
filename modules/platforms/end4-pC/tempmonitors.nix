{ self, inputs, ... }:

{
    flake.homeModules = {
        tempconfig = { config, lib, pkgs, ... }:
            {
                home.activation = {
                    tempmonitors = config.lib.dag.entryAfter [ "writeBoundary" ] ''
                        monitorsSource="$HOME/.config/hypr/custom/general.lua"
                        monitorsTarget="${./tempmonitors.lua}"
                        if [ -f "$monitorsTarget" ]; then
                            $DRY_RUN_CMD mkdir -p "$HOME/.config/hypr/custom"
                            $DRY_RUN_CMD rm -f "$monitorsSource"
                            $DRY_RUN_CMD cp --no-preserve=mode "$monitorsTarget" "$monitorsSource"
                        fi

                        if [ -n "''${HYPRLAND_INSTANCE_SIGNATURE:-}" ]; then
                            $DRY_RUN_CMD ${pkgs.hyprland}/bin/hyprctl reload
                        fi
                    '';
                };
            };
    };
}
