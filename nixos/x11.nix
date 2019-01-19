# This file defines X11 related configurations

{ config, pkgs, ... }:

{

  # Desktop configuration
  services.xserver = {
    enable = true;
    layout = "us";
    libinput.enable = true;
    displayManager.lightdm = {
      enable = true;
    };
    desktopManager = {
      default = "none";
      xterm.enable = false;
    };
    windowManager.i3 = {
      enable = true;
    };
    autorun = true;
    videoDrivers = [ "intel" "nvidia" ];
  };

  # Sound configuration
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Graphics configuration
  hardware.opengl.driSupport32Bit = true;
  hardware.bumblebee.enable = true;
}
