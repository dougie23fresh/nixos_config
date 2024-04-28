{  pkgs, ... }:
{
  # openssh
  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
    openssh
  ];
}
