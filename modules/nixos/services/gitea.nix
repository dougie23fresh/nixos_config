{  pkgs, ... }:
{
  services.gitea.enable = true;
  services.gitea.domain = fqdn;
    services.gitea.httpAddress = "127.0.0.1";
    services.gitea.log.level = "Warn";
    services.gitea.disableRegistration = true;
    services.gitea.rootUrl = "https://gitea.dougie23fresh.com";
}
