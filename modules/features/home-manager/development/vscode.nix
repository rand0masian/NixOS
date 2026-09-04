{ self, inputs, ... }:

{
    flake.homeModules = {
        vscode = { config, pkgs, ... }:
            {
                programs.vscode = {
                    enable = true;
                    package = pkgs.vscode-fhs;
                    userSettings = {
                        "security.workspace.trust.untrustedFiles" = "open";
                        "workbench.editor.empty.hint" = "hidden";
                        "workbench.startupEditor" = "none";
                        "material-code.primaryColor" = "#4C3D50";
                        "editor.minimap.enabled" = false;
      
                        "editor.fontFamily" = "Maple Mono";
                        "editor.fontLigatures" = "false";
                        "terminal.integrated.fontFamily" = "Maple Mono";

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
                                    ];
            
                                    "settings" = {
                                        "fontStyle" = "italic";
                                    };
                                }
                            ];
        
                            "[GitHub Dark Colorblind (Beta)]" = {
                                "textMateRules" = [
                                    {
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
                        
                        "workbench.colorTheme" = "GitHub Dark Colorblind (Beta)";
                        "workbench.iconTheme" = "catppuccin-latte";
                    };
                };
            };
    };
}
