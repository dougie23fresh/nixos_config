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
    ];
    programs.vscode.enable = true;
    # programs.vscode.extensions
    # programs.vscode.userSettings
  };
}
