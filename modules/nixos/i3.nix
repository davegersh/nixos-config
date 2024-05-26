{ pkgs, lib, config, ... }:

{
  options.i3.enable = lib.mkEnableOption "Enables i3wm and gdm";

  config = lib.mkIf config.i3.enable {
    environment.pathsToLink = [ "/libexec" ];

    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      windowManager.i3.enable = true;
    };

    environment.systemPackages = with pkgs; [
      #x11
      lxappearance
      rofi
      picom
      bumblebee-status
      feh
    ];

  };
}
