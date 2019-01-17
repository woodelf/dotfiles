# This file defines network configurations

{ config, pkgs, ... }:

{

  # Network configuration
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  
  # Wireless network configuration
  networking.wireless.enable = true;
}
