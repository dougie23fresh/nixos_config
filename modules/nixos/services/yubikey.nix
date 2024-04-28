{  pkgs, ... }:
{
  # yubikey
  services.udev.packages = [
    pkgs.libu2f-host
    pkgs.pam_u2f
    pkgs.gnupg
    pkgs.yubikey-manager
    pkgs.yubikey-personalization
  ];

  services.udev.extraRules = ''
    # Link/unlink ssh key on yubikey add/remove
    SUBSYSTEM=="usb", ACTION=="add", ATTR{idVendor}=="1050", RUN+="${lib.getBin yubikey-up}/bin/yubikey-up"
    SUBSYSTEM=="input", ACTION=="remove", ENV{ID_VENDOR_ID}=="1050", RUN+="${lib.getBin yubikey-down}/bin/yubikey-down"
  '';

  # enable pam services to allow u2f auth for login and sudo
  security.pam.services = {
    login.u2fAuth = true;
    sudo.u2fAuth = true;
  };

  #FIXME /etc/pam.d/sudo is being written but there is other stuff in there with higher order that may be interfering. Also doesn't seem that this will work over ssh either so may have to wait.
  security.pam.u2f = {
    enable = true;
    control = "sufficient";
    cue = true; # A reminder message will be displayed prompting user to use u2f device

    # override defaults `pam://$HOSTNAME` so that they match the keys and work across hosts
    origin = "pam://hostname";
    appId = "pam://hostname";
  };

  # Yubikey required services and config. See Dr. Duh NixOS config for
  # reference
  services.pcscd.enable = true; # smartcard service

}
