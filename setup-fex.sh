#!/bin/bash
set -e

# https://wiki.fex-emu.com/index.php/Development:Setting_up_FEX
sudo apt install -y \
  git \
  cmake \
  ninja-build \
  pkg-config \
  ccache \
  clang \
  lld \
  binfmt-support \
  libsdl2-dev \
  libepoxy-dev \
  libssl-dev \
  g++-x86-64-linux-gnu \
  nasm \
  python3-clang \
  libstdc++-10-dev-i386-cross \
  libstdc++-10-dev-amd64-cross \
  libstdc++-10-dev-arm64-cross \
  squashfs-tools \
  squashfuse \
  libc-bin \
  libc6-dev-i386-amd64-cross \
  lib32stdc++-9-dev-amd64-cross

cd ~
git clone --recurse-submodules https://github.com/FEX-Emu/FEX.git
cd FEX

mkdir Build
cd Build
CC=clang CXX=clang++ cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DENABLE_LTO=True -DENABLE_LLD=True -DBUILD_TESTS=False -DENABLE_ASSERTIONS=False -G Ninja ..
ninja

sudo ninja install
sudo ninja binfmt_misc_32
sudo ninja binfmt_misc_64
