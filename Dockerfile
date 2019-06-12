FROM ubuntu:16.04
RUN sed -i 's/archive.ubuntu/tw.archive.ubuntu/g' /etc/apt/sources.list

# Setup required packages for runner and OpenWRT compilation
RUN dpkg --add-architecture i386 \
&& apt-get update \
&& apt-get install -y locales \
git-core build-essential \
libssl-dev libncurses5-dev unzip gawk zlib1g-dev \
subversion curl wget file python gettext \
libxml-parser-perl zip kmod cpio \
libswitch-perl bsdmainutils time gperf \
libc6:i386 libncurses5:i386 libstdc++6:i386 zlib1g:i386 \
libarchive-zip-perl sudo vim-common tar device-tree-compiler \
&& apt-get clean
RUN locale-gen en_US.UTF-8; mkdir -p /mnt/data
RUN adduser --disabled-password --gecos '' newuser
RUN adduser newuser sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers


WORKDIR /mnt/data

# autorun command
COPY autorun.sh /root/autorun.sh
