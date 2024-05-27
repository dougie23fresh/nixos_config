#{  lib, config, pkgs, ... }:
{
  # syncthing
  services.syncthing.enable = true;
  #services.syncthing.user = "${username}";
  #services.syncthing.dataDir = "/home/${username}";    # Default folder for new synced folders
  #services.syncthing.configDir = "/home/${username}/.config/syncthing";   # Folder for Syncthing's settings and keys
}
