# Chemin vers le fichier image du fond d'écran
$newWallpaper = "C:\chemin\vers\votre\image.jpg"

# Définir le fond d'écran sur Windows
Set-ItemProperty -path "HKCU:\Control Panel\Desktop" -name Wallpaper -value $newWallpaper

# Actualiser les paramètres du bureau sur Windows pour appliquer le nouveau fond d'écran
$signature = @"
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool SendNotifyMessage(IntPtr hWnd, uint Msg, UIntPtr wParam, IntPtr lParam);

    public static void RefreshDesktop() {
        const int WM_SETTINGCHANGE = 0x001A;
        const int HWND_BROADCAST = 0xFFFF;
        const int SMTO_ABORTIFHUNG = 0x0002;

        SendNotifyMessage((IntPtr)HWND_BROADCAST, WM_SETTINGCHANGE, UIntPtr.Zero, IntPtr.Zero);
    }
"@

Add-Type -MemberDefinition $signature -Namespace MyUtils -Name DesktopUtils
[MyUtils.DesktopUtils]::RefreshDesktop()

# Bloquer les modifications ultérieures du fond d'écran en tant qu'administrateur
Start-Process powershell.exe -Verb RunAs -ArgumentList "/c attrib +R '$env:SystemRoot\System32\oobe\info\backgrounds\backgroundDefault.jpg'"
