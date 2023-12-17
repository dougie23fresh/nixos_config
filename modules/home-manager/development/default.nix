{ inputs, outputs, ... }:

{
  imports = [
    ./git.nix
    ./android.nix
    ./godot.nix
    ./python.nix
    ./rust.nix
    ./vscode.nix
  ];
}