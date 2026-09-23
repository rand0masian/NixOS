# Changelog

## [Unreleased]

### 2026-09-24

#### Added
- Added ollama-cuda `experimentalModule`, alongside introducing the experimental `_pkgs` directory.
- Added nix-community cache and trusted public key to the `settings` nixosModule.
- Added `nixpkgs-ollama` input (`flake.nix`).
- Added `specialArgs` to illogical-impulse's `default.nix`.
- Added a selection of models to preload within `ollama.nix`; including `qwen2.5-coder:7b`, `rfsousa/qwen2.5vl:tools`, `qwen2.5-coder:1.5b` and `nomic-embed-text`. 

#### Changed
- Increased a model's alive time to 30 minutes and disabled the maximum limit on loaded models within the ollama experimentalModule.

#### Fixed
- Corrected module name in `CHANGELOG.md`.

### 2026-09-23

#### Added
- Added environment options to open-webui `experimentalModule`.

### 2026-09-19

#### Fixed
- Removed unnecessary feature gate to the caelestia host `experimentalModule`, alongside separating it from `experimentalNixOS`, importing it instead so it can be inherited by `flake.experimentalModules.nixos`.


## [v0.5.1]

### 2026-09-19

#### Fixed
- Fixed `experimentalFeatures.md` link in `architecture.md` by adding the `.md` extension.
- Corrected unnecessary space in `experimentalFeatures.md`.
- Fixed the link to `experimentalFeatures.md` in `architecture.md`.

## [v0.5.0]

### 2026-09-18

#### Added
- Added `experimentalFeatures.md` to explain `experimentalModules` further, alongside the enabiling process.
- Added `eamodio.gitlens` extension to `vscodium` homeModule.

#### Changed
- Updated `architecture.md` to add a link to `experimentalFeatures.md`.
- Updated `architecture.md` to note that caelestia is experimental.
- [Breaking] Converted both the caelestia host and caelestia platform to `experimentalModules`, therefore the platform is disabled by default and requires enabiling.

### 2026-09-13

#### Added
- Imported `fish` and `starship` into `caelestiaHome`.
- Added `starship` homeModule.
- Added `fish` homeModule.
- Imported `caelestiaPlatform` into `caelestiaHome`.
- Added `caelestiaPlatform`.
- Added `caelestia-shell` input (`flake.nix`).
- Added caelestia host.

#### Changed
- Removed `loadModules` list from the ollama `experimentalModule`.
- Updated `architecture.md` to document both the caelestia host and `caelestiaPlatform`.
- Disabled experimental features within `illogical-impulseConfiguration` and `illogical-impulseHome`.
- Renamed `tempmonitors.nix` to `tempconfig.nix`.

#### Fixed
- Corrected temporary hyprland configuration file name within `tempconfig.nix`.
- Corrected module name within `end4-pCPlatform`.


## [v0.4.1]

### - 2026-09-11

#### Changed
- Replaced Nix IDE with bbenoist's nix within the `vscodium` homeModule.

#### Fixed
- Fixed the `end4-pC` input reverting to the original hyprland config via `tempconfig`.


## [v0.4.0]

### - 2026-09-10

#### Added
- Added declarative extensions within `vscode` homeModule.
- Added handbrake via `/features/home-manager/handbrake.nix`.
- Added protonup-qt via `/features/home-manager/protonup-qt.nix`
- Imported `presets.nix` into `end4-pCPlatform`.
- Added `presets.nix` to input `blapples-presets` into end4-pC's dotfiles.
- Added `blapples-presets` input (`flake.nix`).

#### Changed
- Renamed `vscode` module to `vscodium`.
- Renamed `/features/home-manager/development/vscode.nix` to `/features/home-manager/development/vscodium.nix`.
- Changed the package within the `vscode` homeModule to `vscodium`.
- Updated flake dependencies (`flake.lock`).

#### Fixed
- Fixed syntax highlighting, font and theme issues within `vscode` homeModule.

#### Removed
- Removed unusued legacy filemanagement nixosModules.

### - 2026-09-06

#### Added
- Added `LICENSE.md` to introduce the MIT license.

#### Changed
- Renamed `LICENSE.md` to `LICENSE` for raw text.

### - 2026-09-05

#### Changed
- Updated flake dependencies (`flake.lock`).

#### Fixed
- Corrected a typo in `CHANGELOG.md`.


## [v0.3.1]

### - 2026-09-05

#### Changed
- Changed `/features/nixos/nvidia.nix` to use propietary instead of open drivers.
- Set `forceFullCompositionPipeline` to `false` in `/features/nixos/nvidia.nix`.

#### Removed
- Removed forced `LD_LIBRARY_PATH` from `/features/nixos/nvidia.nix`.


## [v0.3.0]

### - 2026-09-04

#### Added
- Updated `architecture.md` to document `experimentalModules`.
- Introduced `/assets/pfps/emo/` category and relocated `darkemo.webp`.
- Introduced `/assets/pfps/uncategorised/` category and relocated `blackandwhite.jpg` + `exhaustedselfie.jpg`.
- Added new profile pictures to `/assets/pfps/catgirl/`.
- Added new profile pictures to `/assets/pfps/goth/`.
