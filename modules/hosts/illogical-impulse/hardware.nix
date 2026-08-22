{ self, inputs, ... }:

{
    flake.nixosModules = {
        illogical-impulseHardware = { config, lib, pkgs, modulesPath, ... }:
            {
               imports = [
                    (modulesPath + "/installer/scan/not-detected.nix")
                ];

                boot = {
                    initrd = {
                        availableKernelModules = [
                            "vmd"
                            "xhci_pci"
                            "ahci"
                            "nvme"
                            "usb_storage"
                            "usbhid"
                            "sd_mod"
                        ];

                        kernelModules = [];
                    };

                    kernelModules = [
                        "kvm-intel"
                    ];

                    extraModulePackages = [];
                };

                fileSystems = {
                    "/" = {
                        device = "/dev/disk/by-uuid/cca103c1-08db-4d50-90d2-2fde58e056cd";
                        fsType = "ext4";
                    };

                    "/boot" = {
                        device = "/dev/disk/by-uuid/02F8-25C8";
                        fsType = "vfat";
                        options = [
                            "fmask=0077"
                            "dmask=0077"
                        ];
                    };
                };

                swapDevices = [];
                nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
                hardware.cpu = {
                    intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
                }; 
            };
    };
}
