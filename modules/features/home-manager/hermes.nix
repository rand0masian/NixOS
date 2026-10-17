{ self, inputs, ... }:

{
    flake.homeModules = {
        hermes = { pkgs, ... }:
            {
                imports = [
                    inputs.hermes.homeManagerModules.default
                ];

                services.hermes-agent = {
                    enable = true;
                    gateway.enable = true;
                    backend = {
                        mode = "dashboard";
                        port = 9119;
                    };
                };

                programs.hermes-agent = {
                    enable = true;
                    desktop.enable = true;
                };
            };
    };
}
