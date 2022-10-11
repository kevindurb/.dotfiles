FROM registry.fedoraproject.org/fedora-toolbox:36

RUN dnf install -y \
  autojump-zsh \
  bat \
  bc \
  curl \
  diffutils \
  entr \
  exa \
  findutils \
  git \
  jq \
  less \
  ncurses \
  neovim \
  passwd \
  pinentry \
  prettyping \
  procps-ng \
  python-pip \
  ripgrep \
  shadow-utils \
  starship \
  tig \
  tmux \
  util-linux \
  util-linux-user \
  vte-profile \
  wget \
  zsh

ENV SHELL=/usr/bin/zsh
