{ pkgs, ... }:

let
  niriFuzzelSwitcher = pkgs.writeShellApplication {
    name = "niri-fuzzel-switcher";
    runtimeInputs = [
      pkgs.niri
      pkgs.jq
      pkgs.fuzzel
    ];
    text = ''
      # Query active windows from Niri
      windows_json=$(niri msg --json windows)

      # Extract window IDs
      mapfile -t window_ids < <(echo "$windows_json" | jq -r '.[].id')

      # Build Fuzzel dmenu formatted lines with raw control characters (\u0000 and \u001f)
      # and a fallback icon chain
      mapfile -t window_titles < <(
        echo "$windows_json" | jq -b -r '
          .[] | 
          (
            .desktop_entry // 
            (.app_id | select(. != null) | split(".")[-1] | ascii_downcase) // 
            "application-x-executable"
          ) as $icon |
          "\(.app_id // "unknown") - \((.title // "Untitled") | gsub("[\r\n]"; " "))\u0000icon\u001f\($icon),application-x-executable"
        '
      )

      # Find index of currently focused window
      sel=$(echo "$windows_json" | jq '[ .[].is_focused ] | index(true) // 0')

      # Run Fuzzel in dmenu mode
      if [ "''${#window_titles[@]}" -gt 0 ]; then
        result=$(printf "%s\n" "''${window_titles[@]}" | fuzzel --dmenu --index --select-index "$sel" || true)

        if [ -n "$result" ] && [ "$result" -ne -1 ]; then
          niri msg action focus-window --id "''${window_ids[$result]}"
        fi
      fi
    '';
  };
in
{
  home.packages = [
    niriFuzzelSwitcher
    pkgs.fuzzel
    pkgs.jq
    pkgs.papirus-icon-theme
  ];

  xdg.configFile."niri/config.kdl".source = ./niri-config.kdl;
}
