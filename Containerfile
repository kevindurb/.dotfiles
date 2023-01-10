FROM registry.fedoraproject.org/fedora-toolbox:37

RUN dnf install -y \
  autojump-zsh \
  bat \
  bc \
  curl \
  diffutils \
  entr \
  exa \
  findutils \
  fzf \
  gh \
  git \
  httpie \
  jq \
  just \
  less \
  make \
  ncdu \
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
  tldr \
  tmux \
  util-linux \
  util-linux-user \
  vte-profile \
  wget \
  zsh

RUN sudo ln -s /usr/bin/distrobox-host-exec /usr/local/bin/podman
RUN sudo ln -s /usr/bin/distrobox-host-exec /usr/local/bin/docker
RUN sudo ln -s /usr/bin/distrobox-host-exec /usr/local/bin/distrobox
RUN sudo ln -s /usr/bin/distrobox-host-exec /usr/local/bin/flatpak

RUN pip install neovim

# Install starship prompt
RUN wget -O /tmp/install_starship.sh https://starship.rs/install.sh
RUN sh /tmp/install_starship.sh --yes

# Install nvm
ENV NVM_DIR=/opt/nvm
RUN mkdir -p "${NVM_DIR}"
RUN wget -O /tmp/install_nvm.sh https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh
RUN bash /tmp/install_nvm.sh
RUN source "${NVM_DIR}/nvm.sh" && nvm install lts/*

# coc.vim language servers
RUN source "${NVM_DIR}/nvm.sh" && npm install -g \
  dockerfile-language-server-nodejs \
  bash-language-server

RUN chmod -R a+rw /opt/nvm

# Preinstall host-spawn
RUN wget -O /usr/bin/host-spawn "https://github.com/1player/host-spawn/releases/download/1.2.1/host-spawn-$(uname -m)"
RUN chmod +x /usr/bin/host-spawn

ENTRYPOINT ["/bin/zsh"]
