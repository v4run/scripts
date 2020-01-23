#!/bin/bash

function get_ip() {
    ip=$(curl https://checkip.amazonaws.com 2>/dev/null);
    echo "$ip";
}

ip_address=$(get_ip);
while true; do
    sleep 10;
    new_address=$(get_ip);
    if [ "$new_address" != "$ip_address" ]; then
        notify-send "IP Changed" "$new_address";
        ip_address="$new_address";
    fi
done
