{ config, pkgs, lib, inputs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    inputs.nixos-hardware.nixosModules.framework-13-7040-amd
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager.extraSpecialArgs = { inherit inputs; };
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.backupFileExtension = "backup";
      home-manager.users."dave" = import ./home.nix;
    }
  ];

  # framework firmware management
  services.fwupd.enable = true;

  # disk management / mounting
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  programs.xfconf.enable = true; # ensures xfce configs actually save

  # Nix Storage Optimization
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  # Bootloader
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  security.polkit.enable = true;

  networking.hostName = "nixos-fw";

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Display
  hyprland.enable = true;

  users.users.dave = {
    isNormalUser = true;
    description = "dave";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    packages = with pkgs; [ ];
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  programs.dconf.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # essentials
    vim
    git
    wget
    gcc
    neofetch

    # nix utilities
    nixfmt-classic
    nil
    nh

    # utilities
    hyprshot
    peek
    brightnessctl
    eza
    libreoffice
  ];

  # Before changing this value read the documentation for this option check out
  # https://search.nixos.org/options?channel=23.11&show=system.stateVersion.
  system.stateVersion = "23.11"; # Did you read the comment?
}
