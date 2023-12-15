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
  };

  config = mkIf cfg.enable {
    users.users.${cfg.userName} = {
      isNormalUser = true;
      description = "main user";
      extraGroups = [ "networkmanager" "wheel" ];
      #shell = pkg.zsh;
      packages = with pkgs; [
        firefox
      ];
    };
  };
};

}