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
  stow \
  tig \
  tmux \
  util-linux \
  util-linux-user \
  vte-profile \
  wget \
  zsh

# Install starship prompt
RUN curl -sS https://starship.rs/install.sh | sh -s -- --yes

# Install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
