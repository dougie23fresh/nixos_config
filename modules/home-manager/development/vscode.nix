{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.development.vscode;
in
{
  options.dougieHome.development.vscode = {
    enable = mkEnableOption "vscode";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      vscode
      vscode-extensions.ms-python.python
      vscode-extensions.ms-python.vscode-pylance
      vscode-extensions.dracula-theme.theme-dracula
      vscode-extensions.nonylene.dark-molokai-theme
      vscode-extensions.jdinhlife.gruvbox
      vscode-extensions.catppuccin.catppuccin-vsc
    ];
    programs.vscode.enable = true;
    # programs.vscode.extensions
    # programs.vscode.userSettings
  };
}
