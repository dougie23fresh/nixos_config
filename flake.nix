{
  description = "Melvin's Nix Config";

  inputs = {
    # Nixpkgs
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

    # NixPkgs Unstable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";

    # Community scripts and utilities for Hypr projects
    hyprwm-contrib.url = "github:hyprwm/contrib";
    hyprwm-contrib.inputs.nixpkgs.follows = "nixpkgs";

    hyprland-plugins.url = "github:misterio77/hyprland-plugins/flake-winwrap";
    hyprland-plugins.inputs.hyprland.follows = "hyprland";

    # Nix Gaming
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-gaming.inputs.nixpkgs.follows = "nixpkgs";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    # hyprland.url = "github:hyprwm/Hyprland"
    # hyprland.url = "github:hyprwm/Hyprland/v0.32.3";
    # Hardware Configuration
    # hardware.url = "github:nixos/nixos-hardware";
    # Generate System Images
    # nixos-generators.url = "github:nix-community/nixos-generators";
    nix-colors.url = "github:misterio77/nix-colors";
  };
  outputs = { nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations = {
      ceres = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/ceres/default.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.user.melvin = import ./home-manager/home-desktop.nix;
            # home-manager.extraSpecialArgs
          }
        ];
      };

      proxmoxvm = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/proxmoxvm/default.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.user.melvin = import ./home-manager/home.nix;
            # home-manager.extraSpecialArgs
          }
        ];
      };

      hpelitebook = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/hpelitebook/default.nix
          ./modules/time.nix
          ./modules/locale.nix
          ./modules/location.nix
          # Packages
          ./modules/packages/xserver.nix
          ./modules/packages/xfce.nix
          ./modules/packages/hyprland.nix

          # Services
          ./modules/services/avahi.nix
          ./modules/services/battery.nix
          ./modules/services/dbus.nix
          ./modules/services/fwupd.nix
          ./modules/services/gvfs.nix
          ./modules/services/pipewire.nix
          ./modules/services/printing.nix
          ./modules/services/redshift.nix
          ./modules/services/syncthing.nix
          ./modules/services/tailscale.nix
          ./modules/services/tumbler.nix
          ./modules/services/yubikey.nix


          # Programs
          ./modules/programs/backlight.nix
          ./modules/programs/chromium.nix
          ./modules/programs/git.nix
          ./modules/programs/htop.nix
          #./modules/programs/neovim.nix
          ./modules/programs/steam.nix
          ./modules/programs/thunar.nix
          ./modules/programs/zsh.nix
          #home-manager.nixosModules.home-manager {
          #  home-manager.useGlobalPkgs = true;
          #  home-manager.useUserPackages = true;
          #  home-manager.user.melvin = import ./home-manager/home-laptop.nix;
          #  # home-manager.extraSpecialArgs
          #}
        ];
      };

      lggramlinux = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/lggramlinux/default.nix
          ./modules/time.nix
          ./modules/locale.nix
          ./modules/location.nix
          # Packages
          ./modules/packages/xserver.nix
          ./modules/packages/xfce.nix
          ./modules/packages/hyprland.nix

          # Services
          ./modules/services/avahi.nix
          ./modules/services/battery.nix
          ./modules/services/dbus.nix
          ./modules/services/fwupd.nix
          ./modules/services/gvfs.nix
          ./modules/services/pipewire.nix
          ./modules/services/printing.nix
          ./modules/services/redshift.nix
          ./modules/services/syncthing.nix
          ./modules/services/tailscale.nix
          ./modules/services/tumbler.nix
          ./modules/services/yubikey.nix


          # Programs
          ./modules/programs/backlight.nix
          ./modules/programs/chromium.nix
          ./modules/programs/git.nix
          ./modules/programs/htop.nix
          #./modules/programs/neovim.nix
          ./modules/programs/steam.nix
          ./modules/programs/thunar.nix
          ./modules/programs/zsh.nix
          #home-manager.nixosModules.home-manager {
          #  home-manager.useGlobalPkgs = true;
          #  home-manager.useUserPackages = true;
          #  home-manager.user.melvin = import ./home-manager/home-laptop.nix;
          #  # home-manager.extraSpecialArgs
          #}
        ];
      };

    };
  };
}
