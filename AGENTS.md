# AGENTS.md

## Code Style
- Modular > monolithic — "one clean cattery per module," not one big litter box of a config. Follows the repo's core/platform/compositor split.
- Flake-parts idioms by default when scaffolding Nix.
- Declarative > imperative everywhere the ecosystem allows it.
- Comments can have personality (a joke, a smug remark) but never replace an actual explanation — style, not substitute.
- Naming stays cursed-but-readable (Unity/Roblox-refugee-now-Nix-poster energy is fine).
- Diffs over full-file rewrites unless the whole file is genuinely being rewritten.
- No unsolicited best-practices lectures — assume familiarity with the codebase.

## Nix Formatting Conventions (verified against actual repo files)
- 4-space indentation, no tabs.
- Top-level module signature takes only what's actually used: `{ config, lib, ... }:`, `{ self, inputs, ... }:`, `{ self, inputs, lib, ... }:` — no blanket over-importing of args.
- Modules registered under `flake.homeModules` / `flake.nixosModules`, keyed by name, each value its own `{ config, pkgs, ... }: { ... }` function — one attrset per module.
- `with pkgs; [ ... ]` is fine for simple package lists — no need to fully-qualify every `pkgs.foo` in a flat list.
- Conditional config via `lib.mkIf config.features.<flag>.enable { ... }`, wrapping the whole `config = ...` block rather than scattering `mkIf` per-key.
- Feature flags read as `config.features.<name>.enable` — centralized toggle pattern, not ad-hoc booleans.
- Nested attrsets get their own opening/closing braces on their own lines once there's real nesting — don't collapse multi-key blocks onto one line.
- Blank line between logical sub-blocks within a module (e.g. between `imports`, `home-manager.*`, `programs.*`, `home.*`, or between a `modules` list's entries) — readability over compactness.
- Cross-module references to registered flake modules use `self.homeModules.<name>` / `self.nixosModules.<name>` / `self.overlays.<name>`.
- Relative imports (`../../options.nix`) are used for local, non-registered files that aren't part of the `flake.*Modules` registry — registry lookups use `self.*`, plain file imports use relative paths.
- `inherit self inputs;` / `inherit inputs;` used to pass values through `specialArgs`/`extraSpecialArgs` rather than re-threading manually.
- `imports = [ ... ];` and list-of-modules blocks stay one-item-per-line, even when short, with blank lines separating multi-line entries — easy to diff, easy to add/remove.
- Inline anonymous modules (`{ nixpkgs = { ... }; }`) are fine inside a `modules = [ ... ]` list alongside named `self.*Modules.*` references — no forced extraction into a named module for one-off host-level tweaks.
- Overlay lists (`overlays = [ ... ]`) follow the same one-per-line convention as imports.
- Module/attr names: camelCase for most, hyphenated when the name is inherently a proper noun/compound (`illogical-impulseHome`, `end4-pCPlatform`, `neo-zen`) — match whatever the upstream thing is called rather than forcing strict camelCase.
- Trailing semicolons on every binding, including the last one in a block.
