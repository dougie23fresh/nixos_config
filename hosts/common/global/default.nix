{ inputs, outputs, ... }: {
  imports = [
    ./acme.nix
    ./auto-upgrade.nix
    ./fish.nix
    ./locale.nix
    ./nix.nix
    ./openssh.nix
    ./optin-persistence.nix
    ./podman.nix
    ./sops.nix
    ./ssh-serve-store.nix
    ./steam-hardware.nix
    ./systemd-initrd.nix
    ./tailscale.nix
    ./gamemode.nix
    ./time.nix
    ./locale.nix
    ./location.nix

    # Packages
    ./packages/default.nix
    # Services
    ./services/default.nix

    # Programs
    ./programs/default.nix
  ] 
}