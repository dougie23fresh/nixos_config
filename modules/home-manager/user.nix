{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.user;
in
{
  options.dougieHome.user = {
    enable = mkEnableOption "user";
    userName = mkOption {
      type = types.str;
      default = "nixuser";
    };
  };

  config = mkIf cfg.enable {
    home = {
        username = ${cfg.userName} ;
        homeDirectory = "/home/${cfg.userName}";
        stateVersion = "23.11";
        # packages = with pkgs; [ mpv ];
    };
  }
}

