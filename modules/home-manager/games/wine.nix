
{  pkgs, ... }:
{
  home.packages = with pkgs; [
    wine # Execute Window$ programs
    winetricks # Execute Window$ programs

  ];
}
