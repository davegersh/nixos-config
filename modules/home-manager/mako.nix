{ config, pkgs, ... }:

{
  services.mako = {
    enable = true;
    settings = {
      anchor = "top-right";
      background-color = "#111111CF";
      border-color = "#00000000";
      border-radius = 5;
      default-timeout = 5000;
      font = "JetBrainsMonoNerdFont 11";
      width = 350;
      height = 125;
      icons = true;
      format = ''<b>%a ⏵</b> %s\n%b'';
    };
    extraConfig = ''
      [urgency=critical]
      border-color=#b83333
      anchor=top-center
      border-size=5
      default-timeout=0
    '';
  };

  home.packages = with pkgs; [
    libnotify
  ];
}
