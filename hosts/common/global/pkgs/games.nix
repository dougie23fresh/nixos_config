{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    lutris
    steam
    steam-run
    (lutris.override {
      extraPkgs = pkgs: [
        # List package dependencies here
        wineWowPackages.stable
        winetricks
      ];
    })
  ];
}