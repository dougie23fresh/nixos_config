#labwc
#labwc-tweaks
#labwc-tweaks-gtk
#labwc-menu-generator
#labwc-gtktheme
{pkgs, ...}:
{
   home.packages = with pkgs; [
      foot
      swaybg
      mpd
      waybar
   ];
    xdg.configFile = {
      #"labwc/rc.xml" = {
      #  source = ./labwc/rc.xml;
      #  onChange = "${pkgs.psmisc}/bin/killall -s SIGHUP labwc || true";
      #};
    "labwc/waybar_config.json".source = "./nixos_config/modules/home-manager/window-manager/labwc/config.json";
      "labwc/waybar_style.css".source = "./nixos_config/modules/home-manager/window-manager/labwc/style.json";
      "labwc/autostart" = {
        source = (pkgs.writeShellScriptBin "autostart.sh" ''
            labwc-menu-generator > ~/.config/labwc/menu.xml
            # kanshi >/dev/null 2>&1 &
            swaybg -c '#113344' >/dev/null 2>&1 &
            waybar >/dev/null 2>&1 &
            sfwbar >/dev/null 2>&1 &
            mako >/dev/null 2>&1 &
            # Update the DBus environment
            # systemctl --user import-environment WAYLAND_DISPLAY & dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE &

            # Portals
            # bash -c 'LANG=en /usr/lib/xdg-desktop-portal-gtk & LANG=en /usr/lib/xdg-desktop-portal-gnome' &
            
            
        '') + "/bin/autostart.sh";
        #swayidle
        #${pkgs.dbus}/bin/dbus-update-activation-environment --systemd --all
        executable = true;
      };
      "labwc/environment".text = ''
        XDG_CURRENT_DESKTOP=wlroots
        XKB_DEFAULT_OPTIONS=ctrl:swapcaps
        MOZ_ENABLE_WAYLAND=1
        _JAVA_AWT_WM_NONREPARENTING=1
      '';
    };


}
