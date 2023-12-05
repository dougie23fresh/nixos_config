{
  description = "Melvin's Nix Config";

  inputs = {
    # Nixpkgs
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    # NixPkgs Unstable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #hyprland
    hyprland.url = "github:hyprwm/Hyprland";
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
    # nix-colors.url = "github:misterio77/nix-colors";
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
