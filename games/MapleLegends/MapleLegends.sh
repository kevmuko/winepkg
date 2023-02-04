#!/bin/bash
set -e
cd "$(dirname "$0")/Payload"

CMD="wine ./MapleLegends.exe"
if [[ -x "$(command -v FEXBash)" ]]; then
  FEXBash -c "${CMD}"
else
  bash -c "${CMD}"
fi
