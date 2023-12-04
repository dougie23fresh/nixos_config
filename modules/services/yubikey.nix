# yubikey
    pcscd.enable = true;
    udev.packages = [
      pkgs.libu2f-host
      pkgs.yubikey-personalization
    ];
