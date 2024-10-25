# Obtenir le chemin du répertoire où se trouve le script PowerShell
$currentDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Chemin vers le fichier install.bat en utilisant le répertoire courant
$installBatchPath = Join-Path -Path $currentDir -ChildPath "install.bat"

# Exécuter le fichier batch en tant qu'administrateur
Start-Process -FilePath $installBatchPath -Verb RunAs
