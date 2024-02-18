{ inputs, outputs, pkgs, ... }:
let

  # My shell aliases
  myAliases = {
    #ls = "eza --icons -l -T -L=1";
    cat = "bat";
    htop = "btm";
    fd = "fd -Lu";
    w3m = "w3m -no-cookie -v";
    neofetch = "disfetch";
    fetch = "disfetch";
    gitfetch = "onefetch";
    nixos-rebuild = "systemd-run --no-ask-password --uid=0 --system --scope -p MemoryLimit=16000M -p CPUQuota=60% nixos-rebuild";
    home-manager = "systemd-run --no-ask-password --uid=1000 --user --scope -p MemoryLimit=16000M -p CPUQuota=60% home-manager";
  };
in
{
  ###############
  # terminal
  ###############
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
  programs.git.enable = true;
  programs.git.userName = "melvin";
  programs.git.userEmail = "melvin.douglas@gmail.com";
  programs.btop.enable = true;
  programs.eza.enable = true;
  programs.eza.enableAliases = true;
  programs.kitty.enable = true;
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
  
  programs.starship.enable = true;
  programs.starship.enableZshIntegration = true;
  programs.zsh.enable = true;
  programs.zsh.enableAutosuggestions = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.autocd = true;
  programs.zsh.syntaxHighlighting.enable = true;
  programs.zsh.shellAliases = myAliases;
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
  };
  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;
  home.packages = with pkgs; [
    neofetch
    kitty
    alacritty
    starship
    zsh
    eza
    btop
  ];
}