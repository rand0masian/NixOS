{ self, inputs, ... }:

{
    flake.nixosModules = {
        cureneBootloader = { config, ... }:
            {
                boot.loader = {
                    systemd-boot.enable = false;
                    grub = {
                        enable = true;
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
