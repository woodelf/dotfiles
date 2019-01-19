# This file define boot related configurations

{ config, pkgs, ... }:

{

  # Grub2 boot loader configuration (with UEFI)
  boot.loader = {
    systemd-boot = {
      enable = false;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/EFI";
    };
    grub = {
      enable = true;
      efiSupport = true;
      gfxmodeEfi = "1920x1080";
      device = "nodev";
    };
  };

  # Grub2 boot loader configuration (with BIOS)
  #boot.loader = {
  #  systemd-boot = {
  #    enable = false;
  #  };
  #  grub = {
  #    enable = true;
  #    gfxmodeBios = "1920x1080";
  #    device = "nodev";
  #  };
  #};

  # Kernel configuration
  #boot.kernelPackages = pkgs.linuxPackages_testing;
  boot.initrd.kernelModules = [ "btrfs" ];
  boot.kernelParams = [ ];

  # Intel microcode configuration
  hardware.cpu.intel.updateMicrocode = true;
}
