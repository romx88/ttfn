# Liste des sites à débloquer
$sites = @("chat.openai.com", "teams.microsoft.com", "youtube.com", "github.com", "ytrack.learn.ynov.com", "extranet.ynov.com", "outlook.office.com")

# Chemin vers le fichier HOSTS
$hostsFile = "$env:SystemRoot\System32\drivers\etc\hosts"

# Parcourir la liste des sites à débloquer
foreach ($site in $sites) {
    # Supprimer l'entrée du fichier HOSTS, si elle existe
    (Get-Content $hostsFile) | Where-Object { $_ -notmatch "^127\.0\.0\.1\s+$site" } | Set-Content $hostsFile
}

Write-Host "La suppression des entrées a été effectuée. Les sites spécifiés sont maintenant accessibles."
