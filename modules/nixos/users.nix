{  pkgs, username, ... }:
{
  ########
  # users
  ########
  programs.zsh.enable = true;
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
      "dialout"
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
