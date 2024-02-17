{  lib, config, pkgs, ... }:
{
  ########
  # users
  ########
  users.users.${cfg.userName} = {
    isNormalUser = true;
    description = "${cfg.userDescription}";
    extraGroups = [ "networkmanager" "wheel" "scanner" "lp" ];
    shell = pkg.zsh;
    packages = with pkgs; [
      firefox
    ];
  };
}