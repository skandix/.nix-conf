# - name: COMMON | Create ~/.ssh directory
#   file:
#     path: "~/.ssh"
#     state: directory

# - name: COMMON | Create ~/.Pictures directory
#   file:
#     path: "~/Pictures"
#     state: directory

# - name: COMMON | Create ~/.Pictures/screenshot directory
#   file:
#     path: "~/Pictures/screenshot"
#     state: directory

# - name: COMMON | Create ~/gitclones directory
#   file:
#     path: "~/gitclones"
#     state: directory

# - name: COMMON | Create ~/junkyard directory
#   file:
#     path: "~/junkyard"
#     state: directory

# - name: .wallpapers | Create wallpaper directory
#   file:
#     path: "~/.wallpapers"
#     state: directory

# - name: .wallpapers | Symlink wallpaper folder
#   file:
#     src: '{{ ansible_env.PWD }}/roles/common/files/{{ item }}'
#     path: '~/{{ item }}'
#     state: link
#     follow: yes
#     force: yes
#   loop:
#     - .wallpapers