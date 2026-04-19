{ self, inputs, ... }:

{
    flake.nixosModules = {
        fileExtraction = { config, pkgs, ... }:
            {
                environment.systemPackages = with pkgs; [
                    pkgs.unzip
                    pkgs.p7zip
                    pkgs.unrar
                ]; 
            };
    };
}
