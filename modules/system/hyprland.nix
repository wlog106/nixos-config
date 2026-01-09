{ pkgs, ... }:

{

  programs.hyprland.enable = true;
 
  programs.bash.loginShellInit  = "start-hyprland";

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  
  environment.systemPackages = with pkgs; [
    rofi
    nwg-look
    ashell
    hyprpaper
    hyprlock
    hypridle
  ];

}
