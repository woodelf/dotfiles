# This file defines users

{ config, pkgs, ... }:

{

  # Users configuration
  users.users.wood = {
    isNormalUser = true;
    home = "/home/wood";
    uid = 1000;
    extraGroups = [ "wheel" "disk" "audio" "video" "users" "input" "networkmanager"];
  };
}
