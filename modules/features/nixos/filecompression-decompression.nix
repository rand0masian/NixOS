{ self, inputs, ... }:

{
    flake.nixosModules = {
        fileCompression-Decompression = { config, pkgs, ... }:
            {
                environment.systemPackages = with pkgs; [
                    unzip
                    p7zip
                    unrar
                    zip
                ]; 
            };
    };
}
