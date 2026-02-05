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
    settings.user = {
	name = "thiranon";
	email = "thiranon.wi@gmail.com";
    };
  };
  home.enableNixpkgsReleaseCheck = false;
  # Terminals
  programs.kitty = {
    enable = true;
    # themeFile = "Gruvbox Dark";
    settings = {
        font_size = 12;
    };
  };

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    loginExtra = ''
	if [ -z "$DISPLAY" ] && [ "$XDG_VTRN" = 1 ]; then exec Hyprland fi '';
  };
}
