@echo off
:menu
cls
echo Menu :
echo 1. Actualiser le Fond d'ecran
echo 2. Deloquer Internet
echo 3. Enlever l'oie
echo 4. Rechanger le language
echo 5. Quitter

set /p choice="Entrez votre choix (1-4): "

if "%choice%"=="1" goto change_wallpaper
if "%choice%"=="2" goto block_internet
if "%choice%"=="3" goto spawn_goose
if "%choice%"=="4" goto change_language
if "%choice%"=="5" goto end

echo Choix invalide. Veuillez entrer un nombre entre 1 et 5.
pause
goto menu

:change_wallpaper
powershell.exe -ExecutionPolicy Bypass -File "D:\ttfn\windows\deblockChangeBackground.ps1"
echo Fond d'écran actualiser.
pause
goto menu

:block_internet
powershell.exe -ExecutionPolicy Bypass -File "D:\ttfn\windows\piratage.ps1"
echo Internet débloqué.
pause
goto menu

:spawn_goose
start "Ca va mieux" cmd /c "D:\ttfn\windows\Desktop Goose v0.31\DesktopGoose v0.31\Close Goose.bat"
echo Oie disparu.
pause
goto menu

:change_language
powershell.exe -ExecutionPolicy Bypass -File "C:\Users\romx\OneDrive - Ynov\Documents\ttfn\windows\annulchangelanguage.ps1"
echo Changement de langue.
pause
goto menu

:end
echo Au revoir!
