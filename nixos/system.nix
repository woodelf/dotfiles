# This file defines system related configurations

{ config, pkgs, ... }:

{

  # System package configuration
  environment.systemPackages = with pkgs; [
    git networkmanagerapplet sudo wget vim zsh
  ];

  # Allow proprietary packages
  nixpkgs.config.allowUnfree = true;

  # Enable extra packages
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "git" "man" "systemd" ];
    theme = "gentoo";
  };
}
