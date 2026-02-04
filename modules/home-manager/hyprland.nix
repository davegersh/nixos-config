{ config, pkgs, ... }:

let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    swww-daemon &

    sleep 0.1

    swww img /nixos-config/wallpapers/twr_meadow.jpg &
    nm-applet &
    blueman-applet &
    waybar &
    morgen &
  '';
in {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;

    settings = {
      exec-once = "${startupScript}/bin/start";

      monitor = ",preferred,auto,1.175,bitdepth,10";

      # unscale XWayland
      xwayland = { force_zero_scaling = true; };

      windowrulev2 = [
        "opacity 0.925 0.925,class:^(code-url-handler)$" # vscode
        "opacity 0.925 0.925,class:^(kitty)$" # vscode
        "opacity 0.925 0.925,class:^(obsidian)$"
      ];

      env = [
        "GDK_SCALE,2"
        "GDK_DPI_SCALE,1.175"
        "QT_AUTO_SCREEN_SCALE_FACTOR=1"
        "XCURSOR_SIZE,24"
      ];

      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$menu" = "fuzzel";

      bindl = [ ",switch:Lid Switch, exec, hyprlock" ];

      bind = [
        "$mod, RETURN, exec, $terminal"
        "$mod, D, exec, $menu"
        "$mod, V, togglefloating,"
        "$mod, F, fullscreen"
        "$mod, F12, exec, hyprlock"
        "$mod SHIFT, Q, killactive,"
        "$mod SHIFT, X, exit,"

        "$mod, 1, workspace, e~1"
        "$mod, 2, workspace, e~2"
        "$mod, 3, workspace, e~3"
        "$mod, 4, workspace, e~4"
        "$mod, 5, workspace, e~5"
        "$mod, 6, workspace, e~6"
        "$mod, 7, workspace, e~7"
        "$mod, 8, workspace, e~8"
        "$mod, 9, workspace, e~9"
        "$mod, 0, workspace, e~10"

        "$mod SHIFT, 1, movetoworkspace, e~1"
        "$mod SHIFT, 2, movetoworkspace, e~2"
        "$mod SHIFT, 3, movetoworkspace, e~3"
        "$mod SHIFT, 4, movetoworkspace, e~4"
        "$mod SHIFT, 5, movetoworkspace, e~5"
        "$mod SHIFT, 6, movetoworkspace, e~6"
        "$mod SHIFT, 7, movetoworkspace, e~7"
        "$mod SHIFT, 8, movetoworkspace, e~8"
        "$mod SHIFT, 9, movetoworkspace, e~9"
        "$mod SHIFT, 0, movetoworkspace, e~10"

        "$mod SHIFT, n, movetoworkspace, emptyn"

        "$mod ALT, L, resizeactive, 30 0"
        "$mod ALT, H, resizeactive, -30 0"
        "$mod ALT, J, resizeactive, 0 30"
        "$mod ALT, K, resizeactive, 0 -30"

        "$mod SHIFT, L, movewindow, r"
        "$mod SHIFT, H, movewindow, l"
        "$mod SHIFT, J, movewindow, u"
        "$mod SHIFT, K, movewindow, d"

        "$mod, L, movefocus, r"
        "$mod, H, movefocus, l"
        "$mod, J, movefocus, u"
        "$mod, K, movefocus, d"

        ", XF86AudioRaiseVolume, exec, pamixer -i 5"
        ", XF86AudioLowerVolume, exec, pamixer -d 5"
        ", XF86AudioMicMute, exec, pamixer --default-source -m"
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"

        ", XF86MonBrightnessUp, exec, brightnessctl s +3%"
        ", XF86MonBrightnessDown, exec, brightnessctl s 3%-"
      ];

      bindm = [ "$mod, mouse:272, movewindow" ];

      general = {
        gaps_in = 5;
        gaps_out = 10;

        border_size = 0;

        layout = "dwindle";

        resize_on_border = true;
      };

      decoration = {
        rounding = 15;

        active_opacity = 1.0;
        inactive_opacity = 0.9;

        # shadow_offset = "0 5";
        # "col.shadow" = "rgba(00000099)";

        blur = {
          enabled = true;
          size = 5;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;

        # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      misc = {
        force_default_wallpaper =
          0; # Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo =
          true; # If true disables the random hyprland logo / anime girl background. :(
      };

      gestures = { workspace_swipe = true; };

      input = {
        touchpad = {
          natural_scroll = true;
          scroll_factor = 0.5;
        };
      };
    };
  };
}
