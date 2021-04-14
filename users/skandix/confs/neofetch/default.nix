{pkgs, ...}:

{
    home-manager.users.skandix = {
        home.packages = with pkgs; [
            neofetch
        ];
        xdg.configFile = {
            "neofetch/config.conf".source() = ./config.conf
        };
    };
}