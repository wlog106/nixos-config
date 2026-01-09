{ ... }:

{
  programs.bash = {
    enable = true;

    shellAliases = {
      cc-vpn-test = "sudo openfortivpn -c ~/cc-vpn.conf --realm test";
      nrs = "sudo nixos-rebuild switch --flake /home/wlog/nixos-config#default";
      ncg = "sudo nix-collect-garbage -d";
      ff = "fastfetch";
    };

    initExtra = ''
      eval "$(starship init bash)"
    '';
  };
}
