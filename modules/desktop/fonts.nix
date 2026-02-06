{ pkgs, ... }:

{
  # Modern font configuration for 2026
  fonts = {
    packages = with pkgs; [
      # Base fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      liberation_ttf
      
      # Nerd Fonts for terminal
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.droid-sans-mono
      
      # Modern Thai Fonts (2026)
      noto-fonts-cjk-sans  # Includes Thai
      google-fonts.sarabun
      google-fonts.kanit
      google-fonts.prompt
      google-fonts.mitr
      google-fonts.bai-jamjuree
    ];

    # Font rendering configuration
    fontconfig = {
      defaultFonts = {
        serif = [ "Noto Serif" "Noto Serif Thai" ];
        sansSerif = [ "Noto Sans" "Noto Sans Thai" ];
        monospace = [ "JetBrainsMono Nerd Font" "Noto Sans Mono" ];
      };
    };
  };
}
