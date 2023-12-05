# nixos_config

https://search.nixos.org/packages

https://mynixos.com

https://github.com/ryan4yin/nix-config

https://tech.aufomm.com/page/2/

https://flakehub.com

https://gitlab.com/stephan-raabe


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