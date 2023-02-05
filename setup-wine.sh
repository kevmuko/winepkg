#!/bin/sh

CONF=/etc/apt/apt.conf.d/99-insecure
echo "APT::Get::AllowUnauthenticated \"true\";" >> "${CONF}"
echo "Acquire::AllowInsecureRepositories \"true\";" > "${CONF}"

apt update
apt install -y wget

# Install Wine
dpkg --add-architecture i386
mkdir -pm755 /etc/apt/keyrings
wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/focal/winehq-focal.sources

apt update
apt install --install-recommends -y winehq-staging
