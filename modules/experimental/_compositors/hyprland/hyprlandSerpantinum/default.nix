{ ... }:

{
    imports = [
        ./autostart.nix
        ./binds.nix
        ./env.nix
        ./monitors.nix
        ./settings.nix
    ];

    wayland.windowManager = {
        hyprland = {
            enable = true;
            configType = "hyprlang";
        };
    };
}
