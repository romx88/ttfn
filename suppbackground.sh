#!/bin/bash

# Chemin vers le fichier de configuration du fond d'écran
config_file="/changebackground.sh"

# Autoriser les modifications du fond d'écran en tant qu'administrateur
echo "Pour autoriser les modifications ultérieures, entrez votre mot de passe administrateur :"
sudo chattr -i "$config_file"
