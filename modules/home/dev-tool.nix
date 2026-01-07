{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    gdb
    gnumake
    libgcc
  ];

}
