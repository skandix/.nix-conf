{ config, pkgs, ... }:

{
  imports =
    [
      # Hardware udev rules
      ./hardware-configuration.nix

      # core dotfiles + graphical things
      ../../users
      ../../users/skandix
      ../../users/skandix/gui.nix
      ../../users/skandix/cli.nix

      # Common
      ../../common/docker.nix
      ../../common/fonts.nix
      ../../common/games.nix
      ../../common/kubernetes.nix
      ../../common/obs-studio.nix
      ../../common/networkmanager.nix
      ../../common/pipewire.nix
      ../../common/steam.nix
      ../../common/wireguard.nix
      ../../common/networking-extra.nix
      ../../common/vagrant.nix
      ../../common/reveal-md.nix

      # CPU Microcode
      ../../common/cpu/intel.nix

      # GPU Drivers
      ../../common/gpu/nvidia.nix

      # WG
      #./c137.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "TheOrville";
  networking.useDHCP = false;
  networking.interfaces.enp9s0.useDHCP = true;
  networking.interfaces.wlp7s0.useDHCP = true;

  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "no";
  };

  time.timeZone = "Europe/Oslo";

  system.stateVersion = "22.05";
}
