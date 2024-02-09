{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.wm.waybar;

  cat = "${pkgs.coreutils}/bin/cat";
  cut = "${pkgs.coreutils}/bin/cut";
  find = "${pkgs.findutils}/bin/find";
  grep = "${pkgs.gnugrep}/bin/grep";
  pgrep = "${pkgs.procps}/bin/pgrep";
  tail = "${pkgs.coreutils}/bin/tail";
  wc = "${pkgs.coreutils}/bin/wc";
  xargs = "${pkgs.findutils}/bin/xargs";
  timeout = "${pkgs.coreutils}/bin/timeout";
  ping = "${pkgs.iputils}/bin/ping";

  jq = "${pkgs.jq}/bin/jq";
  systemctl = "${pkgs.systemd}/bin/systemctl";
  journalctl = "${pkgs.systemd}/bin/journalctl";
  playerctl = "${pkgs.playerctl}/bin/playerctl";
  playerctld = "${pkgs.playerctl}/bin/playerctld";
  pavucontrol = "${pkgs.pavucontrol}/bin/pavucontrol";
  wofi = "${pkgs.wofi}/bin/wofi";
  hyprlandd = "${pkgs.hyprland}/bin/hyprctl";

  # Function to simplify making waybar outputs
  jsonOutput = name: { pre ? "", text ? "", tooltip ? "", alt ? "", class ? "", percentage ? "" }: "${pkgs.writeShellScriptBin "waybar-${name}" ''
    set -euo pipefail
    ${pre}
    ${jq} -cn \
      --arg text "${text}" \
      --arg tooltip "${tooltip}" \
      --arg alt "${alt}" \
      --arg class "${class}" \
      --arg percentage "${percentage}" \
      '{text:$text,tooltip:$tooltip,alt:$alt,class:$class,percentage:$percentage}'
  ''}/bin/waybar-${name}";
