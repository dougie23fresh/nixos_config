{  pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        nix-tree # Interactively browse a Nix store paths dependencies
        nix-update # Swiss-knife for updating nix packages
        nix-du # A tool to determine which gc-roots take space in your nix store
        # nix-web # Web interface for the Nix store
        nix-health # Check the health of your Nix setup
        nix-index # A files database for nixpkgs
        nix-output-monitor # Processes output of Nix commands to show helpful and pretty information
        hydra-check # check hydra(nix's build farm) for the build status of a package
        nix-init # generate nix derivation from url
        nix-melt # A TUI flake.lock viewer
    ];
}
