FROM ubuntu-base:latest

# Install Haskell Stack
RUN curl -sSL https://get.haskellstack.org/ | sh && \
    stack setup

# Setup path
ENV PATH=/home/user/.local/bin:$PATH

USER user
WORKDIR /mnt
