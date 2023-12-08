{ lib, config, pkgs, inputs, ... }: 
{

  imports = [
    #inputs.hyprland.homeManagerModules.default
  ];

   
  #xdg.portal = {
    #extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    #configPackages = [ pkgs.inputs.hyprland.hyprland ];
  #};

  home.packages = with pkgs; [
    
  ];
  xdg.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    #extraConfig = import ./hyprland-config.nix {};
    xwayland.enable = true;
    settings = {
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        cursor_inactive_timeout = 4;
        "col.active_border" = "rgba(33ccffee) rgba(8f00ffee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
      };
      
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

      exec = [
        ##"${pkgs.swaybg}/bin/swaybg -i ${config.wallpaper} --mode fill"
        #"exec-once = nm-applet --indicator"
        "exec-once = waybar"
      ];

      bind = [
        # Program bindings
        #"SUPER,SHIFT, R, exec, hyprctl reload"
        "SUPER,Q, exec, kitty"
        "SUPER,C, killactive"
        "SUPER,M, exit"
        "SUPER,E, exec, thunar"
        "SUPER,V, togglefloating"
        "SUPER,R, exec, wofi --show drun"
        "SUPER,P, pseudo,"
        "SUPER,J, togglesplit,"
        "SUPER,S, exec, rofi -show drun -show-icons"

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

      monitor = [
        "monitor=,preferred,auto,1"
      ];

      workspace = [
        "DP-1,1"
      ];
    };
  };


}