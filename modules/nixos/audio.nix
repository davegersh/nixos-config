{ config, pkgs, ... }:

{
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;

  security.rtkit.enable = true;

  environment.systemPackages = with pkgs; [ pavucontrol ];
}
