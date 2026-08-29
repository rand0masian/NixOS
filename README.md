# NixOS

A modular NixOS configuration framework featuring multiple hosts and desktop environments.

## Installation

> [!NOTE]
> The switchboard automatically discovers avaliable host configurations and selects the appropriate deployment mode.

### Within NixOS installation media

Run the switchboard remotely:
```bash
nix run github:rand0masian/NixOS#switchboard
```

### Within an existing NixOS system

Run the switchboard remotely:
```bash
nix run github:rand0masian/NixOS#switchboard
```

Alternatively, the switchboard can be used locally:
```bash
nix run .#switchboard
```

## Features

- Flakes
- Home Manager
- agenix
- Multiple hosts
- Niri / Hyprland support

## Architecture

[Explore the overview of the repository structure and module architecture](docs/architecture.md)