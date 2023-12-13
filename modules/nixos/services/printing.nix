{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.services.printing;
in
{
  options.dougieHost.services.printing = {
    enable = mkBoolOpt false "printing";
  };

  config = mkIf cfg.enable {
    services.printing.enable = true;
  };
}