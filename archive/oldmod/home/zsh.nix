{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    sessionVariables = {
      LC_ALL = "en_US.UTF-8";
      #ZSH_AUTOSUGGEST_USE_ASYNC = "true";
      #SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
    };
    dirHashes = {
      docs = "$HOME/docs";
      notes = "$HOME/docs/notes";
      dots = "$HOME/dev/dotfiles";
      dl = "$HOME/download";
      vids = "$HOME/vids";
      music = "$HOME/music";
      media = "/run/media/$USER";
    };
  };
  programs.gpg.enable = true;
  programs.man.enable = true;
  programs.eza.enable = true;
  programs.dircolors = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.bat = {
    enable = true;
    config = {
    pager = "less -FR";
    theme = "catppuccin-frappe";
    };
    themes = {
    catppuccin-mocha = {
        src = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "bat";
        rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
        sha256 = "6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
        };
        file = "Catppuccin-frappe.tmTheme";
    };
    };
  };

}
