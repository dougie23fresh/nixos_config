{ libs, config, pkgs, ...}:
let 
  cfg = config.dougienix.system.boot;
in
{
  options.dougienix.system.boot = with types; {
    enable = lib.mkBoolOpt false "Whether or not to enable booting.";
  };

  config = mkIf lib.cfg.enable {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  };
}