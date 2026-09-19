{ self, inputs, lib, ... }:

{
    options.features = {
        experimental.enable = lib.mkEnableOption
            "experimental features";
    };
}
