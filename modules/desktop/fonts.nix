{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
    # Nerd Fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    # Thai Fonts
    #thai-scalable-fonts-c90
    #google-fonts.sarabun
    #google-fonts.kanit
  ];
}
