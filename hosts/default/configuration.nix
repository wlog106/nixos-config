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
      ../../modules/system/sound.nix
      ../../modules/system/input-method.nix
      ../../modules/system/nvidia.nix
      ../../modules/system/gnome.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.tailscale.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.wlog = {
    isNormalUser = true;
    description = "wlog";
    extraGroups = [ "networkmanager" "wheel" ];
  };


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
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
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    nerd-fonts.fira-mono
    nerd-fonts.jetbrains-mono
  ];

  services.mattermost = {
    enable = true;
    siteUrl = "https://mattermost.it.cs.nycu.edu.tw";
  };

  system.stateVersion = "25.11"; 
}
