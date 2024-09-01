{ config, pkgs, ... }:

{
  #programs.waybar.style = (builtins.readFile ../sources/waybar.css);
  programs.waybar = {
    enable = true;
    settings = [{
      layer = "top";
      position = "top";
      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "hyprland/window" ];
      modules-right = [ "pulseaudio" "battery" "tray" "clock" ];

      "hyprland/workspaces" = {
        format = "{icon}";
        format-icons = {
          active = "";
          default = "";
          urgent = "";
        };
        on-scroll-up = "hyprctl dispatch workspace e+1";
        on-scroll-down = "hyprctl dispatch workspace e-1";
      };
      "clock" = {
        format = " {:L%I:%M %p}";
        tooltip = true;
        tooltip-format = ''
          <big>{:%A, %d.%B %Y }</big>
          <tt><small>{calendar}</small></tt>'';
      };
      "hyprland/window" = {
        max-length = 50;
        separate-outputs = false;
      };
      "tray" = {
        icon-size = 20;
        spacing = 12;
      };
      "pulseaudio" = {
        format = "{icon}  {volume}% {format_source}";
        format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = " {icon} {format_source}";
        format-muted = " {format_source}";
        format-source = " {volume}%";
        format-source-muted = "";
        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = [ "" "" "" ];
        };
        on-click = "sleep 0.1 && pavucontrol";
      };
      "custom/notification" = {
        tooltip = false;
        format = "{icon} {}";
        format-icons = {
          notification = "<span foreground='red'><sup></sup></span>";
          none = "";
          dnd-notification = "<span foreground='red'><sup></sup></span>";
          dnd-none = "";
          inhibited-notification =
            "<span foreground='red'><sup></sup></span>";
          inhibited-none = "";
          dnd-inhibited-notification =
            "<span foreground='red'><sup></sup></span>";
          dnd-inhibited-none = "";
        };
        return-type = "json";
        exec-if = "which swaync-client";
        exec = "swaync-client -swb";
        on-click = "sleep 0.1 && task-waybar";
        escape = true;
      };
      "battery" = {
        states = {
          warning = 25;
          critical = 10;
        };
        format = "{icon} {capacity}%";
        format-charging = "󰂄 {capacity}%";
        format-plugged = "󱘖 {capacity}%";
        format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        on-click = "";
        tooltip = true;
      };
    }];

    style = ''
      * {
        font-family: JetBrainsMono Nerd Font Mono;
        font-size: 16px;
        border-radius: 0px;
        border: none;
        min-height: 0px;
      }
      window#waybar {
        background: rgba(20,20,20,0.6);
      }
      #workspaces {
        margin: 4px 4px;
        padding: 5px 5px;
        border-radius: 16px;
      }
      #workspaces button {
        font-weight: bold;
        padding: 0px 5px;
        margin: 0px 3px;
        border-radius: 16px;
        opacity: 0.8;
      }
      #workspaces button.active {
        font-weight: bold;
        padding: 0px 5px;
        margin: 0px 3px;
        border-radius: 16px;
        opacity: 1.0;
        min-width: 40px;
      }
      #workspaces button:hover {
        font-weight: bold;
        border-radius: 16px;
        opacity: 0.8;
      }
      tooltip {
        border-radius: 12px;
      }
      #window, #pulseaudio, #battery, #tray {
        font-weight: bold;
        margin: 0px;
        padding: 0px 10px;
        border-radius: 24px 10px 24px 10px;
      }
      #clock {
        font-weight: bold;
        margin: 0px;
        padding: 0px 15px 0px 15px;
        border-radius: 0px 0px 0px 40px;
      }
    '';
  };
}
