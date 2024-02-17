{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware.nix
      ../../modules/system/default.nix
      ../../modules/system/amd-cpu.nix
      ../../modules/system/nvidia-gpu.nix
  
    ];

  system.stateVersion = "23.05";
}