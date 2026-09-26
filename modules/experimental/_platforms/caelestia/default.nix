{ experimental, config, lib, ... }:

{
    config = lib.mkIf experimental {
        imports = [
            ./calestia-shell
        ];
    };
}
