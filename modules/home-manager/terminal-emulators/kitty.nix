{  pkgs, ... }:
{
  programs.kitty.enable = true;
  programs.kitty.catppuccin = true;
  programs.kitty.package = pkgs.kitty;
  programs.kitty.font.name = "JetBrainsMono Nerd Font";
  programs.kitty.font.size = 16;
  programs.kitty.settings = {
    scrollback_lines = 2000;
    wheel_scroll_min_lines = 1;
    window_padding_width = 0;
    confirm_os_window_close = 0;
    background_opacity = "0.85";

  };
}
