FROM debian:stable as fetch
RUN apt-get update && apt-get install -y --no-install-recommends \
    bzip2 \
    ca-certificates \
    curl
ARG ver
RUN curl -sL https://github.com/biod/sambamba/releases/download/v${ver}/sambamba_v${ver}_linux.tar.bz2 \
    | tar xj

FROM debian:stable
RUN apt-get update && apt-get install -y --no-install-recommends \
    procps \
    && rm -rf /var/lib/apt/lists/*
ARG ver
COPY --from=fetch /sambamba_v${ver} /usr/bin/sambamba