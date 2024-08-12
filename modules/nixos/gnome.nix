{ pkgs, lib, config, ... }:

{
  options.gnome.enable = lib.mkEnableOption "Enables Full Gnome DM and WM";

  config = lib.mkIf config.gnome.enable {
    # enables gnome and the login manager for gnome
    services.xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
    };

    # exclude a lot of the gnome extra stuff that gets installed (good!)
    environment.gnome.excludePackages =
      (with pkgs; [ gnome-photos gnome-tour gedit cheese epiphany geary yelp ]) ++ (with pkgs.gnome; [
        gnome-music
        gnome-characters
        tali # poker game
        iagno # go game
        hitori # sudoku game
        atomix # puzzle game
        gnome-contacts
        gnome-initial-setup
      ]);

    programs.dconf.enable = true;

    environment.systemPackages = with pkgs; [ gnome-tweaks ];
  };
}
