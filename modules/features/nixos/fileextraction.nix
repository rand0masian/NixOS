{ self, inputs, ... }:

{
    flake.nixosModules = {
        fileExtraction = { config, pkgs, ... }:
            {
                environment.systemPackages = with pkgs; [
                    pkgs.p7zip
                    pkgs.unrar
                ]; 
            };
    };
}
