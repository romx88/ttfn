# Liste des sites à bloquer
$sites = @("chat.openai.com", "teams.microsoft.com", "youtube.com", "github.com", "ytrack.learn.ynov.com", "extranet.ynov.com", "outlook.office.com")

# Chemin vers le fichier HOSTS
$hostsFile = "$env:SystemRoot\System32\drivers\etc\hosts"

# Adresse IP locale (peut être modifiée selon vos besoins)
$redirectIP = "127.0.0.1"

# Lire tout le contenu du fichier HOSTS
$currentContent = Get-Content $hostsFile -Raw

# Parcourir la liste des sites à bloquer
foreach ($site in $sites) {
    # Vérifier si l'entrée existe déjà dans le fichier HOSTS
    $existingEntry = "$redirectIP $site"
    
    if ($currentContent -notlike "*$existingEntry*") {
        # Ajouter une entrée dans le fichier HOSTS pour rediriger le site vers l'adresse IP locale
        $currentContent += "`n$redirectIP $site"
    }
}

# Réécrire le fichier HOSTS avec le nouveau contenu
Set-Content -Path $hostsFile -Value $currentContent

Write-Host "Tout trafic sortant vers les sites bloqués est maintenant redirigé vers l'adresse IP locale."
