{ lib, config, pkgs, ...}:
with lib;
let 
  cfg = config.dougieHost.system.networking;
in
{
  options.dougieHost.system.networking = {
    enable = mkBoolOpt false "Whether or not to enable networking support";
    hostName = mkOpt types.str "nixos";
  };

  config = mkIf cfg.enable {
    #dougienix.user.extraGroups = [ "networkmanager" ];
    networking = {
      hostName = ${cfg.hostName};
      networkmanager = {
        enable = true;
      };
    };
  };
}