{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = [
      {
        layer = "top";
        position = "top";
        modules-left = [
          "niri/workspaces"
          "niri/window"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "tray"
          "pulseaudio"
          "backlight"
          "battery"
        ];

        "niri/workspaces" = {
          format = "<big>{icon}</big>";
          format-icons = {
            active = "";
            default = "";
            urgent = "";
          };
        };
        "clock" = {
          format = "󰃭 {:%Y-%m-%d  󰥔 %R}";
          tooltip = true;
        };
        "niri/window" = {
          max-length = 40;
        };
        "tray" = {
          icon-size = 20;
          spacing = 12;
        };
        "pulseaudio" = {
          format = "{icon} {volume}%  {format_source}";
          format-bluetooth = "{volume}% {icon}  {format_source}";
          format-bluetooth-muted = " {icon}  {format_source}";
          format-muted = "  {format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "sleep 0.05 && pavucontrol";
        };
        "custom/notification" = {
          tooltip = false;
          format = "{icon} {}";
          format-icons = {
            notification = "<span foreground='red'><sup></sup></span>";
            none = "";
            dnd-notification = "<span foreground='red'><sup></sup></span>";
            dnd-none = "";
            inhibited-notification = "<span foreground='red'><sup></sup></span>";
            inhibited-none = "";
            dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
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
          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          events = {
            on-discharging-warning = "notify-send -u normal -a 'BATTERY WARNING' '' \"$(acpi -b | cut -d ' ' -f 4-)\"";
            on-discharging-critical = "notify-send -u critical -a 'BATTERY WARNING' '' \"$(acpi -b | cut -d ' ' -f 4-)\"";
          };
          on-click = "";
          tooltip = true;
        };
        "backlight" = {
          tooltip = false;
          device = "intel_backlight";
          format = "{icon} {percent}%";
          format-icons = [
            "󰃞"
            "󰃟"
            "󰃠"
          ];
        };
      }
    ];

    style = ''
      * {
        font-family: JetBrainsMono Nerd Font;
        font-size: 15px;
        border-radius: 0px;
        border: none;
        min-height: 35px;
      }
      window#waybar {
        background: rgba(20,20,20,0.75);
      }
      #workspaces {
        margin: 0px 0px;
        padding: 0px 0px;
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
      #window, #pulseaudio, #battery, #tray, #backlight {
        font-weight: bold;
        margin: 0px;
        padding: 0px 10px;
        border-radius: 24px 10px 24px 10px;
      }
      #clock {
        font-weight: bold;
        margin: 0px;
        padding: 0px 10px;
        border-radius: 0px 0px 0px 0px;
      }
    '';
  };
}
