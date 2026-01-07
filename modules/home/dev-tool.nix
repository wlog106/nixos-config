{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    gdb
    gnumake
    libgcc
  ];
  
  programs.git.enable = true;
}
