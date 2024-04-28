{
  browsers = import ./browsers;
  mailreader = import ./mailreader;

  citrix_workspace = import ./citrix_workspace.nix;
  discord = import ./discord.nix;
  freerdp = import ./freerdp.nix;
  qbittorrent-nox = import ./qbittorrent-nox.nix;
  webex = import ./webex.nix;
}
