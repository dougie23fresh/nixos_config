{
  description = "Melvin's Nix Config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    # NixPkgs Unstable
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-23.05";
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
  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
  {
    nixosConfigurations = {
      ceres = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/ceres/default.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = inputs;
            home-manager.user.melvin = import ./home-manager/home.nix;
            # home-manager.extraSpecialArgs
          }
        ];
      };

      proxmoxvm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/proxmoxvm/default.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = inputs;
            home-manager.user.melvin = import ./home-manager/home.nix;
            # home-manager.extraSpecialArgs
          }
        ];
      };
    };

  };
}
