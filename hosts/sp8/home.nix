{ config, pkgs, inputs, ... }:

{
  home.username = "dave";
  home.homeDirectory = "/home/dave";

  home.stateVersion = "23.11";

  imports = [
    inputs.self.outputs.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    spotify
    discord
    obsidian
    rnote
    krita
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {

  };

  home.sessionVariables = {
    EDITOR = "code";
    BROWSER = "chromium";
    TERMINAL = "alacritty";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
