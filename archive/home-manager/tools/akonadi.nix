{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.tools.akonadi;
in
{
  options.dougieHome.tools.akonadi = {
    enable = mkEnableOption "akonadi";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ 
      libsForQt5.akonadi
      libsForQt5.akonadi-calendar
      libsForQt5.akonadi-calendar-tools
      libsForQt5.akonadi-contacts
      libsForQt5.akonadi-import-wizard
      libsForQt5.akonadi-mime
      libsForQt5.akonadi-notes
      libsForQt5.akonadi-search
      libsForQt5.akonadiconsole
      libsForQt5.merkuro
    ];
  };
}
