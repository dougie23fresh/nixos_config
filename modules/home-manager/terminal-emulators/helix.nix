{pkgs, ...}:
{
  programs.helix.enable = true;
  programs.helix.catppuccin = true;
  programs.helix.languages.language = [{
    name = "nix";
    auto-format = true;
    formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
  }];
}
