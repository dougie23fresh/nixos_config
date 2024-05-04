{ inputs, outputs, username, ... }:
{
    imports = [
        inputs.catppuccin.homeManagerModules.catppuccin
        outputs.homeManagerModules.window-manager.qt
        outputs.homeManagerModules.window-manager.gtk
        outputs.homeManagerModules.window-manager.xdg
        outputs.homeManagerModules.window-manager.hyprland
        outputs.homeManagerModules.window-manager.waybar
        outputs.homeManagerModules.window-manager.fuzzel
        outputs.homeManagerModules.audio.spotify
        outputs.homeManagerModules.dev.git
        outputs.homeManagerModules.dev.vscode
        outputs.homeManagerModules.networking.browsers.brave
        outputs.homeManagerModules.networking.browsers.chromium
        outputs.homeManagerModules.networking.browsers.edge
        outputs.homeManagerModules.networking.browsers.firefox
        outputs.homeManagerModules.networking.browsers.vivaldi
        #outputs.homeManagerModules.networking.mailreader.bluemail
        #outputs.homeManagerModules.networking.mailreader.betterbird
        outputs.homeManagerModules.networking.citrix_workspace
        outputs.homeManagerModules.networking.discord
        outputs.homeManagerModules.networking.freerdp
        outputs.homeManagerModules.networking.webex
        #outputs.homeManagerModules.office.libreoffice-fresh
        outputs.homeManagerModules.office.mupdf
        outputs.homeManagerModules.office.nvpy
        outputs.homeManagerModules.office.sioyek
        outputs.homeManagerModules.office.xournalpp
        outputs.homeManagerModules.office.zathura
        outputs.homeManagerModules.pictures.imv
        outputs.homeManagerModules.terminal-emulators.alacritty
        outputs.homeManagerModules.terminal-emulators.bat
        outputs.homeManagerModules.terminal-emulators.bottom
        outputs.homeManagerModules.terminal-emulators.btop
        outputs.homeManagerModules.terminal-emulators.eza
        outputs.homeManagerModules.terminal-emulators.helix
        outputs.homeManagerModules.terminal-emulators.kitty
        outputs.homeManagerModules.terminal-emulators.starship
        outputs.homeManagerModules.terminal-emulators.zsh
        outputs.homeManagerModules.video.minitube
        outputs.homeManagerModules.video.mpv
    ];
    nixpkgs.config.allowUnfree = true;
    ###############
    # User
    ###############
    home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        #stateVersion = "23.11";
        # packages = with pkgs; [ mpv ];
    };
    ###############
    # home-manager
    ###############
    programs.home-manager.enable = true;
    home.stateVersion = "23.11";

}
