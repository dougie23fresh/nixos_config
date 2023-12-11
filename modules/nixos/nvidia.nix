{ pkgs, libs, ...}:

let 
  cfg = config.
{
    option1.enable = true
    systemPackages = with pkgs; [
        neovim
    ];
}