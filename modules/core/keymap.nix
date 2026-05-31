{ self, inputs, ... }:

{
    flake.nixosModules = {
        keyMap = { config, ... }:
            {
                console.keyMap = "uk";
            };
    };
}
