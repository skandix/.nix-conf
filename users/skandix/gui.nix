{ config, pkgs, ... }:

{
   imports = [
     # Gui
     ./confs/i3/default.nix

    # Common - Repo
    ../../common/repo/unstable.nix
    ../../common/repo/master.nix
   ];

  home-manager.users.skandix = {
    home.packages = with pkgs; [
      # Comms
      unstable.slack
      discord
      unstable.tdesktop
      unstable.teams
      zoom-us

      # Entertainment
      spotify
      plex-media-player
      unstable.plexamp
      mpv

      # Productivity
      unstable.firefox
      obsidian

      # Code
      unstable.vscode
      sublime3

      # Tools
      pavucontrol
      unstable.filezilla
      nm-tray
      gnome3.seahorse
      peek
      qalculate-gtk
    ];
  };
}
