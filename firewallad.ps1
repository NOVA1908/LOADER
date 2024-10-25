# Obtenir le chemin du répertoire où se trouve le script PowerShell
$currentDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Chemin vers le fichier firewall.bat en utilisant le répertoire courant
$firewallBatchPath = Join-Path -Path $currentDir -ChildPath "firewall.bat"

# Exécuter le fichier batch en tant qu'administrateur
Start-Process -FilePath $firewallBatchPath -Verb RunAs
