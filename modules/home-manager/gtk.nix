{ config, pkgs, ... }:

{
  gtk = {
    enable = true;
    theme.package = pkgs.gruvbox-dark-gtk;
    theme.name = "gruvbox-dark";

    iconTheme.package = pkgs.gruvbox-dark-icons-gtk;
    iconTheme.name = "oomox-gruvbox-dark";

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
}
