{ inputs }:
final: prev: {
    ollama-cuda = (import inputs.nixpkgs-ollama {
        inherit (final) system;
        config.allowUnfree = true;
    }).ollama-cuda;
}
