{ self, inputs, ... }:

{
    flake.homeModules = {
        fish = { config, ... }:
            {
                programs.fish = {
                    enable = true;
                    shellAliases = {
                        snrs = "sudo nixos-rebuild switch --flake";
                    };

                    interactiveShellInit = ''
                        set fish_greeting
                        cd ~/.configuration
                        fastfetch
                    '';
                };
            };
    };
}
