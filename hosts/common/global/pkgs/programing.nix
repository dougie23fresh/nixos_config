{ config, pkgs, ... }:
{
    vscode
    vscode-extensions.ms-python.python
    vscode-extensions.ms-python.vscode-pylance
    vscode-extensions.dracula-theme.theme-dracula
    vscode-extensions.nonylene.dark-molokai-theme
    vscode-extensions.jdinhlife.gruvbox
    vscode-extensions.catppuccin.catppuccin-vsc
    (python3.withPackages(ps: with ps; [
       urllib3
       pandas
       pip
       requests
       flake8
       pylint
       pyflakes
       rich
       python-box
       xmltodict
    ]))
    kate
    gcc
    git
    luarocks
}