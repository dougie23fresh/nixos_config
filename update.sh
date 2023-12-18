rm -r -f nixos_config/
git clone https://github.com/dougie23fresh/nixos_config.git
sudo nixos-rebuild switch --flake './nixos_config/#hpelitebook'