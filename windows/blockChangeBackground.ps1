$path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies"
if (!(Test-Path "$path\ActiveDesktop")) {
    New-Item -Path "$path" -Name "ActiveDesktop" -Force
}
New-ItemProperty -Path "$path\ActiveDesktop" -Name "NoChangingWallPaper" -Value 1 -PropertyType DWORD -Force
Write-Host "Les paramètres permettant de changer de fond d'écran dans Windows 11 sont maintenant grisés et inaccessibles."
Restart-Computer -Force
