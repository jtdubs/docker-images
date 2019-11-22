FROM ubuntu-base:0.1

USER root

# Install dependencies
RUN apt-get update
RUN apt-get install -y -qq \
      build-essential

# Install additional tools
RUN apt-get install -y -qq \
      cmake \
      libfreetype6 \
      libfreetype6-dev \
      libftgl2 \
      libxcb-render0-dev \
      libxcb-shape0-dev \
      libxcb-xfixes0-dev \
      libxft2 \
      libxft-dev \
      nodejs \
      npm \
      python3

USER user

# Add Cargo to PATH
ENV PATH $PATH:/home/user/.cargo/bin

# Install Rust
RUN curl -o rustup.sh --proto '=https' --tlsv1.2 https://sh.rustup.rs && \
    sh ./rustup.sh -y
RUN rustup default stable

USER user
WORKDIR /mnt
CMD /bin/bash
