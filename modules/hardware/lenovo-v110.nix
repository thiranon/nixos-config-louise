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

  # Graphics drivers for Intel (Lenovo V110 typically has Intel HD Graphics)
  hardware.graphics = {
    enable = true;
    enable32Bit = true; # For 32-bit games
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
}
