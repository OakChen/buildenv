FROM ubuntu:14.04
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
    apt-get install -y --no-install-recommends bash-completion openssh-client && \
    apt-get install -y --no-install-recommends vim wget zip unzip lzop xterm && \
    apt-get install -y --no-install-recommends gawk diffstat xutils-dev texinfo flex dos2unix && \
    apt-get install -y --no-install-recommends git subversion cvs && \
    apt-get install -y --no-install-recommends android-tools-fsutils && \
    apt-get install -y --no-install-recommends build-essential chrpath libtool automake && \
    apt-get install -y --no-install-recommends binutils-aarch64-linux-gnu && \
    apt-get install -y --no-install-recommends gcc-multilib g++-multilib && \
    apt-get install -y --no-install-recommends libc6-i386 lib32stdc++6 libglib2.0-dev lib32gcc1 && \
    apt-get install -y --no-install-recommends libsdl1.2-dev lib32gomp1 && \
    apt-get install -y --no-install-recommends lib32ncurses5-dev && \
    apt-get install -y --no-install-recommends lib32z1 lib32z1-dev lib32bz2-dev && \
    apt-get install -y --no-install-recommends libssl-dev python-dev && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

ENV LANG en_US.utf8
ENV LANGUAGE en_US:en
