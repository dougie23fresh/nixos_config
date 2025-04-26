{pkgs, ...}:
{
  programs.helix.enable = true;
  #programs.helix.catppuccin.enable  = true;
  catppuccin.helix.enable = true;

  programs.helix.settings.editor.auto-save = true;
  programs.helix.languages.language = [{
    name = "nix";
    auto-format = true;
    formatter.command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
  }];
}
