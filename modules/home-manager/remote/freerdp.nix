{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.remote.freerdp;
in
{
  options.dougieHome.remote.freerdp = {
    enable = mkEnableOption "freerdp";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ 
      freerdp
    ];
  };
}
