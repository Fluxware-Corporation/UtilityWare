#!/usr/bin/env bash
# myip — public IP
set -euo pipefail
curl -s --max-time 5 https://ifconfig.io || curl -s --max-time 5 https://api.ipify.org
