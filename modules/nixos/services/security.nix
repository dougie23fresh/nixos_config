#{  lib, config, pkgs, ... }:
{
   # security
  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';

  };
  #security.pam.services.login.enableGnomeKeyring = true;
  #services.gnome.gnome-keyring.enable = true;
}
