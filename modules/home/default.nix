{ inputs, outputs, pkgs, username, ... }:

{
  imports = [
    ./browsers.nix
    #./programing.nix
    ./remote.nix
    ./terminals.nix
    ./wm.nix
  ];
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
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [
      # vscodevim.vim # (Neo)Vim mode & keybindings
      # Nix
      jnoortheen.nix-ide
      arrterian.nix-env-selector
      # Lua
      #sumneko.lua
      # Python
      # ms-python.pyright
      ms-python.vscode-pylance
      ms-python.python
      # Rust
      #rust-lang.rust-analyzer
      #techtheawesome.rust-yew
      # C / C++
      #llvm-vs-code-extensions.vscode-clangd
    ];
    # userSettings = {
    #   # JSON
    #   vim.enableNeovim = true;
    #   vim.neovimUseConfigFile = true;
    # };
    # userTasks = {
    #   # JSON
    # };
    # keybindings = [
    #   # List of JSON modules
    # ];
    # globalSnippets = {
    #   # JSON
    # };
    # languageSnippets = {
    #   # JSON
    # };
  };

  
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

    discord # PROPRIETARY messaging and general communication
    heroic # gog and epic games launcher
    gogdl # gog module for heroic launcher
    legendary-gl # Epic games launcher alternative
    # moonlight-qt # Game streaming client # TEST if better than rustdesk
    mangohud # A practical HUD on top of games
    protonup-ng # Manage installation of proton-ge

    # Text & Document
    libreoffice-fresh # Office suite
    # libreoffice-qt # Office suite
    # libreoffice # Office suite
    # libreoffice-fresh-unwrapped # Office suite
    # libreoffice-still # Office suite
    masterpdfeditor4 # PDF editor
    xournalpp # Notetaking with draw
    # write_stylus
    # markdown-anki-decks
    # marktext # Markdown editor
    # calibre # Ebook management
    # zathura # Minimalist PDF reader
    mupdf # Minimalist PDF reader
    sioyek # Minimalist PDF reader
    # tesseract # OCR on PDF or images
    # gnome.simple-scan # Document scanner

    #Note & Organization
    anki-bin # Memorisation
    plantuml-c4 # UML diagrams from text
    # emacsPackages.org-roam-ui
    # hovercraft # impress.js presentations
    # emanote # Structured view text notes
    # logseq # Outliner note taking
    # rnote
    # appflowy
    pdfpc # PDF Presentator Console
    weylus # Phone as graphic tablet
    quarto # Scientific and technical publishing system

    # Audio & Music
    spotify # PROPRIETARY music streaming
    playerctl # MPRIS media players control

    # Image & Video # TODO find better image viewer
    imv # Image viewer
    # swayimg # Image viewer that can integrate with terminals
    # sxiv # Image viewer

    # Utilities & Software # TODO refile more precisely
    qbittorrent-nox # CLI Bittorrent client
    # fontforge # Font editor
    # languagetool # Grammar checking, now using the LSP version
    # qbittorrent # Bittorrent client
    # transmission-qt # Bittorrent client
    # filezilla # FTP client
    # xdg-utils # Mime type based file oppening # TEST if relevant
    # handlr # Default app launcher # TEST if relevant
    wine # Execute Window$ programs
    winetricks # Execute Window$ programs
    # losslesscut-bin # Basic lossless video edditing using ffmpeg

    glaxnimate # video editing library used by kdenlive
    libsForQt5.kdenlive # simple video editor (works on nvidia)
    # shotcut # video editor
    # flowblade # non linear video editor
    # olive-editor # non linear video editor

    # obs-wlrobs
    obs-studio-plugins.wlrobs # OBS for Wayland
    obs-studio # Screen recorder and streaming

    # davinci-resolve # PROPRIETARY video editor

    (retroarch.override {
      cores = with libretro; [
        fbneo # Arcade machines
        # mame # Arcade machines
        # mame2003-plus # Arcade machines
        # mame2010 # Arcade machines
        # beetle-gba # Gamebox Advance
        # snes9x # Super Nintendo
        # genesis-plus-gx # Sega Genesis
      ];
    })


  ];
  


  
    
    
}