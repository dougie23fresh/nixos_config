{ options, config, lib, pkgs, ... }:

with lib;
with lib.plusultra;
let
  cfg = config.plusultra.suites.video;
in
{
  options.plusultra.suites.video = with types; {
    enable = mkBoolOpt false "Whether or not to enable video configuration.";
  };

  config = mkIf cfg.enable {
    plusultra = {
      apps = {
        pitivi = enabled;
        obs = enabled;
      };
    };
  };
}
{ options, config, lib, pkgs, ... }:

with lib;
with lib.plusultra;
let
  cfg = config.plusultra.apps.obs;
in
{
  options.plusultra.apps.obs = with types; {
    enable = mkBoolOpt false "Whether or not to enable support for OBS.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      (pkgs.wrapOBS {
        plugins = with pkgs.obs-studio-plugins; [
          wlrobs
          obs-multi-rtmp
          obs-move-transition
          looking-glass-obs
        ];
      })
    ];
  };
}