#labwc
#labwc-tweaks
#labwc-tweaks-gtk
#labwc-menu-generator
#labwc-gtktheme
{pkg, ...}:
{
  home-manager.sharedModules = [{
    xdg.configFile = {
      #"labwc/rc.xml" = {
      #  source = ./labwc/rc.xml;
      #  onChange = "${pkgs.psmisc}/bin/killall -s SIGHUP labwc || true";
      #};
      "labwc/autostart" = {
        source = (pkgs.writeShellScriptBin "autostart.sh" ''
            labwc-menu-generator > ~/.config/labwc/menu.xml
            swaybg -c '#113344' >/dev/null 2>&1 &
            waybar >/dev/null 2>&1 &
            sfwbar >/dev/null 2>&1 &
            mako >/dev/null 2>&1 &
            
            
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

  }];
}
