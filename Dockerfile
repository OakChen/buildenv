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
    apt-get install -y --no-install-recommends vim python-markdown tofrodos xsltproc texinfo dos2unix texlive && \
    apt-get install -y --no-install-recommends wget rsync zip unzip curl gettext gnupg bc mingw32 busybox && \
    apt-get install -y --no-install-recommends build-essential git gawk flex bison gperf ccache fakeroot && \
    apt-get install -y --no-install-recommends genisoimage device-tree-compiler u-boot-tools && \
    apt-get install -y --no-install-recommends pkg-config && \
    apt-get install -y --no-install-recommends libncurses5-dev lib32ncurses5-dev libreadline6-dev && \
    apt-get install -y --no-install-recommends libc6-dev libc6-dev-i386 lib32stdc++6 && \
    apt-get install -y --no-install-recommends libxml2-utils lib32z-dev zlib1g-dev liblzo2-2 && \
    apt-get install -y --no-install-recommends x11proto-core-dev libx11-dev libgl1-mesa-glx libgl1-mesa-dev && \
    apt-get install -y --no-install-recommends gcc-aarch64-linux-gnu g++-aarch64-linux-gnu && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

ENV LANG en_US.utf8
ENV LANGUAGE en_US:en

# QT可能引用的包，但目前是在源代码里面找
#    apt-get install -y --no-install-recommends libdbus-1-dev libudev-dev libdouble-conversion-dev libxkbcommon-dev && \
#    apt-get install -y --no-install-recommends libdrm-dev libxext-dev libx11-dev libopenvg1-mesa-dev libjasper-dev && \
#    apt-get install -y --no-install-recommends libmng-dev libtiff5-dev libwebp-dev libsdl2-dev libassimp-dev && \
#    apt-get install -y --no-install-recommends libwayland-dev libegl1-mesa-dev libbluetooth-dev libopenal-dev && \
