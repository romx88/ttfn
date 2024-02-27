# Liste des sites à bloquer
$sites = @("chat.openai.com", "teams.microsoft.com", "youtube.com", "github.com", "ytrack.learn.ynov.com", "extranet.ynov.com", "outlook.office.com")

# Chemin vers le fichier HOSTS
$hostsFile = "$env:SystemRoot\System32\drivers\etc\hosts"

# Adresse IP locale (peut être modifiée selon vos besoins)
$redirectIP = "127.0.0.1"

# Parcourir la liste des sites à bloquer
foreach ($site in $sites) {
    # Ajouter une entrée dans le fichier HOSTS pour rediriger le site vers l'adresse IP locale
    Add-Content -Path $hostsFile -Value "`n$redirectIP $site"
}

# Fermer le fichier HOSTS
(Get-Content $hostsFile).Close()

Write-Host "Tout trafic sortant vers les sites bloqués est maintenant redirigé vers l'adresse IP locale."
