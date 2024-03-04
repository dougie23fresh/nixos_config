{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.tools.ark;
in
{
  options.dougieHome.tools.ark = {
    enable = mkEnableOption "ark";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ 
      citrix_workarkspace
    ];
  };
}
