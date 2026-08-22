{ self, inputs, ... }:

{
    flake.homeModules = {
        zsh = { config, pkgs, ... }:
            {
                programs.zsh = {
                    enable = true;
                    enableCompletion = true;
                    autosuggestion.enable = true;
                    syntaxHighlighting.enable = true;

                    shellAliases = {
                        snrs = "sudo nixos-rebuild switch --flake";
                    };

                    history = {
                        size = 10000;
                        ignoreAllDups = true;
                        path = "$HOME/.zsh_history";
                    };

                    oh-my-zsh = {
                        plugins = [
                            "git"
                        ];

                        theme = "agnoster";
                    };
                };
            };
    };
}
