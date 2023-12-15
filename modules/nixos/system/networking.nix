{ lib, config, pkgs, ...}:
with lib;
let 
  cfg = config.dougieHost.system.networking;
in
{
  options.dougieHost.system.networking = {
    enable = mkEnableOption "Whether or not to enable networking support";
    hostName = mkOption types.str "nixos";
  };

  config = mkIf cfg.enable {
    #dougienix.user.extraGroups = [ "networkmanager" ];
    networking = {
      hostName = cfg.hostName;
      networkmanager = {
        enable = true;
      };
    };
  };
}