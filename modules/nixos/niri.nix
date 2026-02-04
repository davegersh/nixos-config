{ config, pkgs, ... }:

{
  programs.niri = {
    enable = true;
  };

  programs.xwayland.enable = true;
  # xdg.portal = {
  #  enable = true;
  # config = {
  #  common = {
  #   "org.freedesktop.impl.portal.FileChooser" = "gtk";
  # };
  #};
  #};
}
