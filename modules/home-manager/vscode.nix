{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      # highlighting
      jnoortheen.nix-ide
      rust-lang.rust-analyzer
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
      arrterian.nix-env-selector
    ];
  };
}
