{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core/boot.nix
    ../../modules/core/audio.nix
    ../../modules/desktop/hyprland.nix
    ../../modules/desktop/fonts.nix
    ../../modules/hardware/lenovo-v110.nix
  ];

  networking.hostName = "v110";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Bangkok";
  
  # Internationalisation Properties
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "th_TH.UTF-8";
    LC_IDENTIFICATION = "th_TH.UTF-8";
    LC_MEASUREMENT = "th_TH.UTF-8";
    LC_MONETARY = "th_TH.UTF-8";
    LC_NAME = "th_TH.UTF-8";
    LC_NUMERIC = "th_TH.UTF-8";
    LC_PAPER = "th_TH.UTF-8";
    LC_TELEPHONE = "th_TH.UTF-8";
    LC_TIME = "th_TH.UTF-8";
  };

  # Input Method (Fcitx5 for Thai)
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      fcitx5-thai
    ];
  };

  users.users.louise = {
    isNormalUser = true;
    description = "Louise";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" ];
    packages = with pkgs; [
      firefox
      git
      vim
      neofetch
      # Add configuration tool for fcitx5
      fcitx5-configtool
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Nix Flakes Settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Environment variables for Input Method
  environment.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };

  system.stateVersion = "25.11"; 
}
