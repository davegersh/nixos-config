{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    environment = {
      "LANG" = "en_US.UTF-8";
      "LC_CTYPE" = "en_US.UTF-8";
      "TERM" = "kitty";
    };

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 14;
    };

    shellIntegration.enableZshIntegration = true;
    shellIntegration.enableBashIntegration = true;

    theme = "Gruvbox Dark Hard";
  };
}
