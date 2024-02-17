{ inputs, outputs, pkgs, ... }:

{
  ###############
  # remote
  ###############
  home.packages = with pkgs; [ 
    freerdp
    citrix_workspace
  ];
}