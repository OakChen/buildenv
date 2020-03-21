FROM ubuntu:16.04
MAINTAINER Oak Chen <oak@sfysoft.com>

# 避免Ubuntu 18.04+构建时提示debconf错误
ENV DEBIAN_FRONTEND noninteractive

# 修改此文件，加入需要免密码执行sudo的用户或组，然后保持权限位0440
COPY sudoers-without-password /etc/sudoers.d/

RUN chmod 0440 /etc/sudoers.d/sudoers-without-password && \
    rm /bin/sh && ln -s bash /bin/sh && \
    apt-get update -y && \
    apt-get install -y --no-install-recommends command-not-found command-not-found-data && \
    apt-get install -y --no-install-recommends language-pack-en language-pack-en-base && \
    apt-get install -y --no-install-recommends language-pack-zh-hans language-pack-zh-hans-base && \
    apt-get install -y --no-install-recommends gcc-4.9-arm-linux-gnueabihf g++-4.9-arm-linux-gnueabihf && \
    apt-get install -y --no-install-recommends build-essential git vim && \
    apt-get install -y --no-install-recommends libboost-dev && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    if [ ! -e /usr/bin/arm-linux-gnueabihf-gcc ]; then ln -s arm-linux-gnueabihf-gcc-4.9 /usr/bin/arm-linux-gnueabihf-gcc; fi && \
    if [ ! -e /usr/bin/arm-linux-gnueabihf-g++ ]; then ln -s arm-linux-gnueabihf-g++-4.9 /usr/bin/arm-linux-gnueabihf-g++; fi

ENV LANG en_US.utf8
ENV LANGUAGE en_US:en

