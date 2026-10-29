{ config, pkgs, ... }:

{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
        ControllerMode = "bredr"; # Forces classic Bluetooth mode
        FastConnectable = true;
      };
    };
  };

  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    wireplumber.enable = true;
    jack.enable = true;
  };

  security.rtkit.enable = true;

  environment.systemPackages = with pkgs; [
    pavucontrol # audio gui
    pamixer # changing volume, muting
    playerctl # play, pause
  ];
}
