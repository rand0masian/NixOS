# Experimental Features

Experimental features are disabled by default and are enabled via an optional switch, if desired to opt in.

> [!NOTE]
> Experimental features are unstable and are subject to constant reconfiguration, expect changes, alongside instability.
> When enabled, the ***entirety*** of the experimental selection is imported; therefore avaliable. 


## Opting into experimental features

### nixosModules
Enabled via importing `self.nixosModules.experimentalFeatures` within the `configuration.nix` of the desired host.

### homeModules
Enabled via importing `self.homeModules.experimental` within the `home.nix` of the desired host.


## Experimental features:

### Hosts:

- caelestia

### Platforms:

- caelestia

### Features:

- Ollama
- Open-webUI
