{ inputs, outputs, ... }: {
  imports = [
    ./logitech.nix
    ./opengl.nix
    ./pulseaudio.nix
  ] 
}