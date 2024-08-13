{ config, pkgs, ... }:

{
  networking.networkmanager = {
    enable = true;
    wifi.powersave = false;
    wifi.scanRandMacAddress = false;
  };

  networking.firewall.enable = true;

  environment.systemPackages = with pkgs; [ 
    networkmanagerapplet #nm-applet for easy network management
  ];
}
