{
  description = "Melvin's Nix Config";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://cache.nixos.org"
    ];

    extraSubstituters = [
      "https://nix-ommunity.cachix.org"
    ];

    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

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
  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    inherit (self) outputs;
  in
  {
    nixosConfigurations = {
      ceres = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/ceres/default.nix
          home-manager.nixosModules.home-manager {
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
          home-manager.nixosModules.home-manager {
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
        specialArgs = { inherit inputs outputs; }; 
        modules = [
          ./hosts/lggramlinux/default.nix
          
         
        ];
      };

    };
  };
}
