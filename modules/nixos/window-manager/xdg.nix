{ pkgs, ... }:
{
  #xdg.sounds.enable = true;
  #xdg.autostart.enable = true;
  #xdg.icons.enable
  #  xdg.menus.enable
  #xdg.enable = true;
  xdg = {
    portal = {
      enable = true;
      #xdgOpenUsePortal = true;
      xdgOpenUsePortal = false;
      config = {
        common.default = ["gtk"];
        hyprland.default = ["gtk" "hyprland"];
      };
      extraPortals = with pkgs; [
      #  #xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk
        kdePackages.xdg-desktop-portal-kde
        # xdg-desktop-portal-xapp Backend implementation for xdg-desktop-portal for Cinnamon, MATE, Xfce
      ];
    };
  };
}
