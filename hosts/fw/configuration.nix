{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
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
  services.fwupd.enable = true; # test

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

  boot.supportedFilesystems = [ "ntfs" ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

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
  users.users.dave = {
    isNormalUser = true;
    description = "dave";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
    ];
    packages = with pkgs; [ ];
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  programs.dconf.enable = true;

  nixpkgs.config.allowUnfree = true;

  # Virtual Machines
  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = [ "dave" ];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # Packages
  environment.systemPackages = with pkgs; [
    # essentials
    xwayland-satellite
    vim
    git
    wget
    gcc
    neofetch
    acpi

    # nix utilities
    nixfmt-classic
    nil
    nh

    # utilities
    peek
    brightnessctl
    eza
    libreoffice

    # rust
    cargo
    rustc
    rust-analyzer
  ];

  # Open network ports
  networking.firewall.allowedTCPPorts = [
    7000
    7001
    7100
  ];
  networking.firewall.allowedUDPPorts = [
    5353
    6000
    6001
    7011
  ];

  # To enable network-discovery
  services.avahi = {
    enable = true;
    nssmdns4 = true; # printing
    openFirewall = true; # ensuring that firewall ports are open as needed
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
      userServices = true;
      domain = true;
    };
  };

  programs.steam.enable = true;

  # Before changing this value read the documentation for this option check out
  # https://search.nixos.org/options?channel=23.11&show=system.stateVersion.
  system.stateVersion = "23.11"; # Did you read the comment?
}
