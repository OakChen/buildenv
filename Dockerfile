FROM ubuntu:14.04
MAINTAINER Oak Chen <oak@sfysoft.com>

# 避免Ubuntu 18.04+构建时提示debconf错误
ENV DEBIAN_FRONTEND noninteractive

# 修改此文件，加入需要免密码执行sudo的用户或组，然后保持权限位0440
COPY sudoers-without-password /etc/sudoers.d/

RUN chmod 0440 /etc/sudoers.d/sudoers-without-password && \
    apt-get update -y && \
    apt-get install -y --no-install-recommends command-not-found command-not-found-data && \
    apt-get install -y --no-install-recommends language-pack-en language-pack-en-base && \
    apt-get install -y --no-install-recommends language-pack-zh-hans language-pack-zh-hans-base && \
    apt-get install -y --no-install-recommends vim python-markdown python tofrodos xsltproc texinfo && \
    apt-get install -y --no-install-recommends zip unzip curl gettext gnupg bc mingw32 sudo wget chrpath && \
    apt-get install -y --no-install-recommends build-essential git gawk flex bison gperf ccache diffstat && \
    apt-get install -y --no-install-recommends genisoimage device-tree-compiler u-boot-tools && \
    apt-get install -y --no-install-recommends libncurses5-dev lib32ncurses5-dev libreadline6-dev && \
    apt-get install -y --no-install-recommends x11proto-core-dev libx11-dev libgl1-mesa-glx libgl1-mesa-dev && \
    apt-get install -y --no-install-recommends libc6-dev libc6-dev-i386 gcc-multilib g++-multilib && \
    apt-get install -y --no-install-recommends libxml2-utils lib32z-dev zlib1g-dev && \
    apt-get install -y --no-install-recommends openjdk-6-jdk && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    if [ ! -e /usr/include/zconf.h ]; then ln -s /usr/include/x86_64-linux-gnu/zconf.h /usr/include/zconf.h; fi

ENV LANG en_US.utf8
ENV LANGUAGE en_US:en

