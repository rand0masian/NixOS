{ config, lib, ... }:

{
    config = lib.mkIf config.features.experimental.enable {
        services.open-webui = {
            enable = true;
            port = 8080;
            host = "0.0.0.0";
        };
    };
}
