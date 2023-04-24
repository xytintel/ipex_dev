FROM ubuntu:22.04
ENV http_proxy=http://child-prc.intel.com:913 https_proxy=http://child-prc.intel.com:913

RUN apt-get update && apt-get install -y git ninja-build libglib2.0-0 libsm6 libxrender-dev libxext6 wget net-tools git software-properties-common \
build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev wget libbz2-dev \
python3.10 python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/python3.10 /usr/bin/python

WORKDIR /workspace
COPY *.sh ./
