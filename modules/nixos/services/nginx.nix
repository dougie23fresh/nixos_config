{  pkgs, ... }:
{
  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    #recommendedTlsSettings = true;
    #virtualHosts = {
    #  "home" = {
    #    serverName = "dougie23fresh.com";
    #    locations."/" = { proxyPass = "https://127.0.0.1:8080"; proxtWebsockets = true;};
    #  };

    #  "books.dougie23fresh.com" = {
    #    locations."/" = {proxyPass = "http://127.0.0.1:3333"; proxyWebsockets = true;};
    #  };
    #};
  };
}
