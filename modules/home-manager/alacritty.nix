{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        LANG = "en_US.UTF-8";
        LC_CTYPE = "en_US.UTF-8";
        TERM = "alacritty";
      };

      colors = {
        bright = {
          black = "#928374";
          blue = "#83a598";
          cyan = "#8ec07c";
          green = "#b8bb26";
          magenta = "#d3869b";
          red = "#fb4934";
          white = "#ebdbb2";
          yellow = "#fabd2f";
        };

        normal = {
          black = "#282828";
          blue = "#458588";
          cyan = "#689d6a";
          green = "#98971a";
          magenta = "#b16286";
          red = "#cc241d";
          white = "#a89984";
          yellow = "#d79921";
        };

        primary = {
          background = "#282828";
          foreground = "#ebdbb2";
        };
      };

      font = {
        normal.family = "JetBrainsMono Nerd Font";
        normal.style = "Regular";
        size = 10;
      };

      window.opacity = 0.9;
    };
  };
}
