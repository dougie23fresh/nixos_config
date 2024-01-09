{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.services.fstrim;
in
{
  options.dougieHost.services.fstrim = {
    enable = mkEnableOption "fstrim";
  };

  config = mkIf cfg.enable {
    services.fstrim.enable = true;
environment.systemPackages = with pkgs; [
    nvme-cli
    smartmontools
  ] ++ lib.optionals (desktop != null) [
    gsmartcontrol
  ];
  services.smartd.enable = true;
  };
}
