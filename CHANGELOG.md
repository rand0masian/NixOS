# Changelog

## [Unreleased]


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
