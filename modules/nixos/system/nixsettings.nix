{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.system.nixSettings;
in
{
  options.dougieHost.system.nixSettings = {
    enable = mkEnableOption "nixSettings";
  };

  config = mkIf cfg.enable {
    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nix.settings = {
      auto-optimise-store = true;
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };
      substituters = [
        "https://nix-gaming.cachix.org"
        "https://nix-community.cachix.org"
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
  };
}