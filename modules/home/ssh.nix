{ ... }:

{
  programs.ssh = {
    enable = true;
    extraConfig = "
      Host debian-in-thinkpad
        Hostname 140.113.89.250
        Port 8390
        User wlog
        IdentityFile ~/.ssh/id_ed25519
    ";
    enableAskPassword = false;
  };
}
