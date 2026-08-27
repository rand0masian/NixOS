{ self, inputs, ... }:

{
    flake.nixosModules = {
        pipewire = { config, ... }:
            {
                services = {
                    pulseaudio.enable = false;
                    pipewire = {
                        enable = true;
                        alsa = {
                            enable = true;
                            support32Bit = true;
                        };

                        wireplumber.extraConfig = {
                            no-ucm = {
                                "monitor.alsa.properties" = {
                                    "alsa.use-ucm" = false;
                                };
                            };
                        };

                        jack.enable = true;
                        pulse.enable = true;
                    };
                };

                boot.extraModprobeConfig = ''
                    options snd-hda-intel model=alc255-acer,headset-mode
                '';
            };
    };
}
