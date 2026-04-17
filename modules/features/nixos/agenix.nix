{ self, inputs, ... }:

{
    flake.nixosModules = {
        agenix = { config, pkgs, ... }:
            {
                imports = [
                    inputs.agenix.nixosModules.default
                ];

                environment.systemPackages = [
                    inputs.agenix.packages.${pkgs.system}.default
                ];

                age.secrets = {
                    steam_api_key = {
                        file = ../../../secrets/steam_api_key.age;
                        owner = "randomasian";
                        group = "users";
                        path = "/home/randomasian/.configuration/secrets";
                    };
                };
            };
    };
}
