{ config, pkgs, ... }:

{
  imports = [
    # Hardware udev rules
    ./hardware-configuration.nix

    # core dotfiles + graphical things
    ../../users
    ../../users/hx
    ../../users/hx/i3
    ../../users/hx/gui.nix
    ../../users/hx/cli.nix
    ../../users/hx/i3

    # Common
    #../../common/bluetooth.nix
    ../../common/docker.nix
    ../../common/networkmanager.nix
    ../../common/fonts.nix
    ../../common/pipewire.nix
    #../../common/virtualbox.nix

    # CPU Microcode
    ../../common/intelcpu.nix

    # GPU Drivers
    ../../common/nvidiagpu.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.firewall.enable = false;

  networking.hostName = "DeathStar";
  networking.useDHCP = false;
  networking.interfaces.eno1.useDHCP = true;
  systemd.network.wait-online.enable = false;
  systemd.network.wait-online.timeout = 0;

  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "no";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  home-manager.users.hx.home.stateVersion = "23.11";
  time.timeZone = "Europe/Oslo";
  system.stateVersion = "24.05"; # Did you read the comment?... no
}
