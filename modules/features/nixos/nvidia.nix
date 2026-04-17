{ self, inputs, ... }:

{
    flake.nixosModules = {
        nvidia = { config, pkgs, ... }:
            {
                nixpkgs.config = {
                    allowUnfree = true;
                };

                hardware = {
                    graphics = {
                        enable = true;
                        enable32Bit = true;
                        extraPackages = with pkgs; [
                            mesa 
                            libva-vdpau-driver 
                            libvdpau-va-gl
                        ];
                    };
                    
                    nvidia = {
                        modesetting.enable = true;
                        powerManagement.enable = false;
                        open = true;
                        forceFullCompositionPipeline = true;
                        package = config.boot.kernelPackages.nvidiaPackages.stable;
                        nvidiaSettings = true;
                    };
                };

                boot = {
                    kernelParams = [
                        "nvidia-drm.modeset=1"
                        "nvidia_drm.fbdev=1"
                        "nvidia.NVreg_RegistryDwords=PowerMizerEnable=0x1"
                        "PerfLevelSrc=0x2222"
                        "PowerMizerDefault=0x1"
                        "PowerMizerDefaultAC=0x1"
                    ];

                    initrd.kernelModules = [
                        "nvidia"
                        "nvidia_modeset"
                        "nvidia_uvm"
                        "nvidia_drm"
                    ];
                };

                environment = {
                    sessionVariables = {
                        "NIXOS_OZONE_WL" = "1";
                        "__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
                        "LD_LIBRARY_PATH" = "/run/opengl-driver/lib:/run/opengl-driver-32/lib";
                    };

                    systemPackages = with pkgs; [
                        nvidia-vaapi-driver
                        egl-wayland
                        libglvnd
                        libva-utils
                        vulkan-tools
                        mesa-demos
                    ];

                    ldso32 = "${pkgs.pkgsi686Linux.glibc}/lib/ld-linux.so.2";
                };
            };
    };
}
