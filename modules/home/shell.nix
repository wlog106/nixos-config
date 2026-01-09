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
      eval "$(starship init bash)"
    '';
  };
}
