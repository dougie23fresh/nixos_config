{  lib, config, pkgs, username, ... }:
{
  ########
  # users
  ########
  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [ "networkmanager" "wheel" "scanner" "lp" ];
    shell = pkg.zsh;
    packages = with pkgs; [
      firefox
    ];
  };
}