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
        # alejandra - An opinionated Nix code formatter optimized for speed and consistency.
        deadnix # Scan Nix files for dead code.
        manix # Find configuration options and function documentation for Nixpkgs, NixOS, and Home Manager.
        #nh - Better output for nix nixos-rebuild and home-manger CLI using nvd and nix-output-monitor.
        nix-init # Generate Nix packages from URLs with hash prefetching, dependency inference, license detection, and more.
        nix-prefetch # A universal tool for updating source checksums.#
        nvd # Diff package versions between two store paths; it's especially useful for comparing NixOS generations on
        nix-top
    ];
    programs.nh = {
        enable = true;
        clean.enable = true;
        clean.extraArgs = "--keep-since 4d --keep 3";
        flake = "/home/melvin/nixos_config";
    };
    environment.sessionVariables = {
        FLAKE = "/home/melvin/nixos_config";
    };
}
