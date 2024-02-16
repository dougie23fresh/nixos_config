{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.user;
in
{
  options.dougieHost.user = {
    enable = mkEnableOption "enable user module";
    userName = mkOption {
      type = types.str;
      default = "nixuser";
    };
    userDescription = mkOption {
      type = types.str;
      default = "nixuser";
    };
  };

  config = mkIf cfg.enable {
    users.users.${cfg.userName} = {
      isNormalUser = true;
      description = "${cfg.userDescription}";
      extraGroups = [ "networkmanager" "wheel" "scanner" "lp" ];
      #shell = pkg.zsh;
      packages = with pkgs; [
        firefox
      ];
    };
  };
}
