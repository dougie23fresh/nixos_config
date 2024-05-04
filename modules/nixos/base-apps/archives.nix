{  pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        rar
        unrar
        #_7zz
        unzip
        zip
        bzip2
        gnutar
        p7zip
        xz
    ];
}
