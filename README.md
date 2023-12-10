# nixos_config

https://github.com/Misterio77/nix-config

https://github.com/skbolton/nix-dotfiles

https://github.com/NixOS/nixos-hardware/tree/master

https://gitlab.com/stephan-raabe/dotfiles/-/tree/main/hypr/conf?ref_type=heads

https://wiki.archlinux.org/title/intel_graphics#Hardware_accelerated_H.264_decoding_on_GMA_4500
----

https://git.polynom.me/PapaTutuWawa/nixos-config/src/branch/master/modules/programs
https://github.com/VixenUtils/Myxer


https://search.nixos.org/packages

https://mynixos.com

https://github.com/ryan4yin/nix-config

https://tech.aufomm.com/page/2/

https://flakehub.com

https://gitlab.com/stephan-raabe
https://github.com/jakehamilton/config/tree/main
https://github.com/georgewhewell/nixos-host/tree/master
https://github.com/librephoenix/nixos-config
https://github.com/snowfallorg/lib
-----
https://gitlab.com/stephan-raabe/dotfiles/-/blob/main/.install/wallpaper.sh?ref_type=heads
https://github.com/dylanaraps/pywal
https://gitlab.com/stephan-raabe/dotfiles/-/blob/main/.install/hyprland-dotfiles.sh?ref_type=heads
https://gitlab.com/stephan-raabe/dotfiles/-/blob/main/.install/keyboard.sh?ref_type=heads
https://gitlab.com/stephan-raabe/dotfiles/-/blob/main/.install/bashrc.sh?ref_type=heads
https://gitlab.com/stephan-raabe/dotfiles/-/blob/main/.install/init-pywal.sh?ref_type=heads


git clone 


update hostname

add this to config file
nix.settings.experimental-features = [ "nix-command" "flakes" ];
home-manager switch --flake <flake-uri>#<USERNAME>
sudo nixos-rebuild switch --flake './my-nix-flake#<your_host_name>'

sudo nixos-rebuild switch --flake 'flake.nix#hpelitebook'
home-manager switch --flake flake.nix#hpelitebook






 nix.settings.experimental-features = [ "nix-command" "flakes" ];
