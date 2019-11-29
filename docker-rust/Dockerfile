FROM ubuntu-base:0.2

USER root
RUN apt-get install -qq -y libxcb*

USER user
WORKDIR /home/user

# Add Cargo to PATH
ENV PATH $PATH:/home/user/.cargo/bin

# Install Rust
RUN curl -o rustup.sh --proto '=https' --tlsv1.2 https://sh.rustup.rs && \
    sh ./rustup.sh -y
RUN rustup default stable
RUN rustup component add rls
RUN rustup component add rust-analysis

USER user
WORKDIR /mnt
CMD /bin/bash
