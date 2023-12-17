
{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.development.git;
in
{
  options.dougieHome.development.git = {
    enable = mkEnableOption "git";
  };

  config = mkIf cfg.enable {
    programs.git.enable = true;
    programs.git.userName = "melvin";
    programs.git.userEmail = "melvin.douglas@gmail.com";
    programs.git.extraConfig = {
      init.defaultBranch = "main";
    };
    home.packages = [ pkgs.git ];
  }
}
