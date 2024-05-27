{  pkgs, ... }:
{
  environment.systemPackages = with pkgs; [

  ];
  programs.rust-motd.enable = true;
  programs.rust-motd.settings = {
    banner = {
      color = "red";
      command = "hostname | figlet -f slant";
    };
    uptime = {
      prefix = "Up";
    };
    filesystems = {
      root = "/";
    };
    memory = {
      swap_pos = "beside";
    };
  };
}
