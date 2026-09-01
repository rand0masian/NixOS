{ self, inputs, ... }:

{
    perSystem = { config, system, ... }:
        let
            pkgs = import inputs.nixpkgs {
                inherit system;
                config.allowUnfree = true;
            };

            switchboard = pkgs.writeShellApplication {
                name = "switchboard";

                runtimeInputs = with pkgs; [
                    nix
                    util-linux
                    disko
                ];

                text = ''
                    export SWITCHBOARD_REPO="${self}"
                    ${builtins.readFile ./switchboard.sh}
                '';
            };
        in
            {
                apps.switchboard = {
                    type = "app";
                    program = "${switchboard}/bin/switchboard";
                };
            };
}
