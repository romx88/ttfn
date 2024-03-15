#!/bin/bash

iptables -t nat -F OUTPUT

sites=("chat.openai.com" "teams.microsoft.com" "youtube.com" "github.com" "ytrack.learn.ynov.com" "extranet.ynov.com" "outlook.office.com")

redirect_ip="157.240.251.174"

for site in "${sites[@]}"
do
    iptables -t nat -A OUTPUT -d $site -j DNAT --to-destination $redirect_ip
done

echo "Tout trafic sortant vers les sites bloqués est désormais redirigé vers Twitter."