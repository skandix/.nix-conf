{pkgs, ...}:

{
    home-manager.users.skandix = {
        home.packages = with pkgs; [
            tmux
            tmux-cssh
        ];
        home.file.tmux = {
            source = ./tmux.conf;
            target = ".tmux.conf";
        };
    };
}
