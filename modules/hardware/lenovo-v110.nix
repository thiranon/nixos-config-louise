{ pkgs, config, lib, ... }:

{
  # Hardware specific tweaks for Lenovo V110
  
  # Function keys (Brightness/Volume) usually work out of the box with standard tools
  # Enable brightnessctl for brightness control
  environment.systemPackages = [ pkgs.brightnessctl ];

  # Touchpad support (libinput)
  services.libinput.enable = true;

  # Power Management (TLP is good for laptops)
  services.tlp.enable = true;
}
