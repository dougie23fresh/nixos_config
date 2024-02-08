{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.app.steam;
in
{
  options.dougieHost.app.steam = {
    enable = mkEnableOption "steam";
  };

  config = mkIf cfg.enable {
    hardware.steam-hardware.enable = true;
    environment.systemPackages = with pkgs; [
      steam
      vulkan-headers
      ntfs3g
      
    ];
    services.jack.alsa.support32Bit = true;
    services.pipewire.alsa.support32Bit = true;
    #programs gamemode 
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      # better for steam proton games
      #systemd.extraConfig = "DefaultLimitNOFILE=1048576";
    };
  };
}
