{ pkgs, libs, ...}:

let 
  cfg = config.main-user;
in

{
  # main-user.enable = true;
  # main-user.userName = "melvin";
  option.main-user = {
    enable = lib.mkEnableOption "enable user module";
    userName = lib.mkOption {
      default = "mainuser";
      description = ''
        username
      '';
    };
  };
  config = lib.mkIf cfg.enable {
    users.users.${cfg.userName} = {
      isNormalUser = true;
      description = "main user";
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkg.zsh;
      packages = with pkgs; [
        firefox
        # thunderbird
      ];
    };
  };
};

}