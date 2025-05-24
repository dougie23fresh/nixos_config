{ inputs, outputs, username, pkgs, ... }:
{
    xdg.enable = true;
    imports = [
        #inputs.catppuccin.homeManagerModules.catppuccin
        inputs.catppuccin.homeModules.catppuccin
        outputs.homeManagerModules.dev.git
        outputs.homeManagerModules.terminal-emulators.bat
        outputs.homeManagerModules.terminal-emulators.bottom
        outputs.homeManagerModules.terminal-emulators.btop
        outputs.homeManagerModules.terminal-emulators.eza
        outputs.homeManagerModules.terminal-emulators.helix
        outputs.homeManagerModules.terminal-emulators.starship
        outputs.homeManagerModules.terminal-emulators.zsh
    ];
    #nixpkgs.config.allowUnfree = true;
    ###############
    # User
    ###############
    home.packages = with pkgs; [
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
