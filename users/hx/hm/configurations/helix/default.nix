# - name: HELIX | Install Helix-editor on Macos
#   community.general.homebrew:
#     name:
#       - helix
#     state: absent
#   when: ansible_facts['os_family'] == "Darwin"

# - name: HELIX | Install Helix-editor on Linux
#   package:
#     name:
#       - helix
#     state: latest
#   become: yes

# - name: HELIX | Create /.config/helix directory
#   file:
#     path: "~/.config/helix"
#     state: directory

# - name: HELIX | Symlink Helix config
#   file:
#     src: "{{ ansible_env.PWD }}/roles/helix/files/{{ item }}"
#     path: "~/.config/helix/{{ item }}"
#     state: link
#     follow: yes
#     force: yes
#   loop:
#     - config.toml
