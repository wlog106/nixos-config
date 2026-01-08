{ pkgs, lib, ... }:

{

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.wayland = true;

  # To disable installing GNOME's suite of applications
  # and only be left with GNOME shell.
  services.gnome.core-apps.enable = false;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;

  environment.systemPackages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.no-title-bar
  ];

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour 
    gnome-user-docs
    gnome-shell-extensions
  ];

  # scale 200% on login screen
  programs.dconf.profiles.gdm.databases = [
    {
      settings = {
        "org/gnome/desktop/interface" = {
          # 1 = 100%, 2 = 200%
          scaling-factor = lib.gvariant.mkUint32 2;
        };
      };
    }
  ];

}
