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
  fzf \
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

RUN sudo ln -s /usr/bin/distrobox-host-exec /usr/local/bin/podman
RUN sudo ln -s /usr/bin/distrobox-host-exec /usr/local/bin/docker
RUN sudo ln -s /usr/bin/distrobox-host-exec /usr/local/bin/distrobox

RUN pip install neovim

# Install starship prompt
RUN wget -O /tmp/install_starship.sh https://starship.rs/install.sh
RUN sh /tmp/install_starship.sh --yes

# Install nvm
ENV NVM_DIR=/opt/nvm
RUN mkdir -p "${NVM_DIR}"
RUN wget -O /tmp/install_nvm.sh https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh
RUN bash /tmp/install_nvm.sh

# Install antigen
ENV ANTIGEN_DIR=/opt/antigen
RUN mkdir -p "${ANTIGEN_DIR}"
RUN wget -O "${ANTIGEN_DIR}/antigen.zsh" git.io/antigen

# Copy in dotfiles
COPY ./zshrc /etc/
COPY ./zprofile /etc/
COPY ./zshenv /etc/

# make antigen plugins happy
RUN mkdir -p /root/.ssh
RUN touch /root/.zshrc

ENTRYPOINT ["/bin/zsh"]
