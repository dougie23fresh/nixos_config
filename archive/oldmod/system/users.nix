{  lib, config, pkgs, username, ... }:
{
  ########
  # users
  ########
  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [
      "networkmanager"
      "wheel"
      "scanner"
      "lp"
      "audio"
      "video"
      "users"
      #"docker"
      #"plugdev"
      #"render"
      #"lxd"
    ];

    shell = pkgs.zsh;
    packages = with pkgs; [
      firefox
    ];
  };
}
