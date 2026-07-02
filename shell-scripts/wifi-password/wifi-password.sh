#!/usr/bin/env bash
# wifi-password — show current Wi-Fi password
set -euo pipefail
case "$(uname -s)" in
  Darwin)
    wifi=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I 2>/dev/null | awk -F': ' '/ SSID/{print $2}')
    [[ -z "$wifi" ]] && { echo "wifi-password: not connected" >&2; exit 2; }
    security find-generic-password -D "AirPort network password" -ga "$wifi" 2>/dev/null | awk -F'"' '/password/{print $2}'
    ;;
  Linux)
    wifi=$(nmcli -t -f active,ssid dev wifi 2>/dev/null | grep -E '^yes:' | cut -d: -f2)
    [[ -z "$wifi" ]] && { echo "wifi-password: not connected or nmcli missing" >&2; exit 2; }
    sudo cat /etc/NetworkManager/system-connections/"$wifi".nmconnection 2>/dev/null | grep -E '^psk=' | cut -d= -f2
    ;;
  *) echo "wifi-password: unsupported OS" >&2; exit 2 ;;
esac
