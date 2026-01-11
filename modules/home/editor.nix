{ pkgs, ... }:

{
  home.packages = [ pkgs.vim ];

  programs.helix = {
    enable = true;
  };
}
