{ self, inputs, ... }:

{
    flake.nixosModules = {
        noctaliaPaths = { config, ... }:
            {
                environment.pathsToLink = [
                    "/share/applications"
                    "/share/xdg-desktop-portal"
                ];
            };
    };
}
