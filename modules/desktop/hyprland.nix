{ pkgs, ... }:

{
  # Hyprland Config - 2026 Edition
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  # Hyprland ecosystem tools
  security.pam.services.hyprlock = {}; # Enable hyprlock PAM

  # Hint Electron apps to use Wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  # Modern desktop packages for Hyprland
  environment.systemPackages = with pkgs; [
    # Wallpaper & Lock
    swww              # Modern wallpaper daemon
    hyprlock          # Lock screen
    hypridle          # Idle management
    
    # Launchers & Menus
    rofi-wayland      # App launcher (better than wofi)
    
    # File Manager
    nautilus
    adwaita-icon-theme
    
    # Clipboard
    wl-clipboard      # Wayland clipboard utilities
    cliphist          # Clipboard history
    
    # Screenshots & Screen Recording
    hyprshot          # Screenshot tool
    grim              # Screenshot utility
    slurp             # Region selector
    wl-screenrec      # Screen recording
    
    # Notifications
    swaynotificationcenter  # Modern notification daemon
    libnotify         # For notify-send
    
    # System utilities
    brightnessctl     # Brightness control
    playerctl         # Media control
    pavucontrol       # Audio control GUI
  ];
  
  # Screen sharing services (xdg-desktop-portal)
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ 
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = "*";
  };
}