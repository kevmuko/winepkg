#!/bin/bash
set -e
cd "$(dirname "$0")"

PAYLOAD_URL="https://www.dropbox.com/s/quplfjb82cd0u6q/Payload.tar.gz?dl=1"
if ! [[ -d "./Payload" ]]; then
  wget -O Payload.tar.gz "${PAYLOAD_URL}"
  tar -xzvf ./Payload.tar.gz
fi

cp -f ./Legends.ini ./Payload/Legends.ini
cp -f ./DLLs/*.dll ~/.wine/drive_c/windows/syswow64

echo "#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Type=Application
Terminal=true
Exec=$(pwd)/MapleLegends.sh
Name=MapleLegends
Comment=MapleLegends
Icon=$(pwd)/Icon.png" > ~/Desktop/MapleLegends.desktop

chmod a+x ~/Desktop/MapleLegends.desktop
gio set ~/Desktop/MapleLegends.desktop metadata::trusted true