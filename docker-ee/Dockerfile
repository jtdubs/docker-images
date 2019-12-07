FROM ubuntu-base:latest
USER root

# Install dependencies
RUN apt-get update
RUN apt-get install --no-install-recommends -qq -y \
      build-essential \
      dbus \
      libasound2 \
      libgl1 \
      libglib2.0-dev \
      libnss3 \
      libpulse0 \
      libssl-dev \
      libusb-1.0-0 \
      libx11-6 \
      libxext6 \
      libxi6 \
      libxkbcommon-dev \
      libxkbcommon-x11-dev \
      libxrandr2 \
      libxrender1 \
      libxtst6 \
      locales-all \
      qt5dxcb-plugin \
      x11-apps \
      x11-xkb-utils \
      xdg-utils

WORKDIR /tmp

# cc65 compiler
RUN git clone https://github.com/cc65/cc65.git && \
    cd cc65 && \
    make && \
    PREFIX=/usr/local make install && \
    cd .. && \
    rm -Rf cc65

# digilent waveforms
RUN wget https://s3-us-west-2.amazonaws.com/digilent/Software/Adept2+Runtime/2.19.2/digilent.adept.runtime_2.19.2-amd64.deb && \
    wget https://digilent.s3-us-west-2.amazonaws.com/Software/Waveforms2015/3.12.1/digilent.waveforms_3.12.1_amd64.deb
RUN mkdir -p /usr/share/desktop-directories /usr/share/icons/hicolor && \
    dpkg -i digilent.adept.runtime_2.19.2-amd64.deb && \
    dpkg -i digilent.waveforms_3.12.1_amd64.deb

WORKDIR /opt

# arduino IDE
RUN wget https://downloads.arduino.cc/arduino-1.8.10-linux64.tar.xz && \
    xz -d arduino-1.8.10-linux64.tar.xz && \
    tar -xf arduino-1.8.10-linux64.tar && \
    rm -f arduino-1.8.10-linux64.tar && \
    cd arduino-1.8.10 && \
    ./install.sh

# eagle
RUN wget https://trial2.autodesk.com/NET17SWDLD/2017/EGLPRM/ESD/Autodesk_EAGLE_9.5.1_English_Linux_64bit.tar.gz && \
    tar -zxf Autodesk_EAGLE_9.5.1_English_Linux_64bit.tar.gz && \
    chown -R user:user eagle-9.5.1 && \
    rm Autodesk_EAGLE_9.5.1_English_Linux_64bit.tar.gz && \
    cd eagle-9.5.1 && \
    ln -s /opt/eagle-9.5.1/eagle /usr/local/bin/eagle

# kicad
RUN apt-get install --no-install-recommends -qq -y \
      kicad

# Run as user
USER user
WORKDIR /mnt
