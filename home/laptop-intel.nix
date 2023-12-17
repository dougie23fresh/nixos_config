{ config, pkgs, ... }:

{
  imports = [ 
    ../modules/home-manager
  ];
  dougieHome.user.enable = true;
  dougieHome.user.userName = "melvin";

  dougieHome.wm.hyprland.enable = true;
}