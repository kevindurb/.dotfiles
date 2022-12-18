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
  gh \
  git \
  jq \
  less \
  make \
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
  stow \
  tig \
  tmux \
  util-linux \
  util-linux-user \
  vte-profile \
  wget \
  zsh
