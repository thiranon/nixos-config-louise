{ pkgs, ... }:

{
  # Bootloader Configuration
  # Using systemd-boot (standard for UEFI). 
  # If legacy BIOS is needed, swap for GRUB.
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
	enable = true;
	device = "/dev/sda";
  };
  
  # Kernel setup (optional: use latest kernel)
  # boot.kernelPackages = pkgs.linuxPackages_latest;
}
