{
  description = "Melvin's Nix Config";
  inputs = {
    #nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hardware.url = "github:nixos/nixos-hardware";
    nix-colors.url = "github:misterio77/nix-colors";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    #hyprland.url = "github:hyprwm/Hyprland";
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
    sops-nix.url = "github:Mic92/sops-nix";
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
  outputs = { self, nixpkgs, home-manager, nixpkgs-unstable, ... }@inputs:
  let
    inherit (self) outputs;

    version = builtins.substring 0 8 self.lastModifiedDate;
    #system = "x86_64-linux";
    username = "melvin";
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
    #pkgsun = nixpkgs-unstable.legacyPackages.${system};
    #  pkgs-unstable

    # Supported systems for your flake packages, shell, etc.
    systems = [
      "aarch64-linux"
      "x86_64-linux"
      #"aarch64-darwin"
      #"x86_64-darwin"
    ];
    # This is a function that generates an attribute by calling a function you
    # pass to it, with each system as an argument
    forAllSystems = nixpkgs.lib.genAttrs systems;

    #unstableOverlay = final: prev: { unstable = nixpkgs-unstable.legacyPackages.${prev.system}; };
    # Overlays-module makes "pkgs.unstable" available in configuration.nix
    #unstableModule = ({ config, pkgs, ... }: { nixpkgs.overlays = [ unstableOverlay ]; });
    #pkgs2 = nixpkgs.legacyPackages.x86_64-linux;
    

  in {
    # Reusable nixos modules you might want to export
    # These are usually stuff you would upstream into nixpkgs
    nixosModules = import ./modules/nixos;
    # Reusable home-manager modules you might want to export
    # These are usually stuff you would upstream into home-manager
    homeManagerModules = import ./modules/home-manager;

    nixosConfigurations = {
      # Desktops
      ceres = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit username;
          inherit inputs;
          inherit outputs;
          hostname = "ceres";
          cpuType = "amd";
          gpuType = "nvida";
          pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
        };
        modules = [
          ./config/ceres/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = { 
              inherit inputs outputs username;
              pkgs-unstable = import nixpkgs-unstable {
                inherit system;
                config.allowUnfree = true;
              };
            };
            home-manager.users.${username} = import ./config/home/home-base.nix;
          }
        ];
      };
      # Laptops
      hpelitebook = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit username;
          inherit inputs;
          inherit outputs;
          hostname = "hpelitebook";
          cpuType = "intel";
          gpuType = "intel";
          pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
        };
        modules = [
          ./config/hpelitebook/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = { inherit inputs outputs username;};
            home-manager.users.${username} = import ./config/home/home-base.nix;
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
          pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
        };
        modules = [
          ./config/lggramlaptop/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = { 
              inherit inputs outputs username;
              pkgs-unstable = import nixpkgs-unstable {
                inherit system;
                config.allowUnfree = true;
              };
            };
            home-manager.users.${username} = import ./config/home/home-base.nix;
          }

        ];
      };

      gonggong = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit username;
          inherit inputs;
          inherit outputs;
          hostname = "gonggong";
          cpuType = "intel";
          gpuType = "intel";
          pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
        };
        modules = [
          ./config/gonggong/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = { inherit inputs outputs username;};
            home-manager.users.${username} = import ./config/home/home-base.nix;
          }

        ];
      };

      msi-gs70-stealth = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit username;
          inherit inputs;
          inherit outputs;
          hostname = "msi-gs70-stealth";
          cpuType = "intel";
          gpuType = "intel-nvidia";
          pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
        };
        modules = [
          ./config/msi-gs70-stealth/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = { inherit inputs outputs username; };
            home-manager.users.${username} = import ./config/home/home-base.nix;
          }
        ];
      };

      razer7500u = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit username;
          inherit inputs;
          inherit outputs;
          hostname = "razer7500u";
          cpuType = "intel";
          gpuType = "intel";
          pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
        };
        modules = [
          ./config/razer7500u/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = { 
              inherit inputs outputs username;
              pkgs-unstable = import nixpkgs-unstable {
                inherit system;
                config.allowUnfree = true;
              };
            };
            home-manager.users.${username} = import ./config/home/home-base.nix;
          }

        ];
      };

      # Servers
      point1 = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit username;
          inherit inputs;
          inherit outputs;
          hostname = "point1";
          cpuType = "intel";
          gpuType = "intel";
          pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
        };
        modules = [
          ./config/point1/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = { 
              inherit inputs outputs username;
              pkgs-unstable = import nixpkgs-unstable {
                inherit system;
                config.allowUnfree = true;
              };
            };
            home-manager.users.${username} = import ./config/home/server.nix;
          }

        ];
      };

      point2 = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit username;
          inherit inputs;
          inherit outputs;
          hostname = "point2";
          cpuType = "intel";
          gpuType = "intel";
          pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
        };
        modules = [

          ./config/point2/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = {
              inherit inputs outputs username;
              pkgs-unstable = import nixpkgs-unstable {
                inherit system;
                config.allowUnfree = true;
              };
            };
            home-manager.users.${username} = import ./config/home/server.nix;
          }

        ];
      };

    };
  };
}
