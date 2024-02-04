{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.wm.plasma;
in
{
  options.dougieHost.wm.plasma = {
    enable = mkEnableOption "plasma";
  };

  config = mkIf cfg.enable {
    services.xserver.displayManager.sddm.enable = true;
    services.xserver.desktopManager.plasma5.enable = true;
    services.xserver.videoDrivers = [
        #"displaylink" # For the DELL docks at work
        "modesetting" # Standard driver
        "fbdev" # Enabled by default in NixOS
    ];
    environment.systemPackages = with pkgs; [
        xdotool # Tools to automate mouse and keyboard in X
        wtype # Wayland version of xdotools
        libsForQt5.qt5.qttools # qdbus command comes from here
        ksystemlog # KDE syslog viewer
        kgpg # KDE pgp tool
        copyq # Clipboard manager
        kate # KDE text editor
        libsForQt5.kdeconnect-kde # Integrate your DE with things
    libsForQt5.plasma-browser-integration # Integrate KDE with 
    libsForQt5.kcalc # KDE calculator
    ark                            # Graphical file compression/decompression utility
     filelight                      # Disk usage statistics
     kdiff3                         # Compares and merges 2 or 3 files or directories
      krename                        # A powerful batch renamer for KDE
      libsForQt5.kweather            # Weather application for Plasma Mobile
      libsForQt5.kweathercore        # Library to facilitate retrieval of weather information including forecasts and alerts 
      libsForQt5.quazip             # Provides access to ZIP archives from Qt 5 programs
                                    # quazip
    ];

  };
}