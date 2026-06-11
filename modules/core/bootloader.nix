{ self, inputs, ... }:

{
    flake.nixosModules = {
        bootLoader = { config, ... }:
            {
                boot.loader = {
                    systemd-boot.enable = true;
                    grub = {
                        enable = false;
                        device = "nodev";
                        useOSProber = true;
                        efiSupport = true;
                    };

                    efi = {
                        canTouchEfiVariables = true;
                        efiSysMountPoint = "/boot";
                    };
                };
            };
    };
}
