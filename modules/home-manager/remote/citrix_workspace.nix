{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.remote.citrix_workspace;
in
{
  options.dougieHome.remote.citrix_workspace = {
    enable = mkEnableOption "citrix_workspace";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ 
      citrix_workspace
    ];
  };
}
