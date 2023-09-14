# hash:sha256:cd69405c7add3459cd80aec8c9cc7772145d67586ec5ce8869fa7d8a5abbf287
FROM registry.apps.codeocean.com/codeocean/py-r:python3.10.12-R4.2.3-IRkernel-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        autoconf \
        automake \
        awscli \
        build-essential \
        ca-certificates \
        cmake \
        gcc \
        gfortran \
        git \
        hdf5-tools \
        libboost-date-time-dev \
        libboost-filesystem-dev \
        libboost-iostreams-dev \
        libboost-program-options-dev \
        libboost-system-dev \
        libbz2-dev \
        libcurl4-gnutls-dev \
        libdeflate-dev \
        libhdf5-dev \
        liblzma-dev \
        libncurses-dev \
        pkg-config \
        wget \
        zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

RUN mamba install -y --channel=conda-forge --channel=bioconda \
        libpng==1.6.39 \
        samtools==1.17 \
    && mamba clean -ya

COPY postInstall /
RUN /postInstall
