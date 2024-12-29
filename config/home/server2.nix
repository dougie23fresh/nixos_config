{ inputs, outputs, username, pkgs, ... }:
{
    xdg.enable = true;
    imports = [
        inputs.catppuccin.homeManagerModules.catppuccin

        outputs.homeManagerModules.dev.git
        outputs.homeManagerModules.terminal-emulators.bat
        outputs.homeManagerModules.terminal-emulators.bottom
        outputs.homeManagerModules.terminal-emulators.btop
        outputs.homeManagerModules.terminal-emulators.eza
        outputs.homeManagerModules.terminal-emulators.helix
        outputs.homeManagerModules.terminal-emulators.starship
        outputs.homeManagerModules.terminal-emulators.zsh
    ];
    nixpkgs.config.allowUnfree = true;
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
    virtualisation.podman.enable = true;
    virtualisation.podman.autoPrune.enable = true;
    virtualisation.podman.dockerCompat = true;
    virtualisation.podman.defaultNetwork.settings.dns_enabled = true;
    

    virtualisation.oci-containers.backend = "podman";
    virtualisation.oci-containers.containers."dockge" = {
        image = "louislam/dockge:1";
        autoStart = true;
        volumes = [
        "/var/run/docker.sock:/var/run/docker.sock"
        "./data:/app/data"
        "/opt/stacks:/opt/stacks"
        ];
        ports = [ "5001:5001" ];
        environment = {
        DOCKGE_STACKS_DIR = "/opt/stacks";
        };
    };
    virtualisation.oci-containers.containers."gitea" = {
        image = "gitea/gitea:latest";
        autoStart = true;
        volumes = [
            "./data/gitea:/data"
            "/etc/timezone:/etc/timezone:ro"
            "/etc/localtime:/etc/localtime:ro"
        ];
        ports = [
            "3000:3000"
            "222:22"
        ];
        environment = {
            USER_UID = "1000";
            USER_GID = "1000";
            #htt
        };
    };
    virtualisation.oci-containers.containers."dashy" = {
        image = "image: lissy93/dashy";
        autoStart = true;
        volumes = [
        "./data/dashy:/app/user-data/"
        ];
        ports = [
        "4000:8080"
        ];
        environment = {
        #USER_UID = "1000";
        #USER_GID = "1000";
        #htt
        };
    };


    ###############
    # home-manager
    ###############
    #catppuccin.flavour = "macchiato";
    programs.home-manager.enable = true;
    home.stateVersion = "23.11";

}
