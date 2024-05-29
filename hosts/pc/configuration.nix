{ config, pkgs, inputs, ... }:

{
  imports = [ # Include the results of the hardware scan.
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

  # Nix Storage Optimization
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

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

  networking.hostName = "nixos-pc";

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
  gnome.enable = true;
  
  nvidia.enable = true;

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
    nix-health

    # utilities
    shutter
    peek
  ];

  # Before changing this value read the documentation for this option check out
  # https://search.nixos.org/options?channel=23.11&show=system.stateVersion.
  system.stateVersion = "23.11"; # Did you read the comment?
}
