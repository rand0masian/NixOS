{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.features.experimental.enable {
    services.ollama = {
      enable = true;
      package = pkgs.ollama-cuda;

      loadModels = [
        "huihui_ai/gemma-4-abliterated:e4b"
        "qwen3.5:4b-q4_K_M"
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
