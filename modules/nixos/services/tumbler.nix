{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.services.tumbler;
in
{
  options.dougieHost.services.tumbler = {
    enable = mkEnableOption "tumbler";
  };

  config = mkIf cfg.enable {
    services.tumbler.enable = true;
  };
}