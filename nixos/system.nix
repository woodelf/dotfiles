# This file defines system related configurations

{ config, pkgs, ... }:

{

  # System package configuration
  environment.systemPackages = with pkgs; [
    git networkmanagerapplet sudo wget vim zsh
  ];

  # Allow proprietary packages
  nixpkgs.config.allowUnfree = true;
}
