{ pkgs, ... }:

{

  programs.hyprland.enable = true;
 
  programs.bash.loginShellInit  = "start-hyprland";

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  
  environment.systemPackages = with pkgs; [
    libnotify  # provides 'notify-send' command
    mako
    rofi
    thunar
    nwg-look
    ashell
    hyprpaper
    hyprlock
    hypridle

    kooha
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
  ];
}
