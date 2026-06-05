{ self, inputs, ... }:

{
    flake.homeModules = {
        niriNoctaliaOverview = { config, ... }:
            {
                programs.niri = {
                    settings.overview = {
                        zoom = 0.3;
                        backdrop-color = "#28282B";
                    };
                };
            };
    };
}
