{
  config,
  pkgs,
  pkgs-stable,
  inputs,
  ...
}:

{
  home.username = "dave";
  home.homeDirectory = "/home/dave";

  home.stateVersion = "23.11";

  imports = [ inputs.self.outputs.homeManagerModules.default ];

  home.packages =
    (with pkgs; [
      # Unstable Packages
      spotify
      discord
      obsidian

      protonvpn-gui
      protonmail-desktop

      awww # background manager
      thunar
      thunar-volman

      prismlauncher
      bat

      ticktick

      transcribe

      obs-studio
      vlc

      zed-editor
      rmpc
      gamescope
    ])
    ++ (with pkgs-stable; [
      # Stable Packages:

    ]);

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {

  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.hackneyed;
    name = "Hackneyed";
    size = 24;
  };

  home.sessionVariables = {
    EDITOR = "hx";
    BROWSER = "firefox";
    TERMINAL = "kitty";
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = "onlyoffice-desktopeditors.desktop";
      "text/html" = "firefox.desktop";
      "image/png" = "firefox.desktop";
      "image/jpeg" = "firefox.desktop";
      "image/webp" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };
  };

  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Music";
    # Optional: automatically start when a client tries to connect
    network.startWhenNeeded = true;
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire Sound Server"
      }
      auto_update "yes"
    '';
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
