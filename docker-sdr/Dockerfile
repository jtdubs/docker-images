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
      libqwt-qt5-dev \
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
      python3-cheetah \
      python3-comedilib \
      python3-gi-cairo \
#      python3-gtk2-dev \
      python3-lxml \
      python3-mako \
      python3-numpy \
#      python3-qt4 \
      python3-setuptools \
      python3-six \
#      python3-wxgtk3.0 \
#      python3-wxgtk3.0-dev \
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
      libsoapysdr0.7 \
      libsoapysdr-dev \
      python3-soapysdr \
      soapysdr0.7-module-all \
      soapysdr-tools \
      uhd-soapysdr

# Install GNU Radio
RUN apt-get install --no-install-recommends -y \
      gnuradio \
      gnuradio-dev \
      gr-fosphor \
      gr-fcdproplus \
      gr-iio \
      gr-limesdr \
      gr-osmosdr \
      gr-radar \
      libgnuradio-analog3.8.1 \
      libgnuradio-audio3.8.1 \
      libgnuradio-blocks3.8.1 \
      libgnuradio-channels3.8.1 \
      libgnuradio-digital3.8.1 \
      libgnuradio-dtv3.8.1 \
      libgnuradio-fcdproplus3.8.0 \
      libgnuradio-fec3.8.1 \
      libgnuradio-fft3.8.1 \
      libgnuradio-filter3.8.1 \
      libgnuradio-fosphor3.8.0 \
      libgnuradio-hpsdr1.2 \
      libgnuradio-iio1 \
      libgnuradio-iqbalance3.8.0 \
      libgnuradio-limesdr3.0.1 \
      libgnuradio-osmosdr0.2.0 \
      libgnuradio-pmt3.8.1 \
      libgnuradio-qtgui3.8.1 \
      libgnuradio-rds1 \
      libgnuradio-runtime3.8.1 \
      libgnuradio-trellis3.8.1 \
      libgnuradio-uhd3.8.1 \
      libgnuradio-video-sdl3.8.1 \
      libgnuradio-vocoder3.8.1 \
      libgnuradio-wavelet3.8.1 \
      libgnuradio-zeromq3.8.1

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

# Install soapy_power
RUN pip3 install wheel && \
    pip3 install soapy-power

# Use /tmp as, well, temporary storage
WORKDIR /tmp

# Install liquid-dsp
RUN git clone https://github.com/jgaeddert/liquid-dsp && \
    cd liquid-dsp && \
    ./bootstrap.sh && \
    CFLAGS="-march=native -O3" ./configure --enable-fftoverride && \
    make -j8 && \
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
    make -j8 && \
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
    make -j8 && \
    make install && \
    ldconfig && \
    cd ../.. && \
    rm -Rf PothosCore

# # Install gqrx
RUN apt-get install --no-install-recommends -y \
      liborc-0.4-dev && \
    git clone https://github.com/csete/gqrx.git && \
    cd gqrx && \
    mkdir build && \
    cd build && \
    cmake -DLINUX_AUDIO_BACKEND=Gr-audio .. && \
    make -j8 && \
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
    make -j8 && \
    make install && \
    cd ../.. && \
    rm -Rf gqrx-scanner

WORKDIR /opt

# Install sdr-trunk
RUN wget https://github.com/DSheirer/sdrtrunk/releases/download/v0.4.0/sdr-trunk-linux-x86_64-v0.4.0.zip && \
    unzip sdr-trunk-linux-x86_64-v0.4.0.zip && \
    rm sdr-trunk-linux-x86_64-v0.4.0.zip && \
    mv sdr-trunk-linux-x86_64-v0.4.0 sdr-trunk && \
    ln -s /opt/sdr-trunk/bin/sdr-trunk /usr/local/bin/sdr-trunk

# Scripts
COPY scripts/* /usr/local/bin/

# Run as sdr user
USER user
WORKDIR /mnt
