{ config, pkgs, ... }:

{
  imports = [
    # Hardware udev rules
    # ./hardware-configuration.nix

    # core dotfiles + graphical things
    ../../users
    ../../users/hx
    ../../users/hx/cli.nix

    # Common
    ../../common/docker.nix
    ../../common/fonts.nix
    ../../common/games.nix
    ../../common/networkmanager.nix
    ../../common/pipewire.nix
    ../../common/networking-extra.nix
    ../../common/security.nix
    ../../common/nix-pkg-allow.nix
    ../../common/amdcpu.nix
    ../../common/amdgpu.nix

    # WG
    #./c137.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber= true;

  networking.hostName = "TheOrville";
  networking.useDHCP = false;
  networking.interfaces.enp5s0.useDHCP = true;
  networking.interfaces.wlp6s0.useDHCP = false;

  i18n.defaultLocale = "en_GB.UTF-8";
  console = { keyMap = "no"; };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  home-manager.users.hx.home.stateVersion = "23.11";
  time.timeZone = "Europe/Oslo";
  system.stateVersion = "23.11";
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
  }
