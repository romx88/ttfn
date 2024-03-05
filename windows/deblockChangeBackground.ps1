$path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies"
if (!(Test-Path "$path\ActiveDesktop")) {
    New-Item -Path "$path" -Name "ActiveDesktop" -Force
}
Set-ItemProperty -Path "$path\ActiveDesktop" -Name "NoChangingWallPaper" -Value 0 -Force
Write-Host "Les paramètres permettant de changer de fond d'écran dans Windows 11 sont de nouveau accessibles."
Restart-Computer -Force
