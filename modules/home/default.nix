{ inputs, outputs, pkgs, username, ... }:

{
  ###############
  # User
  ###############
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
    # packages = with pkgs; [ mpv ];
  };
  ###############
  # home-manager
  ###############
  programs.home-manager.enable = true;
  
  
  
  ###############
  # wm
  ###############
  
  
  #home.packages = with pkgs; [
  #  # Games
  #  pegasus-frontend
  #  myRetroarch
  #  libfaketime
  #  airshipper
  #  qjoypad
  #  superTux
  #  superTuxKart
  # ];
  # # Collection of useful CLI apps
  # home.packages = with pkgs; [
  #  disfetch lolcat cowsay onefetch
  #  gnugrep gnused
  #  bat eza bottom fd bc
  #  direnv nix-direnv
  #];
  
  home.packages = with pkgs; [
    # Command Line
    disfetch neofetch lolcat cowsay onefetch starfetch
    cava
    gnugrep gnused
    killall
    libnotify
    timer
    bat eza fd bottom ripgrep
    rsync
    tmux
    htop
    hwinfo
    unzip
    brightnessctl
    w3m
    fzf
    pandoc
    pciutils
  ];
  


  
    
    
}