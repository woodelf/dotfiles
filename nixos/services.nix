# This file defines init services

{ config, pkgs, ... }:

{

  # Init services configuration
  systemd.services = {
    lightdm.enable = true;
    networkmanager.enable = true;
  };

  # Enable Gconf DBUS
  services.dbus.packages = [ pkgs.gnome3.dconf ];
}

