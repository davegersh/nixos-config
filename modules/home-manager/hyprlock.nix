{ config, pkgs, ... }:

{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 0;
        hide_cursor = true;
        no_fade_in = true;
      };

      background = [
        {
          path = "$HOME/nixos-config/wallpapers/webb_carina.jpg";
          blur_passes = 2;
          blur_size = 8;
        }
      ];

      input-field = [
        {
          size = "250, 60";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          dots_spacing = 0.35;
          fade_on_empty = false;
          font_color = "rgb(250, 250, 250)";
          outer_color = "rgb(0, 0, 0, 0)";
          inner_color = "rgb(40, 40, 40)";
          check_color = "rgb(204, 136, 34)";
          rounding = -1;
          shadow_passes = 0;
        }
      ];

      label = [
        { # Date
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +"%A, %B %d")"'';
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 22;
          font_family = "JetBrains Mono";
          position = "0, 300";
          halign = "center";
          valign = "center";
        }

        { # Time
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +"%I:%M %p")"'';
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 95;
          font_family = "JetBrains Mono";
          position = "0, 200";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}