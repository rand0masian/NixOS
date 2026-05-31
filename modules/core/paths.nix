{ self, inputs, ... }:

{
    flake.nixosModules = {
        paths = { config, ... }:
            {
                environment.pathsToLink = [
                    "/share/applications"
                    "/share/xdg-desktop-portal"
                ];
            };
    };
}
