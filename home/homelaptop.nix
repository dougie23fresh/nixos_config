{ inputs, config, pkgs, ... }:

{
  imports = [
    #./pam.nix
    ./features
  ];
  programs = {
    home-manager.enable = true;
    git.enable = true;
  };
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
  nixpkgs = {
    config = {
      allowUnfree = true;
      #allowUnfreePredicate = true;
    };
  };

  home = {
    username = "melvin";
    homeDirectory = "/home/melvin";
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.11";
    packages = with pkgs; [
      mpv
    ];
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    autocd = true;
    
  };
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.nnn = {
    enable = true;
  };
  programs.btop.enable = true;
  programs.eza = {
    enable = true;
    enableAliases = true;
  };
  #options.dougieHome.remote.citrix_workspace = {
  #ptions.dougieHome.remote.freerdp 
  
}