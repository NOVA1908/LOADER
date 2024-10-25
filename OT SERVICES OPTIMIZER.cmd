@echo off
Set Version=6.0

:: Color Codes
set w=[97m
set p=[95m
set b=[96m
%p%

:: Enabling ANSI Escape Sequences
Reg.exe add "HKCU\CONSOLE" /v "VirtualTerminalLevel" /t REG_DWORD /d "1" /f  > nul

::Enabling Delayed Expansion
setlocal EnablingDelayedExpansion > nul
cls 

::Checking Admin Privlages (this is so the tweaks apply properly)
chcp 65001 >nul 2>&1
cls 
echo.
echo.
echo.       %w%   OT SERVICE OPTIMIZER %p%
echo. ╔════════════════════════════════════════════════════╗
echo. ║                                                    ║
echo. ║     %w% Checking for Administrative Privelages...   %p%  ║
echo. ║                                                    ║
echo. ╚════════════════════════════════════════════════════╝
timeout /t 1 /nobreak > NUL

rmdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
mkdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
if %errorlevel% neq 0 (   
cls 
echo.
echo.
echo. ╔════════════════════════════════════════════════════╗
echo. ║                                                    ║
echo. ║  %w% Running OT SERVICE OPTIMIZER as Administrator...%p% ║
echo. ║                                                    ║
echo. ╚════════════════════════════════════════════════════╝
timeout /t 1 /nobreak > NUL
chcp 437 >nul 2>&1
powershell -NoProfile -NonInteractive -Command start -verb runas "'%~s0'" >nul 2>&1
chcp 65001 >nul 2>&1

if !errorlevel! equ 0 exit /b


echo.
echo             Exm is not running as Admin!
echo     Some optimizations won't work. Continue anyway?
echo.
choice /c:"CQ" /n /m "%BS%               [C] Continue  [Q] Quit" & if !errorlevel! equ 2 exit /b
)


chcp 65001 >nul 2>&1

set THREADS=%NUMBER_OF_PROCESSORS% > nul
for /f %%i in ('wmic path Win32_UserAccount where name^="%username%" get sid ^| findstr "S-"') do set "USER_SID=%%i"


::Enabling Restore points 
chcp 437 >nul 2>&1
powershell -NoProfile Enabling-ComputerRestore -Drive 'C:\' >nul 2>&1
Reg.exe delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "RPSessionInterval" /f  >nul 2>&1
Reg.exe delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "DisablingConfig" /f >nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "SystemRestorePointCreationFrequency" /t REG_DWORD /d 0 /f >nul 2>&1
chcp 65001 >nul 2>&1
%p%

CLS
echo. 
echo. 
echo.                                                                                                  %W%     OT SERVICE OPTIMIZER v1                             
echo.
echo.                                                                                    %r%░██╗░░░░░░░██╗███████╗██╗░░░░░░█████╗░░█████╗░███╗░░░███╗███████╗░
echo.                                                                                    %r%░██║░░██╗░░██║██╔════╝██║░░░░░██╔══██╗██╔══██╗████╗░████║██╔════╝░
echo.                                                                                    %r%░╚██╗████╗██╔╝█████╗░░██║░░░░░██║░░╚═╝██║░░██║██╔████╔██║█████╗░░░
echo.                                                                                    %r%░░████╔═████║░██╔══╝░░██║░░░░░██║░░██╗██║░░██║██║╚██╔╝██║██╔══╝░░░
echo.                                                                                    %r%░░╚██╔╝░╚██╔╝░███████╗███████╗╚█████╔╝╚█████╔╝██║░╚═╝░██║███████╗░
echo.                                                                                    %r%░░░╚═╝░░░╚═╝░░╚══════╝╚══════╝░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚══════╝░ 
echo.                                          %p%"════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                                                                Warning
echo.
echo.                                              We are not responsible for any problems/Damages with your PC this may cause, if you encounter any, don't be afraid to reach out in our discord server
echo.
echo.                                              It's prohibited to resell any of our free tools, it will lead to consequences, the utility is open sourced and the code may be used for non profit
echo.  
echo.                                          %p%"════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                                                          Instructions * Faq
echo.
echo.                                               Press a NUMBER on your keyboard followed by ENTER to select an option, Please Read All warnings, don't just blindly press buttons without reading.
echo.
echo.                                                      You can find the tutorial, more information about the utility and much more in the OT SERVICES Discord Server (discord.gg/ottservices)
echo.  
echo.                                                                       %w%          Made and distributed by OT SERVICES,  ® 2024 * Version 1.0 
echo.                                          %p%"════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║             %w% Press any key to continue...                    %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.
echo.
echo. 
pause > nul
CLS

 
:: Restore Point
:restorepoint
cls
echo.
echo.
echo.                                                                                           %W%        OT SERVICE OPTIMIZER                            
echo.                                                  
echo.                                                          %r%██████╗░███████╗░██████╗████████╗░█████╗░██████╗░███████╗  ██████╗░░█████╗░██╗███╗░░██╗████████╗         
echo.                                                          %r%██╔══██╗██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝  ██╔══██╗██╔══██╗██║████╗░██║╚══██╔══╝        
echo.                                                          %r%██████╔╝█████╗░░╚█████╗░░░░██║░░░██║░░██║██████╔╝█████╗░░  ██████╔╝██║░░██║██║██╔██╗██║░░░██║░░░         
echo.                                                          %r%██╔══██╗██╔══╝░░░╚═══██╗░░░██║░░░██║░░██║██╔══██╗██╔══╝░░  ██╔═══╝░██║░░██║██║██║╚████║░░░██║░░░        
echo.                                                          %r%██║░░██║███████╗██████╔╝░░░██║░░░╚█████╔╝██║░░██║███████╗  ██║░░░░░╚█████╔╝██║██║░╚███║░░░██║░░░        
echo.                                                          %r%╚═╝░░╚═╝╚══════╝╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚══════╝  ╚═╝░░░░░░╚════╝░╚═╝╚═╝░░╚══╝░░░╚═╝░░░        
echo.                                                   %p%╔══════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
echo.                                                   %p%║                                      %w% Do you want to Create a Restore Point?                                 %p%║
echo.                                                   %p%║                                                                                                              %p%║
echo.                                                   %p%║                                                                                                              %p%║
echo.                                                   %p%║                           %r%[%w%1%r%]%w% Make A restore Point             %r%[%w%2%r%]%w% Skip                                      %p%║
echo.                                                   %p%║                                                                                                              %p%║
echo.                                                   %p%║                                                                                                              %p%║
echo.                                                   %p%║══════════════════════════════════════════════════════════════════════════════════════════════════════════════║
echo.                                                   %p%║           %W% Allows you to revert your PC to the same settings as it was when making the restore point         %p%║
echo.                                                   %p%║                    %W% You can use a restore point later on in the utility, if you wish to do so                %p%║
echo.                                                   %p%╚══════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
echo. 
 
set /p input=:
if /i %input% == 1 goto createRP
if /i %input% == 2 goto resources

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu

:RedirectMenu
goto restorepoint

:createRP
cls 
echo.
echo.
echo.
echo.                                                                  %r%██████╗░███████╗░██████╗████████╗░█████╗░██████╗░███████╗  ██████╗░░█████╗░██╗███╗░░██╗████████╗
echo.                                                                  %r%██╔══██╗██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝  ██╔══██╗██╔══██╗██║████╗░██║╚══██╔══╝
echo.                                                                  %r%██████╔╝█████╗░░╚█████╗░░░░██║░░░██║░░██║██████╔╝█████╗░░  ██████╔╝██║░░██║██║██╔██╗██║░░░██║░░░
echo.                                                                  %r%██╔══██╗██╔══╝░░░╚═══██╗░░░██║░░░██║░░██║██╔══██╗██╔══╝░░  ██╔═══╝░██║░░██║██║██║╚████║░░░██║░░░
echo.                                                                  %r%██║░░██║███████╗██████╔╝░░░██║░░░╚█████╔╝██║░░██║███████╗  ██║░░░░░╚█████╔╝██║██║░╚███║░░░██║░░░
echo.                                                                  %r%╚═╝░░╚═╝╚══════╝╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚══════╝  ╚═╝░░░░░░╚════╝░╚═╝╚═╝░░╚══╝░░░╚═╝░░░
echo.
echo. %w% Creating a restore point... %p%                                                       
chcp 437 >nul
powershell "Checkpoint-Computer -Description 'EXM Tweaks Restore Point'
powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Restore point completed successfully, press "OK" to continue', 'OT SERVICES OPTIMIZER', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
chcp 65001 >nul 
cls
goto :resources

:resources
::making ot folder
md C:\exm
cls
chcp 437 >nul 2>&1
powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Downloading resources (power plan, Nvidia profile inspector & more)', 'OT SERVICES OPTIMIZER', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
chcp 65001 >nul 2>&1
cls 
::Downloading power plan, autoruns, nvidia profile inspector, NVPI config, & Windows update blocker
echo.
echo.
echo.
echo.                                                                  %r%██████╗░███████╗░██████╗░█████╗░██╗░░░██╗██████╗░░█████╗░███████╗░██████╗
echo.                                                                  %r%██╔══██╗██╔════╝██╔════╝██╔══██╗██║░░░██║██╔══██╗██╔══██╗██╔════╝██╔════╝
echo.                                                                  %r%██████╔╝█████╗░░╚█████╗░██║░░██║██║░░░██║██████╔╝██║░░╚═╝█████╗░░╚█████╗░
echo.                                                                  %r%██╔══██╗██╔══╝░░░╚═══██╗██║░░██║██║░░░██║██╔══██╗██║░░██╗██╔══╝░░░╚═══██╗
echo.                                                                  %r%██║░░██║███████╗██████╔╝╚█████╔╝╚██████╔╝██║░░██║╚█████╔╝███████╗██████╔╝
echo.                                                                  %r%╚═╝░░╚═╝╚══════╝╚═════╝░░╚════╝░░╚═════╝░╚═╝░░╚═╝░╚════╝░╚══════╝╚═════╝░
echo.
echo. %w% Downloading Resources Used by the tool... (You can find them in the C:\ot folder, they are all trusted apps used by thousands of people) %p%                                                       
echo.
chcp 437 >nul 2>&1
curl -g -k -L -# -o "%temp%\exm.zip" "https://exmapi.onrender.com/static/free/v5.0/v5.0_free_resources.zip"
Powershell -NoProfile Expand-Archive '%temp%\exm.zip' -DestinationPath 'C:\exm' >nul 2>&1 

powershell "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Downloaded resources successfully, Press "OK" To continue to the menu! ', 'OT SERVICES OPTIMIZER', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
chcp 65001 >nul 2>&1
cls

goto menu

:soon
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto menu

:restore
cls
rstrui.exe
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto menu


:Menu
chcp 65001 >nul 2>&1
cls
echo.
echo.
echo.
echo.                                             %p%║════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════║
echo.                                             %p%║                                                                                                                                    %p%║             
echo.                                             %p%║                  %r%[%w%1%r%]%w% General Optimizations         %r%[%w%2%r%]%w% Mouse and Keyboard Optimization    %r%[%w%3%r%]%w% Windows Tweaks                       %p%║                     
echo.                                             %p%║                                                                                                                                    %p%║
echo.                                             %p%║                  %r%[%w%4%r%]%w% PC clean                      %r%[%w%5%r%]%w% Memory/RAM Optimization            %r%[%w%6%r%]%w% Disable Startup Services             %p%║
echo.                                             %p%║                                                                                                                                    %p%║
echo.                                             %p%║                  %r%[%w%7%r%]%w% GPU Tweaks                    %r%[%w%8%r%]%w% CPU Tweaks                         %r%[%w%9%r%]%w% USB Tweaks                           %p%║
echo.                                             %p%║                                                                                                                                    %p%║                                          
echo.                                             %p%║                  %r%[%w%10%r%]%w% Power Tweaks                 %r%[%w%11%r%]%w% System Debloat                    %r%[%w%12%r%]%w% Storage Tweaks                      %p%║              
echo.                                             %p%║                                                                                                                                    %p%║
echo.                                             %p%║                  %r%[%w%13%r%]%w% Fix Corrupted Files          %r%[%w%14%r%]%w% Set Full Screen Optimization      %r%[%w%15%r%]%w% EXM Network Tweaking Utility        %p%║           
echo.                                             %p%║                                                                                                                                    %p%║
echo.                                             %p%║════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════║
echo.                                             %p%║                                                                                                                                    %p%║
echo.                                             %p%║                  %r%[%w%R%r%]%w% Reverts / Fixes               %r%[%w%W%r%]%w% Completely Optimize Your PC        %r%[%w%r%r%]%w% Use Restore Point                    %p%║
echo.                                             %p%║                                                                                                                                    %p%║
echo.                                             %p%║                  %r%[%w%F%r%]%w% Refresh Resources             %r%[%w%X%r%]%w% Exit The Utility                   %r%[%w%E%r%]%w% EXM Tweaks Discord                   %p%║       
echo.                                             %p%║                                                                                                                                    %p%║        
echo.                                             %p%║                                                                                                                                    %p%║                                         
echo.                                             %p%║                   %w%               Made and distributed by OT SERVICES,  ® 2024 * Version 1.0                                      %p%║                                   
echo.                                             %p%║                                                                                                                                    %p%║
echo.                                             %p%╚════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝%w%



set /p input=:
if /i %input% == 1 goto 1
if /i %input% == 2 goto 2
if /i %input% == 3 goto 3
if /i %input% == 4 goto 4
if /i %input% == 5 goto 5
if /i %input% == 6 goto 6
if /i %input% == 7 goto 7
if /i %input% == 8 goto 8war
if /i %input% == 9 goto 9
if /i %input% == 10 goto 10war 
if /i %input% == 11 goto 11war
if /i %input% == 12 goto 12
if /i %input% == 13 goto 13
if /i %input% == 14 goto 14
if /i %input% == 15 goto 15

if /i %input% == R goto revert
if /i %input% == P goto Restore
if /i %input% == F goto Refresh
if /i %input% == X goto Exit
if /i %input% == W start https://otservices.sellauth.com/
if /i %input% == E start https://discord.gg/ottservices

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 1 
goto RedirectMenu

:RedirectMenu
cls
goto menu

:Refresh
echo %w% - Loading ...%p%
cls 
md C:\exm >nul 2>&1
echo %w% - Refreshing exm resource folder %p%
timeout /t 1 /nobreak > NUL
del /s /q C:\exm  >nul 2>&1

goto :res 

:14
:fse
cls
echo.
echo.
echo.                                                                           %r% ███████╗░██████╗███████╗
echo.                                                                           %r% ██╔════╝██╔════╝██╔════╝
echo.                                                                           %r% █████╗░░╚█████╗░█████╗░░
echo.                                                                           %r% ██╔══╝░░░╚═══██╗██╔══╝░░
echo.                                                                           %r% ██║░░░░░██████╔╝███████╗
echo.                                                                           %r% ╚═╝░░░░░╚═════╝░╚══════╝     
echo.                                             %p%"════════════════════════════════════════════════════════════════════════════════"%w%
echo.      
echo.                                                    %r%[%w%1%r%]%w% Set FSE For Windows 10        %r%[%w%2%r%]%w% Set FSE For Windows 11      
echo.                                                                                           
echo.                                                                                           
echo.                                                    %r%%r%%r%%r%                         %r%[%w%M%r%]%w% Back to menu                               
echo.                                                                                          
echo.                                             %p%"════════════════════════════════════════════════════════════════════════════════"
echo.                                                   %W% Please select your Windows Version to apply the appropriate FSO setting
echo.                                             %p%"════════════════════════════════════════════════════════════════════════════════"
echo. 
set /p input=:
if /i %input% == 1 goto windows10
if /i %input% == 2 goto windows11
if /i %input% == M cls & goto menu

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu


:RedirectMenu
cls
goto :14
:windows10
echo %w% - Setting FSE Behavior Mode %p%

Reg.exe add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_DSEBehavior" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f

echo %w% - Delete Overlay %p%
reg delete "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "OverlayTestMode" /f
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto menu

:windows11

echo %w% - Setting FSE Behavior Mode %p%
Reg.exe add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_DSEBehavior" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f

echo %w% - Disabling VRR Optimizations %p%
Reg.exe add "HKCU\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "VRROptimizeEnabling=0;SwapEffectUpgradeEnabling=1;" /f

echo %w% - Delete Overlay %p%
reg delete "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "OverlayTestMode" /f
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.
echo.

pause > nul
cls
goto menu




:net
:15
CLS
echo.
echo.                                                                                                   %W%        OT SERVICE OPTIMIZER      
echo. 
echo.                                                                                      %r%░██╗░░░░░░░██╗███████╗██╗░░░░░░█████╗░░█████╗░███╗░░░███╗███████╗░
echo.                                                                                      %r%░██║░░██╗░░██║██╔════╝██║░░░░░██╔══██╗██╔══██╗████╗░████║██╔════╝░
echo.                                                                                      %r%░╚██╗████╗██╔╝█████╗░░██║░░░░░██║░░╚═╝██║░░██║██╔████╔██║█████╗░░░
echo.                                                                                      %r%░░████╔═████║░██╔══╝░░██║░░░░░██║░░██╗██║░░██║██║╚██╔╝██║██╔══╝░░░
echo.                                                                                      %r%░░╚██╔╝░╚██╔╝░███████╗███████╗╚█████╔╝╚█████╔╝██║░╚═╝░██║███████╗░
echo.                                                                                      %r%░░░╚═╝░░░╚═╝░░╚══════╝╚══════╝░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚══════╝░ 
echo.                                          %p%"════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                                                                Warning
echo.
echo.                                              We are not responsible for any problems/Damages with your PC this may cause, if you encounter any, don't be afraid to reach out in our discord server
echo.
echo.                                              It's prohibited to resell any of our free tools, it will lead to consequences, the utility is open sourced and the code may be used for non profit
echo.
echo.                                                  This tool doesnt decrease ping for 100% of people, since if you get high ping due to server distance, its not really fixable with any tweaks
echo. 
echo.                                                          There are also other factors which take part in why this may not work for you, i just dont want you guys to be dissapointed :)
echo.
echo.                                          %p%"════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                                                          Instructions / Faq
echo.
echo.                                               Press a NUMBER on your keyboard followed by ENTER to select an option, Please Read All warnings, don't just blindly press buttons without reading.
echo.
echo.                                                      You can find the tutorial, more information about the utility and much more in the EXM Tweaks Discord Server (discord.gg/exm)
echo.  
echo.
echo.                                                                    %w%  Made and distributed by EXM TWEAKS, S.R.O. ® 2024 %p%║%w% Version 1.1 %p%║%w% updated 5th October 2024 
echo.                                          %p%"════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║        %w%       Press any key to continue...                    %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

echo. 
pause > nul
CLS


:: Restore Point
:restorepoint
cls
echo.
echo.
echo.                                                                                           %W%        OT SERVICE OPTIMIZER                           
echo.                                                  
echo.                                                        %r%██████╗░███████╗░██████╗████████╗░█████╗░██████╗░███████╗  ██████╗░░█████╗░██╗███╗░░██╗████████╗         
echo.                                                        %r%██╔══██╗██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝  ██╔══██╗██╔══██╗██║████╗░██║╚══██╔══╝        
echo.                                                        %r%██████╔╝█████╗░░╚█████╗░░░░██║░░░██║░░██║██████╔╝█████╗░░  ██████╔╝██║░░██║██║██╔██╗██║░░░██║░░░         
echo.                                                        %r%██╔══██╗██╔══╝░░░╚═══██╗░░░██║░░░██║░░██║██╔══██╗██╔══╝░░  ██╔═══╝░██║░░██║██║██║╚████║░░░██║░░░        
echo.                                                        %r%██║░░██║███████╗██████╔╝░░░██║░░░╚█████╔╝██║░░██║███████╗  ██║░░░░░╚█████╔╝██║██║░╚███║░░░██║░░░        
echo.                                                        %r%╚═╝░░╚═╝╚══════╝╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚══════╝  ╚═╝░░░░░░╚════╝░╚═╝╚═╝░░╚══╝░░░╚═╝░░░        
echo.                                                   %p%╔══════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
echo.                                                   %p%║                                      %w% Do you want to Create a Restore Point?                                 %p%║
echo.                                                   %p%║                                                                                                              %p%║
echo.                                                   %p%║                                                                                                              %p%║
echo.                                                   %p%║                           %r%[%w%1%r%]%w% Make A restore Point             %r%[%w%2%r%]%w% Skip                                      %p%║
echo.                                                   %p%║                                                                                                              %p%║
echo.                                                   %p%║                                                                                                              %p%║
echo.                                                   %p%║══════════════════════════════════════════════════════════════════════════════════════════════════════════════║
echo.                                                   %p%║           %W% Allows you to revert your PC to the same settings as it was when making the restore point         %p%║
echo.                                                   %p%║                    %W% You can use a restore point later on in the utility, if you wish to do so                %p%║
echo.                                                   %p%╚══════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
echo. 
 
set /p input=:
if /i %input% == 1 goto createRP
if /i %input% == 2 goto nmenu

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu

:RedirectMenu
goto restorepoint

:createRP
cls 
echo.
echo.
echo.
echo.                                                                  %r%██████╗░███████╗░██████╗████████╗░█████╗░██████╗░███████╗  ██████╗░░█████╗░██╗███╗░░██╗████████╗
echo.                                                                  %r%██╔══██╗██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝  ██╔══██╗██╔══██╗██║████╗░██║╚══██╔══╝
echo.                                                                  %r%██████╔╝█████╗░░╚█████╗░░░░██║░░░██║░░██║██████╔╝█████╗░░  ██████╔╝██║░░██║██║██╔██╗██║░░░██║░░░
echo.                                                                  %r%██╔══██╗██╔══╝░░░╚═══██╗░░░██║░░░██║░░██║██╔══██╗██╔══╝░░  ██╔═══╝░██║░░██║██║██║╚████║░░░██║░░░
echo.                                                                  %r%██║░░██║███████╗██████╔╝░░░██║░░░╚█████╔╝██║░░██║███████╗  ██║░░░░░╚█████╔╝██║██║░╚███║░░░██║░░░
echo.                                                                  %r%╚═╝░░╚═╝╚══════╝╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚══════╝  ╚═╝░░░░░░╚════╝░╚═╝╚═╝░░╚══╝░░░╚═╝░░░
echo.
echo. %w% Creating a restore point... %p%                                                       
chcp 437 >nul
powershell "Checkpoint-Computer -Description 'EXM Tweaks Network Restore Point'
powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Restore point completed successfully, press "OK" to continue', 'OT SERVICES OPTIMIZER', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
chcp 65001 >nul 
cls
goto :NMenu


:NMenu
cls
echo.
echo.
echo.
echo.                                          %p%║═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════║   
echo.                                          %p%║                                                                                                                                       %p%║
echo.                                          %p%║                        %r%%w%%r%%w%                                  %r%[%w%T%r%]%w% TUTORIAL                                                                 %p%║
echo.                                          %p%║                                                                                                                                       %p%║
echo.                                          %p%║                        %r%%w%%r%%w%                                  %r%[%w%A%r%]%w% APPLY ALL (1-7)                                                          %p%║
echo.                                          %p%║                                                                                                                                       %p%║
echo.                                          %p%║                        %r%[%w%1%r%]%w% Disable Network Limiting                    %r%[%w%2%r%]%w% Enable On-Board Network Adapter Processor                  %p%║        
echo.                                          %p%║                                                                                                                                       %p%║ 
echo.                                          %p%║                        %r%[%w%3%r%]%w% Set Network Throttoling Index               %r%[%w%4%r%]%w% Enable MSI mode on network Adapter                         %p%║    
echo.                                          %p%║                                                                                                                                       %p%║
echo.                                          %p%║                        %r%[%w%5%r%]%w% Enable TCP No Delay                         %r%[%w%6%r%]%w% Set DNS Priorities                                         %p%║ 
echo.                                          %p%║                                                                                                                                       %p%║
echo.                                          %p%║                        %r%[%w%7%r%]%w% Disable Teredo Tunneling                    %r%[%w%8%r%]%w% Optimize NIC Adapter Settings                              %p%║
echo.                                          %p%║                                                                                                                                       %p%║
echo.                                          %p%║                        %r%[%w%9%r%]%w% Set a QOS Policy                            %r%[%w%10%r%]%w% Open NIC Settings                                         %p%║
echo.                                          %p%║                                                                                                                                       %p%║
echo.                                          %p%║═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════║
echo.                                          %p%║                                                                                                                                       %p%║
echo.                                          %p%║                         %r%%w%%r%%w%                                %r%[%w%X%r%]%w%  GO BACK TO MENU                                                          %p%║
echo.                                          %p%║                                                                                                                                       %p%║   
echo.                                          %p%╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
echo.                                                                 
echo.

set /p input=:
if /i %input% == A goto nALL
if /i %input% == 1 goto n1
if /i %input% == 2 goto n2
if /i %input% == 3 goto n3
if /i %input% == 4 goto n4
if /i %input% == 5 goto n5
if /i %input% == 6 goto n6
if /i %input% == 7 goto n7
if /i %input% == 8 goto n8
if /i %input% == 9 goto qos
if /i %input% == 10 ncpa.cpl & goto Nmenu
if /i %input% == X goto menu
if /i %input% == T start https://otservices.sellauth.com/ & goto Nmenu
     
) ELSE (
echo %w%- Invalid Input %p% & goto MisspellRedirect

:MisspellRedirect
cls
echo %w%- Misspell Detected  %p%
timeout 2
goto RedirectMenu


:RedirectMenu
cls
goto menu


:nALL
echo %w%- Disabling Teredo %p%
netsh int teredo set state disabled

echo %w% - Disabling TCP heuristics / Disabling Network Limiting %p%
netsh int tcp set heuristics Disablingd

echo %w% - Disabling Task Offloading / Enabling On-Board Network Adapter Processor %p%
netsh int ip set global taskoffload=Disablingd
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "DisablingTaskOffload" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisablingTaskOffload" /t REG_DWORD /d "0" /f

echo %w% - Set Network Throttoling Index%p%
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f

echo %w% - Enabling MSI Mode On Network Adapter %p%

for /f %%i in ('wmic path win32_NetworkAdapter get PNPDeviceID') do set "str=%%i" & (
echo %w% - Delete network Device Priority %p%
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f
echo %w% - Enabling MSI Mode on NetAdapter %p%
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
)

echo %w% - Disabling Nagiles algorithm %p%

echo %w% - Set Interface Metric %p%
for /f %%q in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%q" /v InterfaceMetric /t REG_DWORD /d "55" /f
echo %w% - Enabling TCPNoDelay %p%
for /f %%q in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%q" /v TCPNoDelay /t REG_DWORD /d "1" /f
echo %w% - Enabling TCP Ack Frequency %p%
for /f %%q in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%q" /v TcpAckFrequency /t REG_DWORD /d "1" /f
echo %w% - Disabling TCP Del AckTicks  %p%
for /f %%q in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%q" /v TcpDelAckTicks /t REG_DWORD /d "0" /f


echo %w% - Set DNS Priorities %p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d "7" /f
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto NMenu


:n1
echo %w% - Disabling TCP heuristics / Disabling Network Limiting %p%
netsh int tcp set heuristics Disablingd
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto NMenu

:n2
echo %w% - Disabling Task Offloading / Enabling On-Board Network Adapter Processor %p%
netsh int ip set global taskoffload=Disablingd
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "DisablingTaskOffload" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisablingTaskOffload" /t REG_DWORD /d "0" /f
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto NMenu

:n3
echo %w% - Set Network Throttoling Index%p%
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.
echo."
pause > nul
cls
goto NMenu

:n4
echo %w% - Enabling MSI Mode On Network Adapter %p%
for /f %%i in ('wmic path win32_NetworkAdapter get PNPDeviceID') do set "str=%%i" & (
echo %w% - Delete network Device Priority %p%
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f
echo %w% - Enabling MSI Mode on NetAdapter %p%
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
)
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.
echo.
pause > nul
cls
goto NMenu


:n7
echo %w%- Disabling Teredo %p%
netsh int teredo set state disabled
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto NMenu

:n5
echo %w% - Disabling Nagiles algorithm %p%

echo %w% - Set Interface Metric %p%
for /f %%q in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%q" /v InterfaceMetric /t REG_DWORD /d "55" /f
echo %w% - Enabling TCPNoDelay %p%
for /f %%q in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%q" /v TCPNoDelay /t REG_DWORD /d "1" /f
echo %w% - Enabling TCP Ack Frequency %p%
for /f %%q in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%q" /v TcpAckFrequency /t REG_DWORD /d "1" /f
echo %w% - Disabling TCP Del AckTicks  %p%
for /f %%q in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%q" /v TcpDelAckTicks /t REG_DWORD /d "0" /f

echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto NMenu

:n6
echo %w% - Set DNS Priorities %p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d "7" /f
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto NMenu

:n8
chcp 437 >nul 2>&1
powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('!WARNING! You can only use this if you are on ethernet, if you are on wifi, press "N" on the next page', 'OT SERVICES OPTIMIZER', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
chcp 65001 >nul 2>&1
cls
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.
set /p input=:
if /i %input% == Y goto cont
if /i %input% == N cls & goto NMenu

) ELSE (
echo %w%- Invalid Input %p% & goto MisspellRedirect

:MisspellRedirect
cls
echo %w%- Misspell Detected  %p%
timeout 2
goto RedirectMenu

:RedirectMenu
cls
goto NMenu


:cont

echo %w% - Optimize NIC Settings %p%

echo %w%- Disabling EEE (Energy Efficient Ethernet) %p%
for /f %%n in ('Reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}" /v "*SpeedDuplex" /s ^| findstr  "HKEY"') do (
Reg.exe add "%%n" /v "AdvancedEEE" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "*EEE" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "EEE" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "EnablingPME" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "EEELinkAdvertisement" /t REG_SZ /d "0" /f 
timeout /t 1 /nobreak > nul

echo %w%- Disabling Power Saving Modes, Power Managment and Much more  %p%
Reg.exe add "%%n" /v "AutoPowerSaveModeEnablingd" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "DisablingDelayedPowerUp" /t REG_SZ /d "2" /f 
Reg.exe add "%%n" /v "AutoDisablingGigabit" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "EnablingGreenEthernet" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "EnablingSavePowerNow" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "EnablingPowerManagement" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "NicAutoPowerSaver" /t REG_SZ /d "2" /f
Reg.exe add "%%n" /v "PowerDownPll" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "PowerSavingMode" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "ReduceSpeedOnPowerDown" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "S5NicKeepOverrideMacAddrV2" /t REG_SZ /d "0" /f 
timeout /t 1 /nobreak > nul

echo %w%- Disabling Power Gating %p%
Reg.exe add "%%n" /v "EnablingDynamicPowerGating" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "EnablingConnectedPowerGating" /t REG_SZ /d "0" /f 
timeout /t 1 /nobreak > nul

echo %w%- Disabling Giga Lite %p%
Reg.exe add "%%n" /v "GigaLite" /t REG_SZ /d "0" /f 
timeout /t 1 /nobreak > nul

echo %w%- Disabling Ultra Low Power Mode %p%
Reg.exe add "%%n" /v "ULPMode" /t REG_SZ /d "0" /f 
timeout /t 1 /nobreak > nul

echo %w%- Disabling WakeOns %p%
Reg.exe add "%%n" /v "EnablingWakeOnLan" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "WakeOnDisconnect" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "*WakeOnMagicPacket" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "S5WakeOnLan" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "*WakeOnPattern" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "WakeOnLink" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "WolShutdownLinkSpeed" /t REG_SZ /d "2" /f 
timeout /t 1 /nobreak > nul


echo %w%- Disabling Jumbo Frame/Packet %p%
Reg.exe add "%%n" /v "JumboPacket" /t REG_SZ /d "1514" /f 
timeout /t 1 /nobreak > nul


echo %w%- Configuring Buffer Sizes %p%
Reg.exe add "%%n" /v "TransmitBuffers" /t REG_SZ /d "2048" /f 
Reg.exe add "%%n" /v "ReceiveBuffers" /t REG_SZ /d "1024" /f 
timeout /t 1 /nobreak > nul


echo %w%- Configuring and Disabling Offloads %p%
Reg.exe add "%%n" /v "IPChecksumOffloadIPv4" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "LsoV1IPv4" /t REG_SZ /d "0" /f  
Reg.exe add "%%n" /v "LsoV2IPv4" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "LsoV2IPv6" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "PMARPOffload" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "PMNSOffload" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "TCPChecksumOffloadIPv4" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "TCPChecksumOffloadIPv6" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "UDPChecksumOffloadIPv6" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "UDPChecksumOffloadIPv4" /t REG_SZ /d "0" /f 
timeout /t 1 /nobreak > nul


echo %w%- Enabling RSS in NIC %p%
Reg.exe add "%%n" /v "RSS" /t REG_SZ /d "1" /f 
Reg.exe add "%%n" /v "*NumRssQueues" /t REG_SZ /d "2" /f 
Reg.exe add "%%n" /v "RSSProfile" /t REG_SZ /d "3" /f 
timeout /t 1 /nobreak > nul


echo %w%- Disabling Flow Control %p%
Reg.exe add "%%n" /v "*FlowControl" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "FlowControlCap" /t REG_SZ /d "0" /f 
timeout /t 1 /nobreak > nul


echo %w%- Removing Interrupt Delays %p%
Reg.exe add "%%n" /v "RxAbsIntDelay" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "TxIntDelay" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "TxAbsIntDelay" /t REG_SZ /d "0" /f 
timeout /t 1 /nobreak > nul

echo %w%- Removing Adapter Notification Sending %p%
Reg.exe add "%%n" /v "FatChannelIntolerant" /t REG_SZ /d "0" /f 
timeout /t 1 /nobreak > nul
)

echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto NMenu

:qos
cls
echo.
echo.
echo.
echo.                                                                      %r%░██████╗░░█████╗░░██████╗  ██████╗░░█████╗░██╗░░░░░██╗░█████╗░██╗░░░██╗╗
echo.                                                                      %r%██╔═══██╗██╔══██╗██╔════╝  ██╔══██╗██╔══██╗██║░░░░░██║██╔══██╗╚██╗░██╔╝
echo.                                                                      %r%██║██╗██║██║░░██║╚█████╗░  ██████╔╝██║░░██║██║░░░░░██║██║░░╚═╝░╚████╔╝░
echo.                                                                      %r%╚██████╔╝██║░░██║░╚═══██╗  ██╔═══╝░██║░░██║██║░░░░░██║██║░░██╗░░╚██╔╝░░
echo.                                                                      %r%░╚═██╔═╝░╚█████╔╝██████╔╝  ██║░░░░░╚█████╔╝███████╗██║╚█████╔╝░░░██║░░░
echo.                                                                      %r%░░░╚═╝░░░░╚════╝░╚═════╝░  ╚═╝░░░░░░╚════╝░╚══════╝╚═╝░╚════╝░░░░╚═╝░░░
echo.                                                %p%"══════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                         If the number 4 fix doesnt work, you will have to unfortunatly skip this step 
echo.
echo.                                                                                                                                                               
echo.                                                           %r%[%w%1%r%]%w% Start PSCHED          %r%[%w%2%r%]%w% Enable MS-Pacer            %r%[%w%3%r%]%w% Open GPEDIT   
echo. 
echo.                                              
echo.                                                %p%"══════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo. 
echo.                                                           %r%%w%%r%%w%        %r%[%w%4%r%]%w% Download GPEDIT (only Run this if you cant open GPEDIT)  
echo. 
echo.                                                           %r%%w%%r%%w%                           %r%[%w%M%r%]%w% Back to menu   
echo.
echo.                                                %p%"══════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                              %W%QoS policy defines throttling limits determines the rate of outbound network traffic
echo.                                                   %W% It basically will make it so your router will prioritize that task over others, decreasing your ping by a lot
echo.                                                %p%"══════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo. 
 
set /p input=:
if /i %input% == 1 goto q1
if /i %input% == 2 goto q2
if /i %input% == 3 goto q3
if /i %input% == 4 goto q4
if /i %input% == M goto menu

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto qos

:q2
chcp 437 >nul 2>&1
echo %w%- Enabling MSPacer %p%
powershell -NoProfile -Command "Enabling-NetAdapterBinding -Name "*" -ComponentID ms_pacer"
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto :qos

:q1
echo %w%- Enabling PSCHED %p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Psched" /v "Start" /t REG_DWORD /d "1" /f
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto :qos

:q3
echo %w%- Start GPEDIT %p%
start gpedit.msc
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto :qos

:q4
chcp 437 >nul 2>&1
powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('You have to restart your pc after this', 'OT SERVICES OPTIMIZER', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"


start https://discord.com/channels/1177410668606009444/1178430446590238860/1281920807089475635
echo %w% This fix takes you to a discord message in my discord server, if it doesnt load, simply go to the #free utility page, the fix is there %p%

chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto :qos







:12
:storage
cls
echo.
echo.
echo.                                                            %r%░██████╗████████╗░█████╗░██████╗░░█████╗░░██████╗░███████╗   
echo.                                                            %r%██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗██╔════╝░██╔════╝ 
echo.                                                            %r%╚█████╗░░░░██║░░░██║░░██║██████╔╝███████║██║░░██╗░█████╗░░        
echo.                                                            %r%░╚═══██╗░░░██║░░░██║░░██║██╔══██╗██╔══██║██║░░╚██╗██╔══╝░░  
echo.                                                            %r%██████╔╝░░░██║░░░╚█████╔╝██║░░██║██║░░██║╚██████╔╝███████╗     
echo.                                                            %r%╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝░╚═════╝░╚══════╝      
echo.                                             %p%"════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                                           
echo.                                                                      %r%[%w%1%r%]%w% Trim/Defragment Drives     
echo. 
echo.                                                                      %r%[%w%2%r%]%w% Enable User Write Cache      
echo. 
echo.                                                                      %r%[%w%3%r%]%w% Disable SSD Power Savings       
echo.                                                                                           
echo.                                                                                           
echo.                                                                         %r%[%w%M%r%]%w% Back to menu                               
echo.
echo.                                             %p%"════════════════════════════════════════════════════════════════════════════════"
echo.                                                 %W% Trim and Defragment Your Driver and apply a few extra storage optimizations 
echo.                                             %p%"════════════════════════════════════════════════════════════════════════════════"
echo. 
set /p input=:
if /i %input% == 1 goto s1
if /i %input% == 2 goto s2
if /i %input% == 3 goto s3
if /i %input% == M cls & goto menu

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu


:RedirectMenu
cls
goto :12

:s3
echo %w% - Disabling SSD Power Savings %p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SD\IdleState\1" /v "IdleExitEnergyMicroJoules" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SD\IdleState\1" /v "IdleExitLatencyMs" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SD\IdleState\1" /v "IdlePowerMw" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SD\IdleState\1" /v "IdleTimeLengthMs" /t REG_DWORD /d "4294967295" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\1" /v "IdleExitEnergyMicroJoules" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\1" /v "IdleExitLatencyMs" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\1" /v "IdlePowerMw" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\1" /v "IdleTimeLengthMs" /t REG_DWORD /d "4294967295" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\2" /v "IdleExitEnergyMicroJoules" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\2" /v "IdleExitLatencyMs" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\2" /v "IdlePowerMw" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\2" /v "IdleTimeLengthMs" /t REG_DWORD /d "4294967295" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\3" /v "IdleExitEnergyMicroJoules" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\3" /v "IdleExitLatencyMs" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\3" /v "IdlePowerMw" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\3" /v "IdleTimeLengthMs" /t REG_DWORD /d "4294967295" /f 
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto menu

:s1
cls
start dfrgui.exe
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :12

:s2
cls
echo %w% - Enabling User Write Cache %p%
For /f "Delims=" %%k in ('Reg.exe Query HKLM\SYSTEM\CurrentControlSet\Enum /f "{4d36e967-e325-11ce-bfc1-08002be10318}" /d /s^|Find "HKEY"') do (
Reg.exe add "%%k\Device Parameters\Disk" /v UserWriteCacheSetting /t REG_DWORD /d 1 /f 
Reg.exe add "%%k\Device Parameters\Disk" /v CacheIsPowerProtected /t REG_DWORD /d 1 /f
)

echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto :12
:3
:windows
cls
echo.
echo.
echo.                                                             %r%   ░██╗░░░░░░░██╗██╗███╗░░██╗██████╗░░█████╗░░██╗░░░░░░░██╗░██████╗      
echo.                                                             %r%   ░██║░░██╗░░██║██║████╗░██║██╔══██╗██╔══██╗░██║░░██╗░░██║██╔════╝      
echo.                                                             %r%   ░╚██╗████╗██╔╝██║██╔██╗██║██║░░██║██║░░██║░╚██╗████╗██╔╝╚█████╗░     
echo.                                                             %r%   ░░████╔═████║░██║██║╚████║██║░░██║██║░░██║░░████╔═████║░░╚═══██╗      
echo.                                                             %r%   ░░╚██╔╝░╚██╔╝░██║██║░╚███║██████╔╝╚█████╔╝░░╚██╔╝░╚██╔╝░██████╔╝      
echo.                                                             %r%   ░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚══╝╚═════╝░░╚════╝░░░░╚═╝░░░╚═╝░░╚═════╝░      
echo.                                             %p%"══════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                                                                      
echo.                                                             %r%%r%%r%%r%%r%[%w%A%r%]%w% Apply all optimizations in the windows category
echo.                                                          
echo.                                                             %r%[%w%1%r%]%w% Windows Update Blocker      %r%[%w%2%r%]%w% Disable Useless Animations                       
echo.                                                                                                                      
echo.                                                             %r%[%w%3%r%]%w% Disable Notifications       %r%[%w%4%r%]%w% Optimize Windows Search           
echo.                                                                                                                                
echo.                                                             %r%[%w%5%r%]%w% Disable Bluetooth           %r%[%w%6%r%]%w% Disable Transparency    
echo.                                                                                                                                                                                                                 
echo.                                                             %r%[%w%7%r%]%w% Disable Error Reporting     %r%[%w%8%r%]%w% Disable Setting Synchronization            
echo.                                                                                                                                
echo.                                                             %r%[%w%9%r%]%w% Disable Diagnostics         %r%[%w%10%r%]%w% Disable Background Apps        
echo.
echo.                                                             %r%[%w%11%r%]%w% Disable Experiments        %r%[%w%12%r%]%w% Enable Game Mode       
echo. 
echo.                                                             %r%[%w%13%r%]%w% Disable Maintenece         %r%[%w%14%r%]%w% Disable Tracking and some diagnostics                            
echo. 
echo.                                                             %r%[%w%15%r%]%w% Disable Popups + more      %r%[%w%16%r%]%w% Disable Activity feed    
echo. 
echo.                                                             %r%[%w%17%r%]%w% Disable Smart Screen       %r%[%w%18%r%]%w% Stop Reinstalling Preinstalled apps 
echo.
echo.                                                             %r%[%w%19%r%]%w% Disable Shared Experiences %r%[%w%20%r%]%w% Track Only Important Failure Events  
echo.
echo.                                                             
echo.                                                             %r%%r%%r%%r%                     %r%[%w%R%r%]%w% Revert Category 
echo.
echo.                                                             %r%%r%%r%%r%                     %r%[%w%M%r%]%w% Back to menu                                          
echo.     
echo.                                             %p%"══════════════════════════════════════════════════════════════════════════════════════════════"
echo.                                                               %W% Optimize a bunch of Windows settings for optimial performance 
echo.                                                         %W% Disabling a bunch of annoying stuff like notifications, popups and more
echo.                                             %p%"══════════════════════════════════════════════════════════════════════════════════════════════"
echo.
set /p input=:
if /i %input% == A goto WA
if /i %input% == 1 goto w6
if /i %input% == 2 goto w3
if /i %input% == 3 goto w2
if /i %input% == 4 goto w4
if /i %input% == 5 goto w5
if /i %input% == 6 goto w1
if /i %input% == 7 goto w7
if /i %input% == 8 goto w8
if /i %input% == 9 goto w9
if /i %input% == 10 goto w10
if /i %input% == 11 goto w11
if /i %input% == 12 goto w12
if /i %input% == 13 goto w13
if /i %input% == 14 goto w14
if /i %input% == 15 goto w15
if /i %input% == 16 goto w16
if /i %input% == 17 goto w17
if /i %input% == 18 goto w18
if /i %input% == 19 goto w19
if /i %input% == 20 goto w20
if /i %input% == M cls & goto menu
if /i %input% == R cls & goto :revert
) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu

:RedirectMenu
goto :3



:w4
echo %w% - Optimizing Windows Search%p%
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnablingd" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaCapabilities" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "IsAssignedAccess" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "IsWindowsHelloActive" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d 0 /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchPrivacy" /t REG_DWORD /d 3 /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchSafeSearch" /t REG_DWORD /d 3 /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d 0 /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWebOverMeteredConnections" /t REG_DWORD /d 0 /f
Reg.exe add "HKLM\Software\Microsoft\PolicyManager\default\Experience\AllowCortana" /v "value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\SearchCompanion" /v "DisablingContentFileUpdates" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCortanaAboveLock" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchPrivacy" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWebOverMeteredConnections" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "DisablingWebSearch" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "DoNotUseWebResults" /t REG_DWORD /d "1" /f
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto windows

:w20
echo %w% - Track Only Important Failure Events %p%
Auditpol /set /subcategory:"Process Termination" /success:Disabling /failure:Enabling
Auditpol /set /subcategory:"RPC Events" /success:Disabling /failure:Enabling
Auditpol /set /subcategory:"Filtering Platform Connection" /success:Disabling /failure:Enabling
Auditpol /set /subcategory:"DPAPI Activity" /success:Disabling /failure:Disabling
Auditpol /set /subcategory:"IPsec Driver" /success:Disabling /failure:Enabling
Auditpol /set /subcategory:"Other System Events" /success:Disabling /failure:Enabling
Auditpol /set /subcategory:"Security State Change" /success:Disabling /failure:Enabling
Auditpol /set /subcategory:"Security System Extension" /success:Disabling /failure:Enabling
Auditpol /set /subcategory:"System Integrity" /success:Disabling /failure:Enabling
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\DiagLog" /v "Start" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\WiFiSession" /v "Start" /t REG_DWORD /d "0" /f
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
pause > nul
cls
goto windows

:WA
cls
chcp 437 >nul 2>&1
powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('This will apply all tweaks in the windows page', 'OT SERVICES OPTIMIZER', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo. 
echo. 
echo.                                              %p%╔═════════════════════════════════════════════════════════════════════════╗
echo.                                              %p%║  %w%  Press "Y" if you want to continue,"N" if you want to go back         %p%║
echo.                                              %p%╚═════════════════════════════════════════════════════════════════════════╝


set /p input=:
if /i %input% == Y goto :WAA
if /i %input% == N cls & goto windows


:waa
cls

echo %w% - Optimizing Windows Search%p%
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnablingd" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaCapabilities" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "IsAssignedAccess" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "IsWindowsHelloActive" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d 0 /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchPrivacy" /t REG_DWORD /d 3 /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchSafeSearch" /t REG_DWORD /d 3 /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d 0 /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWebOverMeteredConnections" /t REG_DWORD /d 0 /f
Reg.exe add "HKLM\Software\Microsoft\PolicyManager\default\Experience\AllowCortana" /v "value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\SearchCompanion" /v "DisablingContentFileUpdates" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCortanaAboveLock" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchPrivacy" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWebOverMeteredConnections" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "DisablingWebSearch" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "DoNotUseWebResults" /t REG_DWORD /d "1" /f

echo %w% - Track Only Important Failure Events %p%
Auditpol /set /subcategory:"Process Termination" /success:Disabling /failure:Enabling
Auditpol /set /subcategory:"RPC Events" /success:Disabling /failure:Enabling
Auditpol /set /subcategory:"Filtering Platform Connection" /success:Disabling /failure:Enabling
Auditpol /set /subcategory:"DPAPI Activity" /success:Disabling /failure:Disabling
Auditpol /set /subcategory:"IPsec Driver" /success:	 /failure:Enabling
Auditpol /set /subcategory:"Other System Events" /success:Disabling /failure:Enabling
Auditpol /set /subcategory:"Security State Change" /success:Disabling /failure:Enabling
Auditpol /set /subcategory:"Security System Extension" /success:Disabling /failure:Enabling
Auditpol /set /subcategory:"System Integrity" /success:Disabling /failure:Enabling
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\DiagLog" /v "Start" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\WiFiSession" /v "Start" /t REG_DWORD /d "0" /f

echo %w% - Disabling Windows Insider Experiments%p%
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\System" /v "AllowExperimentation" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\System\AllowExperimentation" /v "value" /t REG_DWORD /d "0" /f 

echo %w% - Disabling Activity feed%p%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v "EnablingFeeds" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft" /v "AllowNewsAndInterests" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnablingActivityFeed" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enablingd" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnablingActivityFeed" /t REG_DWORD /d "0" /f

echo %w% - Disabling Automatic Maintenance%p%
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisablingd" /t REG_DWORD /d "1" /f 


echo %w% - Disabling Notifications%p%
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_NOTIFICATION_SOUND" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_CRITICAL_TOASTS_ABOVE_LOCK" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\QuietHours" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\windows.immersivecontrolpanel_cw5n1h2txyewy!microsoft.windows.immersivecontrolpanel" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.AutoPlay" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.LowDisk" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Print.Notification" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.WiFiNetworkManager" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisablingNotificationCenter" /t REG_DWORD /d "1" /f


echo %w% - Disabling Bluetooth%p%
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\BTAGService" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bthserv" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\BthAvctpSvc" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\BluetoothUserService" /v "Start" /t REG_DWORD /d "4" /f

echo %w% - Disabling Diagnostic Services%p%
sc config DiagTrack start= Disablingd 
sc config dmwappushservice start= Disablingd
sc config DPS start= Disablingd 
sc config diagnosticshub.standardcollector.service start= Disablingd 

echo %w% - Disabling Windows Error Reporting%p%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disablingd" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "DoReport" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisablingd" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disablingd" /t REG_DWORD /d "1" /f 

echo %w%- Disabling Shared Experiences %p%
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CDP" /v "CdpSessionUserAuthzPolicy" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CDP" /v "NearShareChannelUserAuthzPolicy" /t REG_DWORD /d "0" /f

echo %w% - Disabling Setting Synchronization%p%
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\AppSync" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\DesktopTheme" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\PackageState" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\StartLayout" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows" /v "Enablingd" /t REG_DWORD /d "0" /f 

echo %w%- Disabling windows smart screen %p%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnablingSmartScreen" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnablingd" /t REG_SZ /d "Off" /f 
Reg.exe add "HKU\!USER_SID!\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "EnablingWebContentEvaluation" /t REG_DWORD /d "0" /f 

echo %w%- Stop Reinstalling Preinstalled apps %p%
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContentEnablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnablingd" /t REG_DWORD /d "0" 

echo %w%- Disabling Background Apps %p%
Reg.exe add "HKU\!USER_SID!\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisablingd" /t REG_DWORD /d "1" /f 
Reg.exe add "HKU\!USER_SID!\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\bam" /v "Start" /t REG_DWORD /d "4" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\dam" /v "Start" /t REG_DWORD /d "4" /f 

echo %w%- Disabling Transparency %p%
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnablingTransparency" /t REG_DWORD /d "0" /f

echo %w% - Enabling GameMode%p%
Reg.exe add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "1" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AutoGameModeEnablingd" /t REG_DWORD /d "1" /f 

echo %w% - Disabling Tracking and some diagnostics%p%
Reg.exe add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnablingd" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ShowedToastAtLevel" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_CURRENT_USER\Software\Microsoft\Input\TIPC" /v "Enablingd" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_CURRENT_USER\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Diagnostics\Performance" /v "DisablingDiagnosticTracing" /t REG_DWORD /d "1" /f >nul 2>&1 
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" /v "ScenarioExecutionEnablingd" /t REG_DWORD /d "0" /f
schtasks /change /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /Disabling
schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disabling
schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver"
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /Disabling
schtasks /end /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem"
schtasks /change /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Disabling

timeout 2 > nul
cls
echo.
echo.
echo.                                                       %r%░██████╗░░█████╗░███╗░░░███╗███████╗  ███╗░░░███╗░█████╗░██████╗░███████╗
echo.                                                       %r%██╔════╝░██╔══██╗████╗░████║██╔════╝  ████╗░████║██╔══██╗██╔══██╗██╔════╝
echo.                                                       %r%██║░░██╗░███████║██╔████╔██║█████╗░░  ██╔████╔██║██║░░██║██║░░██║█████╗░░
echo.                                                       %r%██║░░╚██╗██╔══██║██║╚██╔╝██║██╔══╝░░  ██║╚██╔╝██║██║░░██║██║░░██║██╔══╝░░
echo.                                                       %r%╚██████╔╝██║░░██║██║░╚═╝░██║███████╗  ██║░╚═╝░██║╚█████╔╝██████╔╝███████╗
echo.                                                       %r%░╚═════╝░╚═╝░░╚═╝╚═╝░░░░░╚═╝╚══════╝  ╚═╝░░░░░╚═╝░╚════╝░╚═════╝░╚══════╝
echo.                                              %p%"════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.
echo.                                                               %r%[%w%1%r%]%w% Enable Game Mode       %r%[%w%2%r%]%w% Disable Game Mode
echo.
echo. 
echo.                                                                                      %r%[%w%S%r%]%w% Skip   
echo. 
echo.                                              %p%"═════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                          We reccomend Enabling game mode on windows 11, but Disabling it on windows 10                                                
echo.                                              %p%"═════════════════════════════════════════════════════════════════════════════════════════════"%w%
         
set /p input=:
if /i %input% == 1 goto gmodeOn
if /i %input% == 2 goto gmodeOff
if /i %input% == S goto skipg
if /i %input% == X cls & goto 3

) ELSE (
echo %w%- Invalid Input %p% & goto MisspellRedirect

:MisspellRedirect
cls
echo %w%- Misspell Detected  %p%
timeout 2
goto RedirectMenu

:RedirectMenu
goto 3

:gmodeON
echo %w% - Enabling Game Mode b%
Reg.exe add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AutoGameModeEnablingd" /t REG_DWORD /d "1" /f
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto :skipg

:gmodeOFF
echo %w% - Disabling Game Mode b%
Reg.exe add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AutoGameModeEnablingd" /t REG_DWORD /d "0" /f
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto :skipg

:skipg
chcp 437 >nul 
powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Note: (After presing "ok" it will open an app called windows update blocker, Disabling Windows Updates will break microsoft store, if you want to use it again simply press "Enabling" in windows update blocker ', 'OT SERVICES OPTIMIZER', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
start C:\exm\Windows_Update_Blocker.exe

cls 

%windir%\system32\SystemPropertiesPerformance.exe

chcp 65001 >nul 
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto menu









:w19
echo %w%- Disabling Shared Experiences %p%
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CDP" /v "CdpSessionUserAuthzPolicy" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CDP" /v "NearShareChannelUserAuthzPolicy" /t REG_DWORD /d "0" /f
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto :windows

:w17
echo %w%- Disabling windows smart screen %p%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnablingSmartScreen" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnablingd" /t REG_SZ /d "Off" /f 
Reg.exe add "HKU\!USER_SID!\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "EnablingWebContentEvaluation" /t REG_DWORD /d "0" /f 
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto :windows

:w18
echo %w%- Stop Reinstalling Preinstalled apps %p%
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContentEnablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnablingd" /t REG_DWORD /d "0" /f 
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :windows


:w10
cls
echo %w%- Disabling Background Apps %p%
Reg.exe add "HKU\!USER_SID!\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisablingd" /t REG_DWORD /d "1" /f 
Reg.exe add "HKU\!USER_SID!\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\bam" /v "Start" /t REG_DWORD /d "4" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\dam" /v "Start" /t REG_DWORD /d "4" /f 
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :windows

 
:w1
cls
echo %w%- Disabling Transparency %p%
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnablingTransparency" /t REG_DWORD /d "0" /f

echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :windows


:w12
:gamemode
cls
echo.
echo.
echo.                                                      %r%░██████╗░░█████╗░███╗░░░███╗███████╗  ███╗░░░███╗░█████╗░██████╗░███████╗
echo.                                                      %r%██╔════╝░██╔══██╗████╗░████║██╔════╝  ████╗░████║██╔══██╗██╔══██╗██╔════╝
echo.                                                      %r%██║░░██╗░███████║██╔████╔██║█████╗░░  ██╔████╔██║██║░░██║██║░░██║█████╗░░
echo.                                                      %r%██║░░╚██╗██╔══██║██║╚██╔╝██║██╔══╝░░  ██║╚██╔╝██║██║░░██║██║░░██║██╔══╝░░
echo.                                                      %r%╚██████╔╝██║░░██║██║░╚═╝░██║███████╗  ██║░╚═╝░██║╚█████╔╝██████╔╝███████╗
echo.                                                      %r%░╚═════╝░╚═╝░░╚═╝╚═╝░░░░░╚═╝╚══════╝  ╚═╝░░░░░╚═╝░╚════╝░╚═════╝░╚══════╝
echo.                                              %p%"════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.
echo.                                                                 %r%[%w%1%r%]%w% Enable Game Mode       %r%[%w%2%r%]%w% Disable Game Mode
echo.
echo.                           
echo.                                                                                %r%[%w%M%r%]%w% Back to menu    
echo.                                                                             
echo.                                              %p%"═════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                          We reccomend Enabling game mode on windows 11, but Disabling it on windows 10                                                
echo.                                              %p%"═════════════════════════════════════════════════════════════════════════════════════════════"%w%
         
set /p input=:
if /i %input% == 1 goto gmodeOn
if /i %input% == 2 goto gmodeOff
if /i %input% == X cls & goto 3

) ELSE (
echo %w%- Invalid Input %p% & goto MisspellRedirect

:MisspellRedirect
cls
echo %w%- Misspell Detected  %p%
timeout 2
goto RedirectMenu

:RedirectMenu
goto 3

:gmodeON
echo %w% - Enabling Game Mode b%
Reg.exe add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AutoGameModeEnablingd" /t REG_DWORD /d "1" /f
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :3

:gmodeOFF
echo %w% - Disabling Game Mode b%
Reg.exe add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AutoGameModeEnablingd" /t REG_DWORD /d "0" /f
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :3

:w14
cls
echo %w% - Disabling Tracking and some diagnostics%p%
Reg.exe add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnablingd" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ShowedToastAtLevel" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_CURRENT_USER\Software\Microsoft\Input\TIPC" /v "Enablingd" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_CURRENT_USER\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Diagnostics\Performance" /v "DisablingDiagnosticTracing" /t REG_DWORD /d "1" /f >nul 2>&1 
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" /v "ScenarioExecutionEnablingd" /t REG_DWORD /d "0" /f
schtasks /change /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /Disabling
schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disabling
schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver"
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /Disabling
schtasks /end /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem"
schtasks /change /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Disabling
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :windows

:13
cls
echo.
echo.

echo.                                                                %r%███████╗██╗██╗░░██╗    ██████╗░██╗░██████╗░█████╗░
echo.                                                                %r%██╔════╝██║╚██╗██╔╝    ██╔══██╗██║██╔════╝██╔══██╗
echo.                                                                %r%█████╗░░██║░╚███╔╝░    ██║░░██║██║╚█████╗░██║░░╚═╝
echo.                                                                %r%██╔══╝░░██║░██╔██╗░    ██║░░██║██║░╚═══██╗██║░░██╗
echo.                                                                %r%██║░░░░░██║██╔╝╚██╗    ██████╔╝██║██████╔╝╚█████╔╝
echo.                                                                %r%╚═╝░░░░░╚═╝╚═╝░░╚═╝    ╚═════╝░╚═╝╚═════╝░░╚════╝░
echo.                                             %p%"══════════════════════════════════════════════════════════════════════════════════"%w%
echo.
echo.                                                                      %r%[%w%1%r%]%w% Fix Corrupted files
echo.
echo.
echo.                                                                          %r%[%w%M%r%]%w% Back to menu
echo.
echo.                                           %p%"══════════════════════════════════════════════════════════════════════════════════"
echo.                                                 %w% Finds critical core files required to run and gather information 
echo.                                                 %w% then upgrades or repairs any files that are corrupted or out-of-date. 
echo.                                           %p%"══════════════════════════════════════════════════════════════════════════════════"

set /p input=:
if /i %input% == 1 goto f1
if /i %input% == M cls & goto menu

) ELSE (
echo %w%- Invalid Input %p% & goto MisspellRedirect

:MisspellRedirect
cls
echo %w%- Misspell Detected  %p%
timeout 2
goto RedirectMenu


:RedirectMenu
cls
goto :13

:f1
DISM /Online /Cleanup-Image /StartComponentCleanup
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto menu


:11war
chcp 437 >nul 2>&1
powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Note: If you want to revert anything, you can do it in our revert category on the main page of the utility', 'OT SERVICES OPTIMIZER', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
chcp 65001 >nul 2>&1

:11
:Debloat
cls
echo.
echo.
echo.                                                                %r%   ██████╗░███████╗██████╗░██╗░░░░░░█████╗░░█████╗░████████╗     
echo.                                                                %r%   ██╔══██╗██╔════╝██╔══██╗██║░░░░░██╔══██╗██╔══██╗╚══██╔══╝      
echo.                                                                %r%   ██║░░██║█████╗░░██████╦╝██║░░░░░██║░░██║███████║░░░██║░░░    
echo.                                                                %r%   ██║░░██║██╔══╝░░██╔══██╗██║░░░░░██║░░██║██╔══██║░░░██║░░░     
echo.                                                                %r%   ██████╔╝███████╗██████╦╝███████╗╚█████╔╝██║░░██║░░░██║░░░  
echo.                                                                %r%   ╚═════╝░╚══════╝╚═════╝░╚══════╝░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░      
echo.                                             %p%"══════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                                                    
echo.                                                                                       %r%[%w%A%r%]%w% Apply all
echo.                                                                                                                      
echo.                                                            %r%[%w%1%r%]%w% Disable GameDVR           %r%[%w%2%r%]%w% Disable Telemetry                    
echo.                                                                                                                      
echo.                                                            %r%[%w%3%r%]%w% Disable XBOX              %r%[%w%4%r%]%w% Uninstall Useless Windows Apps              
echo.                                                                                                                      
echo.                                                            %r%[%w%5%r%]%w% Disable Office Telemetry  %r%[%w%6%r%]%w% Disable Printing and Maps 
echo. 
echo.                                                            %r%[%w%7%r%]%w% Uninstall Cortana         %r%[%w%8%r%]%w% Uninstall Microsoft Edge     
echo.
echo.                                                            %r%[%w%9%r%]%w% Disable Autologgers       %r%[%w%10%r%]%w% Disable Customer Experience Program                    
echo.                                                                                                                          
echo.                                                                                                                                
echo.                                                                                      %r%[%w%M%r%]%w% Back to menu   
echo. 
echo.                                                                                      %r%[%w%R%r%]%w% Revert Category                                           
echo.
echo.                                             %p%"══════════════════════════════════════════════════════════════════════════════════════════════"
echo.                                                                            %w% Dont Disabling stuff that you actualy use!                         
echo. 
echo.                                                                    %w% Uninstalls and Disablings useless features in windows
echo.                                                      %w% Removes system bloatware which runs in the background taking up system resources 
echo.                                             %p%"══════════════════════════════════════════════════════════════════════════════════════════════"
echo.

set /p input=:
if /i %input% == A goto AD
if /i %input% == 1 goto d1
if /i %input% == 2 goto d2
if /i %input% == 3 goto d3
if /i %input% == 4 goto d4
if /i %input% == 5 goto d5
if /i %input% == 6 goto d6
if /i %input% == 7 goto d7
if /i %input% == 8 goto d8
if /i %input% == 9 goto d9
if /i %input% == 10 goto d10
if /i %input% == M cls & goto menu
if /i %input% == R cls & goto revert
) ELSE (
echo Invalid Input & goto MisspellReirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu

:RedirectMenu
goto :11

:AD
cls
chcp 437 >nul 2>&1
powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('This will apply all tweaks in this page, do you want to continue?', 'OT SERVICES OPTIMIZER', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo. 
echo.                                              %p%"═══════════════════════════════════════════════════════════════"
echo.                                                %w%  Press "Y" if you want to continue,"N" if you want to go back
echo.                                              %p%"═══════════════════════════════════════════════════════════════"

set /p input=:
if /i %input% == Y goto :DA
if /i %input% == N cls & goto debloat

:d2
echo %w% - Disabling Telemetry Through Task Scheduler %p%
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" 
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" 
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" 
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" 
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\Uploader" 
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Uploader" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" 
schtasks /change /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" 
schtasks /change /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Application Experience\StartupAppTask" 
schtasks /change /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /Disabling 
schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" 
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disabling 
schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" 
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" 
schtasks /change /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" 
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyRefresh" 
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyRefresh" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyUpload" 
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyUpload" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Autochk\Proxy" 
schtasks /change /tn "\Microsoft\Windows\Autochk\Proxy" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Maintenance\WinSAT" 
schtasks /change /tn "\Microsoft\Windows\Maintenance\WinSAT" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Application Experience\AitAgent" 
schtasks /change /tn "\Microsoft\Windows\Application Experience\AitAgent" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" 
schtasks /change /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" /Disabling 
schtasks /end /tn "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask" 
schtasks /change /tn "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /Disabling 
schtasks /end /tn "\Microsoft\Windows\DiskFootprint\Diagnostics" 
schtasks /change /tn "\Microsoft\Windows\DiskFootprint\Diagnostics" /Disabling 
schtasks /end /tn "\Microsoft\Windows\PI\Sqm-Tasks" 
schtasks /change /tn "\Microsoft\Windows\PI\Sqm-Tasks" /Disabling 
schtasks /end /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo" 
schtasks /change /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disabling 
schtasks /end /tn "\Microsoft\Windows\AppID\SmartScreenSpecific" 
schtasks /change /tn "\Microsoft\Windows\AppID\SmartScreenSpecific" /Disabling 
schtasks /end /tn "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" 
schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" /Disabling 
schtasks /end /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" 
schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" /Disabling 
schtasks /end /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn" 
schtasks /change /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn" /Disabling 
schtasks /end /tn "\Microsoftd\Office\OfficeTelemetryAgentFallBack" 
schtasks /change /TN "\Microsoftd\Office\OfficeTelemetryAgentFallBack" /Disabling 
schtasks /end /tn "\Microsoft\Office\Office 15 Subscription Heartbeat" 
schtasks /change /TN "\Microsoft\Office\Office 15 Subscription Heartbeat" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" 
schtasks /change /TN "\Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Time Synchronization\SynchronizeTime" 
schtasks /change /TN "\Microsoft\Windows\Time Synchronization\SynchronizeTime" /Disabling 
schtasks /end /tn "\Microsoft\Windows\WindowsUpdate\Automatic App Update" 
schtasks /change /TN "\Microsoft\Windows\WindowsUpdate\Automatic App Update" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Device Information\Device" 
schtasks /change /TN "\Microsoft\Windows\Device Information\Device" /Disabling 
timeout /t 1 /nobreak > NUL
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls

goto :debloat
:d9
echo %w% - Disabling Autologgers%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\AppModel" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Cellcore" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Circular Kernel Context Logger" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\CloudExperienceHostOobe" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DataMarket" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderApiLogger" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderAuditLogger" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DiagLog" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\HolographicDevice" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\iclsClient" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\iclsProxy" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\LwtNetLog" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Mellanox-Kernel" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Microsoft-Windows-AssignedAccess-Trace" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Microsoft-Windows-Setup" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\NBSMBLOGGER" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\PEAuthLog" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\RdrLog" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\ReadyBoot" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SetupPlatform" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SetupPlatformTel" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SocketHeciServer" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SpoolerLogger" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SQMLogger" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\TCPIPLOGGER" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\TileStore" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Tpm" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\TPMProvisioningService" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\UBPM" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WdiContextLog" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WFP-IPsec Trace" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WiFiDriverIHVSession" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WiFiDriverIHVSessionRepro" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WiFiSession" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WinPhoneCritical" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WUDF" /v "LogEnabling" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WUDF" /v "LogLevel" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisablingThirdPartySuggestions" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisablingWindowsConsumerFeatures" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa\Credssp" /v "DebugLogLevel" /t REG_DWORD /d "0" /f 
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto :debloat

:DA
::1

echo %w% - Disabling Telemetry Through Task Scheduler %p%
schtasks /end /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" 
schtasks /change /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" 
schtasks /change /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Application Experience\StartupAppTask" 
schtasks /change /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /Disabling 
schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" 
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disabling 
schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" 
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" 
schtasks /change /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" 
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyRefresh" 
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyRefresh" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyUpload" 
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyUpload" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Autochk\Proxy" 
schtasks /change /tn "\Microsoft\Windows\Autochk\Proxy" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Maintenance\WinSAT" 
schtasks /change /tn "\Microsoft\Windows\Maintenance\WinSAT" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Application Experience\AitAgent" 
schtasks /change /tn "\Microsoft\Windows\Application Experience\AitAgent" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" 
schtasks /change /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" /Disabling 
schtasks /end /tn "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask" 
schtasks /change /tn "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /Disabling 
schtasks /end /tn "\Microsoft\Windows\DiskFootprint\Diagnostics" 
schtasks /change /tn "\Microsoft\Windows\DiskFootprint\Diagnostics" /Disabling 
schtasks /end /tn "\Microsoft\Windows\PI\Sqm-Tasks" 
schtasks /change /tn "\Microsoft\Windows\PI\Sqm-Tasks" /Disabling 
schtasks /end /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo" 
schtasks /change /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disabling 
schtasks /end /tn "\Microsoft\Windows\AppID\SmartScreenSpecific" 
schtasks /change /tn "\Microsoft\Windows\AppID\SmartScreenSpecific" /Disabling 
schtasks /end /tn "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" 
schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" /Disabling 
schtasks /end /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" 
schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" /Disabling 
schtasks /end /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn" 
schtasks /change /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn" /Disabling 
schtasks /end /tn "\Microsoftd\Office\OfficeTelemetryAgentFallBack" 
schtasks /change /TN "\Microsoftd\Office\OfficeTelemetryAgentFallBack" /Disabling 
schtasks /end /tn "\Microsoft\Office\Office 15 Subscription Heartbeat" 
schtasks /change /TN "\Microsoft\Office\Office 15 Subscription Heartbeat" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" 
schtasks /change /TN "\Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Time Synchronization\SynchronizeTime" 
schtasks /change /TN "\Microsoft\Windows\Time Synchronization\SynchronizeTime" /Disabling 
schtasks /end /tn "\Microsoft\Windows\WindowsUpdate\Automatic App Update" 
schtasks /change /TN "\Microsoft\Windows\WindowsUpdate\Automatic App Update" /Disabling 
schtasks /end /tn "\Microsoft\Windows\Device Information\Device" 
schtasks /change /TN "\Microsoft\Windows\Device Information\Device" /Disabling 
timeout /t 1 /nobreak > NUL

echo %w% - Disabling Autologgers%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\AppModel" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Cellcore" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Circular Kernel Context Logger" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\CloudExperienceHostOobe" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DataMarket" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderApiLogger" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderAuditLogger" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DiagLog" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\HolographicDevice" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\iclsClient" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\iclsProxy" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\LwtNetLog" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Mellanox-Kernel" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Microsoft-Windows-AssignedAccess-Trace" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Microsoft-Windows-Setup" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\NBSMBLOGGER" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\PEAuthLog" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\RdrLog" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\ReadyBoot" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SetupPlatform" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SetupPlatformTel" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SocketHeciServer" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SpoolerLogger" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SQMLogger" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\TCPIPLOGGER" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\TileStore" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Tpm" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\TPMProvisioningService" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\UBPM" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WdiContextLog" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WFP-IPsec Trace" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WiFiDriverIHVSession" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WiFiDriverIHVSessionRepro" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WiFiSession" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WinPhoneCritical" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WUDF" /v "LogEnabling" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WUDF" /v "LogLevel" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisablingThirdPartySuggestions" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisablingWindowsConsumerFeatures" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa\Credssp" /v "DebugLogLevel" /t REG_DWORD /d "0" /f 

echo %w% - Disabling Customer Experience Improvement Program%p%
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disabling > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" > nul 2>&1 
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /Disabling > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /Disabling > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" > nul 2>&1 
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disabling > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\Uploader" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Uploader" /Disabling > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disabling > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disabling > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Application Experience\StartupAppTask" > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" /Disabling > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyRefresh" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyRefresh" /Disabling > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyUpload" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyUpload" /Disabling > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Maintenance\WinSAT" > nul 2>&1

::2
echo %w% - Disabling Printing and maps Services  %p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Spooler" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\PrintNotify" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MapsBroker" /v "Start" /t REG_DWORD /d "4" /f

::3
echo %w% - Disabling Office Telemetry  %p%
Reg.exe add "HKCU\Software\Microsoft\Office\Common\ClientTelemetry" /v "DisablingTelemetry" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common" /v "sendcustomerdata" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\Feedback" /v "Enablingd" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\Feedback" /v "includescreenshot" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Outlook\Options\Mail" /v "EnablingLogging" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Word\Options" /v "EnablingLogging" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\Common\ClientTelemetry" /v "SendTelemetry" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common" /v "qmEnabling" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common" /v "updatereliabilitydata" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\General" /v "shownfirstrunoptin" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\General" /v "skydrivesigninoption" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\ptwatson" /v "ptwoptin" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Firstrun" /v "Disablingmovie" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM" /v "Enablinglogging" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM" /v "EnablingUpload" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM" /v "EnablingFileObfuscation" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "accesssolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "olksolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "onenotesolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "pptsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "projectsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "publishersolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "visiosolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "wdsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "xlsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "agave" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "appaddins" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "comaddins" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "documentfiles" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "templatefiles" /t REG_DWORD /d "1" /f

::4
chcp 437 > nul
cls 
echo %w% - Deleting Microsoft Edge %p%
echo %w% - Remove Edge application selection associations %p%
:: Remove file association for "MSEdgeHTM" for .webp
:: Delete the registry value "MSEdgeHTM_.webp" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-20H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_.webp'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for .xml
:: Delete the registry value "MSEdgeHTM_.xml" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_.xml'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for http
:: Delete the registry value "MSEdgeHTM_http" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_http'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for https
:: Delete the registry value "MSEdgeHTM_https" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_https'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for .htm
:: Delete the registry value "MSEdgeHTM_.htm" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_.htm'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for .html
:: Delete the registry value "MSEdgeHTM_.html" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_.html'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgePDF" for .pdf
:: Delete the registry value "MSEdgePDF_.pdf" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgePDF_.pdf'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for .svg
:: Delete the registry value "MSEdgeHTM_.svg" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_.svg'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for mailto
:: Delete the registry value "MSEdgeHTM_mailto" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_mailto'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for read
:: Delete the registry value "MSEdgeHTM_read" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy.sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_read'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for .mht
:: Delete the registry value "MSEdgeHTM_.mht" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy.sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_.mht'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeMHT" for .mht
:: Delete the registry value "MSEdgeMHT_.mht" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeMHT_.mht'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for .mhtml
:: Delete the registry value "MSEdgeHTM_.mhtml" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy.sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_.mhtml'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeMHT" for .mhtml
:: Delete the registry value "MSEdgeMHT_.mhtml" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeMHT_.mhtml'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for microsoft-edge
:: Delete the registry value "MSEdgeHTM_microsoft-edge" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy.sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_microsoft-edge'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for microsoft-edge
:: Delete the registry value "MSEdgeHTM_microsoft-edge" from the key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$versionName = 'Windows11-21H2'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy.sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_microsoft-edge'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for .xht
:: Delete the registry value "MSEdgeHTM_.xht" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_.xht'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for .xhtml
:: Delete the registry value "MSEdgeHTM_.xhtml" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_.xhtml'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for ftp
:: Delete the registry value "MSEdgeHTM_ftp" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_ftp'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"


:: --Remove Edge Open With associations--
echo %w% Edge Open With associations %p%
:: Delete Open With association for "{{ progId }}" for .htm
:: Delete the registry value "MSEdgeHTM" from the key "HKLM\Software\Classes\.htm\OpenWithProgids" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKLM\Software\Classes\.htm\OpenWithProgids'; $valueName = 'MSEdgeHTM'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Delete Open With association for "{{ progId }}" for .html
:: Delete the registry value "MSEdgeHTM" from the key "HKLM\Software\Classes\.html\OpenWithProgids" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKLM\Software\Classes\.html\OpenWithProgids'; $valueName = 'MSEdgeHTM'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Delete Open With association for "{{ progId }}" for .mht
:: Delete the registry value "MSEdgeMHT" from the key "HKLM\Software\Classes\.mht\OpenWithProgids" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKLM\Software\Classes\.mht\OpenWithProgids'; $valueName = 'MSEdgeMHT'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Delete Open With association for "{{ progId }}" for .mhtml
:: Delete the registry value "MSEdgeMHT" from the key "HKLM\Software\Classes\.mhtml\OpenWithProgids" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKLM\Software\Classes\.mhtml\OpenWithProgids'; $valueName = 'MSEdgeMHT'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Delete Open With association for "{{ progId }}" for .pdf
:: Delete the registry value "MSEdgePDF" from the key "HKLM\Software\Classes\.pdf\OpenWithProgids" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKLM\Software\Classes\.pdf\OpenWithProgids'; $valueName = 'MSEdgePDF'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Delete Open With association for "{{ progId }}" for .shtml
:: Delete the registry value "MSEdgeHTM" from the key "HKLM\Software\Classes\.shtml\OpenWithProgids" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKLM\Software\Classes\.shtml\OpenWithProgids'; $valueName = 'MSEdgeHTM'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Delete Open With association for "{{ progId }}" for .svg
:: Delete the registry value "MSEdgeHTM" from the key "HKLM\Software\Classes\.svg\OpenWithProgids" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKLM\Software\Classes\.svg\OpenWithProgids'; $valueName = 'MSEdgeHTM'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Delete Open With association for "{{ progId }}" for .webp
:: Delete the registry value "MSEdgeHTM" from the key "HKLM\Software\Classes\.webp\OpenWithProgids" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKLM\Software\Classes\.webp\OpenWithProgids'; $valueName = 'MSEdgeHTM'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Delete Open With association for "{{ progId }}" for .xht
:: Delete the registry value "MSEdgeHTM" from the key "HKLM\Software\Classes\.xht\OpenWithProgids" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKLM\Software\Classes\.xht\OpenWithProgids'; $valueName = 'MSEdgeHTM'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Delete Open With association for "{{ progId }}" for .xhtml
:: Delete the registry value "MSEdgeHTM" from the key "HKLM\Software\Classes\.xhtml\OpenWithProgids" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKLM\Software\Classes\.xhtml\OpenWithProgids'; $valueName = 'MSEdgeHTM'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Delete Open With association for "{{ progId }}" for .xml
:: Delete the registry value "MSEdgeHTM" from the key "HKLM\Software\Classes\.xml\OpenWithProgids" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKLM\Software\Classes\.xml\OpenWithProgids'; $valueName = 'MSEdgeHTM'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"


:: Remove Edge user associations
echo %w% - Edge user associations %p%
:: Remove user-chosen URL association for "MSEdgeHTM" for http URL protocol
:: Delete the registry value "ProgId" from the key "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-20H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove user-chosen URL association for "MSEdgeHTM" for https URL protocol
:: Delete the registry value "ProgId" from the key "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-20H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove user-chosen URL association for "MSEdgeHTM" for microsoft-edge URL protocol
:: Delete the registry value "ProgId" from the key "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\microsoft-edge\UserChoice" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-20H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\microsoft-edge\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove user-chosen URL association for "MSEdgeHTM" for microsoft-edge-holographic URL protocol
:: Delete the registry value "ProgId" from the key "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\microsoft-edge-holographic\UserChoice" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-20H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\microsoft-edge-holographic\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove user-chosen URL association for "MSEdgeHTM" for ms-xbl-3d8b930f URL protocol
:: Delete the registry value "ProgId" from the key "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\ms-xbl-3d8b930f\UserChoice" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-20H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\ms-xbl-3d8b930f\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove user-chosen URL association for "MSEdgeHTM" for read URL protocol
:: Delete the registry value "ProgId" from the key "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\read\UserChoice" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-20H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\read\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove user-chosen file association for "MSEdgeHTM" for .htm files
:: Delete the registry value "ProgId" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.htm\UserChoice" (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-20H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.htm\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RemovedRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RemovedRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RemoveAccessRule($denyRule)) { $AclChanges.RemovedRules += $denyRule; } else { Write-Warning 'Failed to remove the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RemoveAccessRule($rule)) { Write-Warning 'Failed to remove the rule.'; }; }; foreach ($rule in $AclChanges.RemovedRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.htm\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; Grant-Permissions; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Remove user-chosen file association for "MSEdgeHTM" for .html files
:: Delete the registry value "ProgId" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.html\UserChoice" (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-20H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.html\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RemovedRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RemovedRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RemoveAccessRule($denyRule)) { $AclChanges.RemovedRules += $denyRule; } else { Write-Warning 'Failed to remove the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RemoveAccessRule($rule)) { Write-Warning 'Failed to remove the rule.'; }; }; foreach ($rule in $AclChanges.RemovedRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.html\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; Grant-Permissions; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Remove user-chosen file association for "MSEdgePDF" for .pdf files
:: Delete the registry value "ProgId" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.pdf\UserChoice" (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-20H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.pdf\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RemovedRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RemovedRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RemoveAccessRule($denyRule)) { $AclChanges.RemovedRules += $denyRule; } else { Write-Warning 'Failed to remove the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RemoveAccessRule($rule)) { Write-Warning 'Failed to remove the rule.'; }; }; foreach ($rule in $AclChanges.RemovedRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.pdf\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgePDF'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; Grant-Permissions; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Remove user-chosen file association for "MSEdgeHTM" for .svg files
:: Delete the registry value "ProgId" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.svg\UserChoice" (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-20H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.svg\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RemovedRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RemovedRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RemoveAccessRule($denyRule)) { $AclChanges.RemovedRules += $denyRule; } else { Write-Warning 'Failed to remove the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RemoveAccessRule($rule)) { Write-Warning 'Failed to remove the rule.'; }; }; foreach ($rule in $AclChanges.RemovedRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.svg\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; Grant-Permissions; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Remove user-chosen file association for "MSEdgeHTM" for .mht files
:: Delete the registry value "ProgId" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mht\UserChoice" (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy.sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mht\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RemovedRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RemovedRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RemoveAccessRule($denyRule)) { $AclChanges.RemovedRules += $denyRule; } else { Write-Warning 'Failed to remove the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RemoveAccessRule($rule)) { Write-Warning 'Failed to remove the rule.'; }; }; foreach ($rule in $AclChanges.RemovedRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mht\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; Grant-Permissions; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Remove user-chosen file association for "MSEdgeMHT" for .mht files
:: Delete the registry value "ProgId" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mht\UserChoice" (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mht\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RemovedRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RemovedRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RemoveAccessRule($denyRule)) { $AclChanges.RemovedRules += $denyRule; } else { Write-Warning 'Failed to remove the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RemoveAccessRule($rule)) { Write-Warning 'Failed to remove the rule.'; }; }; foreach ($rule in $AclChanges.RemovedRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mht\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeMHT'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; Grant-Permissions; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Remove user-chosen file association for "MSEdgeHTM" for .mhtml files
:: Delete the registry value "ProgId" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mhtml\UserChoice" (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy.sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mhtml\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RemovedRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RemovedRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RemoveAccessRule($denyRule)) { $AclChanges.RemovedRules += $denyRule; } else { Write-Warning 'Failed to remove the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RemoveAccessRule($rule)) { Write-Warning 'Failed to remove the rule.'; }; }; foreach ($rule in $AclChanges.RemovedRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mhtml\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; Grant-Permissions; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Remove user-chosen file association for "MSEdgeMHT" for .mhtml files
:: Delete the registry value "ProgId" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mhtml\UserChoice" (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mhtml\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RemovedRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RemovedRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RemoveAccessRule($denyRule)) { $AclChanges.RemovedRules += $denyRule; } else { Write-Warning 'Failed to remove the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RemoveAccessRule($rule)) { Write-Warning 'Failed to remove the rule.'; }; }; foreach ($rule in $AclChanges.RemovedRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mhtml\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeMHT'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; Grant-Permissions; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Remove user-chosen file association for "MSEdgeHTM" for .xml files
:: Delete the registry value "ProgId" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.xml\UserChoice" (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-22H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$versionName = 'Windows10-22H2'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy.sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.xml\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RemovedRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RemovedRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RemoveAccessRule($denyRule)) { $AclChanges.RemovedRules += $denyRule; } else { Write-Warning 'Failed to remove the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RemoveAccessRule($rule)) { Write-Warning 'Failed to remove the rule.'; }; }; foreach ($rule in $AclChanges.RemovedRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.xml\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; Grant-Permissions; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Remove user-chosen URL association for "MSEdgeHTM" for ftp URL protocol
:: Delete the registry value "ProgId" from the key "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\ftp\UserChoice" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\ftp\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove user-chosen file association for "MSEdgeHTM" for .xht files
:: Delete the registry value "ProgId" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.xht\UserChoice" (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.xht\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RemovedRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RemovedRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RemoveAccessRule($denyRule)) { $AclChanges.RemovedRules += $denyRule; } else { Write-Warning 'Failed to remove the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RemoveAccessRule($rule)) { Write-Warning 'Failed to remove the rule.'; }; }; foreach ($rule in $AclChanges.RemovedRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.xht\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; Grant-Permissions; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Remove user-chosen file association for "MSEdgeHTM" for .xhtml files
:: Delete the registry value "ProgId" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.xhtml\UserChoice" (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.xhtml\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RemovedRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RemovedRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RemoveAccessRule($denyRule)) { $AclChanges.RemovedRules += $denyRule; } else { Write-Warning 'Failed to remove the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RemoveAccessRule($rule)) { Write-Warning 'Failed to remove the rule.'; }; }; foreach ($rule in $AclChanges.RemovedRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.xhtml\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; Grant-Permissions; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"


:: Remove Edge through official installer
echo %w% -  Remove Edge through official installer %p%
PowerShell -ExecutionPolicy Unrestricted -Command "$data = '1'; reg add 'HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdateDev' /v 'AllowUninstall' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Create a placeholder file at "%SYSTEMROOT%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\MicrosoftEdge.exe".
PowerShell -ExecutionPolicy Unrestricted -Command "$filePath = '%SYSTEMROOT%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\MicrosoftEdge.exe'; $expandedFilePath = [System.Environment]::ExpandEnvironmentVariables($filePath); $placeholderText = 'privacy.sexy placeholder'; Write-Output "^""Creating placeholder file at `"^""$expandedFilePath`"^""."^""; $parentDirectory = [System.IO.Path]::GetDirectoryName($expandedFilePath); if (Test-Path $expandedFilePath -PathType Leaf) { Write-Host "^""Skipping file creation as `"^""$expandedFilePath`"^"" already exists."^""; Exit 0; }; if (Test-Path $parentDirectory -PathType Container) { Write-Host "^""Skipping parent directory creation as `"^""$parentDirectory`"^"" already exists."^""; } else { try { New-Item -ItemType Directory -Path "^""$parentDirectory"^"" -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created directory for placeholder file at `"^""$parentDirectory`"^""."^""; }  catch { Write-Error "^""Failed to create directory for placeholder at `"^""$parentDirectory`"^"": $_"^""; Exit 1; }; }; try { New-Item -ItemType File -Path $expandedFilePath -Value "^""$placeholderText"^"" -Force -ErrorAction Stop | Out-Null; Write-Host "^""Successfully created a placeholder file at `"^""$expandedFilePath`"^""."^""; } catch { Write-Error "^""Failed to create placeholder file at `"^""$expandedFilePath`"^"": $_"^""; Exit 1; }"
:: Uninstall running the official uninstaller
PowerShell -ExecutionPolicy Unrestricted -Command "$installers = (Get-ChildItem "^""$($env:ProgramFiles)*\Microsoft\Edge\Application\*\Installer\setup.exe"^""); if (!$installers) { Write-Host 'Installer not found. Microsoft Edge may already be uninstalled.'; } else { foreach ($installer in $installers) { $uninstallerPath = $installer.FullName; if (-Not (Test-Path "^""$uninstallerPath"^"")) { Write-Host "^""Installer not found at `"^""$uninstallerPath`"^"". Microsoft Edge may already be uninstalled."^""; continue; }; $installerArguments = @("^""--uninstall"^"", "^""--system-level"^"", "^""--verbose-logging"^"", "^""--force-uninstall"^""); Write-Output "^""Uninstalling through uninstaller: $uninstallerPath"^""; $process = Start-Process -FilePath "^""$uninstallerPath"^"" -ArgumentList $installerArguments -Wait -PassThru; if ($process.ExitCode -eq 0 -or $process.ExitCode -eq 19) { Write-Host "^""Successfully uninstalled Edge."^""; } else { Write-Error "^""Failed to uninstall, uninstaller failed with exit code $($process.ExitCode)."^""; }; }; }"


:: Remove Edge shortcuts
echo %w% - Remove Edge shortcuts %p%
PowerShell -ExecutionPolicy Unrestricted -Command "$shortcuts = @(; @{ Revert = $True;  Path = "^""$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk"^""; }; @{ Revert = $True;  Path = "^""$env:AppData\Microsoft\Internet Explorer\Quick Launch\Microsoft Edge.lnk"^""; }; @{ Revert = $True;  Path = "^""$env:AppData\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Microsoft Edge.lnk"^""; }; @{ Revert = $True;  Path = "^""$env:Public\Desktop\Microsoft Edge.lnk"^""; }; @{ Revert = $True;  Path = "^""$env:SystemRoot\System32\config\systemprofile\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\Microsoft Edge.lnk"^""; }; @{ Revert = $False; Path = "^""$env:UserProfile\Desktop\Microsoft Edge.lnk"^""; }; ); foreach ($shortcut in $shortcuts) { if (-Not (Test-Path $shortcut.Path)) { Write-Host "^""Skipping, shortcut does not exist: `"^""$($shortcut.Path)`"^""."^""; continue; }; try { Remove-Item -Path $shortcut.Path -Force -ErrorAction Stop; Write-Output "^""Successfully removed shortcut: `"^""$($shortcut.Path)`"^""."^""; } catch { Write-Error "^""Encountered an issue while attempting to remove shortcut at: `"^""$($shortcut.Path)`"^""."^""; }; }"
chcp 65001 > nul
cls

::5
echo %w% - Disabling GameDVR%p%
Reg.exe add "HKCU\Software\Microsoft\GameBar" /v "UseNexusForGameBarEnablingd" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\GameBar" /v "GameDVR_Enablingd" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnablingd" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AudioCaptureEnablingd" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "CursorCaptureEnablingd" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "HistoricalCaptureEnablingd" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_Enablingd" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\GameDVR" /v "AllowgameDVR" /t REG_DWORD /d "0" /f

::6
echo %w% - Disabling Xbox Services%p%
sc config xbgm start= Disablingd >nul 2>&1
sc config XblAuthManager start= Disablingd
sc config XblGameSave start= Disablingd
sc config XboxGipSvc start= Disablingd
sc config XboxNetApiSvc start= Disablingd
cls

::7
cls
chcp 437 > nul
echo.
echo.
echo [                             0%                            ]
echo.
echo %w%- Uninstalling BingWeather (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.BingWeather* | Remove-AppxPackage}
CLS

echo.
echo.
echo [==                           3.5%                          ]
echo.
echo %w%- Uninstalling GetHelp  (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage}
CLS

echo.
echo.
echo [====                         7.0%                          ]
echo.
echo %w%- Uninstalling Getstarted  (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.Getstarted* | Remove-AppxPackage}
CLS

echo.
echo.
echo [=====                        10.5%                         ]
echo.
echo %w%- Uninstalling Messaging  (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.Messaging* | Remove-AppxPackage}
CLS

echo.
echo.
echo [======                       14.5%                         ]
echo.
echo %w%- Uninstalling Messaging  (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.Microsoft3DViewer* | Remove-AppxPackage}
CLS

echo.
echo.
echo [========                     18.0%                         ]
echo.
echo %w%- Uninstalling MicrosoftSolitaireCollection (Removing Preinstalled Apps) %p%
PowerShell -command "& {Get-AppxPackage *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage}
CLS 

echo.
echo.
echo [==========                   21.5%                         ]
echo.
echo %w%- Uninstalling MicrosoftStickyNotes (Removing Preinstalled Apps) %p%
PowerShell -command "& {Get-AppxPackage *Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage}
CLS

echo.
echo.
echo [============                 24.5%                         ]
echo.
echo %w%- Uninstalling MixedReality.Portal (Removing Preinstalled Apps) %p%
PowerShell -command "& {Get-AppxPackage *Microsoft.MixedReality.Portal* | Remove-AppxPackage}
CLS

echo.
echo.
echo [==============               27.0%                         ]
echo.
echo %w%- Uninstalling OneConnect (Removing Preinstalled Apps) %p%
PowerShell -command "& {Get-AppxPackage *Microsoft.OneConnect* | Remove-AppxPackage}
CLS

echo.
echo.
echo [===============              28.5%                         ]
echo.
echo %w%- Uninstalling People (Removing Preinstalled Apps) %p%
PowerShell -command "& {Get-AppxPackage *Microsoft.People* | Remove-AppxPackage}
CLS

echo.
echo.
echo [==================           30.5%                         ]
echo.
echo %w%- Uninstalling Print3D (Removing Preinstalled Apps) %p%
PowerShell -command "& {Get-AppxPackage *Microsoft.Print3D* | Remove-AppxPackage}
CLS

echo.
echo.
echo [===================           32.0%                        ]
echo.
echo %w%- Uninstalling SkypeApp (Removing Preinstalled Apps) %p%
PowerShell -command "& {Get-AppxPackage *Microsoft.SkypeApp* | Remove-AppxPackage}
CLS

echo.
echo.
echo [====================         34.0%                         ]
echo.
echo %w%- Uninstalling WindowsAlarms (Removing Preinstalled Apps) %p%
PowerShell -command "& {Get-AppxPackage *Microsoft.WindowsAlarms* | Remove-AppxPackage}
CLS

echo.
echo.
echo [=====================        35.2%                         ]
echo.
echo %w%- Uninstalling WindowsCamera (Removing Preinstalled Apps) %p%
PowerShell -command "& {Get-AppxPackage *Microsoft.WindowsCamera* | Remove-AppxPackage}
CLS

echo.
echo.
echo [======================       37.5%                         ]
echo.
echo %w%- Uninstalling windowscommunicationsapps (Removing Preinstalled Apps) %p%
PowerShell -command "& {Get-AppxPackage *microsoft.windowscommunicationsapps* | Remove-AppxPackage}
CLS

echo.
echo.
echo [=======================      38.8%                         ]
echo.
echo %w%- Uninstalling WindowsMaps (Removing Preinstalled Apps) %p%
PowerShell -command "& {Get-AppxPackage *Microsoft.WindowsMaps* | Remove-AppxPackage}
CLS

echo.
echo.
echo [========================     40.0%                         ]
echo.
echo %w%- Uninstalling WindowsFeedbackHub (Removing Preinstalled Apps) %p%
PowerShell -command "& {Get-AppxPackage *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage}
CLS

echo.
echo.
echo [=========================    42.2%                         ]
echo.
echo %w%- Uninstalling WindowsSoundRecorder (Removing Preinstalled Apps) %p%
PowerShell -command "& {Get-AppxPackage *Microsoft.WindowsSoundRecorder* | Remove-AppxPackage}
CLS

echo.
echo.
echo [=========================    44.5%                         ]
echo.
echo %w%- Uninstalling YourPhone (Removing Preinstalled Apps) %p%
PowerShell -command "& {Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage}
CLS

echo.
echo.
echo [===========================  47.0%                         ]
echo.
echo %w%- Uninstalling ZuneMusic (Removing Preinstalled Apps) %p%
PowerShell -command "& {Get-AppxPackage *Microsoft.ZuneMusic* | Remove-AppxPackage}
CLS

echo.
echo.
echo [===========================  49.0%                         ]
echo.
echo %w%- Uninstalling HEIFImageExtension (Removing Preinstalled Apps) %p%

PowerShell -command "& {Get-AppxPackage *Microsoft.HEIFImageExtension* | Remove-AppxPackage}
CLS

echo.
echo.
echo [=============================51.0%                         ]
echo.
echo %w%- Uninstalling WebMediaExtensions (Removing Preinstalled Apps) %p%
PowerShell -command "& {Get-AppxPackage *Microsoft.WebMediaExtensions* | Remove-AppxPackage}
CLS

echo.
echo.
echo [=============================53.5%==                       ]
echo.
echo %w%- Uninstalling WebpImageExtension (Removing Preinstalled Apps) %p%
PowerShell -command "& {Get-AppxPackage *Microsoft.WebpImageExtension* | Remove-AppxPackage}
CLS

echo.
echo.
echo [=============================56.7%====                     ]
echo.
echo %w%- Uninstalling 3dBuilder (Removing Preinstalled Apps) %p%
PowerShell -command "& {Get-AppxPackage *Microsoft.3dBuilder* | Remove-AppxPackage}
CLS

echo.
echo.
echo [=============================59.5%======                   ]
echo.
echo %w%- Uninstalling bing (Removing Preinstalled Apps) %p%
PowerShell -Command "Get-AppxPackage -allusers *bing* | Remove-AppxPackage"
CLS

echo.
echo.
echo [=============================62.0%========                 ]
echo.
echo %w%- Uninstalling bingfinance (Removing Preinstalled Apps) %p%
PowerShell -Command "Get-AppxPackage -allusers *bingfinance* | Remove-AppxPackage"
CLS

echo.
echo.
echo [=============================65.5%==========               ]
echo.
echo %w%- Uninstalling bingsports (Removing Preinstalled Apps) %p%
PowerShell -Command "Get-AppxPackage -allusers *bingsports* | Remove-AppxPackage"
CLS

echo.
echo.
echo [=============================69.0%============             ]
echo.
echo %w%- Uninstalling CommsPhone (Removing Preinstalled Apps) %p%
PowerShell -Command "Get-AppxPackage -allusers *CommsPhone* | Remove-AppxPackage"
CLS

echo.
echo.
echo [=============================75.0 %=============           ]
echo.
echo %w%- Uninstalling Drawboard PDF (Removing Preinstalled Apps) %p%
PowerShell -Command "Get-AppxPackage -allusers *Drawboard PDF* | Remove-AppxPackage"
CLS

echo.
echo.
echo [=============================79.5%%===============         ]
echo.
echo %w%- Uninstalling Sway (Removing Preinstalled Apps) %p%
PowerShell -Command "Get-AppxPackage -allusers *Sway* | Remove-AppxPackage"
CLS

echo.
echo.
echo [=============================85.0%%===================     ]
echo.
echo %w%- Uninstalling WindowsAlarms (Removing Preinstalled Apps) %p%
PowerShell -Command "Get-AppxPackage -allusers *WindowsAlarms* | Remove-AppxPackage"
CLS

echo.
echo.
echo [=============================90.5%%=====================   ]
echo.
echo %w%- Uninstalling WindowsPhone (Removing Preinstalled Apps) %p%
PowerShell -Command "Get-AppxPackage -allusers *WindowsPhone* | Remove-AppxPackage"
CLS

echo.
echo.
echo [=============================93.5%%=====================   ]
echo.
echo %w%- Uninstalling WindowsPhone (Removing Preinstalled Apps) %p%
PowerShell -Command "Get-AppxPackage -allusers *WindowsPhone* | Remove-AppxPackage"
CLS

echo.
echo.
echo [=============================100.0%%=======================]
echo %w%- Finished! %p%
chcp 65001 > nul

::8
echo %w% - Disabling Cortana Related Services and Features%p%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortanaAboveLock" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWebOverMeteredConnections" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisablingWebSearch" /t REG_DWORD /d "0" /f 


chcp 437 >nul 
timeout /t 1 /nobreak > NUL
echo %w% - Uninstalling Cortana%p%
Powershell -Command "Get-appxpackage -allusers *Microsoft.549981C3F5F10* | Remove-AppxPackage" 
timeout /t 1 /nobreak > NUL
chcp 65001 >nul 

echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :menu



:d6 
cls
echo %w% - Disabling Printing and maps Services  %p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Spooler" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\PrintNotify" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MapsBroker" /v "Start" /t REG_DWORD /d "4" /f
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :debloat

:d5
cls
echo %w% - Disabling Office Telemetry  %p%
Reg.exe add "HKCU\Software\Microsoft\Office\Common\ClientTelemetry" /v "DisablingTelemetry" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common" /v "sendcustomerdata" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\Feedback" /v "Enablingd" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\Feedback" /v "includescreenshot" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Outlook\Options\Mail" /v "EnablingLogging" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Word\Options" /v "EnablingLogging" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\Common\ClientTelemetry" /v "SendTelemetry" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common" /v "qmEnabling" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common" /v "updatereliabilitydata" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\General" /v "shownfirstrunoptin" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\General" /v "skydrivesigninoption" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\ptwatson" /v "ptwoptin" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Firstrun" /v "Disablingmovie" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM" /v "Enablinglogging" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM" /v "EnablingUpload" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM" /v "EnablingFileObfuscation" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "accesssolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "olksolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "onenotesolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "pptsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "projectsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "publishersolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "visiosolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "wdsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "xlsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "agave" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "appaddins" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "comaddins" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "documentfiles" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "templatefiles" /t REG_DWORD /d "1" /f
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :debloat

:d8
cls 
chcp 437 > nul

echo %w% - Deleting Microsoft Edge %p%
echo %w% - Remove Edge application selection associations %p%
:: Remove file association for "MSEdgeHTM" for .webp
:: Delete the registry value "MSEdgeHTM_.webp" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-20H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_.webp'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for .xml
:: Delete the registry value "MSEdgeHTM_.xml" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_.xml'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for http
:: Delete the registry value "MSEdgeHTM_http" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_http'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for https
:: Delete the registry value "MSEdgeHTM_https" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_https'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for .htm
:: Delete the registry value "MSEdgeHTM_.htm" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_.htm'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for .html
:: Delete the registry value "MSEdgeHTM_.html" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_.html'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgePDF" for .pdf
:: Delete the registry value "MSEdgePDF_.pdf" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgePDF_.pdf'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for .svg
:: Delete the registry value "MSEdgeHTM_.svg" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_.svg'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for mailto
:: Delete the registry value "MSEdgeHTM_mailto" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_mailto'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for read
:: Delete the registry value "MSEdgeHTM_read" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy.sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_read'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for .mht
:: Delete the registry value "MSEdgeHTM_.mht" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy.sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_.mht'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeMHT" for .mht
:: Delete the registry value "MSEdgeMHT_.mht" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeMHT_.mht'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for .mhtml
:: Delete the registry value "MSEdgeHTM_.mhtml" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy.sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_.mhtml'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeMHT" for .mhtml
:: Delete the registry value "MSEdgeMHT_.mhtml" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeMHT_.mhtml'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for microsoft-edge
:: Delete the registry value "MSEdgeHTM_microsoft-edge" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy.sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_microsoft-edge'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for microsoft-edge
:: Delete the registry value "MSEdgeHTM_microsoft-edge" from the key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$versionName = 'Windows11-21H2'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy.sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_microsoft-edge'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for .xht
:: Delete the registry value "MSEdgeHTM_.xht" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_.xht'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for .xhtml
:: Delete the registry value "MSEdgeHTM_.xhtml" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_.xhtml'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove file association for "MSEdgeHTM" for ftp
:: Delete the registry value "MSEdgeHTM_ftp" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $valueName = 'MSEdgeHTM_ftp'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"


:: --Remove Edge Open With associations--
echo %w% Edge Open With associations %p%
:: Delete Open With association for "{{ progId }}" for .htm
:: Delete the registry value "MSEdgeHTM" from the key "HKLM\Software\Classes\.htm\OpenWithProgids" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKLM\Software\Classes\.htm\OpenWithProgids'; $valueName = 'MSEdgeHTM'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Delete Open With association for "{{ progId }}" for .html
:: Delete the registry value "MSEdgeHTM" from the key "HKLM\Software\Classes\.html\OpenWithProgids" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKLM\Software\Classes\.html\OpenWithProgids'; $valueName = 'MSEdgeHTM'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Delete Open With association for "{{ progId }}" for .mht
:: Delete the registry value "MSEdgeMHT" from the key "HKLM\Software\Classes\.mht\OpenWithProgids" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKLM\Software\Classes\.mht\OpenWithProgids'; $valueName = 'MSEdgeMHT'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Delete Open With association for "{{ progId }}" for .mhtml
:: Delete the registry value "MSEdgeMHT" from the key "HKLM\Software\Classes\.mhtml\OpenWithProgids" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKLM\Software\Classes\.mhtml\OpenWithProgids'; $valueName = 'MSEdgeMHT'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Delete Open With association for "{{ progId }}" for .pdf
:: Delete the registry value "MSEdgePDF" from the key "HKLM\Software\Classes\.pdf\OpenWithProgids" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKLM\Software\Classes\.pdf\OpenWithProgids'; $valueName = 'MSEdgePDF'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Delete Open With association for "{{ progId }}" for .shtml
:: Delete the registry value "MSEdgeHTM" from the key "HKLM\Software\Classes\.shtml\OpenWithProgids" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKLM\Software\Classes\.shtml\OpenWithProgids'; $valueName = 'MSEdgeHTM'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Delete Open With association for "{{ progId }}" for .svg
:: Delete the registry value "MSEdgeHTM" from the key "HKLM\Software\Classes\.svg\OpenWithProgids" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKLM\Software\Classes\.svg\OpenWithProgids'; $valueName = 'MSEdgeHTM'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Delete Open With association for "{{ progId }}" for .webp
:: Delete the registry value "MSEdgeHTM" from the key "HKLM\Software\Classes\.webp\OpenWithProgids" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKLM\Software\Classes\.webp\OpenWithProgids'; $valueName = 'MSEdgeHTM'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Delete Open With association for "{{ progId }}" for .xht
:: Delete the registry value "MSEdgeHTM" from the key "HKLM\Software\Classes\.xht\OpenWithProgids" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKLM\Software\Classes\.xht\OpenWithProgids'; $valueName = 'MSEdgeHTM'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Delete Open With association for "{{ progId }}" for .xhtml
:: Delete the registry value "MSEdgeHTM" from the key "HKLM\Software\Classes\.xhtml\OpenWithProgids" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKLM\Software\Classes\.xhtml\OpenWithProgids'; $valueName = 'MSEdgeHTM'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Delete Open With association for "{{ progId }}" for .xml
:: Delete the registry value "MSEdgeHTM" from the key "HKLM\Software\Classes\.xml\OpenWithProgids" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKLM\Software\Classes\.xml\OpenWithProgids'; $valueName = 'MSEdgeHTM'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"


:: Remove Edge user associations
echo %w% - Edge user associations %p%
:: Remove user-chosen URL association for "MSEdgeHTM" for http URL protocol
:: Delete the registry value "ProgId" from the key "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-20H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove user-chosen URL association for "MSEdgeHTM" for https URL protocol
:: Delete the registry value "ProgId" from the key "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-20H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove user-chosen URL association for "MSEdgeHTM" for microsoft-edge URL protocol
:: Delete the registry value "ProgId" from the key "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\microsoft-edge\UserChoice" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-20H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\microsoft-edge\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove user-chosen URL association for "MSEdgeHTM" for microsoft-edge-holographic URL protocol
:: Delete the registry value "ProgId" from the key "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\microsoft-edge-holographic\UserChoice" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-20H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\microsoft-edge-holographic\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove user-chosen URL association for "MSEdgeHTM" for ms-xbl-3d8b930f URL protocol
:: Delete the registry value "ProgId" from the key "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\ms-xbl-3d8b930f\UserChoice" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-20H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\ms-xbl-3d8b930f\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove user-chosen URL association for "MSEdgeHTM" for read URL protocol
:: Delete the registry value "ProgId" from the key "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\read\UserChoice" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-20H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\read\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove user-chosen file association for "MSEdgeHTM" for .htm files
:: Delete the registry value "ProgId" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.htm\UserChoice" (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-20H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.htm\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RemovedRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RemovedRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RemoveAccessRule($denyRule)) { $AclChanges.RemovedRules += $denyRule; } else { Write-Warning 'Failed to remove the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RemoveAccessRule($rule)) { Write-Warning 'Failed to remove the rule.'; }; }; foreach ($rule in $AclChanges.RemovedRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.htm\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; Grant-Permissions; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Remove user-chosen file association for "MSEdgeHTM" for .html files
:: Delete the registry value "ProgId" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.html\UserChoice" (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-20H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.html\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RemovedRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RemovedRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RemoveAccessRule($denyRule)) { $AclChanges.RemovedRules += $denyRule; } else { Write-Warning 'Failed to remove the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RemoveAccessRule($rule)) { Write-Warning 'Failed to remove the rule.'; }; }; foreach ($rule in $AclChanges.RemovedRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.html\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; Grant-Permissions; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Remove user-chosen file association for "MSEdgePDF" for .pdf files
:: Delete the registry value "ProgId" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.pdf\UserChoice" (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-20H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.pdf\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RemovedRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RemovedRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RemoveAccessRule($denyRule)) { $AclChanges.RemovedRules += $denyRule; } else { Write-Warning 'Failed to remove the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RemoveAccessRule($rule)) { Write-Warning 'Failed to remove the rule.'; }; }; foreach ($rule in $AclChanges.RemovedRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.pdf\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgePDF'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; Grant-Permissions; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Remove user-chosen file association for "MSEdgeHTM" for .svg files
:: Delete the registry value "ProgId" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.svg\UserChoice" (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-20H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.svg\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RemovedRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RemovedRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RemoveAccessRule($denyRule)) { $AclChanges.RemovedRules += $denyRule; } else { Write-Warning 'Failed to remove the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RemoveAccessRule($rule)) { Write-Warning 'Failed to remove the rule.'; }; }; foreach ($rule in $AclChanges.RemovedRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.svg\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; Grant-Permissions; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Remove user-chosen file association for "MSEdgeHTM" for .mht files
:: Delete the registry value "ProgId" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mht\UserChoice" (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy.sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mht\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RemovedRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RemovedRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RemoveAccessRule($denyRule)) { $AclChanges.RemovedRules += $denyRule; } else { Write-Warning 'Failed to remove the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RemoveAccessRule($rule)) { Write-Warning 'Failed to remove the rule.'; }; }; foreach ($rule in $AclChanges.RemovedRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mht\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; Grant-Permissions; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Remove user-chosen file association for "MSEdgeMHT" for .mht files
:: Delete the registry value "ProgId" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mht\UserChoice" (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mht\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RemovedRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RemovedRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RemoveAccessRule($denyRule)) { $AclChanges.RemovedRules += $denyRule; } else { Write-Warning 'Failed to remove the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RemoveAccessRule($rule)) { Write-Warning 'Failed to remove the rule.'; }; }; foreach ($rule in $AclChanges.RemovedRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mht\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeMHT'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; Grant-Permissions; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Remove user-chosen file association for "MSEdgeHTM" for .mhtml files
:: Delete the registry value "ProgId" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mhtml\UserChoice" (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy.sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mhtml\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RemovedRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RemovedRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RemoveAccessRule($denyRule)) { $AclChanges.RemovedRules += $denyRule; } else { Write-Warning 'Failed to remove the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RemoveAccessRule($rule)) { Write-Warning 'Failed to remove the rule.'; }; }; foreach ($rule in $AclChanges.RemovedRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mhtml\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; Grant-Permissions; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Remove user-chosen file association for "MSEdgeMHT" for .mhtml files
:: Delete the registry value "ProgId" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mhtml\UserChoice" (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mhtml\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RemovedRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RemovedRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RemoveAccessRule($denyRule)) { $AclChanges.RemovedRules += $denyRule; } else { Write-Warning 'Failed to remove the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RemoveAccessRule($rule)) { Write-Warning 'Failed to remove the rule.'; }; }; foreach ($rule in $AclChanges.RemovedRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mhtml\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeMHT'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; Grant-Permissions; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Remove user-chosen file association for "MSEdgeHTM" for .xml files
:: Delete the registry value "ProgId" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.xml\UserChoice" (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-22H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$versionName = 'Windows10-22H2'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy.sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.xml\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RemovedRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RemovedRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RemoveAccessRule($denyRule)) { $AclChanges.RemovedRules += $denyRule; } else { Write-Warning 'Failed to remove the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RemoveAccessRule($rule)) { Write-Warning 'Failed to remove the rule.'; }; }; foreach ($rule in $AclChanges.RemovedRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.xml\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; Grant-Permissions; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Remove user-chosen URL association for "MSEdgeHTM" for ftp URL protocol
:: Delete the registry value "ProgId" from the key "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\ftp\UserChoice" 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $keyName = 'HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\ftp\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Remove user-chosen file association for "MSEdgeHTM" for .xht files
:: Delete the registry value "ProgId" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.xht\UserChoice" (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.xht\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RemovedRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RemovedRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RemoveAccessRule($denyRule)) { $AclChanges.RemovedRules += $denyRule; } else { Write-Warning 'Failed to remove the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RemoveAccessRule($rule)) { Write-Warning 'Failed to remove the rule.'; }; }; foreach ($rule in $AclChanges.RemovedRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.xht\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; Grant-Permissions; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Remove user-chosen file association for "MSEdgeHTM" for .xhtml files
:: Delete the registry value "ProgId" from the key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.xhtml\UserChoice" (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.xhtml\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RemovedRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RemovedRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RemoveAccessRule($denyRule)) { $AclChanges.RemovedRules += $denyRule; } else { Write-Warning 'Failed to remove the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RemoveAccessRule($rule)) { Write-Warning 'Failed to remove the rule.'; }; }; foreach ($rule in $AclChanges.RemovedRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $keyName = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.xhtml\UserChoice'; $valueName = 'ProgId'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; $expectedData = 'MSEdgeHTM'; $currentData = Get-ItemProperty -LiteralPath $path -Name $valueName | Select-Object -ExpandProperty $valueName; if ($currentData -ne $expectedData) { Write-Host "^""Skipping, no action needed, current data '$currentData' is not same as '$expectedData'."^""; Exit 0; }; Grant-Permissions; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"


:: Remove Edge through official installer
echo %w% -  Remove Edge through official installer %p%
PowerShell -ExecutionPolicy Unrestricted -Command "$data = '1'; reg add 'HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdateDev' /v 'AllowUninstall' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Create a placeholder file at "%SYSTEMROOT%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\MicrosoftEdge.exe".
PowerShell -ExecutionPolicy Unrestricted -Command "$filePath = '%SYSTEMROOT%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\MicrosoftEdge.exe'; $expandedFilePath = [System.Environment]::ExpandEnvironmentVariables($filePath); $placeholderText = 'privacy.sexy placeholder'; Write-Output "^""Creating placeholder file at `"^""$expandedFilePath`"^""."^""; $parentDirectory = [System.IO.Path]::GetDirectoryName($expandedFilePath); if (Test-Path $expandedFilePath -PathType Leaf) { Write-Host "^""Skipping file creation as `"^""$expandedFilePath`"^"" already exists."^""; Exit 0; }; if (Test-Path $parentDirectory -PathType Container) { Write-Host "^""Skipping parent directory creation as `"^""$parentDirectory`"^"" already exists."^""; } else { try { New-Item -ItemType Directory -Path "^""$parentDirectory"^"" -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created directory for placeholder file at `"^""$parentDirectory`"^""."^""; }  catch { Write-Error "^""Failed to create directory for placeholder at `"^""$parentDirectory`"^"": $_"^""; Exit 1; }; }; try { New-Item -ItemType File -Path $expandedFilePath -Value "^""$placeholderText"^"" -Force -ErrorAction Stop | Out-Null; Write-Host "^""Successfully created a placeholder file at `"^""$expandedFilePath`"^""."^""; } catch { Write-Error "^""Failed to create placeholder file at `"^""$expandedFilePath`"^"": $_"^""; Exit 1; }"
:: Uninstall running the official uninstaller
PowerShell -ExecutionPolicy Unrestricted -Command "$installers = (Get-ChildItem "^""$($env:ProgramFiles)*\Microsoft\Edge\Application\*\Installer\setup.exe"^""); if (!$installers) { Write-Host 'Installer not found. Microsoft Edge may already be uninstalled.'; } else { foreach ($installer in $installers) { $uninstallerPath = $installer.FullName; if (-Not (Test-Path "^""$uninstallerPath"^"")) { Write-Host "^""Installer not found at `"^""$uninstallerPath`"^"". Microsoft Edge may already be uninstalled."^""; continue; }; $installerArguments = @("^""--uninstall"^"", "^""--system-level"^"", "^""--verbose-logging"^"", "^""--force-uninstall"^""); Write-Output "^""Uninstalling through uninstaller: $uninstallerPath"^""; $process = Start-Process -FilePath "^""$uninstallerPath"^"" -ArgumentList $installerArguments -Wait -PassThru; if ($process.ExitCode -eq 0 -or $process.ExitCode -eq 19) { Write-Host "^""Successfully uninstalled Edge."^""; } else { Write-Error "^""Failed to uninstall, uninstaller failed with exit code $($process.ExitCode)."^""; }; }; }"


:: Remove Edge shortcuts
echo %w% - Remove Edge shortcuts %p%
PowerShell -ExecutionPolicy Unrestricted -Command "$shortcuts = @(; @{ Revert = $True;  Path = "^""$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk"^""; }; @{ Revert = $True;  Path = "^""$env:AppData\Microsoft\Internet Explorer\Quick Launch\Microsoft Edge.lnk"^""; }; @{ Revert = $True;  Path = "^""$env:AppData\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Microsoft Edge.lnk"^""; }; @{ Revert = $True;  Path = "^""$env:Public\Desktop\Microsoft Edge.lnk"^""; }; @{ Revert = $True;  Path = "^""$env:SystemRoot\System32\config\systemprofile\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\Microsoft Edge.lnk"^""; }; @{ Revert = $False; Path = "^""$env:UserProfile\Desktop\Microsoft Edge.lnk"^""; }; ); foreach ($shortcut in $shortcuts) { if (-Not (Test-Path $shortcut.Path)) { Write-Host "^""Skipping, shortcut does not exist: `"^""$($shortcut.Path)`"^""."^""; continue; }; try { Remove-Item -Path $shortcut.Path -Force -ErrorAction Stop; Write-Output "^""Successfully removed shortcut: `"^""$($shortcut.Path)`"^""."^""; } catch { Write-Error "^""Encountered an issue while attempting to remove shortcut at: `"^""$($shortcut.Path)`"^""."^""; }; }"
chcp 65001 > nul

cls
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto menu



:w8
cls
echo %w% - Disabling Setting Synchronization%p%
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\AppSync" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\DesktopTheme" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\PackageState" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\StartLayout" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows" /v "Enablingd" /t REG_DWORD /d "0" /f 
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :windows

:w7
echo %w% - Disabling Windows Error Reporting%p%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disablingd" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "DoReport" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisablingd" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disablingd" /t REG_DWORD /d "1" /f 
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :windows

:w9
echo %w% - Disabling Diagnostic Services%p%
sc stop DiagTrack > nul 2>&1
sc config DiagTrack start= Disablingd > nul 2>&1
sc stop dmwappushservice > nul 2>&1
sc config dmwappushservice start= Disablingd > nul 2>&1
sc stop diagnosticshub.standardcollector.service > nul 2>&1
sc config diagnosticshub.standardcollector.service start= Disablingd > nul 2>&1
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :windows

:w5
CLS

echo %w% - Disabling Bluetooth%p%
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\BTAGService" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bthserv" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\BthAvctpSvc" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\BluetoothUserService" /v "Start" /t REG_DWORD /d "4" /f
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :windows

:d1
cls
echo %w% - Disabling GameDVR%p%
Reg.exe add "HKCU\Software\Microsoft\GameBar" /v "UseNexusForGameBarEnablingd" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\GameBar" /v "GameDVR_Enablingd" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnablingd" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AudioCaptureEnablingd" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "CursorCaptureEnablingd" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "HistoricalCaptureEnablingd" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_Enablingd" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\GameDVR" /v "AllowgameDVR" /t REG_DWORD /d "0" /f
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :debloat

:w2
cls
echo %w% - Disabling Notifications%p%
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_NOTIFICATION_SOUND" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_CRITICAL_TOASTS_ABOVE_LOCK" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\QuietHours" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\windows.immersivecontrolpanel_cw5n1h2txyewy!microsoft.windows.immersivecontrolpanel" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.AutoPlay" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.LowDisk" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Print.Notification" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.WiFiNetworkManager" /v "Enablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisablingNotificationCenter" /t REG_DWORD /d "1" /f
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :windows

:d3
cls
echo %w% - Disabling Xbox Services%p%
sc config xbgm start= Disablingd >nul 2>&1
sc config XblAuthManager start= Disablingd
sc config XblGameSave start= Disablingd
sc config XboxGipSvc start= Disablingd
sc config XboxNetApiSvc start= Disablingd
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :debloat

:d7
cls
echo %w% - Disabling Cortana%p%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortanaAboveLock" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWebOverMeteredConnections" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisablingWebSearch" /t REG_DWORD /d "0" /f 


chcp 437 >nul 
timeout /t 1 /nobreak > NUL
Powershell -Command "Get-appxpackage -allusers *Microsoft.549981C3F5F10* | Remove-AppxPackage" 
timeout /t 1 /nobreak > NUL
chcp 65001 >nul 
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :debloat

:w6
cls
timeout /t 1 /nobreak > NUL

powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Note: Disabling Windows Updates will break Microsoft store, if you want to use it again simply press "Enabling" in windows update blocker ', 'OT SERVICES OPTIMIZER', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"

start C:\exm\Windows_Update_Blocker.exe
chcp 65001 >nul 
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :windows



:w3
cls 

%windir%\system32\SystemPropertiesPerformance.exe
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :windows

:d10
cls
echo %w% - Disabling Customer Experience Improvement Program%p%
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disabling > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" > nul 2>&1 
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /Disabling > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /Disabling > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" > nul 2>&1 
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disabling > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\Uploader" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Uploader" /Disabling > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disabling > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disabling > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Application Experience\StartupAppTask" > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" /Disabling > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyRefresh" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyRefresh" /Disabling > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyUpload" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyUpload" /Disabling > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Maintenance\WinSAT" > nul 2>&1
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :menu

:w13
echo %w% - Disabling Automatic Maintenance%p%
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisablingd" /t REG_DWORD /d "1" /f 
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :windows

:w16
echo %w% - Disabling Activity feed%p%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v "EnablingFeeds" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft" /v "AllowNewsAndInterests" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnablingActivityFeed" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enablingd" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnablingActivityFeed" /t REG_DWORD /d "0" /f
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :windows

:w15
echo %w% - Disabling Popups, baloon tips and more%p%
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisallowShaking" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnablingBalloonTips" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" /v "Value" /t REG_SZ /d "Deny" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisablingdByGroupPolicy" /t REG_DWORD /d "1" /f
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :windows


:w11
echo %w% - Disabling Windows Insider Experiments%p%
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\System" /v "AllowExperimentation" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\System\AllowExperimentation" /v "value" /t REG_DWORD /d "0" /f 

echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :windows



:d4
cls
chcp 437 > nul

echo.
echo.
echo [                             0%                            ]
echo.
echo %w%- Uninstalling BingWeather (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.BingWeather* | Remove-AppxPackage}
CLS

echo.
echo.
echo [==                           3.5%                          ]
echo.
echo %w%- Uninstalling GetHelp  (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage}
CLS

echo.
echo.
echo [====                         7.0%                          ]
echo.
echo %w%- Uninstalling Getstarted  (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.Getstarted* | Remove-AppxPackage}
CLS

echo.
echo.
echo [=====                        10.5%                         ]
echo.
echo %w%- Uninstalling Messaging  (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.Messaging* | Remove-AppxPackage}
CLS

echo.
echo.
echo [======                       14.5%                         ]
echo.
echo %w%- Uninstalling Messaging  (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.Microsoft3DViewer* | Remove-AppxPackage}
CLS

echo.
echo.
echo [========                     18.0%                         ]
echo.
echo %w%- Uninstalling MicrosoftSolitaireCollection (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage}
CLS 

echo.
echo.
echo [==========                   21.5%                         ]
echo.
echo %w%- Uninstalling MicrosoftStickyNotes (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage}
CLS

echo.
echo.
echo [============                 24.5%                         ]
echo.
echo %w%- Uninstalling MixedReality.Portal (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.MixedReality.Portal* | Remove-AppxPackage}
CLS

echo.
echo.
echo [==============               27.0%                         ]
echo.
echo %w%- Uninstalling OneConnect (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.OneConnect* | Remove-AppxPackage}
CLS

echo.
echo.
echo [===============              28.5%                         ]
echo.
echo %w%- Uninstalling People (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.People* | Remove-AppxPackage}
CLS

echo.
echo.
echo [==================           30.5%                         ]
echo.
echo %w%- Uninstalling Print3D (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.Print3D* | Remove-AppxPackage}
CLS

echo.
echo.
echo [===================           32.0%                        ]
echo.
echo %w%- Uninstalling SkypeApp (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.SkypeApp* | Remove-AppxPackage}
CLS

echo.
echo.
echo [====================         34.0%                         ]
echo.
echo %w%- Uninstalling WindowsAlarms (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WindowsAlarms* | Remove-AppxPackage}
CLS

echo.
echo.
echo [=====================        35.2%                         ]
echo.
echo %w%- Uninstalling WindowsCamera (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WindowsCamera* | Remove-AppxPackage}
CLS

echo.
echo.
echo [======================       37.5%                         ]
echo.
echo %w%- Uninstalling windowscommunicationsapps (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *microsoft.windowscommunicationsapps* | Remove-AppxPackage}
CLS

echo.
echo.
echo [=======================      38.8%                         ]
echo.
echo %w%- Uninstalling WindowsMaps (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WindowsMaps* | Remove-AppxPackage}
CLS

echo.
echo.
echo [========================     40.0%                         ]
echo.
echo %w%- Uninstalling WindowsFeedbackHub (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage}
CLS

echo.
echo.
echo [=========================    42.2%                         ]
echo.
echo %w%- Uninstalling WindowsSoundRecorder (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WindowsSoundRecorder* | Remove-AppxPackage}
CLS

echo.
echo.
echo [=========================    44.5%                         ]
echo.
echo %w%- Uninstalling YourPhone (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage}
CLS

echo.
echo.
echo [===========================  47.0%                         ]
echo.
echo %w%- Uninstalling ZuneMusic (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.ZuneMusic* | Remove-AppxPackage}
CLS

echo.
echo.
echo [===========================  49.0%                         ]
echo.
echo %w%- Uninstalling HEIFImageExtension (Removing Preinstalled Apps) %p%

Powershell.exe -command "& {Get-AppxPackage *Microsoft.HEIFImageExtension* | Remove-AppxPackage}
CLS

echo.
echo.
echo [=============================51.0%                         ]
echo.
echo %w%- Uninstalling WebMediaExtensions (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WebMediaExtensions* | Remove-AppxPackage}
CLS

echo.
echo.
echo [=============================53.5%==                       ]
echo.
echo %w%- Uninstalling WebpImageExtension (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WebpImageExtension* | Remove-AppxPackage}
CLS

echo.
echo.
echo [=============================56.7%====                     ]
echo.
echo %w%- Uninstalling 3dBuilder (Removing Preinstalled Apps) %p%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.3dBuilder* | Remove-AppxPackage}
CLS

echo.
echo.
echo [=============================59.5%======                   ]
echo.
echo %w%- Uninstalling bing (Removing Preinstalled Apps) %p%
PowerShell -Command "Get-AppxPackage -allusers *bing* | Remove-AppxPackage"
CLS

echo.
echo.
echo [=============================62.0%========                 ]
echo.
echo %w%- Uninstalling bingfinance (Removing Preinstalled Apps) %p%
PowerShell -Command "Get-AppxPackage -allusers *bingfinance* | Remove-AppxPackage"
CLS

echo.
echo.
echo [=============================65.5%==========               ]
echo.
echo %w%- Uninstalling bingsports (Removing Preinstalled Apps) %p%
PowerShell -Command "Get-AppxPackage -allusers *bingsports* | Remove-AppxPackage"
CLS

echo.
echo.
echo [=============================69.0%============             ]
echo.
echo %w%- Uninstalling CommsPhone (Removing Preinstalled Apps) %p%
PowerShell -Command "Get-AppxPackage -allusers *CommsPhone* | Remove-AppxPackage"
CLS

echo.
echo.
echo [=============================75.0 %=============           ]
echo.
echo %w%- Uninstalling Drawboard PDF (Removing Preinstalled Apps) %p%
PowerShell -Command "Get-AppxPackage -allusers *Drawboard PDF* | Remove-AppxPackage"
CLS

echo.
echo.
echo [=============================79.5%%===============         ]
echo.
echo %w%- Uninstalling Sway (Removing Preinstalled Apps) %p%
PowerShell -Command "Get-AppxPackage -allusers *Sway* | Remove-AppxPackage"
CLS

echo.
echo.
echo [=============================85.0%%===================     ]
echo.
echo %w%- Uninstalling WindowsAlarms (Removing Preinstalled Apps) %p%
PowerShell -Command "Get-AppxPackage -allusers *WindowsAlarms* | Remove-AppxPackage"
CLS

echo.
echo.
echo [=============================90.5%%=====================   ]
echo.
echo %w%- Uninstalling WindowsPhone (Removing Preinstalled Apps) %p%
PowerShell -Command "Get-AppxPackage -allusers *WindowsPhone* | Remove-AppxPackage"
CLS

echo.
echo.
echo [=============================93.5%%=====================   ]
echo.
echo %w%- Uninstalling WindowsPhone (Removing Preinstalled Apps) %p%
PowerShell -Command "Get-AppxPackage -allusers *WindowsPhone* | Remove-AppxPackage"
CLS

echo.
echo.
echo [=============================100.0%%=======================]
echo %w%- Finished! %p%


chcp 65001 > nul
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto :debloat



:e
:revert
cls
echo.
echo.
echo.                                                               %r%       ██████╗░███████╗██╗░░░██╗███████╗██████╗░████████╗
echo.                                                               %r%       ██╔══██╗██╔════╝██║░░░██║██╔════╝██╔══██╗╚══██╔══╝
echo.                                                               %r%       ██████╔╝█████╗░░╚██╗░██╔╝█████╗░░██████╔╝░░░██║░░░
echo.                                                               %r%       ██╔══██╗██╔══╝░░░╚████╔╝░██╔══╝░░██╔══██╗░░░██║░░░
echo.                                                               %r%       ██║░░██║███████╗░░╚██╔╝░░███████╗██║░░██║░░░██║░░░
echo.                                                               %r%       ╚═╝░░╚═╝╚══════╝░░░╚═╝░░░╚══════╝╚═╝░░╚═╝░░░╚═╝░░░
echo.                                             %p%"══════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                 %w% Use these if you want to revert certain optimizations                     
echo.                                                                                                                      
echo.                                                                                                                      
echo.                                                                       %r%[%w%1%r%]%w% Bring back default power plans                                 
echo.                                                                                                                          
echo.                                                                       %r%[%w%2%r%]%w% Reinstall default windows apps                                 
echo.                                                                                                                      
echo.                                                                       %r%[%w%3%r%]%w% Enable XBOX Services                                           
echo.                                                                                                                      
echo.                                                                       %r%[%w%4%r%]%w% Enable GameDVR                                                 
echo.                                                                                                                        
echo.                                                                       %r%[%w%5%r%]%w% Enable Notifications                                           
echo.                                                                                                                       
echo.                                                                       %r%[%w%6%r%]%w% Enable Bluetooth      
echo.
echo.                                                                       %r%[%w%7%r%]%w% Enable Fast Startup, Hibernation and Sleep Study (Dont reccomend using them, they are bad for your pc)                                        
echo.                                         
echo.                                                                       %r%[%w%8%r%]%w% Enable Power Throttoling                                            
echo.                                                                                                    
echo.                                                                       %r%[%w%9%r%]%w% Enable Maintenance
echo. 
echo.                                                                       %r%[%w%10%r%]%w% Enable Printing and Maps Services
echo.  
echo.                                                                       %r%[%w%11%r%]%w% Reinstall Edge
echo.
echo.                                                                       %r%[%w%12%r%]%w% Enable Windows Updates
echo.
echo.                                                                       %r%[%w%13%r%]%w% Enable Windows Smart Screen
echo.
echo.                                                                       %r%[%w%14%r%]%w% Enable Diagnostics
echo. 
echo.                                                                       %r%[%w%15%r%]%w% Enable Error Reporting
echo.
echo.                                                                       %r%[%w%16%r%]%w% Revert all power tweaks
echo.
echo.                                                                                                                       
echo.                                                                            %r%[%w%M%r%]%w% Back to menu                                         
echo.                                                                              
echo.                                             %p%"══════════════════════════════════════════════════════════════════════════════════════════════"
echo.                                                       %W% Allows you to revert a bunch of settings, without having to use a restore point
echo.                                                      %W% If you want any specific reverts, tell me in my discord server and ill add them
echo.                                             %p%"══════════════════════════════════════════════════════════════════════════════════════════════"
echo.
set /p input=:
if /i %input% == 1 goto r1
if /i %input% == 2 goto r2
if /i %input% == 3 goto r3
if /i %input% == 4 goto r4
if /i %input% == 5 goto r5
if /i %input% == 6 goto r6
if /i %input% == 7 goto r7
if /i %input% == 8 goto r8
if /i %input% == 9 goto r9
if /i %input% == 10 goto r10
if /i %input% == 11 goto r11
if /i %input% == 12 goto w6
if /i %input% == 13 goto r13
if /i %input% == 14 goto r14
if /i %input% == 15 goto r15
if /i %input% == 16 goto r16
if /i %input% == M cls & goto menu

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu


:RedirectMenu
cls
goto :e

:r16
echo %w% - Enabling Energy Logging + Power Telemetry%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "DisablingTaggedEnergyLogging" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "TelemetryMaxApplication" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "TelemetryMaxTagPerApplication" /t REG_DWORD /d "1" /f 

echo %w%- Enabling Link State Power Managment %p%
FOR /F "eol=E" %%a in ('REG QUERY "HKLM\System\CurrentControlSet\Services" /s "EnablingHIPM"^| FINDSTR /V "EnablingHIPM"') DO (
echo %w%- Enabling HIPM %p%
Reg.exe add "%%a" /v "EnablingHIPM" /t REG_DWORD /d "1" /f  > nul 
echo %w%- Enabling DIPM %p%
Reg.exe add "%%a" /v "EnablingDIPM" /t REG_DWORD /d "1" /f > nul 
echo %w%- Enabling HDD Parking %p%
Reg.exe add "%%a" /v "EnablingHDDParking" /t REG_DWORD /d "1" /f > nul 
FOR /F "tokens=*" %%z IN ("%%a") DO (
SET STR=%%z
SET STR=!STR:HKLM\System\CurrentControlSet\Services\=!
) > nul 
)
	
echo %w% - Enabling GPU Energy Driver%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDrv" /v "Start" /t REG_DWORD /d "4" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDr" /v "Start" /t REG_DWORD /d "4" /f 

echo %w% - Enabling CoalescingTimerInterval%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "CoalescingTimerInterval" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "CoalescingTimerInterval" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "CoalescingTimerInterval" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "CoalescingTimerInterval" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\ModernSleep" /v "CoalescingTimerInterval" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "1" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "PlatformAoAcOverride" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EnergyEstimationEnablingd" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EventProcessorEnablingd" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CsEnablingd" /t REG_DWORD /d "1" /f  

echo %w% - Enabling Power Throttling%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "0" /f 
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :E

echo %w% - Enabling Error Reporting  %p%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "DoReport" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disablingd" /t REG_DWORD /d "0" /f 
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :e

:r14
echo %w% - Enabling Diagnostics %p%
sc config DPS start= auto
sc config DiagTrack start= demand 
sc config dmwappushservice start= demand 
sc config diagnosticshub.standardcollector.service start= demand 
schtasks /change /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /Enabling
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Enabling
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /Enabling
schtasks /change /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Enabling
Reg.exe add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnablingd" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ShowedToastAtLevel" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_CURRENT_USER\Software\Microsoft\Input\TIPC" /v "Enablingd" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_CURRENT_USER\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Diagnostics\Performance" /v "DisablingDiagnosticTracing" /t REG_DWORD /d "0" /f >nul 2>&1 
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" /v "ScenarioExecutionEnablingd" /t REG_DWORD /d "1" /f
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :e

:r13
echo %w% - Enabling Windows Smart Screen  %p%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnablingSmartScreen" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnablingd" /t REG_SZ /d "On" /f 
Reg.exe add "HKU\!USER_SID!\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "EnablingWebContentEvaluation" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /v "DontReportInfectionInformation" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\SmartScreen" /v "ConfigureAppInstallControlEnabled" /t REG_DWORD /d "1" /f
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :e


:r11
chcp 437 > nul
echo %w%- Revert Edge through official installer %p%
PowerShell -ExecutionPolicy Unrestricted -Command "reg delete 'HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdateDev' /v 'AllowUninstall' /f 2>$null"
:: Revert the placeholder file at "%SYSTEMROOT%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\MicrosoftEdge.exe".
PowerShell -ExecutionPolicy Unrestricted -Command "$filePath = '%SYSTEMROOT%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\MicrosoftEdge.exe'; $expandedFilePath = [System.Environment]::ExpandEnvironmentVariables($filePath); $placeholderText = 'privacy.sexy placeholder'; Write-Output "^""Attempting to Revert placeholder file at `"^""$expandedFilePath`"^""."^""; if (-Not (Test-Path $expandedFilePath -PathType Leaf)) { Write-Host "^""Skipping file removal as `"^""$expandedFilePath`"^"" does not exist, no action needed."^""; Exit 0; }; $currentContent = Get-Content $expandedFilePath -ErrorAction SilentlyContinue; if ($currentContent -ne $placeholderText) { Write-Output "^""Skipping removal as the file at `"^""$expandedFilePath`"^"" was not created by privacy.sexy."^""; Exit 0; }; Write-Output "^""File contents match the placeholder content. Proceeding to Revert the file."^""; try { Revert-Item -Path $expandedFilePath -Force -ErrorAction Stop; Write-Host "^""Successfully Revertd the placeholder file at `"^""$expandedFilePath`"^""."^""; } catch { Write-Error "^""Failed to delete the placeholder file at `"^""$expandedFilePath`"^"": $_"^""; Exit 1; }"
:: Download and run the official uninstaller
PowerShell -ExecutionPolicy Unrestricted -Command "$edgeExePath = Get-ChildItem -Path "^""$($env:ProgramFiles)*\Microsoft\Edge\Application"^"" -Filter 'msedge.exe' -Recurse; if ($edgeExePath) { Write-Host 'Microsoft Edge is already installed. Skipping reinstallation.'; Exit 0; }; Write-Host 'Downloading Microsoft Edge...'; $edgeInstallerUrl = 'https://c2rsetup.officeapps.live.com/c2r/downloadEdge.aspx?platform=Default&Channel=Stable&language=en'; $downloadPath = "^""$($env:TEMP)\MicrosoftEdgeSetup.exe"^""; Invoke-WebRequest -Uri "^""$edgeInstallerUrl"^"" -OutFile "^""$downloadPath"^""; $installerArguments = @('/install', '/silent'); Write-Host 'Installing Microsoft Edge...'; $process = Start-Process -FilePath "^""$downloadPath"^"" -ArgumentList "^""$installerArguments"^"" -Wait -PassThru; Revert-Item -Path $downloadPath -Force; if ($process.ExitCode -eq 0) { Write-Host 'Successfully reinstalled Microsoft Edge.'; } else { Write-Error "^""Failed to reinstall Microsoft Edge. Installer failed with exit code $($process.ExitCode)."^""; }"


echo %w%- Revert Edge shortcuts %p%
PowerShell -ExecutionPolicy Unrestricted -Command "$targetFilePath = "^""%PROGRAMFILES(X86)%\Microsoft\Edge\Application\msedge.exe"^""; $expandedTargetFilePath = [System.Environment]::ExpandEnvironmentVariables($targetFilePath); $shortcuts = @(; @{ Revert = $True;  Path = "^""$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk"^""; }; @{ Revert = $True;  Path = "^""$env:AppData\Microsoft\Internet Explorer\Quick Launch\Microsoft Edge.lnk"^""; }; @{ Revert = $True;  Path = "^""$env:AppData\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Microsoft Edge.lnk"^""; }; @{ Revert = $True;  Path = "^""$env:Public\Desktop\Microsoft Edge.lnk"^""; }; @{ Revert = $True;  Path = "^""$env:SystemRoot\System32\config\systemprofile\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\Microsoft Edge.lnk"^""; }; @{ Revert = $False; Path = "^""$env:UserProfile\Desktop\Microsoft Edge.lnk"^""; }; ); if (-Not (Test-Path $expandedTargetFilePath)) { Write-Warning "^""Target file `"^""$expandedTargetFilePath`"^"" does not exist."^""; }; $wscriptShell = $null; try { $wscriptShell = New-Object -ComObject WScript.Shell; } catch { throw "^""Failed to create WScript.Shell object: $($_.Exception.Message)"^""; }; foreach ($shortcut in $shortcuts) { if (-Not $shortcut.Revert) { Write-Host "^""Skipping, revert operation is not needed for: `"^""$($shortcut.Path)`"^""."^""; continue; }; if (Test-Path $shortcut.Path) { Write-Host "^""Shortcut already exists, skipping: `"^""$($shortcut.Path)`"^""."^""; continue; }; try { $shellShortcut = $wscriptShell.CreateShortcut($shortcut.Path); $shellShortcut.TargetPath = $expandedTargetFilePath; $shellShortcut.Save(); Write-Output "^""Successfully created shortcut at `"^""$($shortcut.Path)`"^""."^""; } catch { Write-Error "^""An error occurred while creating the shortcut at `"^""$($shortcut.Path)`"^""."^""; }; }"

eecho %w%- Revert Edge application selection associations %p%
:: Restore toast association for "MSEdgeHTM" for .webp
:: Restore the registry value "MSEdgeHTM_.webp" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-20H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $data = '0'; $rawType = 'REG_DWORD'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $value = 'MSEdgeHTM_.webp'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore toast association for "MSEdgeHTM" for .xml
:: Restore the registry value "MSEdgeHTM_.xml" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $data = '0'; $rawType = 'REG_DWORD'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $value = 'MSEdgeHTM_.xml'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore toast association for "MSEdgeHTM" for http
:: Restore the registry value "MSEdgeHTM_http" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $data = '0'; $rawType = 'REG_DWORD'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $value = 'MSEdgeHTM_http'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore toast association for "MSEdgeHTM" for https
:: Restore the registry value "MSEdgeHTM_https" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $data = '0'; $rawType = 'REG_DWORD'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $value = 'MSEdgeHTM_https'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore toast association for "MSEdgeHTM" for .htm
:: Restore the registry value "MSEdgeHTM_.htm" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $data = '0'; $rawType = 'REG_DWORD'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $value = 'MSEdgeHTM_.htm'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore toast association for "MSEdgeHTM" for .html
:: Restore the registry value "MSEdgeHTM_.html" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $data = '0'; $rawType = 'REG_DWORD'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $value = 'MSEdgeHTM_.html'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore toast association for "MSEdgePDF" for .pdf
:: Restore the registry value "MSEdgePDF_.pdf" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $data = '0'; $rawType = 'REG_DWORD'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $value = 'MSEdgePDF_.pdf'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore toast association for "MSEdgeHTM" for .svg
:: Restore the registry value "MSEdgeHTM_.svg" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $data = '0'; $rawType = 'REG_DWORD'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $value = 'MSEdgeHTM_.svg'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore toast association for "MSEdgeHTM" for mailto
:: Restore the registry value "MSEdgeHTM_mailto" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $data = '0'; $rawType = 'REG_DWORD'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $value = 'MSEdgeHTM_mailto'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore toast association for "MSEdgeHTM" for read
:: Restore the registry value "MSEdgeHTM_read" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy.sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $data = '0'; $rawType = 'REG_DWORD'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $value = 'MSEdgeHTM_read'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore toast association for "MSEdgeHTM" for .mht
:: Restore the registry value "MSEdgeHTM_.mht" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy.sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $data = '0'; $rawType = 'REG_DWORD'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $value = 'MSEdgeHTM_.mht'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore toast association for "MSEdgeMHT" for .mht
:: Restore the registry value "MSEdgeMHT_.mht" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $data = '0'; $rawType = 'REG_DWORD'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $value = 'MSEdgeMHT_.mht'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore toast association for "MSEdgeHTM" for .mhtml
:: Restore the registry value "MSEdgeHTM_.mhtml" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy.sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $data = '0'; $rawType = 'REG_DWORD'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $value = 'MSEdgeHTM_.mhtml'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore toast association for "MSEdgeMHT" for .mhtml
:: Restore the registry value "MSEdgeMHT_.mhtml" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $data = '0'; $rawType = 'REG_DWORD'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $value = 'MSEdgeMHT_.mhtml'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore toast association for "MSEdgeHTM" for microsoft-edge
:: Restore the registry value "MSEdgeHTM_microsoft-edge" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy.sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $data = '0'; $rawType = 'REG_DWORD'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $value = 'MSEdgeHTM_microsoft-edge'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore toast association for "MSEdgeHTM" for microsoft-edge
:: Restore the registry value "MSEdgeHTM_microsoft-edge" in key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$versionName = 'Windows11-21H2'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy.sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $data = '0'; $rawType = 'REG_DWORD'; $rawPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $value = 'MSEdgeHTM_microsoft-edge'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore toast association for "MSEdgeHTM" for .xht
:: Restore the registry value "MSEdgeHTM_.xht" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $data = '0'; $rawType = 'REG_DWORD'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $value = 'MSEdgeHTM_.xht'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore toast association for "MSEdgeHTM" for .xhtml
:: Restore the registry value "MSEdgeHTM_.xhtml" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $data = '0'; $rawType = 'REG_DWORD'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $value = 'MSEdgeHTM_.xhtml'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore toast association for "MSEdgeHTM" for ftp
:: Restore the registry value "MSEdgeHTM_ftp" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $data = '0'; $rawType = 'REG_DWORD'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts'; $value = 'MSEdgeHTM_ftp'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"


echo %w%- Revert Edge Open With associations %p%
:: Restore Open With association for "{{ progId }}" for .htm
:: Restore the registry value "MSEdgeHTM" in key "HKLM\Software\Classes\.htm\OpenWithProgids" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $data = '[string]::Empty'; $data = $(Invoke-Expression $data); $rawType = 'REG_SZ'; $rawPath = 'HKLM\Software\Classes\.htm\OpenWithProgids'; $value = 'MSEdgeHTM'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore Open With association for "{{ progId }}" for .html
:: Restore the registry value "MSEdgeHTM" in key "HKLM\Software\Classes\.html\OpenWithProgids" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $data = '[string]::Empty'; $data = $(Invoke-Expression $data); $rawType = 'REG_SZ'; $rawPath = 'HKLM\Software\Classes\.html\OpenWithProgids'; $value = 'MSEdgeHTM'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore Open With association for "{{ progId }}" for .mht
:: Restore the registry value "MSEdgeMHT" in key "HKLM\Software\Classes\.mht\OpenWithProgids" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $data = '[string]::Empty'; $data = $(Invoke-Expression $data); $rawType = 'REG_SZ'; $rawPath = 'HKLM\Software\Classes\.mht\OpenWithProgids'; $value = 'MSEdgeMHT'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore Open With association for "{{ progId }}" for .mhtml
:: Restore the registry value "MSEdgeMHT" in key "HKLM\Software\Classes\.mhtml\OpenWithProgids" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $data = '[string]::Empty'; $data = $(Invoke-Expression $data); $rawType = 'REG_SZ'; $rawPath = 'HKLM\Software\Classes\.mhtml\OpenWithProgids'; $value = 'MSEdgeMHT'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore Open With association for "{{ progId }}" for .pdf
:: Restore the registry value "MSEdgePDF" in key "HKLM\Software\Classes\.pdf\OpenWithProgids" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $data = '[string]::Empty'; $data = $(Invoke-Expression $data); $rawType = 'REG_SZ'; $rawPath = 'HKLM\Software\Classes\.pdf\OpenWithProgids'; $value = 'MSEdgePDF'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore Open With association for "{{ progId }}" for .shtml
:: Restore the registry value "MSEdgeHTM" in key "HKLM\Software\Classes\.shtml\OpenWithProgids" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $data = '[string]::Empty'; $data = $(Invoke-Expression $data); $rawType = 'REG_SZ'; $rawPath = 'HKLM\Software\Classes\.shtml\OpenWithProgids'; $value = 'MSEdgeHTM'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore Open With association for "{{ progId }}" for .svg
:: Restore the registry value "MSEdgeHTM" in key "HKLM\Software\Classes\.svg\OpenWithProgids" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $data = '[string]::Empty'; $data = $(Invoke-Expression $data); $rawType = 'REG_SZ'; $rawPath = 'HKLM\Software\Classes\.svg\OpenWithProgids'; $value = 'MSEdgeHTM'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore Open With association for "{{ progId }}" for .webp
:: Restore the registry value "MSEdgeHTM" in key "HKLM\Software\Classes\.webp\OpenWithProgids" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $data = '[string]::Empty'; $data = $(Invoke-Expression $data); $rawType = 'REG_SZ'; $rawPath = 'HKLM\Software\Classes\.webp\OpenWithProgids'; $value = 'MSEdgeHTM'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore Open With association for "{{ progId }}" for .xht
:: Restore the registry value "MSEdgeHTM" in key "HKLM\Software\Classes\.xht\OpenWithProgids" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $data = '[string]::Empty'; $data = $(Invoke-Expression $data); $rawType = 'REG_SZ'; $rawPath = 'HKLM\Software\Classes\.xht\OpenWithProgids'; $value = 'MSEdgeHTM'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore Open With association for "{{ progId }}" for .xhtml
:: Restore the registry value "MSEdgeHTM" in key "HKLM\Software\Classes\.xhtml\OpenWithProgids" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $data = '[string]::Empty'; $data = $(Invoke-Expression $data); $rawType = 'REG_SZ'; $rawPath = 'HKLM\Software\Classes\.xhtml\OpenWithProgids'; $value = 'MSEdgeHTM'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"
:: Restore Open With association for "{{ progId }}" for .xml
:: Restore the registry value "MSEdgeHTM" in key "HKLM\Software\Classes\.xml\OpenWithProgids" to its original value 
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-1909'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $data = '[string]::Empty'; $data = $(Invoke-Expression $data); $rawType = 'REG_SZ'; $rawPath = 'HKLM\Software\Classes\.xml\OpenWithProgids'; $value = 'MSEdgeHTM'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; }"


echo %w%- Revert Edge user associations %p%
:: Restore user-chosen file association for "MSEdgeHTM" for .htm files
:: Restore the registry value "ProgId" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.htm\UserChoice" to its original value (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-20H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.htm\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RevertdRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RevertdRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RevertAccessRule($denyRule)) { $AclChanges.RevertdRules += $denyRule; } else { Write-Warning 'Failed to Revert the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RevertAccessRule($rule)) { Write-Warning 'Failed to Revert the rule.'; }; }; foreach ($rule in $AclChanges.RevertdRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $data = 'MSEdgeHTM'; $rawType = 'REG_SZ'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.htm\UserChoice'; $value = 'ProgId'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; Grant-Permissions; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Restore user-chosen file association for "MSEdgeHTM" for .html files
:: Restore the registry value "ProgId" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.html\UserChoice" to its original value (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-20H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.html\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RevertdRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RevertdRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RevertAccessRule($denyRule)) { $AclChanges.RevertdRules += $denyRule; } else { Write-Warning 'Failed to Revert the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RevertAccessRule($rule)) { Write-Warning 'Failed to Revert the rule.'; }; }; foreach ($rule in $AclChanges.RevertdRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $data = 'MSEdgeHTM'; $rawType = 'REG_SZ'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.html\UserChoice'; $value = 'ProgId'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; Grant-Permissions; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Restore user-chosen file association for "MSEdgePDF" for .pdf files
:: Restore user-chosen file association for "MSEdgeHTM" for .svg files
:: Restore the registry value "ProgId" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.svg\UserChoice" to its original value (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-20H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.svg\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RevertdRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RevertdRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RevertAccessRule($denyRule)) { $AclChanges.RevertdRules += $denyRule; } else { Write-Warning 'Failed to Revert the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RevertAccessRule($rule)) { Write-Warning 'Failed to Revert the rule.'; }; }; foreach ($rule in $AclChanges.RevertdRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $data = 'MSEdgeHTM'; $rawType = 'REG_SZ'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.svg\UserChoice'; $value = 'ProgId'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; Grant-Permissions; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Restore user-chosen file association for "MSEdgeHTM" for .mht files
:: Restore the registry value "ProgId" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mht\UserChoice" to its original value (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy.sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mht\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RevertdRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RevertdRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RevertAccessRule($denyRule)) { $AclChanges.RevertdRules += $denyRule; } else { Write-Warning 'Failed to Revert the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RevertAccessRule($rule)) { Write-Warning 'Failed to Revert the rule.'; }; }; foreach ($rule in $AclChanges.RevertdRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $data = 'MSEdgeHTM'; $rawType = 'REG_SZ'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mht\UserChoice'; $value = 'ProgId'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; Grant-Permissions; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Restore user-chosen file association for "MSEdgeMHT" for .mht files
:: Restore the registry value "ProgId" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mht\UserChoice" to its original value (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mht\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RevertdRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RevertdRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RevertAccessRule($denyRule)) { $AclChanges.RevertdRules += $denyRule; } else { Write-Warning 'Failed to Revert the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RevertAccessRule($rule)) { Write-Warning 'Failed to Revert the rule.'; }; }; foreach ($rule in $AclChanges.RevertdRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $data = 'MSEdgeMHT'; $rawType = 'REG_SZ'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mht\UserChoice'; $value = 'ProgId'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; Grant-Permissions; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Restore user-chosen file association for "MSEdgeHTM" for .mhtml files
:: Restore the registry value "ProgId" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mhtml\UserChoice" to its original value (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy.sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mhtml\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RevertdRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RevertdRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RevertAccessRule($denyRule)) { $AclChanges.RevertdRules += $denyRule; } else { Write-Warning 'Failed to Revert the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RevertAccessRule($rule)) { Write-Warning 'Failed to Revert the rule.'; }; }; foreach ($rule in $AclChanges.RevertdRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $data = 'MSEdgeHTM'; $rawType = 'REG_SZ'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mhtml\UserChoice'; $value = 'ProgId'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; Grant-Permissions; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Restore user-chosen file association for "MSEdgeMHT" for .mhtml files
:: Restore the registry value "ProgId" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mhtml\UserChoice" to its original value (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mhtml\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RevertdRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RevertdRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RevertAccessRule($denyRule)) { $AclChanges.RevertdRules += $denyRule; } else { Write-Warning 'Failed to Revert the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RevertAccessRule($rule)) { Write-Warning 'Failed to Revert the rule.'; }; }; foreach ($rule in $AclChanges.RevertdRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $data = 'MSEdgeMHT'; $rawType = 'REG_SZ'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mhtml\UserChoice'; $value = 'ProgId'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; Grant-Permissions; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Restore user-chosen file association for "MSEdgeHTM" for .xml files
:: Restore the registry value "ProgId" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.xml\UserChoice" to its original value (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-22H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$versionName = 'Windows10-22H2'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy.sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.xml\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RevertdRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RevertdRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RevertAccessRule($denyRule)) { $AclChanges.RevertdRules += $denyRule; } else { Write-Warning 'Failed to Revert the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RevertAccessRule($rule)) { Write-Warning 'Failed to Revert the rule.'; }; }; foreach ($rule in $AclChanges.RevertdRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $data = 'MSEdgeHTM'; $rawType = 'REG_SZ'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.xml\UserChoice'; $value = 'ProgId'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; Grant-Permissions; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Restore user-chosen file association for "MSEdgeHTM" for .xht files
:: Restore the registry value "ProgId" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.xht\UserChoice" to its original value (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.xht\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RevertdRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RevertdRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RevertAccessRule($denyRule)) { $AclChanges.RevertdRules += $denyRule; } else { Write-Warning 'Failed to Revert the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RevertAccessRule($rule)) { Write-Warning 'Failed to Revert the rule.'; }; }; foreach ($rule in $AclChanges.RevertdRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $data = 'MSEdgeHTM'; $rawType = 'REG_SZ'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.xht\UserChoice'; $value = 'ProgId'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; Grant-Permissions; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"
:: Restore user-chosen file association for "MSEdgeHTM" for .xhtml files
:: Restore the registry value "ProgId" in key "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.xhtml\UserChoice" to its original value (with additional permissions)
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-21H2'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy.sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $version = [Environment]::OSVersion.Version; $versionNoPatch = [System.Version]::new($version.Major, $version.Minor, $version.Build); if ($versionNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($versionNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }$RawRegistryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.xhtml\UserChoice'; $AclChanges = [PSCustomObject]@{ PreviousOwner = $null; RevertdRules = @(); AddedRules = @(); InheritanceDisabled = $false; }; function Test-AccessModified { return $AclChanges.PreviousOwner -Or $AclChanges.RevertdRules.Count -gt 0 -Or $AclChanges.AddedRules.Count  -gt 0 -Or $AclChanges.InheritanceDisabled; }; function Open-RegistryKey { param ([Parameter(Mandatory=$true)][int]$Rights); <# [OutputType([Microsoft.Win32.RegistryKey])] # Not working through cmd.exe #>; $hive = $RawRegistryPath.Split('\')[0]; $pathWithoutHive = $RawRegistryPath.Substring($hive.Length + 1); try { $rootKey = switch ($hive) { 'HKCU' { [Microsoft.Win32.Registry]::CurrentUser }; 'HKLM' { [Microsoft.Win32.Registry]::LocalMachine }; default { Write-Error "^""Internal error: Unknown registry hive ($hive)."^""; Exit 1; }; }; $key = $rootKey.OpenSubKey( $pathWithoutHive, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, $Rights ); } catch { throw "^""Error when opening '$pathWithoutHive' on '$hive' hive: $_"^""; }; if (-Not $key) { throw "^""Unknown error when opening '$pathWithoutHive' on '$hive' hive."^""; }; return $key; }; function Grant-Permissions { Write-Host "^""Granting permissions to '$RawRegistryPath' registry key."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::TakeOwnership); $acl = $subkey.GetAccessControl(); $owner = $acl.GetOwner([System.Security.Principal.NTAccount]); if ($owner -eq $adminAccount) { $subkey.Close(); } else { $AclChanges.PreviousOwner = $owner; $acl.SetOwner($adminAccount); $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host "^""Successfully took ownership from '$($owner.Value)'."^""; }; } catch { Write-Warning "^""Failed to take ownership. Error: $($_.Exception.Message)"^""; }; try { $subkey = Open-RegistryKey -Rights ([System.Security.AccessControl.RegistryRights]::ChangePermissions); $acl = $subkey.GetAccessControl(); $adminFullControlExists = $acl.Access | Where-Object { $_.IdentityReference -eq $adminAccount -and $_.RegistryRights -eq [System.Security.AccessControl.RegistryRights]::FullControl -and $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow }; if (-Not $adminFullControlExists) { Write-Host 'Granting full control to administrators.'; $fullControlRule = New-Object System.Security.AccessControl.RegistryAccessRule( $adminAccount, [System.Security.AccessControl.RegistryRights]::FullControl, [System.Security.AccessControl.AccessControlType]::Allow ); $acl.AddAccessRule($fullControlRule); $AclChanges.AddedRules += $fullControlRule; }; if ($acl.AreAccessRulesProtected) { $acl.SetAccessRuleProtection($false, $false); $AclChanges.InheritanceDisabled = $true; }; $denyRules = @($acl.Access.Where({ $_.AccessControlType -eq 'Deny' })); foreach ($denyRule in $denyRules) { Write-Host "^""Removing a deny rule for '$($denyRule.IdentityReference)'."^""; if ($acl.RevertAccessRule($denyRule)) { $AclChanges.RevertdRules += $denyRule; } else { Write-Warning 'Failed to Revert the rule.'; }; }; if (-Not (Test-AccessModified)) { Write-Host 'No access modifications were necessary.'; $subkey.Close(); } else { $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully applied new access rules.'; }; } catch { Write-Warning "^""Failed to modify access. Error: $($_.Exception.Message)"^""; }; }; function Revoke-Permissions { Write-Host "^""Restoring permissions: '$RawRegistryPath'."^""; if (-Not (Test-AccessModified)) { Write-Host 'Skipping revoking permissions, they were not granted.'; return; } else { try { $subkey = Open-RegistryKey -Rights ( [System.Security.AccessControl.RegistryRights]::TakeOwnership -bor [System.Security.AccessControl.RegistryRights]::ChangePermissions ); $acl = $subkey.GetAccessControl(); if ($AclChanges.PreviousOwner) { Write-Host 'Restoring owner.'; $acl.SetOwner($AclChanges.PreviousOwner); }; foreach ($rule in $AclChanges.AddedRules) { Write-Host "^""Removing rule for '$($rule.IdentityReference)'."^""; if (-Not $acl.RevertAccessRule($rule)) { Write-Warning 'Failed to Revert the rule.'; }; }; foreach ($rule in $AclChanges.RevertdRules) { $acl.AddAccessRule($rule); Write-Host "^""Adding a rule for '$($rule.IdentityReference)'."^""; }; if ($AclChanges.InheritanceDisabled) { $acl.SetAccessRuleProtection($true, $true); Write-Host 'Restoring inheritance.'; }; $subkey.SetAccessControl($acl); $subkey.Close(); Write-Host 'Successfully restored permissions.'; } catch { Write-Warning "^""Failed to restore permissions. Error: $($_.Exception.Message)"^""; }; }; }; $data = 'MSEdgeHTM'; $rawType = 'REG_SZ'; $rawPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.xhtml\UserChoice'; $value = 'ProgId'; $hive = $rawPath.Split('\')[0]; $path = "^""$($hive):$($rawPath.Substring($hive.Length))"^""; Write-Host "^""Restoring value '$value' at '$path' with type '$rawType' and value '$data'."^""; if (-Not $rawType) { throw "^""Internal privacy.sexy error: Data type is not provided for data '$data'."^""; }; if (-Not (Test-Path -LiteralPath $path)) { try { New-Item -Path $path -Force -ErrorAction Stop | Out-Null; Write-Host 'Successfully created registry key.'; } catch { throw "^""Failed to create registry key: $($_.Exception.Message)"^""; }; }; $currentData = Get-ItemProperty -LiteralPath $path -Name $value -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $value; if ($currentData -eq $data) { Write-Host 'Skipping, no changes required, the registry data is already as expected.'; Exit 0; }; Grant-Permissions; try { $type = switch ($rawType) { 'REG_SZ' { 'String' }; 'REG_DWORD' { 'DWord' }; 'REG_QWORD' { 'QWord' }; 'REG_EXPAND_SZ' { 'ExpandString' }; default { throw "^""Internal privacy.sexy error: Failed to find data type for: '$rawType'."^""; }; }; Set-ItemProperty -LiteralPath $path -Name $value -Value $data -Type $type -Force -ErrorAction Stop; Write-Host 'Successfully restored the registry value.'; } catch { throw "^""Failed to restore the value: $($_.Exception.Message)"^""; } finally { Revoke-Permissions }"


::**MICROSOFT EDGE FIX**

::1. Open powershell as admin
::2. Paste the command below in:
::Start-Process -FilePath winget -ArgumentList "install --force  --accept-source-agreements --accept-package-agreements --silent Microsoft.Edge " -NoNewWindow


start https://discord.com/channels/1177410668606009444/1178430446590238860/1288889764304654440

chcp 65001 > nul

echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :e

:r10
echo %w% - Enabling Printing and maps Services  %p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Spooler" /v "Start" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\PrintNotify" /v "Start" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MapsBroker" /v "Start" /t REG_DWORD /d "2" /f
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :e

:r9
echo %w% - Enabling Maintenance %p%
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisablingd" /t REG_DWORD /d "0" /f 
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :e

:r8
echo %w% - Enabling Power Throttling%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "0" /f 

echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :e

:r7
echo %w% - Enabling Fast Startup%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnablingd" /t REG_DWORD /d "1" /f 
timeout /t 1 /nobreak > NUL

echo %w% - Enabling Hibernation%p%
powercfg /h off
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnablingd" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "SleepReliabilityDetailedDiagnostics" /t REG_DWORD /d "1" /f 
timeout /t 1 /nobreak > NUL

echo %w% - Enabling Study%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "SleepStudyDisablingd" /t REG_DWORD /d "0" /f 

echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :e

:r6
echo %w% - Enabling Bluetooth%p%
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\BTAGService" /v "Start" /t REG_DWORD /d "2" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bthserv" /v "Start" /t REG_DWORD /d "2" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\BthAvctpSvc" /v "Start" /t REG_DWORD /d "2" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\BluetoothUserService" /v "Start" /t REG_DWORD /d "2" /f
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :e

:r5
cls
echo %w% - Enabling Notifications%p%
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnablingd" /t REG_DWORD /d "1" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_NOTIFICATION_SOUND" /t REG_DWORD /d "1" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_CRITICAL_TOASTS_ABOVE_LOCK" /t REG_DWORD /d "1" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\QuietHours" /v "Enablingd" /t REG_DWORD /d "1" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\windows.immersivecontrolpanel_cw5n1h2txyewy!microsoft.windows.immersivecontrolpanel" /v "Enablingd" /t REG_DWORD /d "1" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.AutoPlay" /v "Enablingd" /t REG_DWORD /d "1" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.LowDisk" /v "Enablingd" /t REG_DWORD /d "1" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Print.Notification" /v "Enablingd" /t REG_DWORD /d "1" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v "Enablingd" /t REG_DWORD /d "1" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.WiFiNetworkManager" /v "Enablingd" /t REG_DWORD /d "1" /f 
Reg.exe add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisablingNotificationCenter" /t REG_DWORD /d "0" /f
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto menu

:r4
echo %w% - Enabling Gamedvr Services%p%
Reg.exe add "HKCU\Software\Microsoft\GameBar" /v "UseNexusForGameBarEnablingd" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\GameBar" /v "GameDVR_Enablingd" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnablingd" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AudioCaptureEnablingd" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "CursorCaptureEnablingd" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "HistoricalCaptureEnablingd" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_Enablingd" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\GameDVR" /v "AllowgameDVR" /t REG_DWORD /d "1" /f
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto menu

:r3
echo %w% - Enabling Xbox Services%p%
sc config xbgm start= demand
sc config XblAuthManager start= demand
sc config XblGameSave start= demand
sc config XboxGipSvc start= demand
sc config XboxNetApiSvc start= demand
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto menu

:r2
echo %w% - Redownload default windows apps%p%
chcp 437 > nul
Powershell -Command "Get-AppxPackage -allusers | foreach {Add-AppxPackage -register “$($_.InstallLocation)\appxmanifest.xml” -DisablingDevelopmentMode}"
chcp 65001 > nul

echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto menu

:r1
echo %w% - Resetting power plans%p%
powercfg –restoredefaultschemes
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto menu



:exit
cls
echo.
echo.
chcp 437 >nul 2>&1
powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('! Make sure to restart your pc after using, so the tweaks properly apply !, thanks for using the OT SERVICES OPTIMIZER. Press "ok" to exit', 'OT SERVICES OPTIMIZER', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
timeout /t 1 /nobreak > nul
chcp 65001 >nul 2>&1
pause > nul
cls
exit





:8war
chcp 437 >nul 2>&1
powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Do NOT do these if your pc has bad overheating issues', 'OT SERVICES OPTIMIZER', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
timeout /t 1 /nobreak > nul
chcp 65001 >nul 2>&1

:8
:cpu
cls
echo.
echo.
echo.                                                                  %r% ░█████╗░██████╗░██╗░░░██╗          
echo.                                                                  %r% ██╔══██╗██╔══██╗██║░░░██║       
echo.                                                                  %r% ██║░░╚═╝██████╔╝██║░░░██║         
echo.                                                                  %r% ██║░░██╗██╔═══╝░██║░░░██║        
echo.                                                                  %r% ╚█████╔╝██║░░░░░╚██████╔╝      
echo.                                                                  %r% ░╚════╝░╚═╝░░░░░░╚═════╝░        
echo.                                             %p%"════════════════════════════════════════════════════════════════════"%w%
echo.                                                                                                                                                                                                                       
echo.                                                           %r%[%w%1%r%]%w% Apply Optimizations for AMD CPUs          
echo.
echo.                                                           %r%[%w%2%r%]%w% Apply Optimizations for Intel CPUs                                             
echo.                                                                                           
echo.                                                                                             
echo.                                                                      %r%[%w%T%r%]%w% Open Task Manager                           
echo.                                                                                           
echo.                                                                      %r%[%w%M%r%]%w% Back to menu                                
echo.                                                                             
echo.                                             %p%"════════════════════════════════════════════════════════════════════" %w%
echo.                                                                 %w% Select Which type of cpu you have:   
echo.          
echo.                                                   Disablings power saving features, Disablings core parking and more!
echo.                                             %p%"════════════════════════════════════════════════════════════════════"
echo.

set /p input=:
if /i %input% == 1 goto cpu1
if /i %input% == 2 goto cpu2
if /i %input% == T start taskmgr & goto 8
if /i %input% == M cls & goto menu

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu

:RedirectMenu
cls
goto 	

:cpu1
cls
echo.  
echo.  
echo.
echo.                                                                  %r%░█████╗░███╗░░░███╗██████╗░  ░█████╗░██████╗░██╗░░░██╗
echo.                                                                  %r%██╔══██╗████╗░████║██╔══██╗  ██╔══██╗██╔══██╗██║░░░██║
echo.                                                                  %r%███████║██╔████╔██║██║░░██║  ██║░░╚═╝██████╔╝██║░░░██║
echo.                                                                  %r%██╔══██║██║╚██╔╝██║██║░░██║  ██║░░██╗██╔═══╝░██║░░░██║
echo.                                                                  %r%██║░░██║██║░╚═╝░██║██████╔╝  ╚█████╔╝██║░░░░░╚██████╔╝
echo.                                                                  %r%╚═╝░░╚═╝╚═╝░░░░░╚═╝╚═════╝░  ░╚════╝░╚═╝░░░░░░╚═════╝░
echo.
timeout 1 /nobreak > NUL
echo %w%- Disabling Core Parking  %p%
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet002\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet002\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add HKLM\SYSTEM\CurrentControlSet\Control\Power /v CoreParkingDisablingd /t REG_DWORD /d 0 /f
powercfg -setacvalueindex scheme_current sub_processor CPMINCORES 100
powercfg /setactive SCHEME_CURRENT

echo %w%- Disabling Distribute Timers%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DistributeTimers" /t REG_DWORD /d "1" /f

echo %w%- Disabling TSX%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisablingTsx" /t REG_DWORD /d "0" /f

echo %w%- Disabling Event Processor%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EventProcessorEnablingd" /t REG_DWORD /d "0" /f

echo %w%- CPU Cooling Tweaks %p%
powercfg /setACvalueindex scheme_current SUB_PROCESSOR SYSCOOLPOL 1
powercfg /setDCvalueindex scheme_current SUB_PROCESSOR SYSCOOLPOL 1
powercfg /setactive SCHEME_CURRENT

echo %w%- Enabling All Logical Processors %p%
bcdedit /set {current} numproc %NUMBER_OF_PROCESSORS% 

echo %w% - Disabling C-States%p%
powercfg -setacvalueindex scheme_current SUB_SLEEP AWAYMODE 0
powercfg /setactive SCHEME_CURRENT
powercfg -setacvalueindex scheme_current SUB_SLEEP ALLOWSTANDBY 0
powercfg /setactive SCHEME_CURRENT
powercfg -setacvalueindex scheme_current SUB_SLEEP HYBRIDSLEEP 0
powercfg /setactive SCHEME_CURRENT
powercfg -setacvalueindex scheme_current sub_processor PROCTHROTTLEMIN 100
powercfg /setactive SCHEME_CURRENT

echo %w%- Use Higher P-States on Lower C-States And Viseversa %p%
powercfg -setacvalueindex scheme_current sub_processor IDLESCALING 1
powercfg /setactive SCHEME_CURRENT


echo %w% - Disabling Throttle States%p%
powercfg -setacvalueindex scheme_current sub_processor THROTTLING 0
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "0" /f
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto menu

:cpu2
echo.
echo.
echo.
echo.                                                                  %r%██╗███╗░░██╗████████╗███████╗██╗░░░░░  ░█████╗░██████╗░██╗░░░██╗
echo.                                                                  %r%██║████╗░██║╚══██╔══╝██╔════╝██║░░░░░  ██╔══██╗██╔══██╗██║░░░██║
echo.                                                                  %r%██║██╔██╗██║░░░██║░░░█████╗░░██║░░░░░  ██║░░╚═╝██████╔╝██║░░░██║
echo.                                                                  %r%██║██║╚████║░░░██║░░░██╔══╝░░██║░░░░░  ██║░░██╗██╔═══╝░██║░░░██║
echo.                                                                  %r%██║██║░╚███║░░░██║░░░███████╗███████╗  ╚█████╔╝██║░░░░░╚██████╔╝
echo.                                                                  %r%╚═╝╚═╝░░╚══╝░░░╚═╝░░░╚══════╝╚══════╝  ░╚════╝░╚═╝░░░░░░╚═════╝░
echo.
timeout 1 /nobreak > NUL

echo %w%- Disabling Core Parking  %p%
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet002\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet002\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add HKLM\SYSTEM\CurrentControlSet\Control\Power /v CoreParkingDisablingd /t REG_DWORD /d 0 /f
powercfg -setacvalueindex scheme_current sub_processor CPMINCORES 100
powercfg /setactive SCHEME_CURRENT

echo %w%- Intel Specific Cpu tweaks %p%
bcdedit /set allowedinmemorysettings 0x0
bcdedit /set isolatedcontext No

echo %w%- Disabling Distribute Timers%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DistributeTimers" /t REG_DWORD /d "1" /f

echo %w%- Disabling TSX%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisablingTsx" /t REG_DWORD /d "0" /f

echo %w%- Disabling Event Processor%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EventProcessorEnablingd" /t REG_DWORD /d "0" /f

echo %w%- CPU Cooling Tweaks %p%
powercfg /setACvalueindex scheme_current SUB_PROCESSOR SYSCOOLPOL 1
powercfg /setDCvalueindex scheme_current SUB_PROCESSOR SYSCOOLPOL 1
powercfg /setactive SCHEME_CURRENT

echo %w%- Enabling All Logical Processors %p%
bcdedit /set {current} numproc %NUMBER_OF_PROCESSORS% 

echo %w% - Disabling C-States%p%
powercfg -setacvalueindex scheme_current SUB_SLEEP AWAYMODE 0
powercfg /setactive SCHEME_CURRENT
powercfg -setacvalueindex scheme_current SUB_SLEEP ALLOWSTANDBY 0
powercfg /setactive SCHEME_CURRENT
powercfg -setacvalueindex scheme_current SUB_SLEEP HYBRIDSLEEP 0
powercfg /setactive SCHEME_CURRENT
powercfg -setacvalueindex scheme_current sub_processor PROCTHROTTLEMIN 100
powercfg /setactive SCHEME_CURRENT
timeout /t 1 /nobreak > NUL

echo %w%- Use Higher P-States on Lower C-States And Viseversa %p%
powercfg -setacvalueindex scheme_current sub_processor IDLESCALING 1
powercfg /setactive SCHEME_CURRENT

echo %w% - Disabling Throttle States%p%
powercfg -setacvalueindex scheme_current sub_processor THROTTLING 0
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "0" /f
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto menu



:7
:gpu
cls
echo.
echo.
echo.                                                                %r%  ░██████╗░██████╗░██╗░░░██╗         
echo.                                                                %r%  ██╔════╝░██╔══██╗██║░░░██║        
echo.                                                                %r%  ██║░░██╗░██████╔╝██║░░░██         
echo.                                                                %r%  ██║░░╚██╗██╔═══╝░██║░░░██║        
echo.                                                                %r%  ╚██████╔╝██║░░░░░╚██████╔╝        
echo.                                                                %r%  ░╚═════╝░╚═╝░░░░░░╚═════╝░        
echo.                                             %p%"══════════════════════════════════════════════════════════════════"%w%  
echo.                                                                          
echo.                                                           %r%[%w%1%r%]%w% Apply NVIDIA GPU Optimizations                             
echo.                                                                                            
echo.                                                           %r%[%w%2%r%]%w% Apply AMD GPU Optimizations                                
echo.                                                                                          
echo.                                                           %r%[%w%3%r%]%w% Apply Intel GPU Optimizations                           
echo.                                                                     
echo.                      
echo.                                                                  %r%[%w%T%r%]%w% Open Task Manager                           
echo.                                                                                                                                                                                     
echo.                                                                  %r%[%w%M%r%]%w% Back to menu                                
echo.                                                                     
echo.                                             %p%"══════════════════════════════════════════════════════════════════"
echo.                                                             %w% Select which type of Gpu you have:  
echo. 
echo.                                                       %W%  Optimizes your GPU by tweaking 3d settings
echo.                                                       %W% Disabling power saving features and much more
echo.                                             %p%"══════════════════════════════════════════════════════════════════"
echo.
set /p input=:
if /i %input% == 1 goto g1
if /i %input% == 2 goto g2
if /i %input% == 3 goto g3
if /i %input% == T start taskmgr & goto 7
if /i %input% == M cls & goto menu

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu


:RedirectMenu
cls
goto :7


:g3
cls
echo.
echo.
echo.                                                       %r%   ██╗███╗░░██╗████████╗███████╗██╗░░░░░  ░██████╗░██████╗░██╗░░░██╗
echo.                                                       %r%   ██║████╗░██║╚══██╔══╝██╔════╝██║░░░░░  ██╔════╝░██╔══██╗██║░░░██║
echo.                                                       %r%   ██║██╔██╗██║░░░██║░░░█████╗░░██║░░░░░  ██║░░██╗░██████╔╝██║░░░██║
echo.                                                       %r%   ██║██║╚████║░░░██║░░░██╔══╝░░██║░░░░░  ██║░░╚██╗██╔═══╝░██║░░░██║
echo.                                                       %r%   ██║██║░╚███║░░░██║░░░███████╗███████╗  ╚██████╔╝██║░░░░░╚██████╔╝  
echo.                                                       %r%   ╚═╝╚═╝░░╚══╝░░░╚═╝░░░╚══════╝╚══════╝  ░╚═════╝░╚═╝░░░░░░╚═════╝░
echo.
echo.
echo %w% - Intel Gpu Tweaks%p%
for /f %%t in ('Reg query "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}" /t REG_SZ /s /e /f "Intel" ^| findstr "HKEY"') do (

	Reg.exe add "%%t" /v "Disabling_OverlayDSQualityEnhancement" /t REG_DWORD /d "1" /f
    Reg.exe add "%%t" /v "IncreaseFixedSegment" /t REG_DWORD /d "1" /f
    Reg.exe add "%%t" /v "AdaptiveVsyncEnabling" /t REG_DWORD /d "0" /f
    Reg.exe add "%%t" /v "DisablingPFonDP" /t REG_DWORD /d "1" /f
    Reg.exe add "%%t" /v "EnablingCompensationForDVI" /t REG_DWORD /d "1" /f
    Reg.exe add "%%t" /v "NoFastLinkTrainingForeDP" /t REG_DWORD /d "0" /f
    Reg.exe add "%%t" /v "ACPowerPolicyVersion" /t REG_DWORD /d "16898" /f
    Reg.exe add "%%t" /v "DCPowerPolicyVersion" /t REG_DWORD /d "16642" /f
)


Reg.exe add "HKLM\Software\Intel\GMM" /v "DedicatedSegmentSize" /t REG_DWORD /d "512" /f
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto menu




:1 
cls
echo.
echo.
echo.                                                       %r%   ░██████╗░███████╗███╗░░██╗███████╗██████╗░░█████╗░██╗░░░░░     
echo.                                                       %r%   ██╔════╝░██╔════╝████╗░██║██╔════╝██╔══██╗██╔══██╗██║░░░░░     
echo.                                                       %r%   ██║░░██╗░█████╗░░██╔██╗██║█████╗░░██████╔╝███████║██║░░░░░    
echo.                                                       %r%   ██║░░╚██╗██╔══╝░░██║╚████║██╔══╝░░██╔══██╗██╔══██║██║░░░░░      
echo.                                                       %r%   ╚██████╔╝███████╗██║░╚███║███████╗██║░░██║██║░░██║███████╗     
echo.                                                       %r%   ░╚═════╝░╚══════╝╚═╝░░╚══╝╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝    
echo.                                             %p%"═══════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                
echo.                                                        %r%[%w%1%r%]%w% Apply General Latency and Performance Optimizations 
echo.
echo.                        
echo.                                                                                          
echo.                                                                            %r%[%w%M%r%]%w% Back to menu                           
echo.
echo.                                             %p%"═══════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                        %W%Applies general optimizations in registry, bcd-edit and more!
echo.                                             %p%"═══════════════════════════════════════════════════════════════════════════════"%w%
echo. 
echo. 

set /p input=:
if /i %input% == 1 goto general
if /i %input% == M CLS & goto menu

) ELSE (
echo Invalid Input & goto MisspellRedirect 

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenue
:RedirectMenu
cls
goto :1

:general
CLS
echo.
echo.
echo.                                                       %r%   ░██████╗░███████╗███╗░░██╗███████╗██████╗░░█████╗░██╗░░░░░     
echo.                                                       %r%   ██╔════╝░██╔════╝████╗░██║██╔════╝██╔══██╗██╔══██╗██║░░░░░     
echo.                                                       %r%   ██║░░██╗░█████╗░░██╔██╗██║█████╗░░██████╔╝███████║██║░░░░░    
echo.                                                       %r%   ██║░░╚██╗██╔══╝░░██║╚████║██╔══╝░░██╔══██╗██╔══██║██║░░░░░      
echo.                                                       %r%   ╚██████╔╝███████╗██║░╚███║███████╗██║░░██║██║░░██║███████╗     
echo.                                                       %r%   ░╚═════╝░╚══════╝╚═╝░░╚══╝╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝    
echo.
echo.

::microsoft multimedia
echo %w% - Microsoft Mulitimedia Tweaks%p%
Reg.exe add "HKCU\SOFTWARE\Microsoft\Games" /v "FpsAll" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Games" /v "FpsStatusGames" /t REG_DWORD /d "10" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Games" /v "FpsStatusGamesAll" /t REG_DWORD /d "4" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Games" /v "GameFluidity" /t REG_DWORD /d "1" /f

::bcd
echo %w% - Disabling Dynamic Tick%p%
bcdedit /set Disablingdynamictick yes >nul 2>&1
echo %w% - Disabling High Precision Event Timer (HPET)%p%
bcdedit /deletevalue useplatformclock  >nul 2>&1
echo %w% - Disabling Synthetic Timers%p%
bcdedit /set useplatformtick yes  >nul 2>&1

::nfts
echo %w% - NFTS Tweaks%p%
fsutil behavior set memoryusage 2 >nul 2>&1
fsutil behavior set mftzone 4 >nul 2>&1
fsutil behavior set Disablinglastaccess 1 >nul 2>&1
fsutil behavior set Disablingdeletenotify 0 >nul 2>&1
fsutil behavior set encryptpagingfile 0 >nul 2>&1

::mmcss
echo %w% - MMCSS Priority For Low Latency%p%
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Affinity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Background Only" /t REG_SZ /d "False" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "BackgroundPriority" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Clock Rate" /t REG_DWORD /d "10000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Priority" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Scheduling Category" /t REG_SZ /d "Medium" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "SFIO Priority" /t REG_SZ /d "High" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Latency Sensitive" /t REG_SZ /d "True" /f
echo %w% - MMCSS Priority For Games%p%
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "BackgroundPriority" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d "10000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Latency Sensitive" /t REG_SZ /d "True" /f

::win32priority
echo %w% - Setting Win32Priority%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "38" /f 

::IRQ8 & IRQ16
echo %w% - Setting IRQ8 Priority %p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ8Priority" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "IRQ8Priority" /t REG_DWORD /d "1" /f
echo %w% - Setting IRQ16 Priority %p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ16Priority" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "IRQ16Priority" /t REG_DWORD /d "2" /f
 
::Menu Show Delay
echo %w% - Decreasing process kill time and menu show delay%p%
Reg.exe add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "1000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "1000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_SZ /d "1000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "1000" /f

::IO Time Stamp
echo %w% - Setting IO Time Stamp%p%
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Reliability" /v "TimeStampInterval" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Reliability" /v "IoPriority" /t REG_DWORD /d "3" /f 

::CSRSS priority
echo %w% - Setting CSRSS IO and CPU Priority to Realtime%p%
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "4" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f 

::LatencyTolerance
echo %w% - Setting Latency Tolerance%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "MonitorLatencyTolerance" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ExitLatency" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ExitLatencyCheckEnablingd" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "Latency" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceDefault" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceFSVP" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyTolerancePerfOverride" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceScreenOffIR" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceVSyncEnablingd" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "RtlCapabilityCheckLatency" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyActivelyUsed" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyIdleLongTime" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyIdleMonitorOff" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyIdleNoContext" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyIdleShortTime" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyIdleVeryLongTime" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceIdle0" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceIdle0MonitorOff" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceIdle1" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceIdle1MonitorOff" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceMemory" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceNoContext" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceNoContextMonitorOff" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceOther" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceTimerPeriod" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultMemoryRefreshLatencyToleranceActivelyUsed" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultMemoryRefreshLatencyToleranceMonitorOff" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultMemoryRefreshLatencyToleranceNoContext" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "Latency" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MaxIAverageGraphicsLatencyInOneBucket" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MiracastPerfTrackGraphicsLatency" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MonitorLatencyTolerance" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "TransitionLatency" /t REG_DWORD /d "1" /f 

::SetSystemResponsivness
echo %w% - Setting System Responsiveness%p%
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f 

timeout 3 > nul
cls 
:miti 
echo.
echo.
echo.                                                       %r%███╗░░░███╗██╗████████╗██╗░██████╗░░█████╗░████████╗██╗░█████╗░███╗░░██╗░██████╗
echo.                                                       %r%████╗░████║██║╚══██╔══╝██║██╔════╝░██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║██╔════╝
echo.                                                       %r%██╔████╔██║██║░░░██║░░░██║██║░░██╗░███████║░░░██║░░░██║██║░░██║██╔██╗██║╚█████╗░
echo.                                                       %r%██║╚██╔╝██║██║░░░██║░░░██║██║░░╚██╗██╔══██║░░░██║░░░██║██║░░██║██║╚████║░╚═══██╗
echo.                                                       %r%██║░╚═╝░██║██║░░░██║░░░██║╚██████╔╝██║░░██║░░░██║░░░██║╚█████╔╝██║░╚███║██████╔╝
echo.                                                       %r%╚═╝░░░░░╚═╝╚═╝░░░╚═╝░░░╚═╝░╚═════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝╚═════╝░
echo.                                              %p%"════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.
echo.                                                          %r%[%w%1%r%]%w% Disable Mitigations          %r%[%w%2%r%]%w% Enable Mitigations (revert)
echo.
echo. 
echo.                                                                                        %r%[%w%X%r%]%w% Skip   
echo. 
echo.                                              %p%"═════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                  Mitigations are protections against memory-based attacks, but they come at a performance cost
echo.                                                    This disables a bunch of basic ones which cause performance loss but arent that important
echo.                                              %p%"═════════════════════════════════════════════════════════════════════════════════════════════"%w%
         
set /p input=:
if /i %input% == 1 goto mitioff
if /i %input% == 2 goto mition
if /i %input% == X goto menu

) ELSE (
echo %w%- Invalid Input %p% & goto MisspellRedirect

:MisspellRedirect
cls
echo %w%- Misspell Detected  %p%
timeout 2
goto RedirectMenu

:RedirectMenu
goto miti

:mitioff
::disable basic mitigations
echo %w% - Disabling VirtualizationBasedSecurity%p%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v "EnablingVirtualizationBasedSecurity" /t REG_DWORD /d "0" /f 
echo %w% - Disabling HVCIMATRequired%p%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v "HVCIMATRequired" /t REG_DWORD /d "0" /f 
echo %w% - Disabling ExceptionChainValidation%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisablingExceptionChainValidation" /t REG_DWORD /d "1" /f 
echo %w% - Disabling Sehop%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "KernelSEHOPEnablingd" /t REG_DWORD /d "0" /f 
echo %w% - Disabling CFG%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnablingCfg" /t REG_DWORD /d "0" /f 
echo %w% - Disabling Protection Mode%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "ProtectionMode" /t REG_DWORD /d "0" /f 
echo %w% - Disabling Spectre And Meltdown%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f
echo %w% - Disabling Address Space Layout Randomization%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "MoveImages" /t REG_DWORD /d "0" /f  
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :menu


:mition
echo %w% - Enabling Isolation Memory Integrity%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /t REG_DWORD /d "1" /f
echo %w% - Enabling HVCIMAT%p%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v "HVCIMATRequired" /t REG_DWORD /d "1" /f 
echo %w% - Enabling ExceptionChainValidation%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisablingExceptionChainValidation" /t REG_DWORD /d "1" /f 
echo %w% - Enabling Sehop%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "KernelSEHOPEnabled" /t REG_DWORD /d "1" /f
echo %w% - Enabling CFG%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnablingCfg" /t REG_DWORD /d "1" /f 
echo %w% - Enabling Protection Mode%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "ProtectionMode" /t REG_DWORD /d "1" /f 
echo %w% - Enabling Spectre And Meltdown%p%
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /f 
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /f 
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /f
echo %w% - Enabling Address Space Layout Randomization%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "MoveImages" /t REG_DWORD /d "0" /f  
 

echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :menu









:10war
chcp 437 >nul 2>&1
powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Do NOT do these if your pc has bad overheating issues', 'OT SERVICES OPTIMIZER', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
timeout /t 1 /nobreak > nul
chcp 65001 >nul 2>&1
:10

:power
cls
echo.
echo.
echo.                                                                 %r%██████╗░░█████╗░░██╗░░░░░░░██╗███████╗██████╗░     
echo.                                                                 %r%██╔══██╗██╔══██╗░██║░░██╗░░██║██╔════╝██╔══██╗ 
echo.                                                                 %r%██████╔╝██║░░██║░╚██╗████╗██╔╝█████╗░░██████╔╝        
echo.                                                                 %r%██╔═══╝░██║░░██║░░████╔═████║░██╔══╝░░██╔══██   
echo.                                                                 %r%██║░░░░░╚█████╔╝░░╚██╔╝░╚██╔╝░███████╗██║░░██║      
echo.                                                                 %r%╚═╝░░░░░░╚════╝░░░░╚═╝░░░╚═╝░░╚══════╝╚═╝░░╚═╝      
echo.                                             %p%"════════════════════════════════════════════════════════════════════════════════"%w%                                           
echo.                                                                                                                 
echo.                                                                  %r%[%w%1%r%]%w% Apply OTSERVICES Power Plan V4              
echo.                                                                                           
echo.                                                                  %r%[%w%2%r%]%w% Disable Power Throttoling, Timer Coalescing + more      
echo.   
echo.                                                                  %r%[%w%3%r%]%w% Disable Power Telemetry     
echo.
echo.                                                                  %r%[%w%4%r%]%w% Delete useless power plans 
echo.
echo.                                                                  %r%[%w%5%r%]%w% Disable Hibernation, Fast startup and more     
echo. 
echo.                                                                                     
echo.                                                                  %r%[%w%R%r%]%w% Revert all power tweaks (except power plan)                   
echo.                                                                                     
echo.      
echo.                                                                            %r%[%w%M%r%]%w% Back to menu                               
echo.                                                                                      
echo.                                             %p%"════════════════════════════════════════════════════════════════════════════════════"
echo.                                                             %w% Might increase cpu temperatures on poorly cooled pcs
echo.                                                         %W% Disablings a bunch of useless power saving features and more
echo.                                             %p%"════════════════════════════════════════════════════════════════════════════════════"
echo.
echo.

set /p input=:
if /i %input% == 1 goto p1
if /i %input% == 2 goto p2
if /i %input% == 3 goto p3
if /i %input% == 4 goto p4
if /i %input% == 5 goto p5
if /i %input% == 6 goto r16
if /i %input% == M cls & goto menu

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu


:RedirectMenu
cls
goto :power



:p1
cls
echo %w% Import Exm Free Power Plan V4%p%
powercfg -import "C:\exm\Exm Free Power Plan V4.pow"
powercfg.cpl
timeout /t 1 /nobreak > NUL
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :power

:p5
echo %w% - Disabling Fast Startup (this is bad for your pc, even if it speeds up booting by a few seconds %p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnablingd" /t REG_DWORD /d "0" /f 

echo %w% - Disabling Hibernation%p%
powercfg /h off
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "SleepReliabilityDetailedDiagnostics" /t REG_DWORD /d "0" /f 

echo %w% - Disabling Sleep Study (you should only shutdown your pc, dont put it to sleep, its bad for you pc) %p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "SleepStudyDisablingd" /t REG_DWORD /d "1" /f 
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto menu

:p4
echo %w% - Deleting useless power plans%p%
powercfg -delete 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
powercfg -delete 381b4222-f694-41f0-9685-ff5bb260df2e
powercfg -delete a1841308-3541-4fab-bc81-f71556f20b4a

echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto power

:p3
echo %w% - Disabling Energy Logging + Power Telemetry%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "DisablingTaggedEnergyLogging" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "TelemetryMaxApplication" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "TelemetryMaxTagPerApplication" /t REG_DWORD /d "0" /f 
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :power

:P2
cls
cho %w%- Disabling Link State Power Managment %p%
FOR /F "eol=E" %%a in ('REG QUERY "HKLM\System\CurrentControlSet\Services" /s "EnablingHIPM"^| FINDSTR /V "EnablingHIPM"') DO (
echo %w%- Disabling HIPM %p%
Reg.exe add "%%a" /v "EnablingHIPM" /t REG_DWORD /d "0" /f  > nul 
echo %w%- Disabling DIPM %p%
Reg.exe add "%%a" /v "EnablingDIPM" /t REG_DWORD /d "0" /f > nul 
echo %w%- Disabling HDD Parking %p%
Reg.exe add "%%a" /v "EnablingHDDParking" /t REG_DWORD /d "0" /f > nul 
FOR /F "tokens=*" %%z IN ("%%a") DO (
SET STR=%%z
SET STR=!STR:HKLM\System\CurrentControlSet\Services\=!
) > nul 
)	
echo %w% - Disabling GPU Energy Driver%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDrv" /v "Start" /t REG_DWORD /d "2" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDr" /v "Start" /t REG_DWORD /d "2" /f 

echo %w% - Disabling CoalescingTimerInterval%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\ModernSleep" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "PlatformAoAcOverride" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EnergyEstimationEnablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EventProcessorEnablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CsEnablingd" /t REG_DWORD /d "0" /f 

echo %w% - Disabling Power Throttling%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f 

echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :power


:5
:RAM
cls
echo.
echo.
echo.                                                         %r%███╗░░░███╗███████╗███╗░░░███╗░█████╗░██████╗░██╗░░░██╗     
echo.                                                         %r%████╗░████║██╔════╝████╗░████║██╔══██╗██╔══██╗╚██╗░██╔╝
echo.                                                         %r%██╔████╔██║█████╗░░██╔████╔██║██║░░██║██████╔╝░╚████╔╝░        
echo.                                                         %r%██║╚██╔╝██║██╔══╝░░██║╚██╔╝██║██║░░██║██╔══██╗░░╚██╔╝░░  
echo.                                                         %r%██║░╚═╝░██║███████╗██║░╚═╝░██║╚█████╔╝██║░░██║░░░██║░░░     
echo.                                                         %r%╚═╝░░░░░╚═╝╚══════╝╚═╝░░░░░╚═╝░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░      
echo.                                             %p%"═════════════════════════════════════════════════════════════════════════════"%w%                                           
echo.                                                                         Select how much ram you have:              
echo.                                                                                          
echo.                                                    %r%[%w%1%r%]%w% 4GB                    %r%[%w%2%r%]%w% 8GB                 %r%[%w%3%r%]%w% 12GB                      
echo.                                                                                               
echo.                                                    %r%[%w%4%r%]%w% 16GB                   %r%[%w%5%r%]%w% 24GB                %r%[%w%6%r%]%w% 32GB
echo.  
echo.                                                    %r%[%w%7%r%]%w% 48GB                   %r%[%w%8%r%]%w% 64GB                %r%[%w%9%r%]%w% 128GB 
echo. 
echo.                                                                                       
echo.                                                    %r%%r%%r%%r%                           %r%[%w%T%r%]%w% Open Task Manager  
echo.
echo.                                                    %r%%r%%r%%r%                           %r%[%w%M%r%]%w% Back to menu                               
echo.                                                                                   
echo.                                             %p%"══════════════════════════════════════════════════════════════════════════════"%w% 
echo.                                                 %w% Optimizes a bunch of RAM related registry values for optimal performance 
echo.                                                   %W% Disablings a bunch of useless features which hinder your performance
echo.                                             %p%"══════════════════════════════════════════════════════════════════════════════"%w% 
echo.
echo.

set /p input=:
if /i %input% == 1 goto 4GB
if /i %input% == 2 goto 8GB
if /i %input% == 3 goto 12GB
if /i %input% == 4 goto 16GB
if /i %input% == 5 goto 24GB
if /i %input% == 6 goto 32GB
if /i %input% == 7 goto 48GB
if /i %input% == 8 goto 64GB
if /i %input% == 9 goto 128GB
if /i %input% == M cls & goto menu

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu

:RedirectMenu
cls
goto :5

:4GB
chcp 437 >nul 2>&1
echo %w% - Enabling Memory Compression%p%
PowerShell -Command "Enabling-MMAgent -MemoryCompression" > nul 2>&1
chcp 65001 >nul 2>&1

echo %w% - Setting Best SvcHostSplitThresholdInKB for your ram size%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "4194304" /f 

echo %w% - Disabling Large System Cache%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f

goto rest

:8GB
chcp 437 >nul 2>&1
echo %w% - Enabling Memory Compression%p%
PowerShell -Command "Enabling-MMAgent -MemoryCompression" > nul 2>&1
chcp 65001 >nul 2>&1

echo %w% - Setting Best SvcHostSplitThresholdInKB for your ram size%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "8388608" /f 

echo %w% - Disabling Large System Cache%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f

goto rest

:12GB
chcp 437 >nul 2>&1
echo %w% - Enabling Memory Compression%p%
PowerShell -Command "Enabling-MMAgent -MemoryCompression" > nul 2>&1
chcp 65001 >nul 2>&1

echo %w% - Setting Best SvcHostSplitThresholdInKB for your ram size%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "12582912" /f 

echo %w% - Disabling Large System Cache%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f

goto rest

:16GB

chcp 437 >nul 2>&1
echo %w% - Disabling Memory Compression%p%
PowerShell -Command "Disabling-MMAgent -MemoryCompression" > nul 2>&1
chcp 65001 >nul 2>&1

echo %w% - Setting Best SvcHostSplitThresholdInKB for your ram size%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "16777216" /f 

echo %w% - Enabling Large System Cache%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f

goto rest

:24GB
chcp 437 >nul 2>&1
echo %w% - Disabling Memory Compression%p%
PowerShell -Command "Disabling-MMAgent -MemoryCompression" > nul 2>&1
chcp 65001 >nul 2>&1

echo %w% - Setting Best SvcHostSplitThresholdInKB for your ram size%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "25165824" /f 

echo %w% - Enabling Large System Cache%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f

goto rest

:32GB
chcp 437 >nul 2>&1
echo %w% - Disabling Memory Compression%p%
PowerShell -Command "Disabling-MMAgent -MemoryCompression" > nul 2>&1
chcp 65001 >nul 2>&1

echo %w% - Setting Best SvcHostSplitThresholdInKB for your ram size%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "33554432" /f 

echo %w% - Enabling Large System Cache%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f

goto rest

:48GB
chcp 437 >nul 2>&1
echo %w% - Disabling Memory Compression%p%
PowerShell -Command "Disabling-MMAgent -MemoryCompression" > nul 2>&1
chcp 65001 >nul 2>&1

echo %w% - Setting Best SvcHostSplitThresholdInKB for your ram size%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "50331648" /f 

echo %w% - Enabling Large System Cache%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f

goto rest

:64GB
chcp 437 >nul 2>&1
echo %w% - Disabling Memory Compression%p%
PowerShell -Command "Disabling-MMAgent -MemoryCompression" > nul 2>&1
chcp 65001 >nul 2>&1

echo %w% - Setting Best SvcHostSplitThresholdInKB for your ram size%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "67108864" /f 

echo %w% - Enabling Large System Cache%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f

goto rest

:128GB
chcp 437 >nul 2>&1
echo %w% - Disabling Memory Compression%p%
PowerShell -Command "Disabling-MMAgent -MemoryCompression" > nul 2>&1
chcp 65001 >nul 2>&1

echo %w% - Setting Best SvcHostSplitThresholdInKB for your ram size%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "134217728" /f 

echo %w% - Enabling Large System Cache%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f

goto rest

:rest

echo %w% - Disabling Page Combining%p%
chcp 437 >nul 2>&1
PowerShell -Command "Disabling-MMAgent -PageCombining" > nul 2>&1
chcp 65001 >nul 2>&1

echo %w% - Disabling Paging Executive%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablingPagingExecutive" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DpiMapIommuContiguous" /t REG_DWORD /d "1" /f 

echo %w% - Disabling Prefetch and superfetch%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablingPrefetcher" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablingSuperfetch" /t REG_DWORD /d "0" /f

echo %w% - Optimizing Memory Managment%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablingPagingExecutive" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolQuota" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolSize" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolQuota" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolSize" /t REG_DWORD /d "192" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d "1024" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionPoolSize" /t REG_DWORD /d "192" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionViewSize" /t REG_DWORD /d "192" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SystemPages" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PhysicalAddressExtension" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PoolUsageMaximum" /t REG_DWORD /d "96" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "Start" /t REG_DWORD /d "4" /f


echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto menu




:g1
cls
echo.
echo.
echo.
echo.                                                              %r%███╗░░██╗██╗░░░██╗██╗██████╗░██╗░█████╗░  ░██████╗░██████╗░██╗░░░██╗
echo.                                                              %r%████╗░██║██║░░░██║██║██╔══██╗██║██╔══██╗  ██╔════╝░██╔══██╗██║░░░██║
echo.                                                              %r%██╔██╗██║╚██╗░██╔╝██║██║░░██║██║███████║  ██║░░██╗░██████╔╝██║░░░██║
echo.                                                              %r%██║╚████║░╚████╔╝░██║██║░░██║██║██╔══██║  ██║░░╚██╗██╔═══╝░██║░░░██║
echo.                                                              %r%██║░╚███║░░╚██╔╝░░██║██████╔╝██║██║░░██║  ╚██████╔╝██║░░░░░╚██████╔╝
echo.                                                              %r%╚═╝░░╚══╝░░░╚═╝░░░╚═╝╚═════╝░╚═╝╚═╝░░╚═╝  ░╚═════╝░╚═╝░░░░░░╚═════╝░
timeout 1 /nobreak > NUL
echo %w% - Applying EXMTWEAKS Nvidia Profile Inspector Profile (optimizes nvidia control panel 3D settings and much more) %p%
start "" /wait "C:\exm\NvidiaProfileInspector.exe" "C:\exm\Free NVPI EXM Profile V6.nip" 

echo %w% - Forcing Contigous Memory Allocation %p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PreferSystemMemoryContiguous" /t REG_DWORD /d "1" /f

echo %w% - Disabling Write Combining %p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "DisablingWriteCombining" /t REG_DWORD /d "1" /f

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID') do set "str=%%i" (
echo %w%- Deleting GPU Device Priority %p%
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f

echo %w%- Removing Msi GPU Limits %p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MessageNumberLimit" /f

echo %w%- Enabling MSI Mode on GPU if supported %p%
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
)
echo %w%- Disabling HDCP%p%
			 for /f %%m in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
	for /f "tokens=3" %%a in ('Reg.exe query "HKLM\SYSTEM\ControlSet001\Enum\%%m" /v "Driver"') do (
		for /f %%m in ('echo %w%- %%a ^| findstr "{"') do (
		     Reg.exe add "HKLM\System\ControlSet001\Control\Class\%%m" /v "RMHdcpKeyglobZero" /t REG_DWORD /d "1" /f
                   )
                )
             )
			 
echo %w%- Disabling Preemption%p%			 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisablePreemption" /t Reg_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableCudaContextPreemption" /t Reg_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "GPUPreemptionLevel" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "ComputePreemption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableMidGfxPreemptionVGPU" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableMidBufferPreemptionForHighTdrTimeout" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableAsyncMidBufferPreemption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableSCGMidBufferPreemption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PerfAnalyzeMidBufferPreemption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableMidGfxPreemption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableMidBufferPreemption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableCEPreemption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableCudaContextPreemption" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisablePreemptionOnS3S4" /t REG_DWORD /d "1" /f

echo %w%- Setting query VRAM%p% 
fsutil behavior query memoryusage
fsutil behavior set memoryusage 2

echo %w% - Setting NVIDIA Latency Tolerance%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "D3PCLatency" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "F1TransitionLatency" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "LOWLATENCY" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "Node3DLowLatency" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PciLatencyTimerControl" /t REG_DWORD /d "20" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMDeepL1EntryLatencyUsec" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RmGspcMaxFtuS" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RmGspcMinFtuS" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RmGspcPerioduS" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMLpwrEiIdleThresholdUs" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMLpwrGrIdleThresholdUs" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMLpwrGrRgIdleThresholdUs" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMLpwrMsIdleThresholdUs" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "VRDirectFlipDPCDelayUs" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "VRDirectFlipTimingMarginUs" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "VRDirectJITFlipMsHybridFlipDelayUs" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "vrrCursorMarginUs" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "vrrDeflickerMarginUs" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "vrrDeflickerMaxUs" /t REG_DWORD /d "1" /f 


echo %w% - Disabling NVIDIA Telemetry%p%
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "NvBackend" /f 
Reg.exe add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnablingRID66610" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnablingRID64640" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnablingRID44231" /t REG_DWORD /d "0" /f 
schtasks /change /Disabling /tn "NvTmRep_CrashReport1_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" 
schtasks /change /Disabling /tn "NvTmRep_CrashReport2_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" 
schtasks /change /Disabling /tn "NvTmRep_CrashReport3_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" 
schtasks /change /Disabling /tn "NvTmRep_CrashReport4_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" 
schtasks /change /Disabling /tn "NvDriverUpdateCheckDaily_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" 
schtasks /change /Disabling /tn "NVIDIA GeForce Experience SelfUpdate_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" 
schtasks /change /Disabling /tn "NvTmMon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" 

echo %w%- Disabling GpuEnergy Driver %p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDrv" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDr" /v "Start" /t REG_DWORD /d "4" /f

echo %w% - Disabling Preemption%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisablingPreemption" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisablingCudaContextPreemption" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnablingCEPreemption" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisablingPreemptionOnS3S4" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "ComputePreemption" /t REG_DWORD /d "0" /f 

echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto menu


:g2
cls
echo.
echo.
echo.
echo.                                                              %r%░█████╗░███╗░░░███╗██████╗░  ░██████╗░██████╗░██╗░░░██╗
echo.                                                              %r%██╔══██╗████╗░████║██╔══██╗  ██╔════╝░██╔══██╗██║░░░██║
echo.                                                              %r%███████║██╔████╔██║██║░░██║  ██║░░██╗░██████╔╝██║░░░██║
echo.                                                              %r%██╔══██║██║╚██╔╝██║██║░░██║  ██║░░╚██╗██╔═══╝░██║░░░██║
echo.                                                              %r%██║░░██║██║░╚═╝░██║██████╔╝  ╚██████╔╝██║░░░░░╚██████╔╝
echo.                                                              %r%╚═╝░░╚═╝╚═╝░░░░░╚═╝╚═════╝░  ░╚═════╝░╚═╝░░░░░░╚═════╝░
timeout 1 /nobreak > NUL

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID') do set "str=%%i" (
echo %w%- Deleting GPU Device Priority %p%
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f

echo %w%- Removing Msi GPU Limits %p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MessageNumberLimit" /f

echo %w%- Enabling MSI Mode on GPU if supported %p%
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
)

echo %w%- Disabling GpuEnergy Driver %p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDrv" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDr" /v "Start" /t REG_DWORD /d "4" /f

echo %w%- Disabling High-Bandwidth Digital Content Protection (HDCP) %p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\\DAL2_DATA__2_0\DisplayPath_4\EDID_D109_78E9\Option" /v "ProtectionControl" /t REG_BINARY /d "0100000001000000" /f 

echo %w% - Disabling Display Refresh Rate Override%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "3D_Refresh_Rate_Override_DEF" /t REG_DWORD /d "0" /f 

echo %w% - Disabling SnapShot%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowSnapshot" /t REG_DWORD /d "0" /f 

echo %w% - Disabling Anti Aliasing%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AAF_NA" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AntiAlias_NA" /t REG_SZ /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "ASTT_NA" /t REG_SZ /d "0" /f 

echo %w% - Disabling Subscriptions%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowSubscription" /t REG_DWORD /d "0" /f 

echo %w% - Disabling Anisotropic Filtering%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AreaAniso_NA" /t REG_SZ /d "0" /f 

echo %w% - Disabling Radeon Overlay%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowRSOverlay" /t REG_SZ /d "false" /f  

echo Enabling Adaptive DeInterlacing%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "Adaptive De-interlacing" /t REG_DWORD /d "1" /f 

echo %w% - Disabling Skins%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowSkins" /t REG_SZ /d "false" /f  

echo %w% - Disabling Automatic Color Depth Reduction%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AutoColorDepthReduction_NA" /t REG_DWORD /d "0" /f 

echo %w% - Disabling Power Gating%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisablingSAMUPowerGating" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisablingUVDPowerGatingDynamic" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisablingVCEPowerGating" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisablingPowerGating" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisablingDrmdmaPowerGating" /t REG_DWORD /d "1" /f 

echo %w% - Disabling VCESW Clock Gating%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnablingVceSwClockGating" /t REG_DWORD /d "1" /f 

echo %w% - Disabling UVD Clock Gating%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnablingUvdClockGating" /t REG_DWORD /d "1" /f 

echo %w% - Disabling Active State Power Management (ASPM)%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnablingAspmL0s" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnablingAspmL1" /t REG_DWORD /d "0" /f 

echo %w% - Disabling Ultra Low Power States (ULPS) %p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnablingUlps" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnablingUlps_NA" /t REG_SZ /d "0" /f 

echo %w% - Enabling De-Lag%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_DeLagEnablingd" /t REG_DWORD /d "1" /f 
timeout /t 1 /nobreak > NUL

echo %w% - Disabling Frame Rate Target%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_FRTEnablingd" /t REG_DWORD /d "0" /f 
timeout /t 1 /nobreak > NUL

echo %w% - Disabling DMA%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisablingDMACopy" /t REG_DWORD /d "1" /f 

echo %w% - Enabling BlockWrite%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisablingBlockWrite" /t REG_DWORD /d "0" /f 

echo %w% - Disabling Stutter Mode%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "StutterMode" /t REG_DWORD /d "0" /f 

echo %w% - Disabling GPU Memory Clock Sleep State%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_SclkDeepSleepDisabling" /t REG_DWORD /d "1" /f 

echo %w% - Disabling Thermal Throttling%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_ThermalAutoThrottlingEnabling" /t REG_DWORD /d "0" /f 

echo %w% - Disabling Preemption%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_EnablingComputePreemption" /t REG_DWORD /d "0" /f 

echo %w% - Setting Main3D%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Main3D_DEF" /t REG_SZ /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Main3D" /t REG_BINARY /d "3100" /f 

echo %w% - Setting FlipQueueSize%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "FlipQueueSize" /t REG_BINARY /d "3100" /f 

echo %w% - Setting Shader Cache Size%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "ShaderCache" /t REG_BINARY /d "3200" /f 

echo %w% - Configuring TFQ%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "TFQ" /t REG_BINARY /d "3200" /f 

echo %w%- Disabling Preemption %p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnablingPreemption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "GPUPreemptionLevel" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnablingAsyncMidBufferPreemption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnablingMidGfxPreemptionVGPU" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnablingMidBufferPreemptionForHighTdrTimeout" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnablingSCGMidBufferPreemption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "PerfAnalyzeMidBufferPreemption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnablingMidGfxPreemption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnablingMidBufferPreemption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnablingCEPreemption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "DisablingCudaContextPreemption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "DisablingPreemptionOnS3S4" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "ComputePreemptionLevel" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "DisablingPreemption" /t REG_DWORD /d "1" /f

echo %w% - Disabling GPU Power Down%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_GPUPowerDownEnablingd" /t REG_DWORD /d "1" /f 

echo %w% - Disabling AMD Logging%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdlog" /v "Start" /t REG_DWORD /d "4" /f 

echo %w%- Latency Tolernace %p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ExitLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ExitLatencyCheckEnablingd" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceDefault" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceFSVP" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyTolerancePerfOverride" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceScreenOffIR" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceVSyncEnablingd" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "RtlCapabilityCheckLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "QosManagesIdleProcessors" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DisablingVsyncLatencyUpdate" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DisablingSensorWatchdog" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "InterruptSteeringDisablingd" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LowLatencyScalingPercentage" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HighPerformance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HighestPerformance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MinimumThrottlePercent" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumThrottlePercent" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumPerformancePercent" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "InitialUnparkCount" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyActivelyUsed" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleLongTime" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleMonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleNoContext" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleShortTime" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleVeryLongTime" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle0MonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle1" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle1MonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceMemory" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceNoContext" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceNoContextMonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceOther" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceTimerPeriod" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultMemoryRefreshLatencyToleranceActivelyUsed" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultMemoryRefreshLatencyToleranceMonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultMemoryRefreshLatencyToleranceNoContext" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MiracastPerfTrackGraphicsLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MonitorLatencyTolerance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "TransitionLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DisablingVsyncLatencyUpdate" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DisablingSensorWatchdog" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "InterruptSteeringDisablingd" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ExitLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ExitLatencyCheckEnablingd" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceDefault" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceFSVP" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyTolerancePerfOverride" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceScreenOffIR" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceVSyncEnablingd" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "RtlCapabilityCheckLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LowLatencyScalingPercentage" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaxIAverageGraphicsLatencyInOneBucket" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyActivelyUsed" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleLongTime" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleMonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleNoContext" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleShortTime" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleVeryLongTime" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle0MonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle1" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle1MonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceMemory" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceNoContext" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceNoContextMonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceOther" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceTimerPeriod" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultMemoryRefreshLatencyToleranceActivelyUsed" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultMemoryRefreshLatencyToleranceMonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultMemoryRefreshLatencyToleranceNoContext" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaxIAverageGraphicsLatencyInOneBucket" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MiracastPerfTrackGraphicsLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MonitorLatencyTolerance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "TransitionLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "MonitorLatencyTolerance" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MonitorLatencyTolerance" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RMDisablingPostL2Compression" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmDisablingRegistryCaching" /t REG_DWORD /d "1" /f
timeout /t 1 /nobreak > NUL


echo %w%- Vram %p% 
fsutil behavior query memoryusage
fsutil behavior set memoryusage 2


echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto menu


:9
cls
echo.  
echo.  
echo.  
echo.                                                                           %r%██╗░░░██╗░██████╗██████╗░  ████████╗░██╗░░░░░░░██╗███████╗░█████╗░██╗░░██╗░██████╗
echo.                                                                           %r%██║░░░██║██╔════╝██╔══██╗  ╚══██╔══╝░██║░░██╗░░██║██╔════╝██╔══██╗██║░██╔╝██╔════╝
echo.                                                                           %r%██║░░░██║╚█████╗░██████╦╝  ░░░██║░░░░╚██╗████╗██╔╝█████╗░░███████║█████═╝░╚█████╗░
echo.                                                                           %r%██║░░░██║░╚═══██╗██╔══██╗  ░░░██║░░░░░████╔═████║░██╔══╝░░██╔══██║██╔═██╗░░╚═══██╗
echo.                                                                           %r%╚██████╔╝██████╔╝██████╦╝  ░░░██║░░░░░╚██╔╝░╚██╔╝░███████╗██║░░██║██║░╚██╗██████╔╝
echo.                                                                           %r%░╚═════╝░╚═════╝░╚═════╝░  ░░░╚═╝░░░░░░╚═╝░░░╚═╝░░╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░
timeout 1 /nobreak > NUL
echo %w% - Disabling USB PowerSavings%p%
for /f %%i in ('wmic path Win32_USBController get PNPDeviceID^| findstr /l "PCI\VEN_"') do (
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters" /v "AllowIdleIrpInD3" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters" /v "D3ColdSupported" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters" /v "DeviceSelectiveSuspended" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters" /v "EnablingSelectiveSuspend" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters" /v "EnhancedPowerManagementEnablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters" /v "SelectiveSuspendEnablingd" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters" /v "SelectiveSuspendOn" /t REG_DWORD /d "0" /f 
)


echo %w% - Thread Priority%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\usbxhci\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\USBHUB3\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f

echo %w% - Disabling USB Selective Suspend%p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\USB" /v "DisablingSelectiveSuspend" /t REG_DWORD /d "1" /f 

echo %w% - Enabing MSI mode on usb%p%
for /f %%i in ('wmic path Win32_USBController get PNPDeviceID') do set "str=%%i" & (
echo %w% - DEL USB Device Priority %p%
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f
echo %w% -Enabling MSI Mode on USB %p%
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
)
echo.
echo.
echo.
echo.                                              %p%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %p%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu

:k1
cls
echo.
echo.
echo.
echo.
echo %w% - Disabling Filter Keys (the filterkeys app is completely useless placebo, dont use it for the love of god)%p%
Reg.exe add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d "122" /f
echo %w% - Disabling Toggle Keys%p%
Reg.exe add "HKCU\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t REG_SZ /d "58" /f
echo %w% - Disabling Sticky Keys%p%
Reg.exe add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "506" /f
echo %w% - Disabling Mouse Keys%p%
Reg.exe add "HKCU\Control Panel\Accessibility\MouseKeys" /v "Flags" /t REG_SZ /d "0" /f

echo %w% - Disabling Mouse Acceleration%p%
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f

echo %w% - Enabling 1:1 Pixel Mouse Movements%p%
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseSensitivity" /t REG_SZ /d "10" /f

echo %w% - Reducing Keyboard Repeat Delay%p%
Reg.exe add "HKCU\Control Panel\Keyboard" /v "KeyboardDelay" /t REG_SZ /d "0" /f

echo %w% - Increasing Keyboard Repeat Rate%p%
Reg.exe add "HKCU\Control Panel\Keyboard" /v "KeyboardSpeed" /t REG_SZ /d "31" /f

echo %w% - Setting CSRSS to Realtime%p%
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "4" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f 
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto kbm,

:2
:kbm
cls
echo.
echo.
echo.                                                               %r% ██╗░░██╗██████╗░███╗░░░███╗
echo.                                                               %r% ██║░██╔╝██╔══██╗████╗░████║
echo.                                                               %r% █████═╝░██████╦╝██╔████╔██║
echo.                                                               %r% ██╔═██╗░██╔══██╗██║╚██╔╝██║
echo.                                                               %r% ██║░╚██╗██████╦╝██║░╚═╝░██║
echo.                                                               %r% ╚═╝░░╚═╝╚═════╝░╚═╝░░░░░╚═╝    
echo.                                             %p%"═══════════════════════════════════════════════════════════════"%w%                    
echo.                                                                                          
echo.                                                           %r%[%w%1%r%]%w% Apply KBM Registry Optimizations       
echo.                                                                                           
echo.                                                           %r%[%w%2%r%]%w% Set KBM Data Queue Size   
echo.                                                                                          
echo.                                                                                           
echo.                                                                   %r%[%w%M%r%]%w% Back to menu   
echo.                            
echo.                                                                                         
echo.                                                             %r%%w%%w%%w%  Made by EXM TWEAKS® 2024      
echo.                                             %p%"════════════════════════════════════════════════════════════════"
echo.                                                %w% Optimizes a bunch of mouse and keyboard registry settings
echo.                                             %p%"════════════════════════════════════════════════════════════════"
echo.

set /p input=:
if /i %input% == 1 goto k1
if /i %input% == 2 goto k2
if /i %input% == M cls & goto menu

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu


:RedirectMenu
cls
goto :kbm

:k2
cls
echo.
echo.
echo.

echo.                                                                               %r% ██╗░░██╗██████╗░███╗░░░███╗
echo.                                                                               %r% ██║░██╔╝██╔══██╗████╗░████║
echo.                                                                               %r% █████═╝░██████╦╝██╔████╔██║
echo.                                                                               %r% ██╔═██╗░██╔══██╗██║╚██╔╝██║
echo.                                                                               %r% ██║░╚██╗██████╦╝██║░╚═╝░██║
echo.                                                                               %r% ╚═╝░░╚═╝╚═════╝░╚═╝░░░░░╚═╝
echo.                                             %p%"═══════════════════════════════════════════════════════════════════════════════════════════════════"   
echo.                                                                                                                       
echo.                                                    %r%[%w%1%r%]%w% 14 (High end CPU)          %r%[%w%2%r%]%w% 17 (Mid end CPU)          %r%[%w%3%r%]%w% 20(Low end CPU)                  
echo.                                                                                                                                                                                       
echo.                                                                                                                      
echo.                                                    %r%%r%%r%%r%                               %r%[%w%T%r%]%w% Open Task Manager                                     
echo.                                                                                                                       
echo.                                                    %r%%r%%r%%r%                               %r%[%w%R%r%]%w% Revert                  
echo.                                                                                          
echo.                                             %p%"═══════════════════════════════════════════════════════════════════════════════════════════════════"
echo.                                                              %w% The lower the value, the less peripheral latency you will have
echo.                                                       %w% But it may cause KBM stutters and lag on lower end pc's if the value is too high
echo.
echo.                                                %w% Comment Your CPU under the tutorial youtube video, and we will tell you which value to use
echo.                                             %p%"═══════════════════════════════════════════════════════════════════════════════════════════════════"
echo.
set /p input=: 
if /i %input% == 1 goto 14v
if /i %input% == 2 goto 17v
if /i %input% == 3 goto 20v
if /i %input% == R goto Revertm
if /i %input% == T start taskmgr & goto k2
if /i %input% == X cls & goto mouse

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2 
goto Redirectmouse


:Redirectmouse
cls
goto :mouse

:14v
echo %w% - 14 %p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "20" /f
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto menu

:17v
echo %w% - 17 %p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "23" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "23" /f

echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto menu


:20v
echo %w% - 20 %p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "32" /f
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto menu

:revertm
echo %w% - 100 %p%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "256" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "256" /f
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto menu



:6
cls
chcp 437 > nul

powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('After you press ok it will open an app, Go to the LOGON section, Disabling all services except: antivirus, cmd.exe, and the n/a services', 'OT SERVICES OPTIMIZER', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
chcp 65001 > nul

start C:\exm\autoruns.exe
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto menu





:4
:clean
cls
echo.
echo.
echo.                                                                   %r%░█████╗░██╗░░░░░███████╗░█████╗░███╗░░██╗  
echo.                                                                   %r%██╔══██╗██║░░░░░██╔════╝██╔══██╗████╗░██║
echo.                                                                   %r%██║░░╚═╝██║░░░░░█████╗░░███████║██╔██╗██║      
echo.                                                                   %r%██║░░██╗██║░░░░░██╔══╝░░██╔══██║██║╚████║ 
echo.                                                                   %r%╚█████╔╝███████╗███████╗██║░░██║██║░╚███║    
echo.                                                                   %r%░╚════╝░╚══════╝╚══════╝╚═╝░░╚═╝╚═╝░░╚══╝      
echo.                                             %p%"════════════════════════════════════════════════════════════════════════════════"%w%                
echo.                                                                                                       
echo.                                                  %r%[%w%1%r%]%w% Clean Temporary Device Data    %r%[%w%2%r%]%w% Windows Clean Manager   
echo.
echo.                                                                                                                                                                
echo.                                                                          %r%[%w%M%r%]%w% Back to menu                               
echo.                                                                                    
echo.                                             %p%"════════════════════════════════════════════════════════════════════════════════"
echo.                                                               %W% Clean a bunch of temporary data off your pc
echo.                                                             %W% Deletes old drivers, cache, logs and a lot more
echo.                                             %p%"════════════════════════════════════════════════════════════════════════════════"
echo. 
set /p input=:
if /i %input% == 1 goto c1
if /i %input% == 2 goto c2

if /i %input% == M cls & goto menu

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu


:RedirectMenu
cls
goto :12


:c1
cls
echo %w% -  Cleaning Useless Device Data...%p%
chcp 437 > nul
@echo on
POWERSHELL "$Devices = Get-PnpDevice | ? Status -eq Unknown;foreach ($Device in $Devices) { &\"pnputil\" /remove-device $Device.InstanceId }"
@echo off
chcp 65001 > nul
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto :4

:c2
cls
start cleanmgr.exe
echo.
echo.
echo.
echo.                                                                                  %p%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %p%║    %w% * Operation Completed * Press any key to continue...      %p%║
echo.                                                                                  %p%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto menu
