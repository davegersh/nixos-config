{
  pkgs,
  lib,
  config,
  ...
}:

{
  options.hyprland.enable = lib.mkEnableOption "Enables Hyprland";

  config = lib.mkIf config.hyprland.enable {
    programs.hyprland.enable = true;
    programs.hyprland.xwayland.enable = true;
    programs.xwayland.enable = true;
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
    security.pam.services.hyprlock = { };
  };
}
