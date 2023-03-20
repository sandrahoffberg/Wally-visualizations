# hash:sha256:a19db70b5df9fd7e036da280f80f15498bb7b822bf1c5b59179e6b7fa980ed4b
FROM registry.apps.codeocean.com/codeocean/mambaforge:22.9.0-3

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        autoconf=2.69-11.1 \
        automake=1:1.16.1-4ubuntu6 \
        build-essential=12.8ubuntu1.1 \
        ca-certificates=20211016ubuntu0.20.04.1 \
        cmake=3.16.3-1ubuntu1.20.04.1 \
        gcc=4:9.3.0-1ubuntu2 \
        gfortran=4:9.3.0-1ubuntu2 \
        git=1:2.25.1-1ubuntu3.10 \
        hdf5-tools=1.10.4+repack-11ubuntu1 \
        libboost-date-time-dev=1.71.0.0ubuntu2 \
        libboost-filesystem-dev=1.71.0.0ubuntu2 \
        libboost-iostreams-dev=1.71.0.0ubuntu2 \
        libboost-program-options-dev=1.71.0.0ubuntu2 \
        libboost-system-dev=1.71.0.0ubuntu2 \
        libbz2-dev=1.0.8-2 \
        libcurl4-gnutls-dev=7.68.0-1ubuntu2.18 \
        libdeflate-dev=1.5-3 \
        libhdf5-dev=1.10.4+repack-11ubuntu1 \
        liblzma-dev=5.2.4-1ubuntu1.1 \
        libncurses-dev=6.2-0ubuntu2 \
        pkg-config=0.29.1-0ubuntu4 \
        zlib1g-dev=1:1.2.11.dfsg-2ubuntu1.5 \
    && rm -rf /var/lib/apt/lists/*

RUN conda install -y --channel=bioconda --channel=conda-forge \
        libpng==1.6.39 \
        samtools==1.16.1 \
    && conda clean -ya

COPY postInstall /
RUN /postInstall
