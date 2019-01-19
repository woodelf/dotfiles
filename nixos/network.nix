# This file defines network configurations

{ config, pkgs, ... }:

{

  # Network configuration
  networking.hostName = "NixOS";
  networking.networkmanager.enable = true;
  
  # Wireless network configuration
  #networking.wireless.enable = true;
}
