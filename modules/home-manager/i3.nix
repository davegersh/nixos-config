{ pkgs, lib, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;

    config = rec {
      modifier = "Mod4";
      bars = [{

        statusCommand =
          "bumblebee-status -m pomodoro pasink pasource date time -t gruvbox";
       
        fonts = {
          names = [ "JetBrainsMonoNerdFont" ];
          style = "Regular";
          size = 10.0;
        };

        colors = {
          background = "#1d2021";
          statusline = "#d79921";

          focusedWorkspace.border = "#d79921"; #yellow
          focusedWorkspace.background = "#d79921"; 
          focusedWorkspace.text = "#1d2021"; #darkgray

          activeWorkspace.border = "#1d2021";
          activeWorkspace.background = "#1d2021";
          activeWorkspace.text = "#458588"; #blue

          inactiveWorkspace.border = "#1d2021";
          inactiveWorkspace.background = "#1d2021";
          inactiveWorkspace.text = "#458588";

          urgentWorkspace.border = "#cc241d"; #red
          urgentWorkspace.background = "#cc241d";
          urgentWorkspace.text = "#282828"; #bg
        };

      }];

      window.border = 0;
      window.titlebar = false;

      floating.border = 0;
      floating.titlebar = false;

      gaps.inner = 10;

      keybindings = lib.mkOptionDefault {
        "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
        "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -show drun -show-icons";
        "${modifier}+Shift+d" = "exec ${pkgs.rofi}/bin/rofi -show window";
        "${modifier}+b" = "exec ${pkgs.chromium}/bin/chromium";
      };

      startup = [
        {
          command =
            "xrandr --output DP-2 --mode 1920x1080 --rate 144 --output DP-4 --mode 1920x1080 --rate 144 & xset s off & xset -dpms";
          always = true;
          notification = false;
        }

        {
          command = "feh --bg-scale ~/Pictures/ab_asn.png";
          always = true;
          notification = false;
        }
        
        {
          command = "picom --config ~/.config/picom/picom.conf";
          always = true;
          notification = false;
        }
      ];
    };
  };
}
