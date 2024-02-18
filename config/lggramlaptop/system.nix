{ config, pkgs, ... }:

{
  imports = [ 
    ./hardware.nix
    #../../modules/nixos
    ../../modules/system/default.nix
    ../../modules/system/intel-cpu.nix
    ../../modules/system/intel-gpu.nix
  ];

  system.stateVersion = "23.11";

}