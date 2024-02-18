{  lib, config, pkgs, ... }:
{
  ########
  # services
  ########
  # avahi
  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;
  # Battery
  services.system76-scheduler.settings.cfsProfiles.enable = true; # Better scheduling for CPU cycles - thanks System76
  services.tlp.enable = true; # Enable TLP (better than gnomes internal power manager)
  services.tlp.settings = {
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
  };
  services.power-profiles-daemon.enable = false; # Disable GNOMEs power management
  powerManagement.powertop.enable = true; # Enable powertop
  services.thermald.enable = true; # Enable thermald (only necessary if on Intel CPUs)
  # dbus
  services.dbus.enable = true;
  services.dbus.packages = with pkgs; [
    dconf
    gcr
    udisks2
  ];
  # earlyoom #Enable the early OOM (Out Of Memory) killer service.
  services.earlyoom.enable = true;
  services.earlyoom.freeMemThreshold = 5; # When free memory falls below 15%, earlyoom acts to prevent system slowdown or freezing.
  # fingerprint
  services.fprintd.enable = true;
  # flatpak
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  # fstrim
  services.fstrim.enable = true;
  # fwupd
  services.fwupd.enable = true;
  # gvfs
  services.gvfs.enable = true;
  # ipp-usb
  services.ipp-usb.enable = true;
  # journal
  services.journald.extraConfig = "SystemMaxUse=250M\nSystemMaxFiles=10";
  services.journald.rateLimitBurst = 800;
  services.journald.rateLimitInterval = "5s";
  # logind - laptop lid
  services.logind.lidSwitch = "suspend";
  services.logind.lidSwitchExternalPower = "lock";
  # openrgb
  services.hardware.openrgb.enable = true;
  services.hardware.openrgb.motherboard = "amd";
  # openssh
  services.openssh.enable = true;
  # pipewire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };
  # smartd 
  services.smartd.enable = true;
  # printing
  services.printing.enable = true;
  services.printing.drivers = with pkgs; [ 
    brgenml1cupswrapper      # Generic drivers for more Brother printers
    brgenml1lpr              # Generic drivers for more Brother printers
    brlaser                  # Drivers for some Brother printers
    cnijfilter2              # Generic cannon
    gutenprint               # Drivers for many different printers from many different vendors
    gutenprintBin            # Additional, binary-only drivers for some printers
    hplip                    # Drivers for HP printers
    hplipWithPlugin          # Drivers for HP printers, with the proprietary plugin. Use in terminal  NIXPKGS_ALLOW_UNFREE=1 nix-shell -p hplipWithPlugin --run 'sudo -E hp-setup'

  ];
  # ratbagd - configuring gaming mice.
  services.ratbagd.enable = true;
  # redshift
  services.redshift.enable = true;
  services.redshift.temperature.night = 3700;
  # security
  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };
  #security.pam.services.login.enableGnomeKeyring = true;
  #services.gnome.gnome-keyring.enable = true;
  # syncthing
  services.syncthing.enable = true;
  # tailscale
  services.tailscale.enable = true;
  # tumbler
  services.tumbler.enable = true;
  # udev
  #services.udev.enable = true;
  # udisk2
  services.udisks2.enable = true;
  services.devmon.enable = true;
  # yubikey
  services.pcscd.enable = true;
  services.udev.packages = [
    pkgs.libu2f-host
    pkgs.yubikey-personalization
  ];
}