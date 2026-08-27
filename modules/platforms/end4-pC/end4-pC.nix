{ self, inputs, ... }:

{
    flake.homeModules = {
        end4-pC = { config, ... }:
            {
               home.activation = {
                end4-pC = config.lib.dag.entryAfter [ "copyIllogicalImpulseConfigs" ] ''
                    end4Source="${inputs.end4-pC}"
                    end4Target="$HOME/.config/quickshell/end4-pC"
                    $DRY_RUN_CMD mkdir -p "$HOME/.config/quickshell"
                    $DRY_RUN_CMD rm -rf "$end4Target"
                    $DRY_RUN_CMD ln -s "$end4Source" "$end4Target"
                    variables="$HOME/.config/hypr/hyprland/variables.lua"
                    if [ -f "$variables" ]; then
                        $DRY_RUN_CMD sed -i \
                            's/hl\.env("qsConfig", "ii")/hl.env("qsConfig", "end4-pC")/' \
                            "$variables"
                    fi
                '';
               }; 
            };
    };
}
