#!/bin/bash

# Fonction pour changer le fond d'écran sur Linux (Fedora)
changer_fond_ecran_linux() {
    # Nouveau chemin vers l'image de fond d'écran sur Linux (Fedora)
    new_wallpaper="/home/romx/Documents/Perso/bash/jbcj0uqbihg41.jpg"

    # Changer le fond d'écran pour Linux (Fedora)
    gsettings set org.gnome.desktop.background picture-uri "file://$new_wallpaper"

    # Afficher un message de confirmation
    echo "Fond d'écran changé avec succès sur Linux (Fedora)."
}

# Fonction pour changer le fond d'écran sur Windows
changer_fond_ecran_windows() {
    # Nouveau chemin vers l'image de fond d'écran sur Windows
    newWallpaper="/jbcj0uqbihg41.jpg"

    # Définir le fond d'écran sur Windows
    reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "$newWallpaper" /f

    # Actualiser les paramètres du bureau sur Windows pour appliquer le nouveau fond d'écran
    rundll32.exe user32.dll, UpdatePerUserSystemParameters
}

# Affichage du menu
echo "Choisissez votre environnement :"
echo "1. Linux (Fedora)"
echo "2. Windows"

# Lecture du choix de l'utilisateur
read -p "Entrez le numéro correspondant à votre environnement : " choix

# Appel de la fonction correspondant à l'environnement choisi
case $choix in
    1) changer_fond_ecran_linux ;;
    2) changer_fond_ecran_windows ;;
    *) echo "Choix invalide." ;;
esac
