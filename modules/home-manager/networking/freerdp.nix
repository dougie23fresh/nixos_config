{  pkgs, pkgs-unstable, ... }:
{
  home.packages = with pkgs-unstable; [
    freerdp3
    krb5

  ];
}
