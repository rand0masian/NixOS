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

                    workingDirectory = "/home/randomasian";
                    hermesHomeFiles."SOUL.md" = ./SOUL.md;
                    documents."AGENTS.md" = ../../../../../AGENTS.md;
                    settings = {
                        model = {
                            provider = "custom";
                            default = "huihui_ai/gemma-4-abliterated:e4b";
                            context_length = 64000;
                            base_url = "http://localhost:11434/v1";
                        };

                        terminal.cwd = "home/randomasian";
                        memory = {
                            memory_enabled = true;
                            user_profile_enabled = true;
                        };

                        gateway.api_server = {
                            enabled = false;
                            host = "127.0.0.1";
                            port = 8642;
                            model_name = "Akanai";
                            max_concurrent_runs = 2;
                        };

                        plugins.enabled = [
                            "disk-cleanup"
                        ];
                    };
                };

                programs.hermes-agent = {
                    enable = true;
                    desktop.enable = true;
                };
            };
    };
}
