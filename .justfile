export RCRC := "~/.dotfiles/rcrc"
bw_k8s_item_id := 'dba6245f-a6eb-4fe7-9e70-b01b01148b85'

default: up

fmt:
    stylua .

up:
    rcup

brew:
    brew update
    brew bundle

create:
    distrobox create

build:
    podman build -f ./ci/Containerfile .

update-k8s:
    bw create attachment --itemid {{ bw_k8s_item_id }} --file ~/.kube/config

get-k8s:
    bw get attachment config --itemid {{ bw_k8s_item_id }} --output ~/.kube/config

install-packages:
    ansible-playbook ./playbooks/install_packages.yml
