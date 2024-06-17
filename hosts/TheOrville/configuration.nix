{ config, pkgs, ... }:

{
  imports = [
    # Hardware udev rules
    ./hardware-configuration.nix

    # core dotfiles + graphical things
    ../../home
    ../../home/hx
    ../../home/hx/gui.nix
    ../../home/hx/cli.nix
    ../../home/hx/i3
    ../../home/hx/sway

    # Common
    ../../common/amdcpu.nix
    ../../common/amdgpu.nix
    ../../common/docker.nix
    ../../common/fonts.nix
    ../../common/games.nix
    ../../common/networkmanager.nix
    ../../common/pipewire.nix
    ../../common/networking-extra.nix
    ../../common/security.nix
    ../../common/nix-pkg-allow.nix
    ../../common/virtualbox.nix
    ../../common/fwupd.nix
    ../../common/zsh.nix
    ../../common/ssh-client.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "TheOrville";
  networking.useDHCP = false;
  networking.interfaces.enp5s0.useDHCP = true;
  networking.interfaces.wlp6s0.useDHCP = false;

  i18n.defaultLocale = "en_GB.UTF-8";
  console = { keyMap = "no"; };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  time.timeZone = "Europe/Oslo";
  home-manager.users.hx.home.stateVersion = "24.05";
  system.stateVersion = "24.05";
  }
