@echo off
setlocal enabledelayedexpansion

:: Informations sur le systeme
echo System Information:
echo --------------------
for /f "delims=" %%a in ('powershell -Command "(Get-CimInstance -ClassName Win32_OperatingSystem).Caption"') do (
    set "osName=%%a"
)
for /f "delims=" %%a in ('powershell -Command "(Get-CimInstance -ClassName Win32_OperatingSystem).Version"') do (
    set "osVersion=%%a"
)

:: Extraire le suffixe de la version
for /f "tokens=2 delims=." %%b in ("!osVersion!") do (
    set "versionSuffix="
    if "%%b"=="0" (
        set "versionSuffix=20H2"
    ) else if "%%b"=="1" (
        set "versionSuffix=21H2"
    ) else if "%%b"=="2" (
        set "versionSuffix=22H2"
    ) else if "%%b"=="3" (
        set "versionSuffix=23H2"
    )
)

echo OS Name: !osName!
echo OS Version: !versionSuffix!
echo.

:: Definir le code de couleur jaune
set "YELLOW=0E"

:: Variables pour stocker les resultats
set "secureBootResult="
set "virtualizationResult="
set "antiCheatResult=Pas d'anti-cheat detecte."
set "antivirusResult=Pas d'antivirus detecte."
set "vcredistResult="
set "vcredistVersions="
set "antiCheatFound=0"
set "antivirusFound=0"
set "vcredistFound=0"
set "realTimeProtectionResult="
set "coreIsolationResult="

:: Verifier l'etat du demarrage securise
echo OT SERVICES : Verification de l'etat du demarrage securise...
for /f "tokens=2 delims=:" %%a in ('bcdedit /enum ^| findstr /i "SecureBoot"') do (
    set "secureBootState=%%a"
)
if /i "!secureBootState!"=="Yes" (
    set "secureBootResult=ACTIVE"
) else (
    set "secureBootResult=DESACTIVE"
)

:: Verifier l'etat de la virtualisation
echo OT SERVICES : Verification de l'etat de la virtualisation...
for /f "tokens=*" %%i in ('wmic cpu get VirtualizationFirmwareEnabled ^| findstr /i "TRUE"') do (
    set "virtualizationResult=La virtualisation est activee."
)
if not defined virtualizationResult (
    set "virtualizationResult=La virtualisation est desactivee."
)

:: Verifier les anti-cheats
set "antiCheatList=Epic Games;Riot Games;BattlEye;Easy Anti-Cheat;FairFight;PunkBuster"
for %%a in (%antiCheatList%) do (
    echo OT SERVICES : Verification de %%a...
    if "%%a"=="Epic Games" (
        reg query "HKLM\SOFTWARE\Epic Games\EpicGamesLauncher" >nul 2>&1 && (
            set "antiCheatFound=1"
            set "antiCheatResult=Anti-cheat detecte : Epic Games."
        )
    ) else if "%%a"=="Riot Games" (
        reg query "HKLM\SOFTWARE\Riot Games" >nul 2>&1 && (
            set "antiCheatFound=1"
            set "antiCheatResult=Anti-cheat detecte : RIOT Games."
        )
    ) else if "%%a"=="BattlEye" (
        reg query "HKLM\SOFTWARE\BattlEye" >nul 2>&1 && (
            set "antiCheatFound=1"
            set "antiCheatResult=Anti-cheat detecte : BattlEye."
        )
    ) else if "%%a"=="Easy Anti-Cheat" (
        reg query "HKLM\SOFTWARE\EasyAntiCheat" >nul 2>&1 && (
            set "antiCheatFound=1"
            set "antiCheatResult=Anti-cheat detecte : Easy Anti-Cheat."
        )
    ) else if "%%a"=="FairFight" (
        reg query "HKLM\SOFTWARE\FairFight" >nul 2>&1 && (
            set "antiCheatFound=1"
            set "antiCheatResult=Anti-cheat detecte : FairFight."
        )
    ) else if "%%a"=="PunkBuster" (
        reg query "HKLM\SOFTWARE\PunkBuster" >nul 2>&1 && (
            set "antiCheatFound=1"
            set "antiCheatResult=Anti-cheat detecte : PunkBuster."
        )
    )
)

:: Verifier la presence d'antivirus
echo OT SERVICES : Verification de Windows Defender...
sc query Windefend >nul 2>&1 && (
    set "antivirusFound=1"
    set "antivirusResult=Antivirus detecte : Windows Defender."
)

