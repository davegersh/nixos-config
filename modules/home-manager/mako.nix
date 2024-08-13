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
  };
}
