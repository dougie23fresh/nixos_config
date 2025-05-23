{ inputs, outputs, username, pkgs, ... }:
{
    xdg.enable = true;
    imports = [
        #inputs.catppuccin.homeManagerModules.catppuccin
        inputs.catppuccin.homeModules.catppuccin
        #outputs.homeManagerModules.window-manager.qt
        #outputs.homeManagerModules.window-manager.gtk
        #outputs.homeManagerModules.window-manager.xdg
        outputs.homeManagerModules.window-manager.hyprland
        #outputs.homeManagerModules.window-manager.waybar
        #outputs.homeManagerModules.window-manager.fuzzel
        outputs.homeManagerModules.window-manager.labwc
        #outputs.homeManagerModules.audio.spotify
        outputs.homeManagerModules.dev.git
        outputs.homeManagerModules.editors.notepadqq
        #outputs.homeManagerModules.dev.python
        #outputs.homeManagerModules.dev.thonny
        outputs.homeManagerModules.dev.vscode
        outputs.homeManagerModules.dev.zed-editor
        outputs.homeManagerModules.networking.browsers.brave
        outputs.homeManagerModules.networking.browsers.chromium
        #outputs.homeManagerModules.networking.browsers.edge
        outputs.homeManagerModules.networking.browsers.firefox
        outputs.homeManagerModules.networking.browsers.vivaldi
        outputs.homeManagerModules.networking.browsers.tor-browser
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
        outputs.homeManagerModules.office.obsidian
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
    #nixpkgs.config.allowUnfree = true;
    ###############
    # User
    ###############
    home.packages = with pkgs; [
        standardnotes
        anytype
        remmina
    ];
    home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        #stateVersion = "23.11";
        # packages = with pkgs; [ mpv ];
    };
    ###############
    # home-manager
    ###############
    #catppuccin.flavour = "macchiato";
    programs.home-manager.enable = true;
    home.stateVersion = "23.11";

}
