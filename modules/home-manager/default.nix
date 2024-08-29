# needed to allow automatic importing of all files in the home-manager directory

{ lib, ... }: {
  imports = [
    ./btop.nix
    ./git.nix
    ./gtk.nix
    ./zsh.nix
    ./kitty.nix
    ./yazi.nix
    ./chromium.nix
    ./neovim.nix
    ./vscode.nix
    ./hyprland.nix
    ./waybar.nix
    ./hyprlock.nix
    ./mako.nix
  ];
}
