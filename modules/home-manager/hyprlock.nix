{ config, pkgs, ... }:

{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = false;
        grace = 0;
        hide_cursor = true;
        no_fade_in = true;
      };

      background = [
        {
          path = "$HOME/nixos-config/wallpapers/webb_ngc602.jpg";
          blur_passes = 1;
          blur_size = 8;
        }
      ];

      input-field = [
        {
          size = "60, 60";
          position = "0, 0";
          monitor = "";
          dots_center = true;
          dots_spacing = 0.35;
          fade_on_empty = false;
          font_color = "rgb(250, 250, 250)";
          outer_color = "rgba(0, 0, 0, 0)";
          inner_color = "rgba(50, 50, 50, 0.75)";
          check_color = "rgba(95, 235, 52, 0.75)";
          shadow_passes = 1;
          font_family = "JetBrainsMono NF";
          placeholder_text = "<i>Enter PIN...</i>";
          rounding = 15;
        }
      ];

      label = [
        {
          # Date
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +"%A, %B %d")"'';
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 22;
          font_family = "JetBrainsMono NF";
          position = "0, 250";
          halign = "center";
          valign = "center";
          shadow_passes = 1;
        }

        {
          # Time
          monitor = "";
          #text = ''cmd[update:1000] echo "$(date +"%R")"'';
          text = "<b>$TIME</b>";
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 100;
          font_family = "JetBrainsMono NF";
          position = "0, 150";
          halign = "center";
          valign = "center";
          shadow_passes = 1;
        }
      ];
    };
  };
}
