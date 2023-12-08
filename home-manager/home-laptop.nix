{ config, pkgs, ... }:

{
  imports = [
    #./pam.nix
    ./features
  ];
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = true;
    };
  };
  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
  programs = {
    home-manager.enable = true;
    git.enable = true;
  };
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
  home.username = "melvin";
  home.homeDirectory = "/melvin";
  home.stateVersion = "22.11";
}