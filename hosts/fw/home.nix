{ config, pkgs, inputs, ... }:

{
  home.username = "dave";
  home.homeDirectory = "/home/dave";

  home.stateVersion = "23.11";

  imports = [ inputs.self.outputs.homeManagerModules.default ];

  home.packages = with pkgs; [
    spotify
    discord
    obsidian

    protonvpn-cli
    protonmail-desktop

    rofi-wayland
    swww # background manager
    xfce.thunar
    xfce.thunar-volman
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {

  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.hackneyed;
    name = "Hackneyed";
    size = 24;
  };

  home.sessionVariables = {
    EDITOR = "hx";
    BROWSER = "chromium";
    TERMINAL = "kitty";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
