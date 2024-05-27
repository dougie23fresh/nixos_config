{  pkgs, ... }:
{
  services.restic.backups."dns" = {
    initialize = true;
    repository = "rest:http://10.1.1.95:8000/dns";
    passwordFile = "...";
    timerConfig.OnCalendar = "hourly";
    paths = [ "/var/lib/technitium-dns-server" ];
  };
}
