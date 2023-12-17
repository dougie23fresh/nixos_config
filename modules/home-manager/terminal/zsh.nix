{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.terminal.zsh;
in
{
  options.dougieHome.terminal.zsh = {
    enable = mkEnableOption "zsh";
  };

  config = mkIf cfg.enable {
    programs.zsh.enable = true;
    programs.zsh.enableAutosuggestions = true;
    programs.zsh.enableCompletion = true;
    programs.zsh.autocd = true;
  };
}
