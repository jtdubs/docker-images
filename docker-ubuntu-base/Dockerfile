FROM ubuntu:19.10

# Set envrionment variables
ENV DEBIAN_FRONTEND noninteractive
ENV TERM rxvt-unicode-256color
ENV QT_X11_NO_MITSHM 1
ENV LC_ALL C

# Create user
RUN groupadd -g 1000 user
RUN useradd -r -u 1000 -g user -d /home/user -m user

# Populate home directories (.bashrc, etc.)
COPY home/* /root/
COPY home/.* /root/
COPY home/* /home/user/
COPY home/.* /home/user/
RUN chown -R user:user /home/user/.*

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
      strace \
      npm \
      nodejs

# Setup sudo
RUN echo "user	ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Run as user
USER user
WORKDIR /mnt
CMD /bin/bash
