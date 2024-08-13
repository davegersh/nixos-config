{ config, pkgs, ... }:

{
  networking.networkmanager = {
    enable = true;
    wifi.powersave = false;
    wifi.scanRandMacAddress = false;
  };

  networking.firewall.enable = true;
}
