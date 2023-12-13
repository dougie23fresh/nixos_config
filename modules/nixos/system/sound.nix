{ lib, config, pkgs, ...}:
with lib;
let 
  cfg = config.dougieHost.system.sound;
in
{
  options.dougieHost.system.sound = {
    enable = mkBoolOpt false "enable sound";
  };

  config = mkIf cfg.enable {
    sound.enable = true;
    security.rtkit.enable = true;
  };
}