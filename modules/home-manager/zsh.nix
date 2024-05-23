{ config, pkgs, ... }:

{
  programs.starship.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -alh";

      upgrade = "sudo nixos-rebuild switch --upgrade";
      update = "sudo nixos-rebuild switch";
      nixconf = "sudo nvim /etc/nixos/configuration.nix";
      ns = "nix-shell --command zsh";
      nsr = "nix-shell --command zsh --run ";
      nsp = "nix-shell --command zsh -p";

      hupdate = "home-manager switch";

      sus = "systemctl suspend";
      bios = "systemctl reboot --firmware-setup";
      restart = "systemctl reboot";
      poweroff = "shutdown now";

      ".." = "cd ..";
      cdc = "clear && cd";
      nv = "nvim";
      snv = "sudo nvim";
    };

    initExtra = ''
      eval "$(starship init zsh)"
    '';

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
  };
}
