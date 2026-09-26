{ self, inputs, ... }:

{
    flake.homeModules = {
        codex = { config, ... }:
            {
                imports = [
                    inputs.codex.homeManagerModules.default
                ];

                programs.codexDesktopLinux = {
                    enable = true;
                };
            };
    };
}
