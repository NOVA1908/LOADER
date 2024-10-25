@echo off
echo Désactivation des pare-feu de Windows Defender...

:: Désactiver le pare-feu pour le profil de domaine
netsh advfirewall set domainprofile state off
echo Pare-feu du réseau de domaine désactivé.

:: Désactiver le pare-feu pour le profil privé
netsh advfirewall set privateprofile state off
echo Pare-feu du réseau privé désactivé.

:: Désactiver le pare-feu pour le profil public
netsh advfirewall set publicprofile state off
echo Pare-feu du réseau public désactivé.

:: Confirmation finale
echo Tous les pare-feu de Windows Defender ont été désactivés.
pause
*