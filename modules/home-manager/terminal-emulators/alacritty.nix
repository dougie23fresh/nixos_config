{
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    window.padding.x = 15;
    window.padding.y = 15;
    window.decorations = "none";
    window.startup_mode = "Windowed";
    window.dynamic_title = true;
    window.opacity = 0.85;
    cursor.style.shape = "Beam";
    cursor.style.blinking = "On";
    live_config_reload = true;
    font.normal.family = "JetBrainsMono Nerd Font";
    font.bold.family = "JetBrainsMono Nerd Font";
    font.italic.family = "JetBrainsMono Nerd Font";
    font.bold_italic.family = "JetBrainsMono Nerd Font";
    font.size = 14;

  };
}
