{ config, pkgs, ... }:
{
  security.pam.services = {
    login.u2fAuth = false;
    sudo.u2fAuth = true;
  };

  security.pam.u2f = {
    enable = true;
    cue = true;
  };
}