{ config, pkgs, ... }:

{
  services.mako = {
    enable = true;
    anchor = "top-right";
    backgroundColor = "#111111CF";
    borderColor = "#00000000";
    borderRadius = 5;
    defaultTimeout = 5000;
    font = "JetBrainsMonoNerdFont 11";
    width = 350;
    height = 125;
    icons = true;
    format = ''<b>%a ⏵</b> %s\n%b'';
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
