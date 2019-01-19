# This file defines users

{ config, pkgs, ... }:

{

  # Users configuration
  users.users.wood = {
    isNormalUser = true;
    home = "/home/wood";
    uid = 1000;
    extraGroups = [ "audio" 
	"disk" 
        "input"
	"networkmanager"
	"users"
	"video"
	"wheel"
	];
  };
}
