{ self, inputs, ... }:

{
    flake.homeModules = {
        git = { config, ... }:
            {
                programs.git = {
                    enable = true;
                    userName = "rand0masian";
                    userEmail = "alfieroskell@outlook.com";
                    extraConfig = {
                        init.defaultBranch = "main";
                    };
                };
            };
    };
}
