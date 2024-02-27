# Scripts de redirection et de blocage de trafic avec iptables

## Description

Ce dépôt contient des scripts permettant de rediriger ou de bloquer le trafic sortant vers certains sites Web en utilisant iptables, un utilitaire de filtrage de paquets sous Linux.

## Scripts disponibles

### `solution.sh`

Ce script bloque le trafic sortant vers une liste de sites Web spécifiés en utilisant iptables. Il redirige tout trafic sortant vers ces sites vers une adresse IP de destination prédéfinie.

### `piratage.sh`

Ce script annule les règles de blocage ajoutées par le script `block_websites.sh`, permettant ainsi de restaurer le trafic sortant vers les sites Web bloqués.

## Utilisation

1. Assurez-vous d'exécuter les scripts en tant que superutilisateur (root) pour qu'ils aient les permissions nécessaires pour manipuler les règles iptables.

2. Avant d'exécuter les scripts, assurez-vous de modifier les variables appropriées pour spécifier les sites Web à bloquer/rediriger et l'adresse IP de destination.

3. Pour exécuter un script, ouvrez un terminal, naviguez jusqu'au répertoire contenant le script et exécutez-le avec la commande `sudo` :

```bash
sudo ./solution.sh
```
ou

```bash
sudo ./piratage.sh
```