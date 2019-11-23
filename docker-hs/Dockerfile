FROM ubuntu-base:0.1

# Install Haskell Stack
RUN curl -sSL https://get.haskellstack.org/ | sh && \
    stack setup

USER user
WORKDIR /mnt
CMD /bin/bash