in
{

  options.dougieHome.wm.waybar = {
    enable = mkEnableOption "waybar";
  };

  config = mkIf cfg.enable {
    systemd.user.services.waybar = {
      Unit.StartLimitBurst = 30;
    };
    programs.waybar = {
      enable = true;
      package = pkgs.waybar.overrideAttrs (oa: {
        mesonFlags = (oa.mesonFlags or  [ ]) ++ [ "-Dexperimental=true" ];
      });
      systemd.enable = true;
      settings = {
        primary = {
          # mode = "dock";
          layer = "top";
          position = "top";
          # height = 40;
          # margin = "6";
          # spacing = "4";
          modules-left = [
            "hyprland/workspaces"
            #"hyprland/submap"
          ];
          modules-center = [
            "custom/music"
            #"battery"
            #"clock"
          ];
          modules-right = [
            "custom/hostname"
            "network"
            "bluetooth"
            "pulseaudio"
            "backlight"
            "battery"
            "clock"
            "tray"
            "custom/lock"
            "custom/power"
            #"custom/dunst"
            #"keyboard-state"
            #"custom/hostname"
          ];

          "hyprland/workspaces" = {
            format = "{icon}{windows}";
            on-click = "activate";
            all-outputs = true;
            sort-by-number = true;
            persistent-workspaces = {
              "*" = 5;
            };
          };
          "custom/music" = {
            format = "󰎆  {}";
            escape = true;
            interval = 5;
            tooltip = false;
            exec = "playerctl metadata --format='{{ title }}'";
            on-click = "playerctl play-pause";
            max-length = 50;
          };
          network = {
            format = " {ipaddr}";
            format-wifi = " {ipaddr}";
            format-ethernet = "󰈀 {ipaddr}";
            format-disconected = " Disconnected";
            on-click = "wl-copy $(ip a | grep 'inet ' | tail -n 1 | grep -oP 'inet \\K[\\d.]+')";
            max-length = 50;

            #format = "{icon}";
            #format-alt = "{bandwidthDownBytes} {icon}";
            #format-alt-click = "click-right";
            #format-icons = {
            #  wifi = [ "" "" "" ];
            #  ethernet = [ "" ];
            #  disconnected = [ "睊" ];
            #};
            #on-click": "hyprctl dispatch exec '[float; size 600 600;move 100%-620 70] gnome-control-center wifi'",
            #tooltip-format = "{ipaddr}/{cidr}";
          };
          bluetooth = {
            format = "";
            format-disabled = "";
            format-connected = "";
            tooltip-format = "{controller_alias}\t{controller_address}";
            tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
            tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
            on-click = "blueberry";
          };
          pulseaudio = {
            format = "{icon} {volume}%";
            format-muted = "";
            format-icons = {
              default = ["󰕿" "󰝞" "󰝝"];
            };
            #scroll-step = 10;
            #on-click = "myxer";
            on-click = "pavucontrol";
            # tooltip-format = "At {volume}%";
          };
          backlight = {
              device =  "intel_backlight";
              format = "{icon}";
              #format = "{percent}% {icon}";
              # format-alt = "{time} {icon} ";
              format-icons =  [ "" "" "" "" "" "" "" "" "" ];
              tooltip-format = "At {capacity}%";
              #on-scroll-down = "light -U 10";
              #on-scroll-up = "light -A 10";
          };
          tray = {
            icon-size = 21;
            spacing = 10;
          };
          clock = {
            #interval = 1;
            format = "󰥔  {:%H:%M}";
            format-alt = "󰃭  {:%d/%m/%Y}";
            #on-click = "morgen";
            #on-click-left = "mode";
            tooltip-format = ''<tt><small>{calendar}</small></tt>'';
          };
          battery = {
            #bat = "CMB0";
            #interval = 10;
            format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
            format = "{icon}";
            format-alt = "{icon}";
            tooltip-format = "{capacity}%";
            format-charging = "󰂄";
            format-plugged = "󰚥";
            #onclick = "";
            states = {
              warning = 30;
              critical = 15;
            };
          };
          "custom/hostname" = {
            exec = "echo $USER@$HOSTNAME";
            on-click = "${systemctl} --user restart waybar";
          };
          "custom/dunst" = {
            format = "{}";
            exec = "~/.config/hypr/themes/minimal/waybar/modules/dunst.sh";
            on-click = "dunstctl set-paused toggle";
            restart-interval = 1;
          };
          "custom/lock" = {
            tooltip =  false;
            on-click = "sh -c '(sleep 0.5s; swaylock -f --screenshots --clock --indicator --indicator-radius 100 --indicator-thickness 7 --effect-blur 7x5 --grace 1 --fade-in 0.1)' & disown";
            format = "󰌾";
          };
          "custom/power" = {
            tooltip = false;
            on-click = "wlogout";
            format = " ⏻ ";
          };
        };
      };
      style = ''
        @define-color base   #1e1e2e;
        @define-color mantle #181825;
        @define-color crust  #11111b;

        @define-color text     #cdd6f4;
        @define-color subtext0 #a6adc8;
        @define-color subtext1 #bac2de;

        @define-color surface0 #313244;
        @define-color surface1 #45475a;
        @define-color surface2 #585b70;

        @define-color overlay0 #6c7086;
        @define-color overlay1 #7f849c;
        @define-color overlay2 #9399b2;

        @define-color blue      #89b4fa;
        @define-color lavender  #b4befe;
        @define-color sapphire  #74c7ec;
        @define-color sky       #89dceb;
        @define-color teal      #94e2d5;
        @define-color green     #a6e3a1;
        @define-color yellow    #f9e2af;
        @define-color peach     #fab387;
        @define-color maroon    #eba0ac;
        @define-color red       #f38ba8;
        @define-color mauve     #cba6f7;
        @define-color pink      #f5c2e7;
        @define-color flamingo  #f2cdcd;
        @define-color rosewater #f5e0dc;

        * {
          font-family: FantasqueSansMono Nerd Font;
          font-size: 17px;
          min-height: 0;
        }

        #waybar {
          background: transparent;
          color: @text;
          margin: 5px 5px;
        }

        #workspaces {
          border-radius: 1rem;
          margin: 5px;
          background-color: @surface0;
          margin-left: 1rem;
        }

        #workspaces button {
          color: @lavender;
          border-radius: 1rem;
          padding: 0.4rem;
          box-shadow: inset 0 -3px transparent;
          transition: all 0.5s cubic-bezier(.55,-0.68,.48,1.68);
          background-color: transparent;
          margin-right: 0.4rem;
        }

        #workspaces button.active {
          color: @sky;
          border-radius: 1rem;
        }

        #workspaces button:hover {
          color: @sapphire;
          border-radius: 1rem;
        }

        #custom-music,
        #tray,
        #backlight,
        #clock,
        #battery,
        #pulseaudio,
        #custom-lock,
        #network,
        #bluetooth,
        #custom-power {
          background-color: @surface0;
          padding: 0.5rem 0.5rem;
          margin: 2px 0;
        }

        #clock {
          color: @blue;
          /* border-radius: 0px 1rem 1rem 0px;*/
          /*margin-right: 1rem;*/
          border-radius: 0;
        }

        #battery {
          color: @green;
        }

        #battery.charging {
          color: @green;
        }

        #battery.warning:not(.charging) {
          color: @red;
        }

        #backlight {
          color: @yellow;
        }

        #backlight, #battery {
            border-radius: 0;
        }

        #pulseaudio {
          color: @maroon;
          /*border-radius: 1rem 0px 0px 1rem;*/
          /*margin-left: 1rem;*/
          border-radius: 0;
        }

        #custom-music {
          color: @mauve;
          border-radius: 1rem;
        }

        #network {
          color: @peach;
          /* border-radius: 1rem;*/
          border-radius: 1rem 0px 0px 1rem;
        }

        #bluetooth {
          color: @peach;
          border-radius: 0;
        }

        #custom-lock {
            color: @lavender;
            border-radius: 0;
        }

        #custom-power {
            border-radius: 0px 1rem 1rem 0px;
            color: @red;
        }

        #tray {
          margin-right: 1rem;
        }

      
      '';
    };
  };
}