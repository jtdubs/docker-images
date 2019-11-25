FROM ubuntu-base:0.2

USER root

# Setup Microsoft repository
RUN wget -q https://packages.microsoft.com/config/ubuntu/19.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    sudo dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb && \
    sudo apt-get update && \
    sudo apt-get install -qq -y apt-transport-https && \
    sudo apt-get update

# Install .NET SDK 3.0
RUN sudo apt-get install -qq -y dotnet-sdk-3.0

USER user
WORKDIR /mnt
CMD /bin/bash
