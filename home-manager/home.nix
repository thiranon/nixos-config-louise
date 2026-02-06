{ config, pkgs, ... }:

{
  imports = [
    ./waybar.nix
  ];

  home.username = "louise";
  home.homeDirectory = "/home/louise";

  # Setting cursor theme
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

  # Basic Git config
  programs.git = {
    enable = true;
    userName = "thiarnon";
    userEmail = "thiarnon@gmail.com";
  };
  
  # Terminals
  programs.kitty = {
    enable = true;
    themeFile = "GruvboxDark";
    settings = {
        font_size = 12;
    };
  };

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
