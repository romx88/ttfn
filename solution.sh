#!/bin/bash

# Supprimer toutes les règles dans la chaîne OUTPUT de la table nat
iptables -t nat -F OUTPUT

# Liste des sites à bloquer et à rediriger
sites=("chat.openai.com" "teams.microsoft.com" "youtube.com" "github.com" "ytrack.learn.ynov.com" "extranet.ynov.com" "outlook.office.com")

# Adresse IP de la destination vers laquelle nous voulons rediriger (Twitter)
redirect_ip="157.240.251.174"

# Parcourir la liste des sites à bloquer
for site in "${sites[@]}"
do
    # Ajouter une règle pour rediriger le trafic sortant du site vers Twitter
    iptables -t nat -A OUTPUT -d $site -j DNAT --to-destination $redirect_ip
done

echo "Tout trafic sortant vers les sites bloqués est désormais redirigé vers Twitter."
