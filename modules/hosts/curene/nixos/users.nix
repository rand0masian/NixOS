{ self, inputs, ... }:

{
    flake.nixosModules = {
        cureneUsers = { config, ... }:
            {
                users.users = {
                    randomasian = {
                        isNormalUser = true;
                        extraGroups = [
                            "networkmanager"
                            "wheel"
                            "input"
                            "tty"
                        ];
                    };
                };
            };
    };
}
