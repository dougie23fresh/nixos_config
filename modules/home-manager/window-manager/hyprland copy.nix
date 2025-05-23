{ config, inputs, outputs, pkgs, ... }:
let
  #pointer = config.home.pointerCursor;
  #homeDir = config.home.homeDirectory;
  mod = "SUPER";
  modshift = "${mod}SHIFT";
in
{
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.xwayland.enable = true;
  wayland.windowManager.hyprland.systemd.enable = true;

  services.udiskie.enable = true;
  services.udiskie.tray = "always";
  services.dunst.enable = true;

  services.playerctld.enable = true;
  #home.file.".config/hypr/hyprpaper.conf".source = ./hyprpaper.conf;
  #home.file.".config/hypr/palm-tree-night.jpg".source = ../../../../wallpaper/palm-tree-night.jpg;
  #home.file.".config/fuzzel/fuzzel.ini".source = ./fuzzel.ini;
  home.packages = with pkgs; [
    seatd
    jaq
    xorg.xprop
    kdePackages.xwaylandvideobridge
    playerctl # Command-line utility and library for controlling media players that implement MPRIS
    killall
    polkit_gnome # A dbus session bus service that is used to bring up authentication dialogs
    libva-utils # A collection of utilities and examples for VA-API
    gsettings-desktop-schemas
    wlr-randr # An xrandr clone for wlroots compositors
    wtype # xdotool type for wayland
    wl-clipboard
    wl-screenrec
    cliphist
    wlogout
    hyprland-protocols
    hyprpicker # wlroots-compatible Wayland color picker that does not su
    swayidle # Idle management daemon for Wayland
    gtklock # GTK-based lockscreen for Wayland
    swaybg # Wallpaper tool for Wayland compositors
    swaylock # locking the screen
    fnott # notification daemon
    fuzzel # Wayland-native application launcher
    wev # Wayland event viewer
    grim  # Grab images from a Wayland compositor
    slurp # Select a region in a Wayland compositor
    grimblast
    swappy
    libsForQt5.qt5.qtwayland # A cross-platform application framework for C++
    qt6.qtwayland # A cross-platform application framework for C++
    xdg-utils
    xdg-desktop-portal
    #xdg-desktop-portal-gtk
    bc # GNU software calculator
    mako
    alsa-utils
    mpd # for playing system sounds
    mpc-cli # command-line mpd client
    ncmpcpp # a mpd client with a UI
    networkmanagerapplet # provide GUI app: nm-connection-editor
    #xdg-desktop-portal-hyprland
    wlsunset # Day/night gamma adjustments for Wayland
    pavucontrol # PulseAudio Volume Control
    pamixer # Pulseaudio command line mixer
    #swaylock
    swaylock-fancy
    swaylock-effects
    brightnessctl
    grimblast
    hyprpaper
    wofi
    rofi
    wvkbd
    #cinnamon.nemo
    cinnamon.nemo-with-extensions
    cinnamon.nemo-emblems
    cinnamon.nemo-fileroller
    cinnamon.folder-color-switcher
    dconf
    gtk-engine-murrine
    gnome.gnome-themes-extra
    gtk3
    gtk4
    clipman
    networkmanager_dmenu
    nwg-look
    themechanger
    catppuccin-kvantum
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    qt6Packages.qt6ct

    bitwarden
    bitwarden-cli
    keyutils
    networkmanagerapplet
    ranger
    yewtube
    dosfstools
    libnotify
    foot
    wezterm
    poweralertd
    hyprctl
  ];
  wayland.windowManager.hyprland.settings = {
      "$MOD" = "SUPER";
      env = [
        # NIXOS Environment Variable
        "NIXOS_OZONE_WL, 1"  # Wayland support in Chromium and Electron
        "NIXPKGS_ALLOW_UNFREE, 1"
        # Hyprland Environment Variables
        # Toolkit Backend Variables
        ##"GDK_BACKEND, wayland,x11"  # GTK: Use wayland if available, fall back to x11 if not.
        ##"QT_QPA_PLATFORM, wayland;xcb"  # Qt: Use wayland if available, fall back to x11 if not.
        ##"SDL_VIDEODRIVER, wayland"  # Run SDL2 applications on Wayland. Remove or set to x11 if games that provide older versions of SDL cause compatibility issues
        #"CLUTTER_BACKEND, wayland"  # Clutter package already has wayland enabled, this variable will force Clutter applications to try and use the Wayland backend
        # XDG Specifications
        ##"XDG_CURRENT_DESKTOP, Hyprland"
        ##"XDG_SESSION_TYPE, wayland"
        ##"XDG_SESSION_DESKTOP, Hyprland"
        # Qt Variables
        ##"QT_AUTO_SCREEN_SCALE_FACTOR, 1"  # (From the Qt documentation) enables automatic scaling, based on the monitor’s pixel density
        ##"QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"  # Disables window decorations on Qt applications
        ##"QT_QPA_PLATFORMTHEME, qt5ct"  # Tells Qt based applications to pick your theme from qt5ct, use with Kvantum.
        # NVIDIA Specific
        #"LIBVA_DRIVER_NAME, nvidia"  # Hardware acceleration on NVIDIA GPUs
        # Theming Related Variables
        #"GTK_THEME"  # Set a GTK theme manually, for those who want to avoid appearance tools such as lxappearance or nwg-look
        #"XCURSOR_THEME"  # Set your cursor theme. The theme needs to be installed and readable by your user.
        # "XCURSOR_SIZE"  # Set cursor size. See here for why you might want this variable set.
        "MOZ_ENABLE_WAYLAND, 1"  # irefox with Wayland
        # XDG_SCREENSHOTS_DIR = "$HOME/Pictures/screenshots";
        # vm "WLR_NO_HARDWARE_CURSORS,1"
        # VM "WLR_RENDERER_ALLOW_SOFTWARE,1"
        # nivida "WLR_NO_HARDWARE_CURSORS,1"
      ];
      exec = [
        ##"${pkgs.swaybg}/bin/swaybg -i ${config.wallpaper} --mode fill"
        #"exec-once = nm-applet --indicator"
        #exec-once = dbus-update-activation-environment DISPLAY XAUTHORITY WAYLAND_DISPLAY
        #exec-once = hyprctl setcursor '' + config.gtk.cursorTheme.name + " " + builtins.toString config.gtk.cursorTheme.size + ''
        #exec-once = hyprprofile Personal

        #exec-once = pypr
        #exec-once=wlsunset -l -23 -L -46

        #"exec-once = hyprpaper"
        #"exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "exec-once = dbus-update-activation-environment --systemd --all"
        "exec-once = systemctl --user import-environment QT_QPA_PLATFORMTHEME WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        #"exec-once = hyprctl setcursor '' + config.gtk.cursorTheme.name + " " + builtins.toString config.gtk.cursorTheme.size + ''"

        #"exec-once = swww init"
        #"exec-once = waybar"
        #"exec-once = swaync"
        #"exec-once = wallsetter"
        #"exec-once = dunst"
        #"exec-once = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "exec-once = nm-applet --indicator"
        "exec-once = blueman-applet"
        #"exec-once = swayidle -w timeout 720 'swaylock -f' timeout 800 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' before-sleep 'swaylock -f -c 000000'"

        #"exec-once = swayidle -w timeout 600 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' timeout 605 'swaylock -f --screenshots --clock --indicator --indicator-radius 100 --indicator-thickness 7 --effect-blur 7x5 --grace 1 --fade-in 0.1' before-sleep 'swaylock -f --screenshots --clock --indicator --indicator-radius 100 --indicator-thickness 7 --effect-blur 7x5 --grace 1 --fade-in 0.1'"
        # exec-once = GOMAXPROCS=1 syncthing --no-browser

        #exec-once = swayidle -w timeout 90 '${pkgs.gtklock}/bin/gtklock -d' timeout 210 'suspend-unless-render' resume '${pkgs.hyprland}/bin/hyprctl dispatch dpms on' before-sleep "${pkgs.gtklock}/bin/gtklock -d"
        #exec-once = obs-notification-mute-daemon
        #"exec-once = hyprctl setcursor ${pointer.name} ${toString pointer.size}"
        #"exec-once = hyprlock"
        #"exec-once = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        #"exec-once = wlsunset -t 5200 -S 9:00 -s 19:30"
        "exec-once = wl-paste --type text --watch cliphist store"
        "exec-once = wl-paste --type image --watch cliphist store"
        "exec-once = xprop -root -f _XWAYLAND_GLOBAL_OUTPUT_SCALE 32c -set _XWAYLAND_GLOBAL_OUTPUT_SCALE 1"
        "exec-once = hyprctl dispatcher focusmonitor 1"
        "exec-once = dunst"
        "exec-once = waybar"
      ];
      general = {
        gaps_in = 7;
        gaps_out = 7;
        resize_on_border = true;
        border_size = 2;
        cursor_inactive_timeout = 30;
        no_cursor_warps = false;
        "col.active_border" = "0xffb072d1";
        "col.inactive_border" = "0xff292a37";
      };
      monitor = [
        ",preferred,auto,auto"
        "eDP-1,1920x1080@60,0x0,1"
      ];

      input = {
        kb_layout = "us";
        numlock_by_default = true;
        touchpad.natural_scroll = true;
        #"touchpad.tap-to-click" = true;
        #touchpad.disable_while_typing  = true;
      };
      dwindle.split_width_multiplier = 1.35;
      misc = {
        disable_hyprland_logo  = true;
      };
      layerrule = [
        "blur,waybar"
        "ignorezero,waybar"
      ];
      blurls = [
        "waybar"
        "thunar"
      ];

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 5;
          passes = 1;
          new_optimizations = true;
          ignore_opacity = true;
        };
        active_opacity = 0.94;
        inactive_opacity = 0.75;
        fullscreen_opacity = 1.0;
        drop_shadow = true;
        shadow_range = 4;
        shadow_offset = "3 3";
        #"col.shadow" = "0x44000000";
        "col.shadow" = "rgba(1a1a1aee)";
        "col.shadow_inactive" = "0x66000000";
      };
      animations = {
        enabled = true;
        bezier = [
          "easein,0.11, 0, 0.5, 0"
          "easeout,0.5, 1, 0.89, 1"
          "easeinback,0.36, 0, 0.66, -0.56"
          "easeoutback,0.34, 1.56, 0.64, 1"
        ];

      animation = [
        "windowsIn,1,3,easeoutback,slide"
        "windowsOut,1,3,easeinback,slide"
        "windowsMove,1,3,easeoutback"
        "workspaces,1,2,easeoutback,slide"
        "fadeIn,1,3,easeout"
        "fadeOut,1,3,easein"
        "fadeSwitch,1,3,easeout"
        "fadeShadow,1,3,easeout"
        "fadeDim,1,3,easeout"
        "border,1,3,easeout"
        ];
      };


      bind = [
        "ALT,TAB,cyclenext"
        "ALTSHIFT,TAB,cyclenext,prev"
        # Program bindings
        #"SUPER,SHIFT, R, exec, hyprctl reload"
        "${mod},Q, exec, kitty"
        "${mod},C,killactive"
        "${mod},MINUS,killactive"
        #"${mod},SPACE,exec,run-as-service $(tofi-drun)"
        "SUPER,M, exit"
        "SUPER,E, exec, thunar"
        "SUPER,V, togglefloating"
        "SUPER,D, exec,fuzzel"
        "SUPERSHIFT,S, exec,grimblast copy area"
        "SUPER,X, exec,wlogout"
        "SUPER,R, exec, wofi --show drun"
        "SUPER,P, pseudo,"
        "SUPER,J, togglesplit,"
        "SUPER,S, exec, rofi -show drun -show-icons"
        "SUPER,L, exec,swaylock -f --screenshots --clock --indicator --indicator-radius 100 --indicator-thickness 7 --effect-blur 7x5 --grace 1 --fade-in 0.1"
        # Move focus with mainMod + arrow keys
        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        "SUPER SHIFT, 6, movetoworkspace, 6"
        "SUPER SHIFT, 7, movetoworkspace, 7"
        "SUPER SHIFT, 8, movetoworkspace, 8"
        "SUPER SHIFT, 9, movetoworkspace, 9"
        "SUPER SHIFT, 0, movetoworkspace, 10"

        # Scroll through existing workspaces with mainMod + scroll
        "SUPER, mouse_down, workspace, e+1"
        "SUPER, mouse_up, workspace, e-1"

        #"SUPER,b,exec,${browser}"
        # Brightness control (only works if the system has lightd)
        ",XF86MonBrightnessUp,exec,light -A 10"
        ",XF86MonBrightnessDown,exec,light -U 10"
        #"XF86AudioRaiseVolume,exec,amixer -D pipewire sset Master 5%+"
        #"XF86AudioLowerVolume,exec,amixer -D pipewire sset Master 5%-"
        #"XF86AudioMute,exec,amixer -D pipewire sset Master 1+ toggle"
        #bind=,code:122,exec,pamixer -d 10
        # bind=,code:123,exec,pamixer -i 10
        # bind=,code:121,exec,pamixer -t
        # bind=,code:256,exec,pamixer --default-source -t
        # bind=SHIFT,code:122,exec,pamixer --default-source -d 10
        # bind=SHIFT,code:123,exec,pamixer --default-source -i 10
        # bind=,code:232,exec,brightnessctl set 15-
        # bind=,code:233,exec,brightnessctl set +15
        # bind=,code:237,exec,brightnessctl --device='asus::kbd_backlight' set 1-
        # bind=,code:238,exec,brightnessctl --device='asus::kbd_backlight' set +1
        # bind=,code:255,exec,airplane-mode
        #bind=SUPERSHIFT,S,exec,gtklock -d & sleep 1 && systemctl suspend
        # bind=SUPERCTRL,L,exec,gtklock -d
        # Volume
        #",XF86AudioRaiseVolume,exec,${pactl} set-sink-volume @DEFAULT_SINK@ +5%"
        #",XF86AudioLowerVolume,exec,${pactl} set-sink-volume @DEFAULT_SINK@ -5%"
        #",XF86AudioMute,exec,${pactl} set-sink-mute @DEFAULT_SINK@ toggle"
        #"SHIFT,XF86AudioMute,exec,${pactl} set-source-mute @DEFAULT_SOURCE@ toggle"
        #",XF86AudioMicMute,exec,${pactl} set-source-mute @DEFAULT_SOURCE@ toggle"
        # Screenshotting
        #",Print,exec,${grimblast} --notify --freeze copy output"
        ##"SHIFT,Print,exec,${grimblast} --notify --freeze copy active"
        #"CONTROL,Print,exec,${grimblast} --notify --freeze copy screen"
        #"SUPER,Print,exec,${grimblast} --notify --freeze copy area"
        # "ALT,Print,exec,${grimblast} --notify --freeze copy area"
        # Tally counter
        #"SUPER,z,exec,${notify-send} -t 1000 $(${tly} time) && ${tly} add && ${gtk-play} -i dialog-information" # Add new entry
        #"SUPERCONTROL,z,exec,${notify-send} -t 1000 $(${tly} time) && ${tly} undo && ${gtk-play} -i dialog-warning" # Undo last entry
        #"SUPERCONTROLSHIFT,z,exec,${tly} reset && ${gtk-play} -i complete" # Reset
        #"SUPERSHIFT,z,exec,${notify-send} -t 1000 $(${tly} time)" # Show current time
        # Media control
        #",XF86AudioNext,exec,${playerctl} next"
        #",XF86AudioPrev,exec,${playerctl} previous"
        #",XF86AudioPlay,exec,${playerctl} play-pause"
        #",XF86AudioStop,exec,${playerctl} stop"
        #"ALT,XF86AudioNext,exec,${playerctld} shift"
        #"ALT,XF86AudioPrev,exec,${playerctld} unshift"
        #"ALT,XF86AudioPlay,exec,systemctl --user restart playerctld"
        # Screen lock
        #",XF86Launch5,exec,${swaylock} -S"
        #",XF86Launch4,exec,${swaylock} -S"
        # "SUPER,backspace,exec,${swaylock} -S"
        # Notification manager
        #"SUPER,w,exec,${makoctl} dismiss"
        # Launcher
        #"SUPER,x,exec,${wofi} -S drun -x 10 -y 10 -W 25% -H 60%"
        #"SUPER,d,exec,${wofi} -S run"
      ];

    };
}
