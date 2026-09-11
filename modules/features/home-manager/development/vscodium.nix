{ self, inputs, ... }:

{
    flake.homeModules = {
        vscodium = { config, pkgs, ... }:
            {
                home.packages = with pkgs; [
                    nixd
                ];

                programs.vscodium = {
                    enable = true;

                    profiles.default = {
                        enableExtensionUpdateCheck = false;

                        extensions = with pkgs.vscode-extensions; [
                            github.github-vscode-theme
                            catppuccin.catppuccin-vsc-icons
                            bbenoist.nix
                        ];

                        userSettings = {
                            "security.workspace.trust.untrustedFiles" = "open";
                            "workbench.editor.empty.hint" = "hidden";
                            "workbench.startupEditor" = "none";
                            "material-code.primaryColor" = "#4C3D50";
                            "editor.minimap.enabled" = false;

                            "editor.fontFamily" = "Maple Mono";
                            "editor.fontLigatures" = false;
                            "terminal.integrated.fontFamily" = "Maple Mono";

                            "editor.semanticHighlighting.enabled" = true;

                            "workbench.colorTheme" = "GitHub Dark Colorblind (Beta)";
                            "workbench.iconTheme" = "catppuccin-latte";

                            "files.associations" = {
                                "*.nix" = "nix";
                            };

                            "nix.enableLanguageServer" = true;
                            "nix.serverPath" = "nixd";

                            "editor.tokenColorCustomizations" = {
                                "textMateRules" = [
                                    {
                                        "name" = "Force Maple Mono cursive loops";

                                        "scope" = [
                                            "comment"
                                            "keyword"
                                            "storage"
                                            "storage.type"
                                            "variable.parameter"
                                            "variable.language.this"
                                            "entity.name.tag"
                                            "entity.other.attribute-name"
                                        ];

                                        "settings" = {
                                            "fontStyle" = "italic";
                                        };
                                    }
                                ];
                            };
                        };
                    };
                };
            };
    };
}
