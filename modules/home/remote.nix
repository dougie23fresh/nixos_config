{ inputs, outputs, ... }:

{
  ###############
  # remote
  ###############
  home.packages = with pkgs; [ 
    freerdp
  ];
  home.packages = with pkgs; [ 
    citrix_workspace
  ];
}