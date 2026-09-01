{ self, inputs, lib, ... }:

{
    options.installation = {
        targetDisk = lib.mkOption {
            type = lib.types.str;
            defualt = "/dev/nvme0n1";
        };
    };
}
