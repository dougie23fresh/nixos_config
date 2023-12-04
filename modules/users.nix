users.users.melvin = {
  isNormalUser = true;
  description = "melvin";
  extraGroups = [ "networkmanager" "wheel" ];
  packages = with pkgs; [
    firefox
    # thunderbird
  ];
};
