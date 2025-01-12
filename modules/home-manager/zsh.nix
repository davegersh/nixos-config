{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "exa -alh";

      upfw = "sudo nixos-rebuild switch --flake .#fw";
      ns = "nix-shell --command zsh";
      nsr = "nix-shell --command zsh --run";
      nsp = "nix-shell --command zsh -p";
      pkg = "nix search nixpkgs";
      nix-conf = "zellij a nixos-config";

      sus = "systemctl suspend";
      bios = "systemctl reboot --firmware-setup";
      restart = "systemctl reboot";
      poweroff = "shutdown now";

      ".." = "cd ..";
      cdc = "clear && cd";

      shx = "sudo hx";

      cat = "bat";

      zj = "zellij";
      zjc = "zellij --layout compact";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
  };
}
