{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.development.rust;
in
{
  options.dougieHome.development.rust = {
    enable = mkEnableOption "rust";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      rustup
    ];
  };
}
