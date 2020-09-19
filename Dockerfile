FROM php:7.3.22-fpm-alpine

RUN apk update && \
    apk add git zlib-dev libressl-dev libsasl zstd-dev zstd-static build-base && \
    git config --global advice.detachedHead false && \
    apk add bash

RUN git clone --branch v1.5.0 https://github.com/edenhill/librdkafka.git && \
    cd librdkafka && \
    ./configure --install-deps && \
    make && \
    make install