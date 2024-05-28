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
      (with pkgs; [ gnome-photos gnome-tour gedit ]) ++ (with pkgs.gnome; [
        cheese # webcam tool
        gnome-music
        epiphany # web browser
        geary # email reader
        gnome-characters
        tali # poker game
        iagno # go game
        hitori # sudoku game
        atomix # puzzle game
        yelp # Help view
        gnome-contacts
        gnome-initial-setup
      ]);

    programs.dconf.enable = true;

    environment.systemPackages = with pkgs; [ gnome.gnome-tweaks ];
  };
}
