wayfire
{  inputs, pkgs, ... }:
{
    programs.wayfire  = {
        # Install the packages from nixpkgs
        enable = true;
        # Whether to enable XWayland
        xwayland.enable = true;
        plugins = with pkgs.wayfirePlugins; [
            wcm
            wf-shell
            wayfire-plugins-extra
            windecor
            firedecor
        ];
    };
    environment.systemPackages = with pkgs; [
        lxde.lxtask
        lxterminal
        #pcmanfm
        lxqt.pcmanfm-qt
        lxqt.qterminal
        lxqt.qps
        lxqt.pavucontrol-qt
    ];
}