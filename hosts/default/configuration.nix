# Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/system/boot.nix
      ../../modules/system/network.nix
      ../../modules/system/timezone-locale.nix
      ../../modules/system/users.nix
      ../../modules/system/sound.nix
      ../../modules/system/input-method.nix
      ../../modules/system/fonts.nix
      ../../modules/system/nvidia.nix
      ../../modules/system/gnome.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.tailscale.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # wallpaper location: /run/current-system/sw/share/backgrounds/nixos
  environment.systemPackages = (with pkgs; [
    qbittorrent
    tailscale
    mattermost
    mattermost-desktop
    discord
    fastfetch
    lshw
    dconf
    dconf2nix
    nautilus
  ]) ++ (with pkgs.nixos-artwork.wallpapers; [
    binary-black
  ]);

  services.mattermost = {
    enable = true;
    siteUrl = "https://mattermost.it.cs.nycu.edu.tw";
  };

  system.stateVersion = "25.11"; 
}
