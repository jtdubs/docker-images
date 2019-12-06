FROM ubuntu-base:latest
USER root

# Install dependencies
RUN apt-get update
RUN apt-get install --no-install-recommends -y \
      alsa \
      autoconf \
      automake \
      build-essential \
      cmake \
      freeglut3 \
      freeglut3-dev \
      libboost-all-dev \
      libcomedi-dev \
      libfftw3-dev \
      libghc-gi-cairo-dev \
      libghc-gi-gtk-dev \
      libgmp3-dev \
      libgsl-dev \
      libgtk2.0-0 \
      libgtk2.0-dev \
      libjpeg8 \
      libjpeg8-dev \
      liblog4cpp5-dev \
      libopenblas-dev \
      libpulse0 \
      libpulse-dev \
      libqt5svg5-dev \
      libqwt-dev \
      libsdl1.2-dev \
      libtiff5 \
      libtiff5-dev \
      libusb-1.0.0-dev \
      libxmu6 \
      libxmu-dev \
      libzmq3-dev \
      mono-complete \
      portaudio19-dev \
      python3 \
      python3-dev \
      python3-pip \
      python3-pyqt5 \
      python3-setuptools \
      python-cheetah \
      python-comedilib \
      python-gi-cairo \
      python-gtk2-dev \
      python-lxml \
      python-mako \
      python-numpy \
      python-qt4 \
      python-setuptools \
      python-six \
      python-wxgtk3.0 \
      python-wxgtk3.0-dev \
      qt5-default \
      subversion \
      swig3.0 \
      unzip

# Install RTL-SDR
RUN apt-get install --no-install-recommends -y \
      librtlsdr0 \
      librtlsdr-dev \
      rtl-sdr

# Install SoapySDR
RUN apt-get install --no-install-recommends -y \
      libsoapysdr0.6 \
      libsoapysdr-dev \
      python3-soapysdr \
      python-soapysdr \
      soapysdr0.6-module-all \
      soapysdr-tools \
      uhd-soapysdr

# Install GNU Radio
RUN apt-get install --no-install-recommends -y \
      gnuradio \
      gnuradio-dev \
      gr-fosphor \
      gr-gsm \
      gr-iio \
      gr-limesdr \
      gr-osmosdr \
      libgnuradio-analog3.7.13 \
      libgnuradio-atsc3.7.13 \
      libgnuradio-audio3.7.13 \
      libgnuradio-blocks3.7.13 \
      libgnuradio-channels3.7.13 \
      libgnuradio-comedi3.7.13 \
      libgnuradio-digital3.7.13 \
      libgnuradio-dtv3.7.13 \
      libgnuradio-fcd3.7.13 \
      libgnuradio-fcdproplus3.7.11 \
      libgnuradio-fec3.7.13 \
      libgnuradio-fft3.7.13 \
      libgnuradio-filter3.7.13 \
      libgnuradio-fosphor3.7.12 \
      libgnuradio-hpsdr1.2 \
      libgnuradio-iio0 \
      libgnuradio-iqbalance3.7.11 \
      libgnuradio-limesdr0 \
      libgnuradio-noaa3.7.13 \
      libgnuradio-osmosdr0.1.4 \
      libgnuradio-pager3.7.13 \
      libgnuradio-pmt3.7.13 \
      libgnuradio-qtgui3.7.13 \
      libgnuradio-radar3.7 \
      libgnuradio-rds3.7.11 \
      libgnuradio-runtime3.7.13 \
      libgnuradio-trellis3.7.13 \
      libgnuradio-uhd3.7.13 \
      libgnuradio-video-sdl3.7.13 \
      libgnuradio-vocoder3.7.13 \
      libgnuradio-wavelet3.7.13 \
      libgnuradio-wxgui3.7.13 \
      libgnuradio-zeromq3.7.13

# Install inspectrum
RUN apt-get install --no-install-recommends -y \
      inspectrum

