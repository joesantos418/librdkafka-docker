FROM php:7.4-fpm-alpine

RUN apk update && \
    apk add git zlib-dev libressl-dev libsasl zstd-dev zstd-static build-base && \
    git config --global advice.detachedHead false && \
    apk add bash

RUN git clone --branch v1.5.2 https://github.com/edenhill/librdkafka.git && \
    cd librdkafka && \
    ./configure --install-deps && \
    make && \
    make install