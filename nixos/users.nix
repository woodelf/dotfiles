# This file defines users

{ config, pkgs, ... }:

{

  # Users configuration
  users.users.wood = {
    isNormalUser = true;
    home = "/home/wood";
    uid = 1000;
	shell = pkgs.zsh;
    extraGroups = [ "wheel" "disk" "audio" "video" "users" "input" "networkmanager"];
  };

  users.extraUsers.root = {
    shell = pkgs.zsh;
  };
}
