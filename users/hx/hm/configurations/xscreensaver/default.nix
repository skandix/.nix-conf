# - name: Screensaver | Install xsecurelock on Linux
#   become: yes
#   package:
#     name:
#       - xsecurelock
#     state: latest

# - name: Screensaver | Install xscreensaver on Linux
#   become: yes
#   package:
#     name:
#       - xscreensaver
#     state: latest

# - name: Screensaver | Install xscreensaver-aerial on Linux
#   pacman:
#     name: xscreensaver-aerial
#     state: latest
#     executable: yay
#     extra_args: --builddir /var/cache/yay
#   when: ansible_facts['os_family'] == "ArchLinux"

# - name: Screensaver | Symlink Alacritty config
#   become: yes
#   file:
#     src: "{{ ansible_env.PWD }}/roles/xscreensaver/files/{{ item }}"
#     path: "~/{{ item }}"
#     state: link
#     follow: yes
#     force: yes
#   loop:
#     - .xscreensaver
