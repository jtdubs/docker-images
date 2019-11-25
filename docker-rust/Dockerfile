FROM ubuntu-base:0.2

USER user
WORKDIR /home/user

# Add Cargo to PATH
ENV PATH $PATH:/home/user/.cargo/bin

# Install Rust
RUN curl -o rustup.sh --proto '=https' --tlsv1.2 https://sh.rustup.rs && \
    sh ./rustup.sh -y
RUN rustup default stable

USER user
WORKDIR /mnt
CMD /bin/bash
