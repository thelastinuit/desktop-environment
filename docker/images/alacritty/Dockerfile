ARG DESKTOP_ENVIRONMENT_BASE
FROM $DESKTOP_ENVIRONMENT_BASE:latest

# Install alacritty
RUN sudo apt-get update -qq && \
  sudo apt-get install -qq \
  pkg-config \
  libfreetype6-dev \
  libfontconfig1-dev \
  libgl1-mesa-dev \
  libxcb-xfixes0-dev && \
  curl https://sh.rustup.rs -sSf | sh -s -- -y && \
  export PATH=$PATH:$HOME/.cargo/bin && \
  rustup override set stable && \
  rustup update stable && \
  cargo install --git https://github.com/alacritty/alacritty --tag v0.6.0 && \
  sudo ln -s ~/.cargo/bin/alacritty /usr/bin/alacritty

# Run alacritty
ENTRYPOINT ["/usr/bin/alacritty"]
