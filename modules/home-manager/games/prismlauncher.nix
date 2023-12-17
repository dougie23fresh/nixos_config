{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.games.prismlauncher;
in
{
  options.dougieHome.games.prismlauncher = {
    enable = mkEnableOption "prismlauncher";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ prismlauncher ];
  };
}
