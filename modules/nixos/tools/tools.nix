{ options, config, lib, pkgs, ... }:

with lib;
with lib.plusultra;
let cfg = config.plusultra.tools.misc;
in
{
  options.plusultra.tools.misc = with types; {
    enable = mkEnableOption "Whether or not to enable common utilities.";
  };

  config = mkIf cfg.enable {
    plusultra.home.configFile."wgetrc".text = "";

    environment.systemPackages = with pkgs; [
      fzf
      killall
      unzip
      file
      jq
      clac
      wget
      curl
      git
      #libverto # Asynchronous event loop abstraction library
      #libnotify # Minimalistic libnotify wrapper
      home-manager
    ];
  };
}