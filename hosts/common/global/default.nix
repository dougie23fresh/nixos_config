{ inputs, outputs, ... }: 
{
  imports = [
    ./locale.nix
    ./location.nix
    ./time.nix

    # Packages
    ./packages/default.nix
    # Services
    ./services/default.nix

    # Programs
    ./programs/default.nix
    ./pkgs/default.nix

    #./security.nix

  ];
}