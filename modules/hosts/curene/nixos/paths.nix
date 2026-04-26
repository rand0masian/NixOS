{ self, inputs, ... }:

{
    flake.nixosModules = {
        curenePaths = { config, ... }:
            {
                environment.pathsToLink = [
                    "/share/applications"
                    "/share/xdg-desktop-portal"
                ];
            };
    };
}
