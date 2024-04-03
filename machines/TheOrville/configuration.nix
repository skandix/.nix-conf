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

    # Common
    ../../common/docker.nix
    ../../common/fonts.nix
    ../../common/games.nix
    ../../common/networkmanager.nix
    ../../common/pipewire.nix
    ../../common/security.nix
    ../../common/nix-pkg-allow.nix
    ../../common/amdcpu.nix
    ../../common/amdgpu.nix
  ];

  boot.loader = {
    #systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
      extraEntries = ''
        menuentry "IIDX" --class windows --class os {
          insmod part_gpt
          insmod fat
          insmod search_fs_uuid
          insmod chain
          search --no-floppy --fs-uuid --set=root 56ad5e22-b84b-4b32-81bb-7e0ea58414bd
          chainloader \EFI\BOOT\BOOTX64.EFI
        }
      '';
    };
  };
  boot.supportedFilesystems = [ "ntfs" ];

  networking.hostName = "TheOrville";
  networking.useDHCP = false;
  networking.interfaces.enp5s0.useDHCP = true;
  networking.interfaces.wlp6s0.useDHCP = false;
  #systemd.network.wait-online.enable = false;

  i18n.defaultLocale = "en_GB.UTF-8";
  console = { keyMap = "no"; };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  home-manager.users.hx.home.stateVersion = "23.11";
  time.timeZone = "Europe/Oslo";
  time.hardwareClockInLocalTime = true;
  system.stateVersion = "23.11";
  }
