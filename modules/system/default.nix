{  lib, config, pkgs, ... }:
{
  imports = [
    ./default_pkgs.nix
    ./default_programs.nix
    ./font.nix
    #./hardware.nix
    ./services.nix
    ./systems.nix
    ./users.nix
    #./virtualisation.nix
    #./windowmanager.nix
  ];


}
