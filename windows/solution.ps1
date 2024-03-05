# Liste des sites à bloquer
$sites = @("chat.openai.com", "teams.microsoft.com", "youtube.com", "github.com", "ytrack.learn.ynov.com", "extranet.ynov.com", "outlook.office.com")

# Chemin vers le fichier HOSTS
$hostsFile = "$env:SystemRoot\System32\drivers\etc\hosts"

# Adresse IP locale (peut être modifiée selon vos besoins)
$redirectIP = "127.0.0.1"

# Vérifier si le script est exécuté en tant qu'administrateur
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "Le script doit être exécuté en tant qu'administrateur pour modifier le fichier hosts."
    exit
}

# Parcourir la liste des sites à bloquer
foreach ($site in $sites) {
    # Vérifier si l'entrée existe déjà dans le fichier HOSTS
    $existingEntry = "$redirectIP`t$site"
    $pattern = "\b$([regex]::Escape($site))\b"
    
    if (-not (Get-Content $hostsFile | Select-String -Pattern $pattern)) {
        # Ajouter une entrée dans le fichier HOSTS pour rediriger le site vers l'adresse IP locale
        Add-Content -Path $hostsFile -Value "$redirectIP`t$site"
    }
}

Write-Host "Tout trafic sortant vers les sites bloqués est maintenant redirigé vers l'adresse IP locale."
