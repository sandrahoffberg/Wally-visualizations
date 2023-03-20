# hash:sha256:91b6bf3beed63bb83d65f46ac700c3ff310af1eb66879d9bace0e9780fe36771
FROM registry.apps.codeocean.com/codeocean/mambaforge:22.9.0-3

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        autoconf=2.69-14 \
        automake=1:1.16.3-2 \
        build-essential=12.9 \
        ca-certificates=20210119 \
        cmake=3.18.4-2+deb11u1 \
        gcc=4:10.2.1-1 \
        gfortran=4:10.2.1-1 \
        git=1:2.30.2-1+deb11u2 \
        hdf5-tools=1.10.6+repack-4+deb11u1 \
        libboost-date-time-dev=1.74.0.3 \
        libboost-filesystem-dev=1.74.0.3 \
        libboost-iostreams-dev=1.74.0.3 \
        libboost-program-options-dev=1.74.0.3 \
        libboost-system-dev=1.74.0.3 \
        libbz2-dev=1.0.8-4 \
        libcurl4-gnutls-dev=7.74.0-1.3+deb11u7 \
        libdeflate-dev=1.7-1 \
        libhdf5-dev=1.10.6+repack-4+deb11u1 \
        liblzma-dev=5.2.5-2.1~deb11u1 \
        libncurses-dev=6.2+20201114-2 \
        pkg-config=0.29.2-1 \
        zlib1g-dev=1:1.2.11.dfsg-2+deb11u2 \
    && rm -rf /var/lib/apt/lists/*

RUN conda install -y --channel=bioconda --channel=conda-forge \
        libpng==1.6.39 \
        samtools==1.16.1 \
    && conda clean -ya

COPY postInstall /
RUN /postInstall
