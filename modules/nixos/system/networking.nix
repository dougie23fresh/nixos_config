{ libs, config, pkgs, ...}:
let 
  cfg = config.dougienix.system.networking;
in
{
  options.dougienix.system.networking = with types; {
    enable = lib.mkBoolOpt false "Whether or not to enable networking support";
    hostName = mkOpt types.str "nixos";
  };

  config = lib.mkIf cfg.enable {
    #dougienix.user.extraGroups = [ "networkmanager" ];
    networking = {
      hostName = ${cfg.hostName};
      networkmanager = {
        enable = true;
      };
    };
  };
}