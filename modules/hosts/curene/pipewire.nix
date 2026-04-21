{ self, inputs, ... }:

{
    flake.nixosModules = {
        curenePipewire = { config, ... }:
            {
                services = {
                    pulseaudio.enable = false;
                    pipewire = {
                        enable = true;
                        alsa = {
                            enable = true;
                            support32Bit = true;
                        };
                        
                        pulse.enable = true;
                    };
                };
            };
    };
}
