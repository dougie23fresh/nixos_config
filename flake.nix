{
  description = "Melvin's Nix Config";
  inputs = {
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
    nix-software-center.url = "github:snowfallorg/nix-software-center";
    nixos-conf-editor.url = "github:snowfallorg/nixos-conf-editor";
    stylix.url = "github:danth/stylix";
    ags.url = "github:Aylur/ags";
    ags.inputs.nixpkgs.follows = "nixpkgs";
    #anyrun.url = "github:Kirottu/anyrun";
    #anyrun.inputs.nixpkgs.follows = "nixpkgs";
    hypridle.url = "github:hyprwm/hypridle";
    hypridle.inputs.nixpkgs.follows = "nixpkgs";


    hyprland-contrib.url = "github:hyprwm/contrib";
    hyprland-contrib.inputs.nixpkgs.follows = "nixpkgs";

    hyprlock.url = "github:hyprwm/hyprlock";
    hyprlock.inputs.nixpkgs.follows = "nixpkgs";

    hyprpaper.url = "github:hyprwm/hyprpaper";
    ags.url = "github:Aylur/ags";
    ags.inputs.nixpkgs.follows = "nixpkgs";
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
  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs:
  let
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
  in {

    
    #nixosModules.dougieHost = {
    #  imports = [
    #    ./modules/nixos
    #  ];
    #};
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
          hostname = "hpelitebook";
          cpuType = "intel";
          gpuType = "intel";
        }; 
        modules = [
          ./hosts/hpelitebook/default.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; inherit username;};
            home-manager.users.${username} = import ./modules/home/default.nix;
            home-manager.modules = [
              stylix.homeManagerModules.stylix
            ];
          }
        ];
      };

      lggramlinux = nixpkgs.lib.nixosSystem {
        specialArgs = { 
          inherit username;
          inherit inputs;
          hostname = "lggramlinux";
          cpuType = "intel";
          gpuType = "intel";
        }; 
        modules = [
          ./config/lggramlaptop/system.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; inherit username;};
            home-manager.users.${username} = import ./modules/home/default.nix;
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