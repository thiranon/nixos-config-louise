{ pkgs, ... }:

{
  # Hyprland Config
  programs.hyprland = {
    enable = true;
    # Optional: enable nvidia helper if needed (not likely for V110 but good for ref)
    # enableNvidiaPatches = false; 
    xwayland.enable = true;
  };

  # Hint Electron apps to use Wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1"; # often needed for older hardware/VMs
  };

  # Essential desktop packages
  environment.systemPackages = with pkgs; [
    hyprpaper # wallpaper
    wofi # app launcher
    dolphin # file manager
  ];
  
  # Screen sharing services (xdg-desktop-portal)
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
