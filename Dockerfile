FROM ubuntu:14.04
MAINTAINER Oak Chen <oak@sfysoft.com>

# 避免Ubuntu 18.04+构建时提示debconf错误
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends command-not-found command-not-found-data && \
    apt-get install -y --no-install-recommends language-pack-en language-pack-en-base && \
    apt-get install -y --no-install-recommends language-pack-zh-hans language-pack-zh-hans-base && \
    apt-get install -y --no-install-recommends rsync && \
    apt-get install -y --no-install-recommends vim python-markdown tofrodos xsltproc && \
    apt-get install -y --no-install-recommends zip unzip curl ca-certificates gettext gnupg bc mingw32 && \
    apt-get install -y --no-install-recommends build-essential git gawk flex bison gperf ccache && \
    apt-get install -y --no-install-recommends genisoimage device-tree-compiler u-boot-tools && \
    apt-get install -y --no-install-recommends libncurses5-dev lib32ncurses5-dev libreadline6-dev && \
    apt-get install -y --no-install-recommends x11proto-core-dev libx11-dev libgl1-mesa-glx libgl1-mesa-dev && \
    apt-get install -y --no-install-recommends libc6-dev libc6-dev-i386 gcc-multilib g++-multilib && \
    apt-get install -y --no-install-recommends libxml2-utils lib32z-dev zlib1g-dev && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    mkdir -p /usr/lib/jvm && \
    curl -o jdk8.tgz https://android.googlesource.com/platform/prebuilts/jdk/jdk8/+archive/master.tar.gz && \
    tar -zxf jdk8.tgz linux-x86 && \
    mv linux-x86 /usr/lib/jvm/java-8-openjdk-amd64 && \
    rm -rf jdk8.tgz

ENV LANG en_US.utf8
ENV LANGUAGE en_US:en