:: Verifier d'autres antivirus populaires
set "antivirusList=Avast;AVG;Norton;McAfee;Kaspersky Lab"
for %%a in (%antivirusList%) do (
    echo OT SERVICES : Verification de %%a...
    reg query "HKLM\SOFTWARE\%%a" >nul 2>&1 && (
        set "antivirusFound=1"
        set "antivirusResult=Antivirus detecte : %%a."
    )
)

:: Verifier l'etat de la protection en temps reel
echo OT SERVICES : Verification de l'etat de la protection en temps reel...
for /f "tokens=*" %%i in ('powershell -Command "Get-MpPreference | Select-Object -ExpandProperty DisableRealtimeMonitoring"') do (
    if "%%i"=="True" (
        set "realTimeProtectionResult=Protection en temps reel desactivee."
    ) else (
        set "realTimeProtectionResult=Protection en temps reel activee."
    )
)

:: Verifier l'isolement de base
echo OT SERVICES : Verification de l'etat de l'isolement de base...
for /f "tokens=*" %%i in ('powershell -Command "Get-CimInstance -Namespace 'root\Microsoft\Windows\DeviceGuard' -ClassName 'Win32_DeviceGuard' | Select-Object -ExpandProperty Enabled"') do (
    if "%%i"=="TRUE" (
        set "coreIsolationResult=Isolement de base actif."
    ) else (
        set "coreIsolationResult=Isolement de base inactif."
    )
)

:: Verifier les redistributables Visual C++
echo OT SERVICES : Verification des redistributables Visual C++...

:: Verifier chaque version par rapport aux fichiers et aux registres
:: 2015-2022
if exist "C:\Windows\System32\msvcr140.dll" (
    set "vcredistFound=1"
    set "vcredistVersions=!vcredistVersions!2015-2022 "
)
reg query "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\x64" >nul 2>&1 && (
    set "vcredistFound=1"
    set "vcredistVersions=!vcredistVersions!2015-2022 "
)

:: 2013
if exist "C:\Windows\System32\msvcr120.dll" (
    set "vcredistFound=1"
    set "vcredistVersions=!vcredistVersions!2013 "
)
reg query "HKLM\SOFTWARE\Microsoft\VisualStudio\12.0\VC\Runtimes\x64" >nul 2>&1 && (
    set "vcredistFound=1"
    set "vcredistVersions=!vcredistVersions!2013 "
)

:: 2012
if exist "C:\Windows\System32\msvcr110.dll" (
    set "vcredistFound=1"
    set "vcredistVersions=!vcredistVersions!2012 "
)
reg query "HKLM\SOFTWARE\Microsoft\VisualStudio\11.0\VC\Runtimes\x64" >nul 2>&1 && (
    set "vcredistFound=1"
    set "vcredistVersions=!vcredistVersions!2012 "
)

:: 2010
if exist "C:\Windows\System32\msvcr100.dll" (
    set "vcredistFound=1"
    set "vcredistVersions=!vcredistVersions!2010 "
)
reg query "HKLM\SOFTWARE\Microsoft\VisualStudio\10.0\VC\Runtimes\x64" >nul 2>&1 && (
    set "vcredistFound=1"
    set "vcredistVersions=!vcredistVersions!2010 "
)

:: 2008
if exist "C:\Windows\System32\msvcr90.dll" (
    set "vcredistFound=1"
    set "vcredistVersions=!vcredistVersions!2008 "
)
reg query "HKLM\SOFTWARE\Microsoft\VisualStudio\9.0\VC\Runtimes\x64" >nul 2>&1 && (
    set "vcredistFound=1"
    set "vcredistVersions=!vcredistVersions!2008 "
)

:: 2005
if exist "C:\Windows\System32\msvcr80.dll" (
    set "vcredistFound=1"
    set "vcredistVersions=!vcredistVersions!2005 "
)
reg query "HKLM\SOFTWARE\Microsoft\VisualStudio\8.0\VC\Runtimes\x64" >nul 2>&1 && (
    set "vcredistFound=1"
    set "vcredistVersions=!vcredistVersions!2005 "
)

:: Resume final des resultats
echo.
echo ======= Resume des verifications =======
color %YELLOW%
echo Etat du demarrage securise : %secureBootResult%
echo %virtualizationResult%
echo %antiCheatResult%
echo %antivirusResult%
if %vcredistFound%==0 (
    echo Pas de redistributables detectes.
) else (
    echo Redistributables detectes : !vcredistVersions!
)
echo %realTimeProtectionResult%
echo %coreIsolationResult%
echo =========================================
echo Appuyez sur une touche pour fermer la fenetre...
pause

endlocal
