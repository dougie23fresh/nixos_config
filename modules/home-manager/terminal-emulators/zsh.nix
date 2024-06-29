{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "python"
        "man"
        "sudo"
        "vscode"
        "qrcode"
        "pip"
      ];
    };
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
  programs.zsh.syntaxHighlighting.catppuccin.enable = true;
}
