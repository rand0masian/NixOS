{ self, inputs, ... }:

{
    flake.nixosModules = {
        users = { config, ... }:
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
