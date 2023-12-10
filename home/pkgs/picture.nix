{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # pic
    gthumb
    libsForQt5.gwenview
  ];
}