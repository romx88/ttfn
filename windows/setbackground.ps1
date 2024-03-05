# Chemin vers le fichier image du fond d'écran
$newWallpaper = "C:\Users\romx\OneDrive - Ynov\Documents\ttfn\background.jpg"

# Définir le fond d'écran avec la fonction SystemParametersInfo
$SPI_SETDESKWALLPAPER = 20
$UpdateIniFile = 0x01
$SendChange = 0x02

# Vérifier si le type Wallpaper existe déjà
if (-not ([System.Management.Automation.PSTypeName]'Wallpaper').Type) {
    # Définir le type Wallpaper
    Add-Type -TypeDefinition @"
        using System;
        using System.Runtime.InteropServices;

        public class Wallpaper {
            [DllImport("user32.dll", CharSet = CharSet.Auto)]
            public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
        }
"@
}

# Appliquer le fond d'écran
[Wallpaper]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $newWallpaper, $UpdateIniFile -bor $SendChange)

# Définir les autorisations pour le fichier de fond d'écran pour empêcher les modifications par les utilisateurs
$wallpaperPath = "C:\Windows\Web\Wallpaper\Windows\img0.jpg"

# Obtenez l'identité de l'utilisateur actuel
$currentIdentity = [System.Security.Principal.WindowsIdentity]::GetCurrent()

# Obtenez les objets de sécurité du fichier de fond d'écran
$acl = Get-Acl -Path $wallpaperPath

# Créez une règle d'autorisation refusée pour l'utilisateur actuel
$denyRule = New-Object System.Security.AccessControl.FileSystemAccessRule($currentIdentity.Name, "Write", "Deny")

# Ajoutez la règle d'autorisation refusée à la liste de contrôle d'accès (ACL)
$acl.AddAccessRule($denyRule)

# Appliquer les autorisations modifiées au fichier de fond d'écran
Set-Acl -Path $wallpaperPath -AclObject $acl
