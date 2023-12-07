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
    ./packages/xserver.nix
    ./packages/xfce.nix
    ./packages/hyprland.nix

    # Services
    ./services/avahi.nix
    ./services/battery.nix
    ./services/dbus.nix
    ./services/fwupd.nix
    ./services/gvfs.nix
    ./services/pipewire.nix
    ./services/printing.nix
    ./services/redshift.nix
    ./services/syncthing.nix
    ./services/tailscale.nix
    ./services/tumbler.nix
    ./services/yubikey.nix


    # Programs
    ./programs/backlight.nix
    ./programs/chromium.nix
    ./programs/git.nix
    ./programs/htop.nix
    #./programs/neovim.nix
    ./programs/steam.nix
    ./programs/thunar.nix
    ./programs/zsh.nix
  ] 
}