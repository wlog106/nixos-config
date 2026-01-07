{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gdb
    gnumake
    libgcc
  ];
  
  programs.git.enable = true;
}
