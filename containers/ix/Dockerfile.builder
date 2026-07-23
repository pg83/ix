FROM alpine@sha256:28bd5fe8b56d1bd048e5babf5b10710ebe0bae67db86916198a6eec434943f8b

ARG IX_UID=1000
ARG IX_GID=1000

RUN apk add --no-cache \
        bash \
        ca-certificates \
        g++ \
        gcc \
        git \
        make \
        python3 \
    && mkdir -p /home/ix /src/ix \
    && chown "${IX_UID}:${IX_GID}" /home/ix /src/ix

COPY --chmod=755 compiler /opt/ix-bootstrap/bin/gcc
COPY --chmod=755 compiler /opt/ix-bootstrap/bin/g++

USER ${IX_UID}:${IX_GID}
ENV HOME=/home/ix
ENV PATH=/opt/ix-bootstrap/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
WORKDIR /src/ix
