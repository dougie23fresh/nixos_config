{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.system.boot;
in
{
  options.dougieHost.system.boot = {
    enable = mkBoolOpt false "Whether or not to enable booting.";
  };

  config = mkIf cfg.enable {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  };
}