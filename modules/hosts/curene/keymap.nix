{ self, inputs, ... }:

{
    flake.nixosModules = {
        cureneKeymap = { config, ... }:
            {
                console.keyMap = "uk";
            };
    };
}
