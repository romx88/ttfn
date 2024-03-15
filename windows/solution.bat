@echo off
:menu
cls
echo Menu :
echo 1. Changer le fond d'écran
echo 2. Bloquer Internet
echo 3. Faire apparaître une oie
echo 4. Changer de language
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
powershell.exe -ExecutionPolicy Bypass -File "D:\ttfn\windows\setbackground.ps1"
powershell.exe -ExecutionPolicy Bypass -File "D:\ttfn\windows\blockChangeBackground.ps1"
echo Fond d'écran changé.
pause
goto menu

:block_internet
powershell.exe -ExecutionPolicy Bypass -File "D:\ttfn\windows\solution.ps1"
echo Internet bloqué.
pause
goto menu

:spawn_goose
start "TTNF = Tu T'es Fait Niquer" cmd /c "D:\ttfn\windows\Desktop Goose v0.31\DesktopGoose v0.31\GooseDesktop.exe"
echo Oie apparue.
pause
goto menu

:change_language
powershell.exe -ExecutionPolicy Bypass -File "C:\Users\romx\OneDrive - Ynov\Documents\ttfn\windows\changelanguage.ps1"
echo Langue Changer en Russe
pause
goto menu

:end
echo Au revoir!
