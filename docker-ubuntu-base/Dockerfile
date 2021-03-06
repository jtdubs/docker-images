FROM ubuntu:20.04

# Set envrionment variables
ENV DEBIAN_FRONTEND noninteractive
ENV TERM rxvt-unicode-256color
ENV QT_X11_NO_MITSHM 1
ENV LC_ALL C

# Create user
RUN groupadd -g 1000 user
RUN useradd -r -u 1000 -g user -d /home/user -m user

# Install essential tools
RUN apt-get update && \
    apt-get install -qq -y \
      neovim \
      curl \
      wget \
      sudo \
      ca-certificates \
      git \
      iputils-ping \
      iproute2 \
      strace \
      npm \
      nodejs \
      bash-completion \
      fd-find \
      fish

# Populate home directories (.bashrc, etc.)
COPY home /root
COPY --chown=1000:1000 home /home/user

# Setup sudo
RUN echo "user	ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Run as user
USER user
ENV SHELL /usr/bin/fish
ENV USER user
ENV EDITOR nvim
ENV VISUAL nvim
ENV PATH /home/user/bin:/home/user/.local/bin:/home/user/.fzf/bin:$PATH

RUN mkdir -p /home/user/.config
WORKDIR /mnt
CMD /usr/bin/fish
