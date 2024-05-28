{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      # highlighting
      jnoortheen.nix-ide
      matklad.rust-analyzer
      tamasfe.even-better-toml

      #python
      ms-python.python
      ms-python.debugpy
      ms-python.vscode-pylance

      # theme
      jdinhlife.gruvbox

      # other
      esbenp.prettier-vscode
      usernamehw.errorlens
    ];
  };
}
