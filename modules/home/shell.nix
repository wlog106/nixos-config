{ ... }:

{
  programs.bash = {
    enable = true;

    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake /home/wlog/nixos-config#default";
      ncg = "sudo nix-collect-garbage -d";
      ff = "fastfetch";
    };

    initExtra = ''
      export PS1='\[\e[38;5;221m\]\u\[\e[0m\] @ \[\e[38;5;75m\]\h\[\e[0m\] in \[\e[38;5;77m\]\w\n\[\e[0m\]-> \[\e[38;5;221m\]\\$\[\e[0m\] '
    '';
  };
}
