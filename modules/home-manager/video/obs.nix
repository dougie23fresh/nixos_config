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
    # boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
    #boot.extraModprobeConfig = ''
    #  options v4l2loopback devices=1 video_nr=13 card_label="OBS Virtual Camera" exclusive_caps=1
    #'';
    environment.systemPackages = [
      (unstable.wrapOBS {
        plugins = with unstable.obs-studio-plugins; [
          wlrobs
          obs-multi-rtmp
          looking-glass-obs
          advanced-scene-switcher
          obs-3d-effect
          one-command-source
          obs-gradient-source
          obs-gstreamer
          obs-move-transition
          obs-mute-filter
          obs-pipewire-audio-capture
          obs-rgb-levels-filter
          obs-scale-to-sound
          obs-shaderfilter
          obs-source-clone
          obs-source-record
          obs-source-switcher
          obs-teleport
          obs-text-pthread
          obs-transition-table
          obs-vaapi
          obs-vertical-canvas
          obs-vintage-filter
          obs-websocket
          waveform
        ];
      })
    ];
  };
}