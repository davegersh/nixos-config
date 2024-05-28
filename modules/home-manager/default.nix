# needed to allow automatic importing of all files in the home-manager directory

{ lib, ... }: {
  imports = [
    ./btop.nix
    ./git.nix
    ./gtk.nix
    ./zsh.nix
    ./i3.nix
    ./gnome.nix
    ./alacritty.nix
    ./chromium.nix
    ./neovim.nix
    ./vscode.nix
  ];
}
