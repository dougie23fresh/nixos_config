{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.services.printing;
in
{
  options.dougieHost.services.printing = {
    enable = mkEnableOption "printing";
  };

  config = mkIf cfg.enable {
    programs.system-config-printer.enable = true;
    services.printing.enable = true;
    services.ipp-usb.enable = true;
    services.printing.drivers = with pkgs; [ 
      brgenml1cupswrapper      # Generic drivers for more Brother printers
      brgenml1lpr              # Generic drivers for more Brother printers
      brlaser                  # Drivers for some Brother printers
      cnijfilter2              # Generic cannon
      gutenprint               # Drivers for many different printers from many different vendors
      gutenprintBin            # Additional, binary-only drivers for some printers
      hplip                    # Drivers for HP printers
      hplipWithPlugin          # Drivers for HP printers, with the proprietary plugin. Use in terminal  NIXPKGS_ALLOW_UNFREE=1 nix-shell -p hplipWithPlugin --run 'sudo -E hp-setup'
 
    ];
    #    printing.drivers = with pkgs; [ gutenprint ];
    hardware.sane = {
      enable = true;
      #extraBackends = with pkgs; [ hplipWithPlugin sane-airscan ];
      extraBackends = with pkgs; [ 
        sane-airscan
        epkowa
      ];
      disabledDefaultBackends = ["escl"];
    };
  };
}