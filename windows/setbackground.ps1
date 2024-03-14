$newWallpaper = "D:\ttfn\windows/background"
$SPI_SETDESKWALLPAPER = 20
$UpdateIniFile = 0x01
$SendChange = 0x02
if (-not ([System.Management.Automation.PSTypeName]'Wallpaper').Type) {
    Add-Type -TypeDefinition @"
        using System;
        using System.Runtime.InteropServices;

        public class Wallpaper {
            [DllImport("user32.dll", CharSet = CharSet.Auto)]
            public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
        }
"@
}
[Wallpaper]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $newWallpaper, $UpdateIniFile -bor $SendChange)
$wallpaperPath = "C:\Windows\Web\Wallpaper\Windows\img0.jpg"
$currentIdentity = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$acl = Get-Acl -Path $wallpaperPath
$denyRule = New-Object System.Security.AccessControl.FileSystemAccessRule($currentIdentity.Name, "Write", "Deny")
$acl.AddAccessRule($denyRule)
Set-Acl -Path $wallpaperPath -AclObject $acl
