FROM kalilinux/kali-rolling:latest

# Install Kali base packages
RUN apt-get update
RUN yes no | apt-get install -y kismet-capture-common
RUN yes no | apt-get install -y macchanger
RUN yes 1  | apt-get install -y keyboard-configuration
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qq -y kali-linux-full

# Install additional security tools
RUN apt-get install -y iputils-ping gobuster arachni hurl


WORKDIR /tmp

# xortool
RUN git clone https://github.com/hellman/xortool.git/ && \
    cd xortool && \
    pip3 install . && \
    cd .. && \
    rm -Rf xortool

# CrackMapExec
RUN git clone https://github.com/byt3bl33d3r/CrackMapExec && \
    cd CrackMapExec && \
    git submodule init && \
    git submodule update --recursive && \
    pip install . && \
    cd .. && \
    rm -Rf CrackMapExec

# angr
RUN git clone https://github.com/angr/angr.git && \
    cd angr && \
    pip3 install . && \
    cd .. && \
    rm -Rf angr

# miasm
RUN git clone https://github.com/cea-sec/miasm.git && \
    cd miasm && \
    pip install . && \
    cd .. && \
    rm -Rf miasm

# interact
RUN git clone https://github.com/jtdubs/interact.git && \
    cd interact && \
    pip3 install . && \
    cd .. && \
    rm -Rf interact

# additional python packages
RUN pip3 install monkeyhex


WORKDIR /opt

# angr examples
RUN git clone https://github.com/angr/angr-doc

# pwndbg
RUN apt-get install -y libpcrecpp0v5 libglib2.0-dev-bin libpcre16-3 libsepol1-dev libpcre2-32-0 libpcre2-posix0 uuid-dev libpcre32-3 libblkid-dev libpcre2-dev libselinux1-dev libpcre3-dev libmount-dev libglib2.0-dev

RUN git clone https://github.com/pwndbg/pwndbg && \
    cd pwndbg && \
    python3 -m pip install -Ur requirements.txt && \
    echo "source $PWD/gdbinit.py" >> ~/.gdbinit

# RsaCtfTool
RUN git clone https://github.com/Ganapati/RsaCtfTool.git

# CyberChef
RUN mkdir CyberChef && \
    cd CyberChef && \
    wget https://github.com/gchq/CyberChef/releases/download/v9.11.2/CyberChef_v9.11.2.zip && \
    unzip CyberChef_v9.11.2.zip && \
    rm CyberChef_v9.11.2.zip && \
    ln -s CyberChef_v9.11.2.html index.html

COPY scripts/cyberchef /usr/local/bin/

# koadic
RUN git clone https://github.com/zerosum0x0/koadic.git && \
    cd koadic && \
    pip install -r requirements.txt

# Ghidra
RUN wget https://ghidra-sre.org/ghidra_9.1_PUBLIC_20191023.zip && \
    unzip ghidra_9.1_PUBLIC_20191023.zip && \
    mv ghidra_9.1_PUBLIC ghidra && \
    rm ghidra_9.1_PUBLIC_20191023.zip && \
    ln -s /opt/ghidra/ghidraRun /usr/local/bin/ghidra

# strace, pypy
RUN apt-get install -y strace pypy pypy3


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
      nodejs \
      bash-completion \
      fd-find \
      fish

# Setup sudo
RUN echo "user	ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Work out of /mnt, which is where $PWD will be mounted
USER user
WORKDIR /mnt
CMD /usr/bin/fish
