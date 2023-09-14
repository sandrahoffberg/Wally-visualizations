# hash:sha256:b34ffc3154ce8c1fb93fbbebe9100664a4de7c78e30475a48f56cd8e216eebd9
FROM registry.apps.codeocean.com/codeocean/py-r:python3.10.12-R4.2.3-IRkernel-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        autoconf=2.71-2 \
        automake=1:1.16.5-1.3 \
        awscli=1.22.34-1 \
        build-essential=12.9ubuntu3 \
        ca-certificates=20230311ubuntu0.22.04.1 \
        cmake=3.22.1-1ubuntu1.22.04.1 \
        gcc=4:11.2.0-1ubuntu1 \
        gfortran=4:11.2.0-1ubuntu1 \
        git=1:2.34.1-1ubuntu1.10 \
        hdf5-tools=1.10.7+repack-4ubuntu2 \
        libboost-date-time-dev=1.74.0.3ubuntu7 \
        libboost-filesystem-dev=1.74.0.3ubuntu7 \
        libboost-iostreams-dev=1.74.0.3ubuntu7 \
        libboost-program-options-dev=1.74.0.3ubuntu7 \
        libboost-system-dev=1.74.0.3ubuntu7 \
        libbz2-dev=1.0.8-5build1 \
        libcurl4-gnutls-dev=7.81.0-1ubuntu1.13 \
        libdeflate-dev=1.10-2 \
        libhdf5-dev=1.10.7+repack-4ubuntu2 \
        liblzma-dev=5.2.5-2ubuntu1 \
        libncurses-dev=6.3-2ubuntu0.1 \
        pkg-config=0.29.2-1ubuntu3 \
        wget=1.21.2-2ubuntu1 \
        zlib1g-dev=1:1.2.11.dfsg-2ubuntu9.2 \
    && rm -rf /var/lib/apt/lists/*

RUN mamba install -y --channel=conda-forge --channel=bioconda \
        libpng==1.6.39 \
        samtools==1.17 \
    && mamba clean -ya

COPY postInstall /
RUN /postInstall
