{ self, inputs, ... }:

{
    flake.nixosModules = {
        noctaliaFileextraction = { config, pkgs, ... }:
            {
                environment.systemPackages = with pkgs; [
                    pkgs.p7zip
                    pkgs.unrar
                ]; 
            };
    };
}
