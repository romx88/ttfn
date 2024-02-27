# Annuler le blocage du fond d'écran en tant qu'administrateur
Start-Process powershell.exe -Verb RunAs -ArgumentList "/c attrib -R '$env:SystemRoot\System32\oobe\info\backgrounds\backgroundDefault.jpg'"
