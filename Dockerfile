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
    apt-get install -y --no-install-recommends vim wget curl unzip lzop socat xterm && \
    apt-get install -y --no-install-recommends gawk diffstat texinfo texi2html docbook-utils help2man asciidoc groff && \
    apt-get install -y --no-install-recommends python-pysqlite2 desktop-file-utils && \
    apt-get install -y --no-install-recommends git-core cvs subversion mercurial && \
    apt-get install -y --no-install-recommends build-essential autoconf automake chrpath u-boot-tools && \
    apt-get install -y --no-install-recommends gcc-multilib libsdl1.2-dev libgl1-mesa-dev libglu1-mesa-dev && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

ENV LANG en_US.utf8
ENV LANGUAGE en_US:en

