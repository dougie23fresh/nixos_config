{ config, pkgs, ... }:

{
  imports = [ 
    ../../modules/home-manager
  ];
  dougieHome.user.enable = true;
  dougieHome.user.userName = "melvin";

  dougieHome.wm.hyprland.enable = true;
  dougieHome.browser.chromium.enable = true;
  dougieHome.browser.vivaldi.enable = true;
  dougieHome.browser.brave.enable = true;
  dougieHome.browser.firefox.enable = true;
  dougieHome.terminal.kitty.enable = true;
  dougieHome.terminal.btop.enable = true;
  dougieHome.terminal.neofetch.enable = true;
  dougieHome.terminal.zsh.enable = true;
  dougieHome.terminal.starship.enable = true;
  dougieHome.terminal.nnn.enable = true;
  dougieHome.terminal.alacritty.enable = true;
  #dougieHome.remote.citrix_workspace = {
  dougieHome.remote.freerdp.enable = true; 
}