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
  rcm \
  ripgrep \
  shadow-utils \
  tig \
  tmux \
  util-linux \
  util-linux-user \
  vte-profile \
  wget \
  zsh


# Install starship prompt
RUN wget -O /tmp/install_starship.sh https://starship.rs/install.sh
RUN sh /tmp/install_starship.sh --yes

# Install nvm
RUN wget -O /tmp/install_nvm.sh https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh
RUN bash /tmp/install_nvm.sh
