{ pkgs, ... }:

{
  # Sound Configuration with Pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK
    # jack.enable = true;
  };
}
