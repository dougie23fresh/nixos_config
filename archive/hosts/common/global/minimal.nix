{ inputs, outputs, ... }: 
{
  imports = [
    ./locale.nix
    ./time.nix
    #./users.nix
    ./fonts.nix
    
    # services
    ./services/avahi.nix
    ./services/battery.nix
    ./services/dbus.nix
    ./services/fwupd.nix
    ./services/gvfs.nix
    ./services/pipewire.nix
    ./services/printing.nix
    #./redshift.nix
    # ./syncthing.nix
    ./tailscale.nix
    ./tumbler.nix
    ./yubikey.nix
    
    # Programs
    ./programs/backlight.nix
    #./chromium.nix
    #./git.nix
    #./htop.nix
    ./programs/steam.nix
    ./programs/thunar.nix
    #./zsh.nix

    # packages
    #./packages/default.nix
    ./pkgs/lib.nix

  ];
}