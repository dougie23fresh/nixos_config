{  lib, config, pkgs, inputs, ... }:
{
  programs.dconf.enable = true;
  programs.file-roller.enable = true;
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  programs.hyprland.portalPackage = pkgs.xdg-desktop-portal-hyprland;

  environment.variables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
      polkit_gnome
      gnome.nautilus
      gnome.zenity
    ];
  };

  services.dbus.enable = true;
  # Make the gnome keyring work properly
  services.dbus.packages = [ pkgs.gnome3.gnome-keyring pkgs.gcr ];
  services.gnome.gnome-keyring.enable = true;
  services.gnome.sushi.enable = true;
  services.gvfs.enable = true;
  # unlock gnome keyring automatically with greetd
  #security.pam.services.greetd.enableGnomeKeyring = true;

  environment.systemPackages = with pkgs; [
    (pkgs.writeScriptBin "hypr-run" ''
    export XDG_SESSION_TYPE="wayland"
    export XDG_SESSION_DESKTOP="Hyprland"
    export XDG_CURRENT_DESKTOP="Hyprland"
    systemd-run --user --scope --collect --quiet --unit="hyprland" \
        systemd-cat --identifier="hyprland" ${pkgs.hyprland}/bin/Hyprland $@
    ${pkgs.hyprland}/bin/hyperctl dispatch exit
    '')
  ];
}