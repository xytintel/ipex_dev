FROM ubuntu:20.04
ENV http_proxy=http://child-prc.intel.com:913 https_proxy=http://child-prc.intel.com:913

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing git ninja-build libglib2.0-0 libsm6 libxext6 wget net-tools git software-properties-common \
build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget libbz2-dev \
clang-format opencl-headers clinfo initramfs-tools libdrm2 libz3-4 libigdfcl1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get update && add-apt-repository ppa:deadsnakes/ppa -y &&  apt-get install -y python3.10 python3-pip

RUN ln -s /usr/bin/python3.10 /usr/bin/python

WORKDIR /workspace
COPY *.sh ./
COPY *.txt ./

RUN wget -r http://mlpc.intel.com/downloads/gpu-new/components/driver/UBUNTU/agama-ci-devel-602/
RUN dpkg -i ./mlpc.intel.com/downloads/gpu-new/components/driver/UBUNTU/agama-ci-devel-602/*.deb

RUN pip --no-cache-dir install --upgrade \
    pip \
    setuptools

RUN python -m pip install -r requirements.txt
