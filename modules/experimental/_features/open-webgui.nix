{ config, lib, ... }:

{
    config = lib.mkIf config.features.experimental.enable {
        services.open-webui = {
            enable = true;
            port = 8080;
            host = "0.0.0.0";
            environment = {
                OLLAMA_BASE_URL = "http://127.0.0.1:11434";
                WEBUI_ANALYTICS = "False";
                WEBUI_AUTH = "True";
            };
        };
    };
}
