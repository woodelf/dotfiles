# This file defines init services

{ config, pkgs, ... }:

{

  # Init services configuration
  systemd.services = {
    lightdm.enable = true;
    networkmanager.enable = true;
  };
}
