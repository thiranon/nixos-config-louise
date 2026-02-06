{ pkgs, ... }:

{
  # Gaming support for 2026
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
  };

  # GameMode for performance optimization
  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        renice = 10;
      };
      custom = {
        start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
        end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
      };
    };
  };

  # Gaming packages
  environment.systemPackages = with pkgs; [
    # Game launchers
    lutris
    heroic
    
    # Gaming utilities
    mangohud
    goverlay
    gamemode
    
    # Performance monitoring
    btop
    
    # Wine for Windows games
    wineWowPackages.stable
    winetricks
  ];
}
