{
  description = "Melvin's Nix Config";
  inputs = {
    #nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hardware.url = "github:nixos/nixos-hardware";
    nix-colors.url = "github:misterio77/nix-colors";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprlock.url = "github:hyprwm/hyprlock";
    #hyprlock.inputs.nixpkgs.follows = "nixpkgs";
    hypridle.url = "github:hyprwm/hypridle";
    #hypridle.inputs.nixpkgs.follows = "nixpkgs";
    hyprpaper.url = "github:hyprwm/hyprpaper";
    hyprland-contrib.url = "github:hyprwm/contrib";
    hyprland-contrib.inputs.nixpkgs.follows = "nixpkgs";
    hyprland-plugins.url = "github:hyprwm/hyprland-plugins";
    hyprland-plugins.inputs.hyprland.follows = "hyprland";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-software-center.url = "github:snowfallorg/nix-software-center";
    nixos-conf-editor.url = "github:snowfallorg/nixos-conf-editor";
    # stylix.url = "github:danth/stylix";
    helix.url = "github:helix-editor/helix";
    catppuccin.url = "github:catppuccin/nix";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    nixpkgs-wayland.inputs.nixpkgs.follows = "nixpkgs";
    #anyrun.url = "github:Kirottu/anyrun";
    #anyrun.inputs.nixpkgs.follows = "nixpkgs";
    #firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    #firefox-addons.inputs.nixpkgs.follows = "nixpkgs";
    # Community scripts and utilities for Hypr projects
    # hyprwm-contrib.url = "github:hyprwm/contrib";
    # hyprwm-contrib.inputs.nixpkgs.follows = "nixpkgs";
    # nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    # hardware.url = "github:nixos/nixos-hardware";
    # Generate System Images
    # nixos-generators.url = "github:nix-community/nixos-generators";
  };
  outputs = { self, nixpkgs, home-manager, catppuccin, ... }@inputs:
  let
    inherit (self) outputs;

    version = builtins.substring 0 8 self.lastModifiedDate;
    system = "x86_64-linux";
    username = "melvin";

    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
      };
      #overlays = [ my_overlay ];
    };

    # Supported systems for your flake packages, shell, etc.
      systems = [
        "aarch64-linux"
        "x86_64-linux"
        #"aarch64-darwin"
        #"x86_64-darwin"
      ];
      # This is a function that generates an attribute by calling a function you
      # pass to it, with each system as an argument
      forAllSystems = inputs.nixpkgs-unstable.lib.genAttrs systems;
  in {
    # Reusable nixos modules you might want to export
    # These are usually stuff you would upstream into nixpkgs
    nixosModules = import ./modules/nixos;
    # Reusable home-manager modules you might want to export
    # These are usually stuff you would upstream into home-manager
    homeManagerModules = import ./modules/home-manager;

    nixosConfigurations = {
      ceres = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit username;
          inherit inputs;
          hostname = "ceres";
          cpuType = "amd";
          gpuType = "nvida";
        };
        modules = [
          ./config/ceres/system.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; inherit username;};
            home-manager.users.${username} = import ./modules/home/default.nix;
          }
        ];
      };

      hpelitebook = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit username;
          inherit inputs;
          inherit outputs;
          hostname = "hpelitebook";
          cpuType = "intel";
          gpuType = "intel";
        };
        modules = [
          ./config/hpelitebook/configuration.nix
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; inherit username;};
            #home-manager.users.${username} = import ./modules/home/default.nix;
            home-manager.users.${username} = import ./config/home/home-base.nix;
                #catppuccin.homeManagerModules.catppuccin

          }
        ];
      };

      lggramlinux = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit username;
          inherit inputs;
          inherit outputs;
          hostname = "lggramlinux";
          cpuType = "intel";
          gpuType = "intel";
        };
        modules = [
          ./config/lggramlaptop/configuration.nix
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; inherit username;};
            home-manager.users.${username} = import ./config/home/home-base.nix;
            home-manager.sharedModules = [
              catppuccin.homeManagerModules.catppuccin
            ];
                #catppuccin.homeManagerModules.catppuccin
          }

        ];
      };

      msi-gs70-stealth = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit username;
          inherit inputs;
          hostname = "msi-gs70-stealth";
          cpuType = "intel";
          gpuType = "intel-nvidia";
        };
        modules = [
          ./config/msi-gs70-stealth/system.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.${username} = import ./modules/home/default.nix;
          }
        ];
      };
    };
  };
}
