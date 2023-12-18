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
          #mode = "dock";
          #layer = "top";
          height = 40;
          #margin = "6";
          spacing = "4";
          position = "top";
          modules-left = [
            "hyprland/workspaces"
            #"hyprland/submap"
          ];
          modules-center = [
            "battery"
            "clock"
          ];
          modules-right = [
            "tray"
            "custom/dunst"
            "keyboard-state"
            "backlight"
            "pulseaudio"
            "bluetooth"
            "network"
            "custom/hostname"
          ];
          "hyprland/workspaces" = {
            format = "{icon}";
            on-click = "activate";
            sort-by-number = true;
  
          };
          network = {
            format = "{icon}";
            format-alt = "{bandwidthDownBytes} {icon}";
            format-alt-click = "click-right";
            format-icons = {
              wifi = [ "" "" "" ];
              ethernet = [ "" ];
              disconnected = [ "睊" ];
            };
            #on-click": "hyprctl dispatch exec '[float; size 600 600;move 100%-620 70] gnome-control-center wifi'",
            tooltip-format = "{ipaddr}/{cidr}";
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
            format = "{icon}";
            format-muted = "婢";
              format-icons = {
                phone = [ " " " " " " ];
                default = [ "奄" "奔" "墳" ];
              };
              scroll-step = 10;
              on-click = "myxer";
              tooltip-format = "At {volume}%";
          };
          backlight = {
              # "device=  "acpi_video1";
              format = "{percent}% {icon}";
              format-alt = "{time} {icon} ";
              format-icons =  [ "" "" "" "" "" "" "" "" "" ];
              tooltip-format = "At {capacity}%";
              on-scroll-down = "light -U 10";
              on-scroll-up = "light -A 10";
          };
          tray = {
            icon-size = 18;
            spacing = 10;
          };
          clock = {
            interval = 1;
            format = "{:%d/%m %H:%M:%S}";
            format-alt = "{:%Y-%m-%d %H:%M:%S %z}";
            on-click = "morgen";
            on-click-left = "mode";
            tooltip-format = ''
              <big>{:%Y %B}</big>
              <tt><small>{calendar}</small></tt>'';
          };
          battery = {
            #bat = "CMB0";
            interval = 10;
            format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
            format = "{icon} {capacity}%";
            format-charging = "󰂄 {capacity}%";
            onclick = "";
            states = {
              warning = 25;
              critical = 10;
            };
          };
          "custom/hostname" = {
            exec = "echo $USER@$HOSTNAME";
            on-click = "${systemctl} --user restart waybar";
          };
          keyboard-state = {
              numlock = true;
              capslock = true;
              format = "{name} {icon}";
              format-icons = {
                  locked = "";
                  unlocked = "";
              };
          };
          "custom/dunst" = {
            format = "{}";
            exec = "~/.config/hypr/themes/minimal/waybar/modules/dunst.sh";
            on-click = "dunstctl set-paused toggle";
            restart-interval = 1;
          };


        };
      };
      style = ''
        * {
          border: none;
          border-radius: 0;
          font-family: JetbrainsMono Nerd Font, Sans;
          font-size: 18px;
          box-shadow: none;
          text-shadow: none;
          transition-duration: 0s;
        }

        window {
          color: rgba(35, 31, 32, 0.85);
          background: rgba(35, 31, 32, 0.2);
        }

        window#waybar.solo {
          background: rgb(217, 216, 216);
          color: rgba(32, 31, 35, 0.85);
        }
        .modules-left,
        .modules-center,
        .modules-right {
          margin-bottom: 0px;
        }

        .modules-right {
          transition: 0.1s all ease;
          color: #eae9f0;
          background-color: unset;
          transition: 0.1s all ease;
          color: #eae9f0;
          opacity: 1;
          padding: 0px;
        }
        #workspaces {
          font-size: 16px;
          margin-bottom: 0px;
          border-radius: 10px;
          transition: none;
          color: #eae9f0;
          margin-bottom: 0px;
        }

        #workspaces button {
          min-width: 40px;
          transition: 0.1s all ease;
          color: #eae9f0;
          background-color: unset;
          opacity: 0.7;
        }

        #workspaces button:hover {
          opacity: 1;
        }

        #workspaces button.active {
          transition: 0.1s all ease;
          color: #eae9f0;
          background-color: unset;
          transition: 0.1s all ease;
          color: #eae9f0;
          opacity: 1;
        }

        #workspaces button.active:hover {
          transition: 0.04s all ease;
          opacity: 1;
        }
        #mode,
        #battery,
        #cpu,
        #bluetooth #memory,
        #network,
        #pulseaudio,
        #idle_inhibitor,
        #backlight,
        #custom-storage,
        #custom-terminal,
        #custom-spotify,
        #custom-weather,
        #custom-dunst,
        #custom-mail {
          margin: 5px 6px 0px 10px;
          padding-bottom: 3px;
        }

        #clock {
          margin: 0px 16px 0px 10px;
          font-weight: bold;
        }

        #network {
          padding-left: 3px;
          padding-right: 6px;
        }

        #bluetooth {
          padding-right: 2px;
          padding-left: 8px;
          margin-top: 2px;
        }

        #battery {
          padding-left: 0px;
          margin-left: 6px;
        }

        #battery.warning {
          color: #eae9f0;
        }

        #battery.critical {
          color: #eae9f0;
        }

        #battery.charging {
          color: #eae9f0;
        }

        #custom-storage.warning {
          color: #eae9f0;
        }

        #custom-storage.critical {
          color: #eae9f0;
        }

        #apatheia {
          color: #eae9f0;
        }

        #backlight {
          padding-right: 5px;
        }

        #tray {
          font-size: 5px;
          padding: 0px 10px;
          padding-right: 1px;
          border-radius: 5px 0px 0px 5px;
          background-color: rgba(17, 17, 27, 0);
        }

      
      '';
    };
  };
}