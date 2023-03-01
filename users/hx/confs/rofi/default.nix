{ pkgs, configs, ... }:

{
  home-manager.users.hx = {
    home.packages = with pkgs; [
      rofi
    ];

    xdg.configFile = {
      "rofi/config.rasi".source = ./config.rasi;
      "rofi/Arc-Dark.rasi".source = ./Arc-Dark.rasi;
    };
  };
}
