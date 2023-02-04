#!/bin/sh

apt -o Acquire::AllowInsecureRepositories=true update
apt install --allow-unauthenticated -y wget

# Install Wine
dpkg --add-architecture i386
mkdir -pm755 /etc/apt/keyrings
wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bullseye/winehq-bullseye.sources

apt -o Acquire::AllowInsecureRepositories=true update
apt install --install-recommends --allow-unauthenticated -y winehq-staging
