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
      ../../modules/system/media.nix
      ../../modules/system/input-method.nix
      ../../modules/system/fonts.nix
      ../../modules/system/nvidia.nix
      ../../modules/system/hyprland.nix
      #../../modules/system/gnome.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.tailscale.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    starship
    qbittorrent
    tailscale
    mattermost
    mattermost-desktop
    discord
    fastfetch
    lshw
    nautilus
  ];

  services.mattermost = {
    enable = true;
    siteUrl = "https://mattermost.it.cs.nycu.edu.tw";
  };

  system.stateVersion = "25.11"; 
}
