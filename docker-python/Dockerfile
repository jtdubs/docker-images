FROM ubuntu-base:latest

USER root
RUN apt-get update && \
    apt-get install -qq -y \
      python3-pip

USER user

ENV PATH /home/user/.local/bin:$PATH

RUN pip3 install --upgrade pip && \
    python3 -m pip install --user virtualenv

USER user
WORKDIR /mnt
