@echo off
:menu
cls
echo Menu :
echo 1. Actualiser le Fond d'ecran
echo 2. Deloquer Internet
echo 3. Enlever l'oie
echo 4. Quitter

set /p choice="Entrez votre choix (1-4): "

if "%choice%"=="1" goto change_wallpaper
if "%choice%"=="2" goto block_internet
if "%choice%"=="3" goto spawn_goose
if "%choice%"=="4" goto end

echo Choix invalide. Veuillez entrer un nombre entre 1 et 4.
pause
goto menu

:change_wallpaper
powershell.exe -ExecutionPolicy Bypass -File "C:\Users\romx\OneDrive - Ynov\Documents\ttfn\windows\deblockChangeBackground.ps1"
echo Fond d'écran actualiser.
pause
goto menu

:block_internet
powershell.exe -ExecutionPolicy Bypass -File "C:\Users\romx\OneDrive - Ynov\Documents\ttfn\windows\piratage.ps1"
echo Internet débloqué.
pause
goto menu

:spawn_goose
start "Ca va mieux" cmd /c "C:\Users\romx\OneDrive - Ynov\Documents\ttfn\windows\Desktop Goose v0.31\DesktopGoose v0.31\Close Goose.bat"
echo Oie disparu.
pause
goto menu

:end
echo Au revoir!
