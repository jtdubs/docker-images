FROM hs:0.1

USER root

# Install dependencies
RUN apt-get install --no-install-recommends -qq -y \
  libx11-dev \
  libxinerama-dev \
  libxext-dev \
  libxrandr-dev \
  libxss-dev \
  libxft-dev

USER user

# Install xmonad
RUN stack install xmonad xmonad-contrib

USER user
WORKDIR /home/user
CMD /bin/bash
