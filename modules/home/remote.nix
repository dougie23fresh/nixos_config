{ inputs, outputs, ... }:

{
  ###############
  # remote
  ###############
  home.packages = with pkgs; [ 
    freerdp
    citrix_workspace
  ];
}