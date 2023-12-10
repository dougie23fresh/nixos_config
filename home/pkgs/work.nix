{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # work
    citrix_workspace
    webex
    freerdp
  ];
}