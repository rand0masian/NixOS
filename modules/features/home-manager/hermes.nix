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

                    settings.model = {
                        provider = "custom";
                        default = "qwen3.5:4b-q4_K_M";
                        base_url = "http://localhost:11434/v1";
                        context_length = 64000;
                    };
                };

                programs.hermes-agent = {
                    enable = true;
                    desktop.enable = true;
                };
            };
    };
}
