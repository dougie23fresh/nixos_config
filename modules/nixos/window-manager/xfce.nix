#{  lib, config, pkgs, inputs, ... }:
{
  services.xserver.desktopManager.xfce.enable = true;
  environment.systemPackages = with pkgs; [
    networkmanagerapplet # NetworkManager control applet for GNOME
    xdg-user-dirs # A tool to help manage well known user directories like the desktop folder and the music folder
    xorg.xrandr
    findex # Highly customizable application finder written in Rust and uses Gtk3
    i3lock-color # A simple screen locker like slock, enhanced version with extra configuration options
    picom # A fork of XCompMgr, a sample compositing manager for X servers
    qt6Packages.qtstyleplugin-kvantum # SVG-based Qt theme engine plus a config tool and extra themes
    roboto # The Roboto family of fonts
    roboto-mono # Google Roboto Mono fonts
    xfce.xfwm4-themes
    papirus-icon-theme
    numix-icon-theme
    numix-cursor-theme
    dracula-icon-theme
    arc-icon-theme
    fluent-gtk-theme
    dracula-theme
    colloid-gtk-theme
    graphite-cursors
    #] ++ (with pkgs.xfce; [
    #  ristretto # A fast and lightweight picture-viewer for the Xfce desktop environment
    #  xfce4-appfinder # Appfinder for the Xfce4 Desktop Environment
    #  #xfce4-cpugraph-plugin # CPU graph show for Xfce panel
    #  xfce4-panel # Panel for the Xfce desktop environment
    #  xfce4-power-manager # A power manager for the Xfce Desktop Environment
    #  #xfce4-pulseaudio-plugin # Adjust the audio volume of the PulseAudio sound system
    #  xfce4-screenshooter # Screenshot utility for the Xfce desktop
    #  xfce4-session # Session manager for Xfce
    #  #xfce4-settings # Settings manager for Xfce
    #  xfce4-taskmanager # Easy to use task manager for Xfce
    #  #xfce4-whiskermenu-plugin # Alternate application launcher for Xfce
    #  xfdesktop # Xfce's desktop manager
    #  xfwm4 # Window manager for Xfce
    #  zuki-themes
      #genmon-cpu
      #genmon-datetime
      #genmon-mem
      #i3lock-everblush
  ];
}
