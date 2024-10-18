{  pkgs, ... }:
{
  home.packages = with pkgs; [
    unstableModule.freerdp3

  ];
}
