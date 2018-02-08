FROM debian:stable as build
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    libbz2-dev \
    liblzma-dev \
    libncurses5-dev \
    libncursesw5-dev \
    zlib1g-dev \
ARG ver
RUN curl -sL https://github.com/samtools/samtools/releases/download/${ver}/samtools-${ver}.tar.bz2 \
    | tar xj \
    && cd samtools-$ver \
    && make

FROM debian:stable
RUN apt-get update && apt-get install -y --no-install-recommends \
    bzip2 \
    lzma \
    libncurses5 \
    libncursesw5 \
    procps \
    zlib1g \
    && rm -rf /var/lib/apt/lists/*
ARG ver
COPY --from=build /samtools-${ver} /samtools-${ver}
ENV PATH="/samtools-${ver}:${PATH}"