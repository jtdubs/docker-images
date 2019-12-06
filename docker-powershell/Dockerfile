FROM ubuntu-base:latest

USER root
WORKDIR /tmp
RUN mkdir -p /opt/microsoft/powershell && \
    wget https://github.com/PowerShell/PowerShell/releases/download/v7.0.0-preview.6/powershell-7.0.0-preview.6-linux-x64.tar.gz && \
    tar -C /opt/microsoft/powershell -zxvf /tmp/powershell-7.0.0-preview.6-linux-x64.tar.gz && \
    rm -f /opt/powershell-7.0.0-preview.6-linux-x64.tar.gz && \
    ln -s /opt/microsoft/powershell/pwsh /usr/local/bin/

USER user
WORKDIR /mnt
CMD /usr/local/bin/pwsh
