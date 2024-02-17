{ config, pkgs, ... }:

{
  imports = [ 
    ./hardware.nix
    ../../modules/nixos
  ];
  nixpkgs.overlays = [(final: prev: 
    rec {
      python = prev.python.override {
        # Careful, we're using a different final and prev here!
        packageOverrides = final: prev: {
          ipython = prev.buildPythonPackage rec {
            pname = "ipython";
            version = "8.18.1";
            src = prev.fetchPypi {
              inherit pname version;
              hash = "sha256-ym8Hm7M0V8ZuIz5FgOv8QSiFW0z2Nw3d1zhCqVY+iic=";
              extension = "tar.bz2";
            };
          };
        };
      };
      python3 = prev.python.override {
        # Careful, we're using a different final and prev here!
        packageOverrides = final: prev: {
          ipython = prev.buildPythonPackage rec {
            pname = "ipython";
            version = "8.18.1";
            src = prev.fetchPypi {
              inherit pname version;
              hash = "sha256-ym8Hm7M0V8ZuIz5FgOv8QSiFW0z2Nw3d1zhCqVY+iic=";
              extension = "tar.bz2";
            };
          };
        };
      };
      python39 = prev.python.override {
        # Careful, we're using a different final and prev here!
        packageOverrides = final: prev: {
          ipython = prev.buildPythonPackage rec {
            pname = "ipython";
            version = "8.18.1";
            src = prev.fetchPypi {
              inherit pname version;
              hash = "sha256-ym8Hm7M0V8ZuIz5FgOv8QSiFW0z2Nw3d1zhCqVY+iic=";
              extension = "tar.bz2";
            };
          };
        };
      };
      # nix-shell -p pythonPackages.my_stuff
      pythonPackages = python.pkgs;
      python3Packages = python3.pkgs;
      python39Packages = python39.pkgs;
      # nix-shell -p my_stuff
      ipython = pythonPackages.buildPythonPackage rec {
        pname = "ipython";
        version = "8.18.1";
        src = pythonPackages.fetchPypi {
          inherit pname version;
          hash = "sha256-ym8Hm7M0V8ZuIz5FgOv8QSiFW0z2Nw3d1zhCqVY+iic=";
          extension = "tar.bz2";
        };
      };
      ipython = python3Packages.buildPythonPackage rec {
        pname = "ipython";
        version = "8.18.1";
        src = python3Packages.fetchPypi {
          inherit pname version;
          hash = "sha256-ym8Hm7M0V8ZuIz5FgOv8QSiFW0z2Nw3d1zhCqVY+iic=";
          extension = "tar.bz2";
        };
      };
      ipython = python39Packages.buildPythonPackage rec {
        pname = "ipython";
        version = "8.18.1";
        src = python39Packages.fetchPypi {
          inherit pname version;
          hash = "sha256-ym8Hm7M0V8ZuIz5FgOv8QSiFW0z2Nw3d1zhCqVY+iic=";
          extension = "tar.bz2";
        };
      };
    }
  )];
  ######
  # system
  ######

  # Bootloader
  dougieHost.system.boot.enable = true;
  # networking
  dougieHost.system.networking.enable = true;
  dougieHost.system.networking.hostName = "lggramlinux";
  # time
  dougieHost.system.time.enable = true;
  # location
  dougieHost.system.location.enable = true;
  # locale
  dougieHost.system.locale.enable = true;
  # sound
  dougieHost.system.sound.enable = true;
  # nix settings
  dougieHost.system.nixSettings.enable = true;
  dougieHost.system.multithreading.enable = true;
  

  #######
  # services
  #######

  # avahi
  dougieHost.services.avahi.enable = true;
  # battery
  dougieHost.services.battery.enable = true;
  dougieHost.services.dbus.enable = true;
  dougieHost.services.fwupd.enable = true;
  dougieHost.services.fstrim.enable = true;
  dougieHost.services.gvfs.enable = true;
  dougieHost.services.pipewire.enable = true;
  dougieHost.services.printing.enable = true;
  dougieHost.services.redshift.enable = true;
  dougieHost.services.syncthing.enable = true;
  dougieHost.services.tailscale.enable = true;
  dougieHost.services.tumbler.enable = true;
  dougieHost.services.yubikey.enable = true;
  dougieHost.services.earlyoom.enable = true;
  


  #######
  # hardware
  #######
  dougieHost.hardware.bluetooth.enable = true;
  #dougieHost.hardware.brillo.enable = true;
  #dougieHost.hardware.fingerprint.enable = true;
  #dougieHost.hardware.i2c.enable = true;
  #dougieHost.hardware.journald.enable = true;
  dougieHost.hardware.laptoplid.enable = true;
  dougieHost.hardware.logitech.enable = true;
  dougieHost.hardware.intel-video.enable = true;
  #dougieHost.hardware.openrgb.enable = true;
  #dougieHost.hardware.storage.enable = true;

  # wm
  dougieHost.wm.gdm.enable = true;
  dougieHost.wm.xfce.enable = true;
  dougieHost.wm.wayland.enable = true;
  dougieHost.wm.hyprland.enable = true;
  dougieHost.wm.sway.enable = true;
  
  # fonts
  dougieHost.fonts.enable = true;
  dougieHost.tools.enable = true;
  
  dougieHost.app.utils.enable = true;
  dougieHost.app.chromium.enable = true;
  # user
  dougieHost.user.enable = true;
  dougieHost.user.userName = "melvin";
  dougieHost.user.userDescription = "Melvin";

  system.stateVersion = "23.11";

}