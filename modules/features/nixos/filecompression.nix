{ self, inputs, ... }:

{
    flake.nixosModules = {
        fileCompression = { config, pkgs, ... }:
            {
                environment.systemPackages = with pkgs; [
                    zip
                ];
            };
    };
}
