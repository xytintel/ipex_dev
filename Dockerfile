FROM ubuntu:20.04
ENV http_proxy=http://child-prc.intel.com:913 https_proxy=http://child-prc.intel.com:913

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing git ninja-build libglib2.0-0 libsm6 libxext6 wget net-tools git software-properties-common \
build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget libbz2-dev curl vim nano pciutils \
clang-format opencl-headers clinfo initramfs-tools libdrm2 libz3-4 libigdfcl1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 

WORKDIR /workspace
COPY *.sh ./
COPY *.txt ./
RUN echo "source /root/miniconda3/bin/activate" >> env.sh
RUN . /root/miniconda3/bin/activate && python -m pip install -r requirements.txt

RUN wget -r http://mlpc.intel.com/downloads/gpu-new/components/driver/UBUNTU/agama-ci-devel-602/
RUN dpkg -i ./mlpc.intel.com/downloads/gpu-new/components/driver/UBUNTU/agama-ci-devel-602/*.deb
RUN rm -rf ./mlpc.intel.com
