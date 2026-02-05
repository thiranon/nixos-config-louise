{ pkgs, ... }:

{
  # Hyprland Config
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Hint Electron apps to use Wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1"; 
  };

  # Essential desktop packages
  environment.systemPackages = with pkgs; [
    hyprpaper         # wallpaper
    wofi              # app launcher
    nautilus          # เปลี่ยนเป็น nautilus เพื่อให้ตรงกับ $mod + E ใน home.nix 
    adwaita-icon-theme # เพิ่มตัวนี้เพื่อให้ Nautilus แสดงไอคอนได้ถูกต้อง
  ];
  
  # Screen sharing services (xdg-desktop-portal)
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}