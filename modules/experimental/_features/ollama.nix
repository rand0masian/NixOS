{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.features.experimental.enable {
    services.ollama = {
      enable = true;
      package = pkgs.ollama-cuda;

      loadModels = [
        "qwen2.5-coder:7b"
        "qwen3.5:4b-q4_K_M"
        "qwen2.5-coder:1.5b"
        "nomic-embed-text"
      ];

      environmentVariables = {
        OLLAMA_FLASH_ATTENTION = "1";
        OLLAMA_KV_CACHE_TYPE = "q8_0";
        OLLAMA_MAX_LOADED_MODELS = "-1";
        OLLAMA_KEEP_ALIVE = "30m";
        OLLAMA_CONTEXT_LENGTH = "64000";
      };
    };
  };
}
