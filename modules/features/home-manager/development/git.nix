{ self, inputs, ... }:

{
    flake.homeModules = {
        git = { config, ... }:
            {
                programs.git = {
                    enable = true;
                    settings = {
                        user = {
                            name = "rand0masian";
                            email = "alfieroskell@outlook.com";
                        };

                        init.defaultBranch = "main";
                    };
                };
            };
    };
}
