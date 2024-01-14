{pkgs, ...}:

{
home-manager.users.hx = {
  home.packages = with pkgs; [
    alacritty
  ];
  xdg.configFile = {
    "alacritty/files/alacritty.toml".source = ./alacritty.yml;
  };
};
}