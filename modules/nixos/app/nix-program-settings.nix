{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.app.nix-program-settings;
in
{
  options.dougieHost.app.nix-program-settings = {
    enable = mkEnableOption "nix-program-settings";
  };

  config = mkIf cfg.enable {
    programs = {

      # allow users to mount fuse filesystems with allow_other
      fuse.userAllowOther = true;

      # help manage android devices via command line
      adb.enable = true;

      java = {
        enable = false;
        #  package = pkgs.jre;
      };

      #direnv = {
      #  enable = true;
      #  nix-direnv.enable = true;
      #};

    };
  };
}
