# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "hpeliteboox"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";
  time.hardwareClockInLocalTime = true;
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Games setting
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;
  nixpkgs.config.allowUnfreePredicate = (pkg: builtins.elem (builtins.parseDrvName pkg.name).name [ "steam" ]);
  nix.settings = {
    substituters = ["https://nix-gaming.cachix.org"];
    trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
  };
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the XFCE Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
  # services.gnome-keyring.enable = true;
  # packages.picom.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
  powerManagement.enable = true;
  #powerManagement.powertop.enable = true;
  # Firmware updater
  services.fwupd.enable = true;
  # userspace virtual filesystem
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  # Thumbnail support for images
  services.tumbler.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  services.tailscale.enable = true;
  services.syncthing.enable = true;
  #services.syncthing.systemService = true;
  services.clipman.enable = true;
  services.tlp.enable = true;
  services.tlp.settings = {
    CPU_SCALING_GOVERNOR_ON_AC = "performance";
    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

    CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
    CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

    CPU_MIN_PERF_ON_AC = 0;
    CPU_MAX_PERF_ON_AC = 100;
    CPU_MIN_PERF_ON_BAT = 0;
    CPU_MAX_PERF_ON_BAT = 20;
  };
  # Battery power management
  services.upower.enable = true;

  services.hardware.bolt.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.redshift.enable = true;
  services.redshift.provider = "manual";
  services.redshift.latitude = "26.006409";
  services.redshift.longitude = "-90.229664";
  services.redshift.temperature.night = 1500;
  # yubikey
  services.pcscd.enable = true;
  services.udev.packages = [
    pkgs.libu2f-host
    pkgs.yubikey-personalization
  ];
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  programs.thunar.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
    thunar-media-tags-plugin
  ];
  programs.neovim.enable = true;
  programs.neovim.withPython3 = true;
  programs.zsh.enable = true;

  # programs.neovim.configure


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.melvin = {
    isNormalUser = true;
    description = "melvin";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
    #  thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
    # web
    vivaldi
    vivaldi-ffmpeg-codecs
    microsoft-edge
    chromium
    # work
    citrix_workspace
    webex
    freerdp
    # network
    tailscale
    tailscale-systray
    # app runtime
    appimage-run
    flatpak
    # video
    ffmpeg
    mpv
    vlc
    # pic
    gthumb
    libsForQt5.gwenview
    # themes
    plano-theme
    zuki-themes
    stilo-themes
    amber-theme
    numix-gtk-theme
    catppuccin-gtk
    gnome-icon-theme
    vimix-icon-theme
    tela-icon-theme
    pop-icon-theme
    qogir-icon-theme
    numix-icon-theme
    pop-gtk-theme
    colloid-gtk-theme
    fluent-gtk-theme
    arc-theme
    venta
    qogir-theme
    nordic
    # comand line
    w3m
    neofetch
    fontconfig
    freetype
    wget
    htop
    # other
    libverto
    luarocks
    obsidian
    redshift
    xclip
    brightnessctl
    dia
    nix-output-monitor
    okular
    libnotify
    mate.mate-calc
    # font
    terminus-nerdfont
    fontconfig
    freetype
    dejavu_fonts
    gentium
    yanone-kaffeesatz
    emojione
    #fwupd
    firmware-manager
    # term
    wezterm
    # music
    rhythmbox
    # xfce
    xfce.xfce4-clipman-plugin
    xfce.xfce4-dict
    xfce.xfce4-pulseaudio-plugin
    xfce.xfce4-whiskermenu-plugin
    xfce.xfce4-weather-plugin
    xfce.xfce4-notes-plugin
    xfce.xfce4-verve-plugin
    xfce.xfce4-screensaver
    xfce.xfce4-screenshooter
    xfce.xfdashboard
    ulauncher
    xorg.libX11
    xorg.libX11.dev
    xorg.libxcb
    xorg.libXft
    xorg.libXinerama
    xorg.xinit
    xorg.xinput
    # games
    lutris
    steam
    steam-run
    (lutris.override {
      extraPkgs = pkgs: [
        # List package dependencies here
        wineWowPackages.stable
        winetricks
      ];
    })
    # code
    kate
    gcc
    git
    vscode
    vscode-extensions.ms-python.python
    vscode-extensions.ms-python.vscode-pylance
    vscode-extensions.dracula-theme.theme-dracula
    vscode-extensions.nonylene.dark-molokai-theme
    vscode-extensions.jdinhlife.gruvbox
    vscode-extensions.catppuccin.catppuccin-vsc
    (python3.withPackages(ps: with ps; [
       urllib3
       pandas
       pip
       requests
       flake8
       pylint
       pyflakes
       rich
       python-box
       xmltodict
    ]))
    #yubikey
    opensc
    pcsctools
    libu2f-host
    yubikey-personalization
  ];
  fonts.fonts = with pkgs-unstable; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    ibm-plex
    fira-code
    fira-code-symbols
  ];
  xfconf.settings.thunar = let
  #listToCommaStringList = l: commaList (map builtins.toString l);
  in {
    # Display > View settings
    "/misc-folders-first" = true; # Sort folders before files
    "/misc-file-size-binary" = true; # Show file size in binary format
    # Display > Thumbnails
    "/misc-thumbnail-mode" = "THUNAR_THUMBNAIL_MODE_ONLY_LOCAL"; # Local files only
    "/misc-thumbnail-max-file-size" = 1048576 * 100; # Only show thumbnails for files smaller than 100MiB
    "/misc-thumbnail-draw-frames" = true;
    # Display > Icon view
    "/misc-text-beside-icons" = true;
    # Display > Window icon
    "/misc-change-window-icon" = false;
    "/misc-full-path-in-window-title" = true; # hidden
    # View defaults: default view
    "/default-view" = "void"; # View new folders using "last active view"
    "/last-view" = "ThunarCompactView";
    "/last-show-hidden" = true;
  };
  xfconf.settings.xfwm4 = let
  in {
    "general/activate_action" = "bring";
    "general/borderless_maximize" = true;
    "general/box_move" = false;
    "general/box_resize" = false;
    "general/button_layout" = "O|SHMC";
    "general/button_offset" = 0;
    "general/button_spacing" = 0;
    "general/click_to_focus" = true;
    "general/cycle_apps_only" = false;
    "general/cycle_draw_frame" = true;
    "general/cycle_raise" = false;
    "general/cycle_hidden" = true;
    "general/cycle_minimum" = true;
    "general/cycle_minimized" = false;
    "general/cycle_preview" = true;
    "general/cycle_tabwin_mode" = 0;
    "general/cycle_workspaces" = false;
    "general/double_click_action" = "maximize";
    "general/double_click_distance" = 5;
    "general/double_click_time" =250;
    "general/easy_click" = "Alt";
    "general/focus_delay" = 250;
    "general/focus_hint" = true;
    "general/focus_new" = true;
    "general/frame_opacity" = 100;
    "general/frame_border_top" = 0;
    "general/full_width_title" = true;
    "general/horiz_scroll_opacity" = false;
    "general/inactive_opacity" = 100;
    "general/maximized_offset" = 0;
    "general/mousewheel_rollup" = true;
    "general/move_opacity" = 100;
    "general/placement_mode" ="center";
    "general/placement_ratio" = 20;
    "general/popup_opacity" = 100;
    "general/prevent_focus_stealing" = false;
    "general/raise_delay" = 250;
    "general/raise_on_click" = true;
    "general/raise_on_focus" = false;
    "general/raise_with_any_button" = true;
    "general/repeat_urgent_blink" = false;
    "general/resize_opacity" =100;
    "general/scroll_workspaces" = true;
    "general/shadow_delta_height" = 0;
    "general/shadow_delta_width" = 0;
    "general/shadow_delta_x" = 0;
    "general/shadow_delta_y" = -3;
    "general/shadow_opacity" = 50;
    "general/show_app_icon" = false;
    "general/show_dock_shadow" = false;
    "general/show_frame_shadow" = true;
    "general/show_popup_shadow" = false;
    "general/snap_resist" = false;
    "general/snap_to_border" = true;
    "general/snap_to_windows" = false;
    "general/snap_width" = 10;
    "general/vblank_mode" = "auto";
    # "general/theme" = "Yaru-dark";
    "general/tile_on_move" = true;
    "general/title_alignment" = "center";
    "general/title_font" = "Sans Bold 9";
    "general/title_horizontal_offset" = 0;
    "general/titleless_maximize" = false;
    "general/title_shadow_active"  = false;
    "general/title_shadow_inactive" = false;
    "general/title_vertical_offset_active" = 0;
    "general/title_vertical_offset_inactive" = 0;
    "general/toggle_workspaces" = false;
    "general/unredirect_overlays" = true;
    "general/urgent_blink" = false;
    "general/use_compositing" = true;
    "general/workspace_count" = 4;
    "general/wrap_cycle" = true;
    "general/wrap_layout" = true;
    "general/wrap_resistance" = 10;
    "general/wrap_windows" = true;
    "general/wrap_workspaces" = false;
    "general/zoom_desktop" = true;
    "general/zoom_pointer" = true;
    "general/workspace_names" = [ "Workspace 1" "Workspace 2" "Workspace 3" "Workspace 4" ];
  };
  xfconf.settings.xfwm4 = let
  in {
    #"/Net/ThemeName" = "Yaru-purple-dark";
    #"/Net/IconThemeName" = "Papirus-Dark";
    "/Gtk/DecorationLayout" = "menu:minimize,maximize,close";
    "/Gtk/ShellShowsMenubar" = true;
    "/Gtk/ShellShowsAppmenu" = true;
    "/Gtk/Modules" = "appmenu-gtk-module";
  };
  xfconf.settings.xfdashboard = let
  in {
    "theme" = "unicorn-dashboard";
    "enabled-plugins" = [ "clock-view" "gnome-shell-search-provider" "recently-used-search-provider" ];
    "enable-animations" = false;
  };
  xfconf.settings.xfce4-panel = let
  in {
    "configver" = 2;
    "panels" = [ 1 ];
    "panels/dark-mode" = true;
    "panels/panel-1/position" = "p=6;x=960;y=20";
    "panels/panel-1/position-locked" = true;
    "panels/panel-1/icon-size" = "22";
    "panels/panel-1/size" = "38";
    "panels/panel-1/plugin-ids" = [ 15 6 3 5 8 4 7 2 9 12 1 ]
    "panels/panel-1/enter-opacity" = 93;
    "panels/panel-1/leave-opacity" = 93;
    "panels/panel-1/background-style" = 1;
    "panels/panel-1/background-rgba" = [ 0.082714666666666659 0.05373333333333332 0.13 1.0 ]
    "plugins/plugin-1" = "separator";
    "plugins/plugin-1/style" = 0;
    "plugins/plugin-2" = "pulseaudio";
    "plugins/plugin-2/enable-keyboard-shortcuts" = true;
    "plugins/plugin-3" = "separator";
    "plugins/plugin-3/style" = 0;
    "plugins/plugin-3/expand" = false;
    "plugins/plugin-4" = "systray";
    "plugins/plugin-4/known-legacy-items" = [ "networkmanager applet" "network" "ibus panel" ];
    "plugins/plugin-4/known-items" = [ "chrome_status_icon_1" "blueman" "nm-applet" ];
    "plugins/plugin-4/hidden-items" = [ "nm-applet" ];
    "plugins/plugin-4/square-items" = true;
    "plugins/plugin-4/hidden-legacy-items" = [ "networkmanager applet" ];
    "plugins/plugin-4/symbolic-icons" = true;
    "plugins/plugin-4/single-row" = false;
    "plugins/plugin-4/hide-new-items" = false;
    "plugins/plugin-4/icon-size" = 22;
    "plugins/plugin-4/menu-is-primary" = false;
    "plugins/plugin-5" = "separator";
    "plugins/plugin-5/style" = 0;
    "plugins/plugin-5/expand" = true;
    "plugins/plugin-6" = "appmenu";
    "plugins/plugin-6/plugins/plugin-6/compact-mode" = false;
    "plugins/plugin-6/plugins/plugin-6/bold-application-name" = true;
    "plugins/plugin-6/plugins/plugin-6/expand" = false;
    "plugins/plugin-7" = "notification-plugin";
    "plugins/plugin-8" = "separator";
    "plugins/plugin-8/style" = 0;
    "plugins/plugin-8/expand" = true;
    "plugins/plugin-9" = "power-manager-plugin";
    "plugins/plugin-12/digital-date-format" = "%d %b %Y";
    "plugins/plugin-12/digital-layout" = 3;
    "plugins/plugin-12/digital-time-format" = "%a %b %d  %Y  %_I:%M %p";
    "plugins/plugin-12/digital-time-font" = "Ubuntu Medium 14";
    "plugins/plugin-15" = "launcher";


  };
  xfconf.settings.xfce4-keyboard-shortcuts = let
  in {
    "/commands/custom/<Alt>F3" = "xfce4-appfinder";
    "/commands/custom/<Alt>F3/startup-notify" = true;
    "/commands/custom/<Primary><Alt>Delete" = "xfce4-session-logout";
    "/commands/custom/<Super>f" = "exo-open --launch FileManager";
    "/commands/custom/<Alt>F1" = "xfce4-popup-applicationsmenu";
    "/commands/custom/<Super>w" = "exo-open --launch WebBrowser";
    "/commands/custom/<Super>l" = "";
    "/commands/custom/<Primary><Alt>t" = "exo-open --launch TerminalEmulator";
    "/commands/custom/<Primary><Alt>t/startup-notify" = true;
    "/commands/custom/<Super>r" = "xfrun4";
    "/commands/custom/<Super>r/startup-notify" = true;
    "/commands/custom/XF86Music" = "rhythmbox";
    "/commands/custom/Print" = "xfce4-screenshooter -f";
    "/commands/custom/<Primary><Alt>Escape" = "xkill";
    "/commands/custom/<Alt>F2" = "xfrun4";
    "/commands/custom/<Alt>F2/startup-notify" = true;
    "/commands/custom/XF86Explorer" = "exo-open --launch FileManager";
    "/commands/custom/<Super>m" = "exo-open --launch MailReader";
    "/commands/custom/<Primary>Escape" = "xfce4-popup-whiskermenu";
    "/commands/custom/<Primary><Shift>Escape" = "xfce4-taskmanager";
    "/commands/custom/<Alt><Super>s" = "orca";
    "/commands/custom/XF86Calculator" = "mate-calc";
    "/commands/custom/<Super>t" = "exo-open --launch TerminalEmulator";
    "/commands/custom/XF86HomePage" = "exo-open --launch WebBrowser";
    "/commands/custom/<Primary><Alt>f" = "exo-open --launch FileManager";
    "/commands/custom/HomePage" = "exo-open --launch WebBrowser";
    "/commands/custom/<Alt>Print" = "xfce4-screenshooter -w";
    "/commands/custom/<Super>F1" = "xfce4-find-cursor";
    "/commands/custom/<Alt>Pause" = "xfce4-popup-whiskermenu";
    "/commands/custom/<Primary><Alt>l" = "xflock4";
    "/commands/custom/XF86Display" = "xfce4-display-settings --minimal";
    "/commands/custom/XF86Mail" = "exo-open --launch MailReader";
    "/commands/custom/<Super>Print" = "xfce4-screenshooter -r";
    "/commands/custom/<Super>p" = "xfce4-display-settings --minimal";
    "/commands/custom/<Super>e" = "exo-open --launch FileManager";
    "/commands/custom/XF86WWW" = "exo-open --launch WebBrowser";
    "/commands/custom/override" = true;
    "/commands/custom/<Super>d" = "xfdashboard";
    #"/commands/custom/<Super>a" = "lightpad";
    "/xfwm4/custom/default/<Primary>F12" = "workspace_12_key";
    "/xfwm4/custom/default/<Super>KP_Down" = "tile_up_key";
    "/xfwm4/custom/default/<Alt>F4" = "close_window_key";
    "/xfwm4/custom/default/<Primary><Alt>KP_3" = "move_window_workspace_3_key";
    "/xfwm4/custom/default/<Primary>F2" = "workspace_2_key";
    "/xfwm4/custom/default/<Primary>F6" = "workspace_6_key";
    "/xfwm4/custom/default/<Primary><Alt>Right" = "down_workspace_key";
    "/xfwm4/custom/default/<Primary><Alt>KP_9" = "move_window_workspace_9_key";
    "/xfwm4/custom/default/<Super>KP_Up" = "tile_down_key";
    "/xfwm4/custom/default/<Primary><Alt>End" = "move_window_next_workspace_key";
    "/xfwm4/custom/default/<Primary>F8" = "workspace_8_key";
    "/xfwm4/custom/default/<Primary><Shift><Alt>Left" = "move_window_left_key";
    "/xfwm4/custom/default/<Super>KP_Right" = "tile_right_key";
    "/xfwm4/custom/default/<Primary><Alt>KP_4" = "move_window_workspace_4_key";
    "/xfwm4/custom/default/Right" = "right_key";
    "/xfwm4/custom/default/Down" = "down_key";
    "/xfwm4/custom/default/<Primary>F3" = "workspace_3_key";
    "/xfwm4/custom/default/<Shift><Alt>Page_Down" = "lower_window_key";
    "/xfwm4/custom/default/<Primary>F9" = "workspace_9_key";
    "/xfwm4/custom/default/<Alt>Tab" = "cycle_windows_key";
    "/xfwm4/custom/default/<Primary><Shift><Alt>Right" = "move_window_right_key";
    "/xfwm4/custom/default/<Primary><Alt>Down" = "right_workspace_key";
    "/xfwm4/custom/default/<Alt>F6" = "stick_window_key";
    "/xfwm4/custom/default/<Primary><Alt>KP_5" = "move_window_workspace_5_key";
    "/xfwm4/custom/default/<Primary>F11" = "workspace_11_key";
    "/xfwm4/custom/default/<Alt>F10" = "maximize_window_key";
    "/xfwm4/custom/default/<Alt>Delete" = "del_workspace_key";
    "/xfwm4/custom/default/<Super>Tab" = "switch_window_key";
    "/xfwm4/custom/default/<Primary><Alt>d" = "show_desktop_key";
    "/xfwm4/custom/default/<Primary>F4" = "workspace_4_key";
    "/xfwm4/custom/default/<Super>KP_Page_Up" = "tile_up_right_key";
    "/xfwm4/custom/default/<Alt>F7" = "move_window_key";
    "/xfwm4/custom/default/Up" = "up_key";
    "/xfwm4/custom/default/<Primary><Alt>KP_6" = "move_window_workspace_6_key";
    "/xfwm4/custom/default/<Alt>F11" = "fullscreen_key";
    "/xfwm4/custom/default/<Alt>space" = "popup_menu_key";
    "/xfwm4/custom/default/<Super>KP_Home" = "tile_up_left_key";
    "/xfwm4/custom/default/Escape" = "cancel_key";
    "/xfwm4/custom/default/<Primary><Alt>KP_1" = "move_window_workspace_1_key";
    "/xfwm4/custom/default/<Super>KP_Next" = "tile_down_right_key";
    "/xfwm4/custom/default/<Super>KP_Left" = "tile_left_key";
    "/xfwm4/custom/default/<Shift><Alt>Page_Up" = "raise_window_key";
    "/xfwm4/custom/default/<Primary><Alt>Home" = "move_window_prev_workspace_key";
    "/xfwm4/custom/default/<Alt><Shift>Tab" = "cycle_reverse_windows_key";
    "/xfwm4/custom/default/<Primary><Alt>Up" = "left_workspace_key";
    "/xfwm4/custom/default/<Alt>F12" = "above_key";
    "/xfwm4/custom/default/<Primary><Shift><Alt>Up" = "move_window_up_key";
    "/xfwm4/custom/default/<Primary>F5" = "workspace_5_key";
    "/xfwm4/custom/default/<Alt>F8" = "resize_window_key";
    "/xfwm4/custom/default/<Primary><Alt>KP_7" = "move_window_workspace_7_key";
    "/xfwm4/custom/default/<Primary><Alt>KP_2" = "move_window_workspace_2_key";
    "/xfwm4/custom/default/<Super>KP_End" = "tile_down_left_key";
    "/xfwm4/custom/default/<Primary><Alt>Left" = "up_workspace_key";
    "/xfwm4/custom/default/<Alt>F9" = "hide_window_key";
    "/xfwm4/custom/default/<Primary>F7" = "workspace_7_key";
    "/xfwm4/custom/default/<Primary>F10" = "workspace_10_key";
    "/xfwm4/custom/default/Left" = "left_key";
    "/xfwm4/custom/default/<Primary><Alt>KP_8" = "move_window_workspace_8_key";
    "/xfwm4/custom/default/<Alt>Insert" = "add_workspace_key";
    "/xfwm4/custom/default/<Primary>F1" = "workspace_1_key";
    "/xfwm4/custom/override" = true;
    "/providers" = [ "xfwm4" "commands" ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This  determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this  at the release version of the first install of this system.
  # Before changing this  read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
  ## Backups & Upgrades
  # Backup system config
  system.copySystemConfiguration = true;
  # System Upgrades
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  ## Garbage Collection
  # Automatic Garbage Collection
  nix.gc = {
                automatic = true;
                dates = "weekly";
                options = "--delete-older-than 3d";
          };
}
