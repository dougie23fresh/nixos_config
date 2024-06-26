{pkgs, ...}:
{
  #home.packages = with pkgs; [zsh-forgit gitflow];
  programs.git = {
    enable = true;
    userName = "melvin";
    userEmail = "melvin.douglas@gmail.com";
    #signing = {
    #  key = "056CFD15A9F99B0E";
    #  signByDefault = false;
    #};
    ignores = [
      ".cache/"
      ".DS_Store"
      ".idea/"
      "*.swp"
      "*.elc"
      "auto-save-list"
      ".direnv/"
      "node_modules"
      "result"
      "result-*"
    ];
  };
}
