# nixos_config

<https://github.com/Arana-Jayavihan/Lucifers_NIX>
<https://github.com/donovanglover/nix-config>
<https://github.com/71zenith/nix-dots>
<https://github.com/adi1090x/rofi?tab=readme-ov-file>

nixos-rebuild build "$@" && nvd diff /run/current-system result
sudo nixos-rebuild boot --log-format internal-json -v |& nom --json
nix run github:astro/deadnix example.nix

<https://github.com/ryan4yin/nix-config/blob/main/modules/nixos/desktop/peripherals.nix>
<https://github.com/abayomi185/nix-dotfiles/blob/main/modules/home-manager/shell/git.nix>
<https://github.com/bderenzo/tinymotd>
<https://github.com/sioodmy/dotfiles>
<https://github.com/mcdonc/.nixconfig/tree/master>
<https://github.com/Misterio77/nix-config>

<https://github.com/skbolton/nix-dotfiles>

<https://github.com/NixOS/nixos-hardware/tree/master>

<https://gitlab.com/stephan-raabe/dotfiles/-/tree/main/hypr/conf?ref_type=heads>

<https://wiki.archlinux.org/title/intel_graphics#Hardware_accelerated_H.264_decoding_on_GMA_4500>

<https://github.com/vimjoyer/flake-starter-config/tree/main>
-------

nix-shell -p sops --run "sops secrets/secrets.yaml"
cat secrets/secrets.yaml
#############################
<https://github.com/alexandergall/nixos-pxe-installer>
<https://github.com/phip1611/nixos-configs/tree/main>
<https://git.cyplo.dev/cyplo/dotfiles>
<https://github.com/yunfachi/nix-config>
<https://github.com/Funny-Linux-People/Kalyx>
<https://github.com/ivan770/modulo/>
<https://github.com/aksiksi/compose2nix/blob/main/nixos-test/podman-compose.nix>
<https://github.com/nikitawootten/infra?tab=readme-ov-file>
<https://git.cyplo.dev/cyplo/dotfiles/src/branch/main/nixos>
----

<https://github.com/tolgaerok/nixos-kde/tree/main>
<https://git.polynom.me/PapaTutuWawa/nixos-config/src/branch/master/modules/programs>
<https://github.com/VixenUtils/Myxer>

<https://search.nixos.org/packages>

<https://mynixos.com>

<https://github.com/ryan4yin/nix-config>

<https://tech.aufomm.com/page/2/>

<https://flakehub.com>

<https://gitlab.com/stephan-raabe>
<https://github.com/jakehamilton/config/tree/main>
<https://github.com/georgewhewell/nixos-host/tree/master>
<https://github.com/librephoenix/nixos-config>
<https://github.com/snowfallorg/lib>
-----

<https://gitlab.com/stephan-raabe/dotfiles/-/blob/main/.install/wallpaper.sh?ref_type=heads>
<https://github.com/dylanaraps/pywal>
<https://gitlab.com/stephan-raabe/dotfiles/-/blob/main/.install/hyprland-dotfiles.sh?ref_type=heads>
<https://gitlab.com/stephan-raabe/dotfiles/-/blob/main/.install/keyboard.sh?ref_type=heads>
<https://gitlab.com/stephan-raabe/dotfiles/-/blob/main/.install/bashrc.sh?ref_type=heads>
<https://gitlab.com/stephan-raabe/dotfiles/-/blob/main/.install/init-pywal.sh?ref_type=heads>
<https://github.com/exploitoverload/PwNixOS>
<https://github.com/ekahPruthvi/cynageOS/tree/main/Configs>
git clone

update hostname

add this to config file
nix.settings.experimental-features = [ "nix-command" "flakes" ];
home-manager switch --flake <flake-uri>#<USERNAME>
sudo nixos-rebuild switch --flake './my-nix-flake#<your_host_name>'

sudo nixos-rebuild switch --flake 'flake.nix#hpelitebook'
home-manager switch --flake flake.nix#hpelitebook

<https://github.com/chadcat7/crystal/blob/bdbb59cfff83286f41c1b12d3c02275c6b778721/home/namish/conf/ui/hyprland/default.nix>
<https://github.com/cole-h/nixos-config/blob/60bdb75969282c2bf6bee8f517436cfdf294f5c7/hosts/nixos/scadrial/modules/programs.nix>

<https://github.com/MatthiasBenaets/nixos-config/blob/552a9d5f0f5d9ee4322e9de7bf70d47d8e37e1ac/rsc/archive/waybar.nix#L22>
<https://github.com/JaKooLit/Hyprland-v3/blob/9530df692cbe9ce8f58a835b6c122f426e3cd2d4/config/hypr/waybar/configs/config-dual#L17>
 nix.settings.experimental-features = [ "nix-command" "flakes" ];

<https://gitlab.com/gfauredev/nixos-config>
<https://gitlab.com/SamDenton/lunix/-/blob/master/hosts/base.nix?ref_type=heads>
<https://gitlab.com/null4833902/nixos/-/tree/main/core?ref_type=heads>
<https://gitlab.com/Zaney/zaneyos>

<https://xeiaso.net/blog/nix-flakes-1-2022-02-21/>
<https://github.com/SomeGuyNamedMay/users/blob/master/flake.nix>
<https://github.com/SomeGuyNamedMay/users/blob/master/flake.nix>
<https://github.com/danth/stylix>
<https://github.com/librephoenix/selfhosted-templates>
<https://github.com/librephoenix/nixos-config/blob/main/flake.nix>

sct 2300
-----

services.blueman.enable = true;
services.clipman.enable
services.clipmenu.enable
services.dunst
services.fnott

services.hostapd
services.httpd
services.kea
services.nfs
services.tftpd
services.vsftpd

services.bookstack
services.bazarr
services.avahi
services.audiobookshelf
services.asterisk
services.akkoma
services.certmgr
services.cfssl
services.cloudflared
services.code-server
services.dnsmasq
services.esphome
services.frigate
services.freshrss
services.gitea
services.gotify.enable
services.gotosocial
services.graylog
services.grocy
services.guacamole-client
services.guacamole-server
services.headphones
services.headscale
services.healthchecks
services.home-assistant
services.homeassistant-satellite
services.homepage-dashboard
services.jackett
services.jellyfin
services.jellyseerr
services.k3s
services.kasmweb
services.keybase
services.keycloak
services.lemmy
services.lldap
services.lldpd
services.logstash
services.mastodon
services.matrix-synapse
services.matrix-conduit
services.matterbridge
services.mautrix-whatsapp
services.mautrix-telegram
services.mautrix-facebook
services.minio
services.monica
services.netbox
services.nextcloud
services.nginx
services.node-red
services.ntfy-sh
services.onlyoffice
services.openldap
services.paperless
services.pgadmin
services.photoprism
services.pleroma
services.postgresql
services.postgresqlBackup
services.privoxy
services.pykms
services.radarr
services.radicale
services.readarr
services.redis
services.rsnapshot
services.samba
services.smokeping
services.snipe-it
services.sonarr
services.step-ca
services.syslog-ng
services.tailscale
services.teleport
services.uptime-kuma
services.traefik
services.vaultwarden
services.webdav
services.wg-netmanager
services.zigbee2mqtt
services.zitadel
