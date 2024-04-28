{  pkgs, ... }:
{
  home.packages = with pkgs; [
    libsForQt5.kdenlive
    glaxnimate # video editing library used by kdenlive

  ];
}
