FROM ubuntu:14.04
MAINTAINER Oak Chen <oak@sfysoft.com>

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends command-not-found command-not-found-data && \
    apt-get install -y --no-install-recommends language-pack-en language-pack-en-base && \
    apt-get install -y --no-install-recommends language-pack-zh-hans language-pack-zh-hans-base && \
    apt-get install -y --no-install-recommends build-essential git gnupg flex bison gperf vim && \
    apt-get install -y --no-install-recommends zip curl libc6-dev libncurses5-dev x11proto-core-dev && \
    apt-get install -y --no-install-recommends libx11-dev libreadline6-dev libgl1-mesa-glx && \
    apt-get install -y --no-install-recommends libgl1-mesa-dev g++-multilib mingw32 tofrodos && \
    apt-get install -y --no-install-recommends python-markdown libxml2-utils xsltproc lib32z1 && \
    apt-get install -y --no-install-recommends genisoimage gawk device-tree-compiler u-boot-tools bc && \
    apt-get install -y --no-install-recommends openjdk-7-jdk unzip gettext && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

ENV LANG en_US.utf8
ENV LANGUAGE en_US:en
