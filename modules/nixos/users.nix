{  pkgs, username, ... }:
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
    programs.zsh.enable = true;
    packages = with pkgs; [
      firefox
    ];
  };
}
