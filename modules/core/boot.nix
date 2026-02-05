{ pkgs, ... }:

{
  # Bootloader Configuration
  # Using systemd-boot (standard for UEFI). 
  # If legacy BIOS is needed, swap for GRUB.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # Kernel setup (optional: use latest kernel)
  # boot.kernelPackages = pkgs.linuxPackages_latest;
}
