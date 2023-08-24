bw_k8s_item_id := 'dba6245f-a6eb-4fe7-9e70-b01b01148b85'

default: install up

fmt:
    stylua .

install:
    npm install

up:
    cp ~/.dotfiles/.rcrc ~/.rcrc
    rcup -fv

build:
    podman build -f ./ci/Containerfile .

update-k8s:
    bw create attachment --itemid {{ bw_k8s_item_id }} --file ~/.kube/config

get-k8s:
    bw get attachment config --itemid {{ bw_k8s_item_id }} --output ~/.kube/config

install-packages:
    ansible-playbook ./playbooks/install_packages.yml

dark-mode:
    kitty +kitten themes --reload-in=all Catppuccin-Macchiato
    echo "vim.o.background = 'dark'" > ~/.config/nvim/after/plugin/theme-color.lua
    sed -i .bak 's/latte/macchiato/g' ./tmux.conf
    tmux source ~/.tmux.conf

light-mode:
    kitty +kitten themes --reload-in=all Catppuccin-Latte
    echo "vim.o.background = 'light'" > ~/.config/nvim/after/plugin/theme-color.lua
    sed -i .bak 's/macchiato/latte/g' ./tmux.conf
    tmux source ~/.tmux.conf
