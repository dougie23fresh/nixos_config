{
  description = "Melvin's Nix Config";
  inputs = {
    # Nixpkgs
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

    # NixPkgs Unstable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-colors.url = "github:misterio77/nix-colors";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins.url = "github:hyprwm/hyprland-plugins";
    hyprland-plugins.inputs.hyprland.follows = "hyprland";
    nix-gaming.url = "github:fufexan/nix-gaming";
    # Community scripts and utilities for Hypr projects
    # hyprwm-contrib.url = "github:hyprwm/contrib";
    # hyprwm-contrib.inputs.nixpkgs.follows = "nixpkgs";
    # nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    # hardware.url = "github:nixos/nixos-hardware";
    # Generate System Images
    # nixos-generators.url = "github:nix-community/nixos-generators";
  };
  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    # Generate a user-friendly version number.
    version = builtins.substring 0 8 self.lastModifiedDate;
    # System types to support.
    supportedSystems = [
      "x86_64-linux"
      #"x86_64-darwin"
      #"aarch64-linux"
      #"aarch64-darwin"
    ];
    # Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

    # Nixpkgs instantiated for supported system types.
    nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
    #system = "x86_64-linux";
    #pkgs = nixpkgs.legacyPackages.${system};
  in
  {

    # Provide some binary packages for selected system types.
    packages = forAllSystems (system:
      let
        pkgs = nixpkgsFor.${system};
      in
      {

        nixosModules.dougieHost = {
          imports = [
            ./modules/nixos
          ];
        };
        nixosConfigurations = {
          ceres = nixpkgs.lib.nixosSystem {
            modules = [
              ./hosts/ceres/default.nix
            ];
          };
          proxmoxvm = nixpkgs.lib.nixosSystem {
            modules = [
              ./hosts/proxmoxvm/default.nix
            ];
          };

          hpelitebook = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs; }; 
            modules = [
              ./hosts/hpelitebook/default.nix
              home-manager.nixosModules.home-manager {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = { inherit inputs; };
                home-manager.users.melvin = import ./home/laptop-intel.nix;
              }
            ];
          };

          lggramlinux = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs; }; 
            modules = [
              ./config/lggramlaptop/system.nix
              home-manager.nixosModules.home-manager {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = { inherit inputs; };
                home-manager.users.melvin = import ./config/home/laptop-intel.nix;
              }
            ];
          };
      
          msi-gs70-stealth = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs; }; 
            modules = [
              ./hosts/msi-gs70-stealth/default.nix
              home-manager.nixosModules.home-manager {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = { inherit inputs; };
                home-manager.users.melvin = import ./home/homelaptop.nix;
              }
            ];
          };

        };
      
    });
  };
}