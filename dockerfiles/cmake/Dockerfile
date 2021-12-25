FROM ubuntu:latest

LABEL maintainer="Rayyh <rayyounghong@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    gdb \
    && apt-get autoclean -y