# Install cubicsdr
RUN apt-get install --no-install-recommends -y \
      cubicsdr

# Install audacity
RUN apt-get install --no-install-recommends -y \
      audacity \
      audacity-data

# soapy_power
RUN pip3 install wheel && \
    pip3 install soapy-power

# Use /tmp as, well, temporary storage
WORKDIR /tmp

# Install liquid-dsp
RUN git clone https://github.com/jgaeddert/liquid-dsp && \
    cd liquid-dsp && \
    ./bootstrap.sh && \
    CFLAGS="-march=native -O3" ./configure --enable-fftoverride && \
    make -j4 && \
    make install && \
    ldconfig && \
    cd .. && \
    rm -Rf liquid-dsp

# Install QSpectrumAnalyzer
RUN git clone https://github.com/xmikos/qspectrumanalyzer && \
    cd qspectrumanalyzer && \
    pip3 install . && \
    cd .. && \
    rm -Rf qspectrumanalyzer

# Install dump1090
RUN git clone git://github.com/tedsluis/dump1090.git && \
    cd dump1090 && \
    perl -pi -e 's/-Werror//' Makefile && \
    make -j4 && \
    install -m 755 -p dump1090 /usr/local/bin/ && \
    install -m 755 -p view1090 /usr/local/bin/ && \
    cd .. && \
    rm -Rf dump1090

# Install Pothos SDR
RUN git clone --recursive https://github.com/pothosware/PothosCore.git && \
    cd PothosCore && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j4 && \
    make install && \
    ldconfig && \
    cd ../.. && \
    rm -Rf PothosCore

# Install gqrx
RUN git clone https://github.com/csete/gqrx.git && \
    cd gqrx && \
    mkdir build && \
    cd build && \
    cmake -DLINUX_AUDIO_BACKEND=Portaudio .. && \
    make -j4 && \
    make install && \
    ldconfig && \
    cd ../.. && \
    rm -Rf gqrx

# Install baudline
RUN wget http://www.baudline.com/baudline_1.08_linux_x86_64.tar.gz && \
    tar -zxvf baudline_1.08_linux_x86_64.tar.gz && \
    rm baudline_1.08_linux_x86_64.tar.gz && \
    cd baudline_1.08_linux_x86_64 && \
    install -m 755 -p baudline /usr/local/bin/ && \
    cd .. && \
    rm -Rf baudline_1.08_linux_x86_64

# Install SDR#
RUN git clone https://github.com/cgommel/sdrsharp && \
    cd sdrsharp && \
    xbuild /p:TargetFrameworkVersion="v4.5" /p:Configuration=Release && \
    mkdir /opt/SDRSharp && \
    cp Release/* /opt/SDRSharp && \
    ln -s /usr/lib/x86_64-linux-gnu/libportaudio.so.2 /opt/SDRSharp/libportaudio.so && \
    ln -s /usr/lib/x86_64-linux-gnu/librtlsdr.so.0 /opt/SDRSharp/librtlsdr.dll

# Install gqrx-scanner
RUN git clone https://github.com/neural75/gqrx-scanner.git && \
    cd gqrx-scanner && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j4 && \
    make install && \
    cd ../.. && \
    rm -Rf gqrx-scanner

WORKDIR /opt

# Install sdr-trunk
RUN wget https://github.com/DSheirer/sdrtrunk/releases/download/v0.4.0-alpha.9/sdr-trunk-0.4.0-alpha.9-linux-x64.zip && \
    unzip sdr-trunk-0.4.0-alpha.9-linux-x64.zip && \
    rm sdr-trunk-0.4.0-alpha.9-linux-x64.zip && \
    mv sdr-trunk-linux-x64 sdr-trunk && \
    ln -s /opt/sdr-trunk/bin/sdr-trunk /usr/local/bin/sdr-trunk

# Scripts
COPY scripts/* /usr/local/bin/

# Run as sdr user
USER user
WORKDIR /mnt
CMD /bin/bash
