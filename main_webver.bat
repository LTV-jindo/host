@echo off
(
    echo [%date% %time%]
) >> "%~dp0log.log"
setlocal EnableDelayedExpansion
title MultiTool - by Ebola Man (upgrade version by Jindo)
chcp 65001 >nul
:start
call :banner

:menu
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A
echo.
echo.
echo [38;2;255;255;0m        ╔═(1) System Informer[0m  
echo [38;2;255;255;0m        ║[0m  
echo [38;2;255;255;0m        ╠═══(2) Personal Password Generator[0m  
echo [38;2;255;255;0m        ║[0m  
echo [38;2;255;255;0m        ╚╦═══(3) Exit 
echo [38;2;255;255;0m         ║[0m  
echo [38;2;255;255;0m         ║[0m  
set "input="
set /p "input=.%BS% [38;2;255;255;0m        ╚══════>[0m  
if /I "!input!"=="1" (
  echo The web version doesn't support this. please download the full app instead.
  pause
  cls
  goto start
)
if /I "!input!"=="2" (
  echo The web version doesn't support this. please download the full app instead.
  pause
  cls
  goto start
)
if /I "!input!"=="3" exit
if /I "!input!"=="0973505373" (
  echo The web version doesn't support this. please download the full app instead.
  pause
  cls
  goto start
)
if /I "!input!"=="restart" (
    echo Are you sure you want to shut down the PC?
    choice /c yn /n /m "[Y/N]> "

    if errorlevel 2 (
        cls
        goto start
    )

    shutdown /r /t 0
)
if /I "!input!"=="shutdown" (
    echo Are you sure you want to shut down the PC?
    choice /c yn /n /m "[Y/N]> "
    if errorlevel 2 (
        cls
        goto :start
    )

    "%SystemRoot%\System32\shutdown.exe" /s /t 0
    exit
)
if /I "!input!"=="help" goto :help
if /I "!input!"=="lock" (
    "%SystemRoot%\System32\rundll32.exe" user32.dll,LockWorkStation
    exit
)
if /I "!input!"=="hide" (
    popd

    set "target="
    echo.
    set /p "target=[38;2;255;255;0mEnter the file or folder path: "

    if not defined target (
        echo.
        echo No path entered.
        pause
        pushd files
        cls
        goto :start
    )

    if exist "!target!" (
        attrib +h +s +r "!target!"

        if errorlevel 1 (
            set "errorcommand=Hide"
            set "errormessage=Failed to hide the selected file or folder."
            set "errorcode=!errorlevel!"
            pushd files
            goto :errorhandler
        )

        echo.
        echo Hidden successfully.
    ) else (
        set "errorcommand=Hide"
        set "errormessage=File or folder not found."
        set "errorcode=1"
        pushd files
        goto :errorhandler
    )

    pause
    pushd files
    cls
    goto :start
)

if /I "!input!"=="unhide" (
    popd

    set "target="
    echo.
    set /p "target=[38;2;255;255;0mEnter the file or folder path: "

    if not defined target (
        echo.
        echo No path entered.
        pause
        pushd files
        cls
        goto :start
    )

    if exist "!target!" (
        attrib -h -s -r "!target!"

        if errorlevel 1 (
            set "errorcommand=Unhide"
            set "errormessage=Failed to unhide the selected file or folder."
            set "errorcode=!errorlevel!"
            pushd files
            goto :errorhandler
        )

        echo.
        echo Unhidden successfully.
    ) else (
        set "errorcommand=Unhide"
        set "errormessage=File or folder not found."
        set "errorcode=3"
        pushd files
        goto :errorhandler
    )

    pause
    pushd files
    cls
    goto :start
)
if /I "!input!"=="network" goto :network
if /I "!input!"=="open" goto :launchmenu
if /I "!input!"=="sysmgr" goto :sysmgr
if /I "!input!"=="version" goto :version
if /I "!input!"=="calc" goto :calc
if /I "!input!"=="fun" goto :fun
if /I "!input!"=="contact" goto contact
if /I "!input!"=="website" goto mainp
if /I "!input!"=="update" goto :update
if /I "!input!"=="process" goto :process
if /I "!input!"=="folders" goto folder
if /I "!input!"=="optimize" goto :optimize
cls
goto start

:help
cls
echo [38;2;255;255;0m ==============================
echo            COMMANDS
echo  ==============================
echo [38;2;255;255;0mAvailable commands:
echo 1         - System Informer (doesn't support on web version)
echo 2         - Personal Password Generator (doesn't support on web version)
echo 3         - Exit
echo restart   - Restart the PC
echo shutdown  - Shut down the PC
echo help      - Show this list
echo lock      - Lock the PC
echo hide      - hide a file or folder
echo unhide    - unhide a file or folder
echo open      - files launcher
echo network   - network tool
echo sysmgr    - system manager
echo version   - show information such as version, Devlopers name's,...
echo calc      - open calculator
echo fun       - show fun things ^:^)
echo website   - open the website of Multi-Tool
echo contact   - open the contact page of Multi-Tool
echo update    - check if there is a newer udpate
echo process   - search for selected running process
echo folders   - quick folder launcher
echo optimize  - optimize for best performence
echo.
echo This script contains a devloper-only command
echo It also need a secret code.
echo.
pause
cls
goto start

:launchmenu
cls
echo [38;2;255;255;0m==============================
echo          FILE LAUNCHER
echo ==============================
echo.
echo Found:
set "target="
echo !target!
echo.
echo (1) Open
echo (2) Enter another path
echo (3) Back
echo.

set "launchinput="
set /p "launchinput=> "

if "!launchinput!"=="1" (
    echo.
    echo Launching...
    start "" "!target!"
    pause
    goto :launchmenu
)

if "!launchinput!"=="2" goto :launch

if "!launchinput!"=="3" (
    cls
    goto :start
)

echo.
echo Invalid option.
pause
goto :launchmenu

:network
cls
echo [38;2;255;255;0m ==============================
echo        NETWORK TOOLS 3.0
echo  ==============================
echo.
echo (1) Ping
echo (2) Show Hostname
echo (3) IP Configuration
echo (4) Network in File Explorer
echo (5) Tracert
echo (6) DNS Lookup
echo (7) Active Connections
echo (8) Flush DNS
echo (9) Internet Connectivity Test
echo (10) Release IP
echo (11) Renew IP
echo (12) Routing Table
echo (13) ARP Table
echo (14) Network Adapter Information
echo (15) Network Settings
echo (16) Back
echo.

set "netinput="
set /p "netinput=> "

if "!netinput!"=="1" (
    cls
    echo [38;2;255;255;0m ==============================
    echo              PING
    echo  ==============================
    echo.
    set "host="
    set /p "host=Enter hostname or IP: "
    echo.
    ping "!host!"
    echo.
    pause
    goto :network
)

if "!netinput!"=="2" (
    cls
    echo [38;2;255;255;0m ==============================
    echo            HOST NAME
    echo  ==============================
    echo.
    hostname
    echo.
    pause
    goto :network
)

if "!netinput!"=="3" (
    cls
    echo [38;2;255;255;0m ========================================
    echo            IP CONFIGURATION
    echo  ========================================
    echo.
    ipconfig /all
    echo.
    pause
    goto :network
)

if /I "!netinput!"=="4" (
    start "" explorer.exe shell:NetworkPlacesFolder
    goto :network
)

if /I "!netinput!"=="5" (
    cls
    echo [38;2;255;255;0m ==============================
    echo             TRACERT
    echo  ==============================
    echo.
    set "host="
    set /p "host=Enter hostname or IP: "
    echo.
    tracert "!host!"
    echo.
    pause
    goto :network
)

if /I "!netinput!"=="6" (
    cls
    echo [38;2;255;255;0m ==============================
    echo           DNS LOOKUP
    echo  ==============================
    echo.
    set "host="
    set /p "host=Enter hostname: "
    echo.
    nslookup "!host!"
    echo.
    pause
    goto :network
)

if /I "!netinput!"=="7" (
    cls
    echo [38;2;255;255;0m ==============================
    echo       ACTIVE CONNECTIONS
    echo  ==============================
    echo.
    netstat -ano
    echo.
    pause
    goto :network
)

if /I "!netinput!"=="8" (
    cls
    echo [38;2;255;255;0m ==============================
    echo            FLUSH DNS
    echo  ==============================
    echo.
    ipconfig /flushdns
    echo.
    pause
    goto :network
)

if /I "!netinput!"=="9" (
    cls
    echo [38;2;255;255;0m ==============================
    echo    INTERNET CONNECTIVITY TEST
    echo  ==============================
    echo.
    ping 1.1.1.1
    echo.
    pause
    goto :network
)

if /I "!netinput!"=="10" (
    cls
    echo [38;2;255;255;0m ==============================
    echo            RELEASE IP
    echo  ==============================
    echo.
    ipconfig /release
    echo.
    pause
    goto :network
)

if /I "!netinput!"=="11" (
    cls
    echo [38;2;255;255;0m ==============================
    echo             RENEW IP
    echo  ==============================
    echo.
    ipconfig /renew
    echo.
    pause
    goto :network
)

if /I "!netinput!"=="12" (
    cls
    echo [38;2;255;255;0m ==============================
    echo          ROUTING TABLE
    echo  ==============================
    echo.
    route print
    echo.
    pause
    goto :network
)

if /I "!netinput!"=="13" (
    cls
    echo [38;2;255;255;0m ==============================
    echo           ARP TABLE
    echo  ==============================
    echo.
    arp -a
    echo.
    pause
    goto :network
)

if /I "!netinput!"=="14" (
    cls
    echo [38;2;255;255;0m ==============================
    echo       NETWORK ADAPTER INFO
    echo  ==============================
    echo.
    getmac /v
    echo.
    pause
    goto :network
)

if /I "!netinput!"=="15" (
    start "" ms-settings:network
    goto :network
)

if /I "!netinput!"=="16" (
    cls
    goto start
)

cls
goto :network

:launch
cls
echo [38;2;255;255;0m==============================
echo          Launch File
echo ==============================
echo.
set "target="
set /p "target=Enter the file path: "
  if not defined target (
    echo.
    echo No path entered.
    pause
    pushd files
    cls
    goto :start
)
if exist "!target!" (
    echo.
    echo Launching "!target!"
    start "" "!target!"

    if errorlevel 1 (
        set "errorcommand=File Launcher"
        set "errormessage=Failed to launch the selected file."
        set "errorcode=!errorlevel!"
        goto errorhandler
    )
) else (
    set "errorcommand=File Launcher"
    set "errormessage=The selected file was not found."
    set "errorcode=1"
    goto errorhandler
)
cls
goto launchmenu

:sysmgr
cls
echo [38;2;255;255;0m ==============================
echo        SYSTEM MANAGER 3.0
echo  ==============================
echo.
echo (1) System Information
echo (2) Task Manager
echo (3) Services
echo (4) Startup Apps
echo (5) Disk Management
echo (6) Windows Settings
echo (7) Device Manager
echo (8) Environment Variables
echo (9) System Tools
echo (10) Administrative Tools
echo (11) Control Panel
echo (12) This PC
echo (13) C: Drive
echo (14) Command Prompt
echo (15) Windows PowerShell
echo (16) Windows Accessories
echo (17) Network Connections
echo (18) Drives select
echo (19) Temporary Files Cleaner
echo (20) Event viewer
echo (21) Storage cleanup
echo (22) Power config
echo (23) Network settings
echo (24) Back

==============================
set "sysinput="
set /p "sysinput=> "
if "!sysinput!"=="1" goto sysinfo
if "!sysinput!"=="2" start "" taskmgr.exe
if "!sysinput!"=="3" start "" services.msc
if "!sysinput!"=="4" (
  echo Seting startup app?
  choice /c yn /n /m "[Y/N]> "

    if errorlevel 2 (
      echo Opening startup folder...
      start "" shell:startup
      pause
      cls
      goto sysmgr
    )

      start "" ms-settings:startupapps
      pause
      cls
      goto sysmgr

)
if "!sysinput!"=="5" start "" diskmgmt.msc
if "!sysinput!"=="6" start "" ms-settings:
if "!sysinput!"=="7" start "" devmgmt.msc
if "!sysinput!"=="8" start "" rundll32.exe sysdm.cpl,EditEnvironmentVariables
if "!sysinput!"=="9" start "" "%AppData%\Microsoft\Windows\Start Menu\Programs\System Tools"
if "!sysinput!"=="10" start "" "%windir%\system32\control.exe" /name Microsoft.AdministrativeTools
if "!sysinput!"=="11" start "" "%windir%\system32\control.exe"
if "!sysinput!"=="12" start "" explorer.exe shell:MyComputerFolder
if "!sysinput!"=="13" start "" C:\
if "!sysinput!"=="14" start "" cmd.exe
if "!sysinput!"=="15" start "" Powershell.exe
if "!sysinput!"=="16" start "" "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Accessories"
if "!sysinput!"=="17" start "" ncpa.cpl
if "!sysinput!"=="18" (
    echo Choose drive...
    set "dinput="
    set /p "dinput=Drive letter (example: C): "

    if defined dinput (
        start "" "!dinput!:\"
        pause
        cls
        goto sysmgr
    )
)
if "!sysinput!"=="19" (
    cls
    echo [38;2;255;255;0m ============================
    echo     TEMPORARY FILE CLEANER
    echo  ============================
    echo.
    echo Cleaning temporary files...
    echo.

    echo Cleaning user TEMP...
    for /f "delims=" %%F in ('dir /b /a-d "%TEMP%" 2^>nul') do (
        if /I not "%%F"=="%~nx0" (
            del /q /f "%TEMP%\%%F" >nul 2>&1
        )
    )

    echo Cleaning Windows TEMP...
    del /q /f "%windir%\Temp\*" >nul 2>&1
    for /d %%D in ("%windir%\Temp\*") do rd /s /q "%%D" >nul 2>&1

    echo.
    echo Temporary files cleaned.
    echo.
    pause
    cls
    goto sysmgr
)
if "!sysinput!"=="20" start "" eventvwr.msc
if "!sysinput!"=="21" (
    start "" ms-settings:storagesense
    cls
    goto sysmgr
)
if "!sysinput!"=="22" start "" powercfg.cpl
if "!sysinput!"=="23" start "" ms-settings:network
if "!sysinput!"=="24" (
  cls
  goto start
)
cls
goto :sysmgr

:version
cls
echo [38;2;255;255;0m ============================
echo      VERSION ^& INFORMATION
echo  ============================
echo.
echo.
echo Multi-Tool webver
echo Jindo's devloper team Copyright ©
echo.
echo Thanks to:
echo - Naoko Ka Moi
echo - Ca Say Kho
echo - Altreyos
echo.
echo Special thanks:
echo - Ebola Man
echo - Hiryea Hiris
echo - Ca Say Kho
echo - Altreyos
echo - Naoko Ka Moi
echo.
echo Contributors:
echo - Ca Say Kho
echo - Damien (also known as Diamond)
echo.
echo Bugs found? Use the "contact" command to open the contact website for bugs report.
pause
cls
goto start

:calc
cls
echo [38;2;255;255;0m ============================
echo           CALCULATOR
echo  ============================
echo.
echo.
echo (1) Addition
echo (2) Subtraction
echo (3) Multiplication
echo (4) Division
echo (5) System calculator
echo (6) Back
set "linput="
set "result="
set /p "linput=> "
if "!linput!"=="1" goto :plus
if "!linput!"=="2" goto :minus
if "!linput!"=="3" goto :multiply
if "!linput!"=="4" goto :divide
if "!linput!"=="5" (
  start "" calc.exe
  goto :calc
)
if "!linput!"=="6" (
  cls
  goto start
)
cls
goto calc

:plus
cls
echo [38;2;255;255;0m ============================
echo              PLUS
echo  ============================
set "firnum="
set "secnum="
set /p "firnum=First number: "
set /p "secnum=Second number: "
set /a "result=firnum + secnum"
echo Result: !result!
pause
cls
goto calc

:minus
cls
echo [38;2;255;255;0m ============================
echo             MINUS
echo  ============================
set "firnum="
set "secnum="
set /p "firnum=First number: "
set /p "secnum=Second number: "
set /a "result=firnum - secnum"
echo Result: !result!
pause
cls
goto calc

:multiply
cls
echo [38;2;255;255;0m ============================
echo           MULTIPLY
echo  ============================
set "firnum="
set "secnum="
set /p "firnum=First number: "
set /p "secnum=Second number: "
set /a "result=firnum * secnum"
echo Result: !result!
pause
cls
goto calc

:divide
cls
echo [38;2;255;255;0m ============================
echo             DIVIDE
echo  ============================
set "firnum="
set "secnum="
set /p "firnum=First number: "
set /p "secnum=Second number: "
set /a "result=firnum / secnum"
set /a "remainder=firnum %% secnum"
set "decimal="

for /L %%D in (1,1,6) do (
    set /a "remainder*=10"
    set /a "digit=remainder / secnum"
    set /a "remainder=remainder %% secnum"
    set "decimal=!decimal!!digit!"
)

echo Result: !result!.!decimal!
pause
cls
goto calc

:sysinfo
cls
echo [38;2;255;255;0m =========================================
echo          SYSTEM INFORMATION 2.0
echo  =========================================
echo.

echo Computer Name:
hostname
echo.

echo User:
whoami
echo.

echo Windows:
ver
echo.

echo System Architecture:
if defined ProgramFiles(x86) (
    echo 64-bit
) else (
    echo 32-bit
)
echo.

echo CPU:
for /f "tokens=2,*" %%A in ('reg query "HKLM\HARDWARE\DESCRIPTION\System\CentralProcessor\0" /v ProcessorNameString 2^>nul ^| find /I "ProcessorNameString"') do echo %%B
echo.

echo RAM:
where wmic >nul 2>&1
where wmic >nul 2>&1
if not errorlevel 1 (
    wmic OS get TotalVisibleMemorySize

    if errorlevel 1 (
        set "errorcommand=System Information"
        set "errormessage=Failed to retrieve RAM information."
        set "errorcode=1"
        goto errorhandler
    )
) else (
    set "errorcommand=System Information"
    set "errormessage=WMIC is not available, so RAM information cannot be retrieved."
    set "errorcode=1"
    goto errorhandler
)
echo.

echo GPU:
where wmic >nul 2>&1
where wmic >nul 2>&1
if not errorlevel 1 (
    wmic path win32_VideoController get name

    if errorlevel 1 (
        set "errorcommand=System Information"
        set "errormessage=Failed to retrieve GPU information."
        set "errorcode=1"
        goto errorhandler
    )
) else (
    set "errorcommand=System Information"
    set "errormessage=WMIC is not available, so GPU information cannot be retrieved."
    set "errorcode=1"
    goto errorhandler
)
echo.

echo System Drive:
where wmic >nul 2>&1
if not errorlevel 1 (
    wmic logicaldisk where "DeviceID='C:'" get Size,FreeSpace

    if errorlevel 1 (
        set "errorcommand=System Information"
        set "errormessage=Failed to retrieve system drive information."
        set "errorcode=1"
        goto errorhandler
    )
) else (
    set "errorcommand=System Information"
    set "errormessage=WMIC is not available, so system drive information cannot be retrieved."
    set "errorcode=1"
    goto errorhandler
)
echo.

echo IPv4 Address:
ipconfig | findstr /C:"IPv4"
echo.

echo Current Date:
date /t
echo.

echo Current Time:
time /t
echo.

echo [38;2;255;255;0m =========================================
pause
cls
goto sysmgr

:fun
cls
echo [38;2;255;255;0m =========================================
echo              SECRET COMMAND
echo  =========================================
echo.
echo.
echo (1) show the fun things ^:^)
echo (2) Back
set "sinput="
set /p "sinput=>> "
if /I "!sinput!"=="1" (
    set "sc="
    echo [38;2;255;0;0mAre you sure? ^(this can make your computer explode if your computer is a potato^)[Y/N]
    set /p "sc=>> "

    if /I "!sc!"=="Y" (
        start "" "https://fl.youareanidiot.cc"
        echo [38;5;226myou are an idiot, ha ha ha ha ha ha ha ha ha ha ha.
        pause
        cls
        goto :fun
    )

    if /I "!sc!"=="N" (
        echo [38;5;226mok ^:^)
        pause
        cls
        goto :fun
    )

    echo Invalid input.
    pause
    cls
    goto :fun
)
if "!sinput!"=="2" (
  cls
  goto start
)
cls
goto fun

:update
cls
echo [38;2;255;255;0m ============================
echo         UPDATE CHECKER
echo  ============================
echo.
echo Current version: v1.2.7 (web version)
echo.
echo Checking GitHub for the latest release...
echo.

where curl.exe >nul 2>&1
if errorlevel 1 (
    echo ERROR: curl.exe is not available on this PC.
    echo.
    pause
    cls
    goto start
)

set "urlfile=%TEMP%\multitool_update_url.txt"
set "latest_url="

curl.exe -sS -L --fail -o nul -w "%%{url_effective}" "https://github.com/LTV-Jindo/Multi-Tool-recreate-by-Jindo/releases/latest" > "%urlfile%"

if errorlevel 1 (
    echo ERROR: Failed to connect to GitHub.
    del /q "%urlfile%" >nul 2>&1
    pause
    cls
    goto start
)

set /p "latest_url="<"%urlfile%"
del /q "%urlfile%" >nul 2>&1

if not defined latest_url (
    echo ERROR: Could not find the latest release.
    pause
    cls
    goto start
)

echo.
echo GitHub release:
echo !latest_url!
echo.

set "latest=!latest_url:*Multi-Tool-update-v=!"

if /I "!latest!"=="!latest_url!" (
    echo ERROR: Could not determine the latest version.
    pause
    cls
    goto start
)

echo Latest version: v!latest!
echo.

for /f "tokens=1-3 delims=." %%A in ("1.2.7") do (
    set /a currentMajor=%%A
    set /a currentMinor=%%B
    set /a currentPatch=%%C
)

for /f "tokens=1-3 delims=." %%A in ("!latest!") do (
    set /a latestMajor=%%A
    set /a latestMinor=%%B
    set /a latestPatch=%%C
)

if !latestMajor! GTR !currentMajor! goto update_available
if !latestMajor! EQU !currentMajor! if !latestMinor! GTR !currentMinor! goto update_available
if !latestMajor! EQU !currentMajor! if !latestMinor! EQU !currentMinor! if !latestPatch! GTR !currentPatch! goto update_available

echo You are using the latest version. (web version)
echo.
pause
cls
goto start

:update_available
echo UPDATE AVAILABLE!
echo.
echo Current version: v1.2.7 (web version)
echo Latest version:  v!latest!
echo.
choice /c YN /n /m "Open the GitHub release page? [Y/N] "

if errorlevel 2 (
    cls
    goto start
)

start "" "!latest_url!"
cls
goto start

:contact
cls
echo [38;2;255;255;0m =================================
echo              CONTACT
echo  =================================
echo.
echo Opening contact webpage...
start "" https://contact-mbol.onrender.com/contact
echo Opened in your default browser.
echo Please click the link in the website to get contact.
pause
cls
goto start

:mainp
cls
echo [38;2;255;255;0m =================================
echo              WEBSITE
echo  =================================
echo.
echo Opening main webpage
start "" https://contact-mbol.onrender.com/
echo Opened in your default browser.
echo Click any links in the website to goto that page
pause
cls
goto start

:process
cls
echo [38;2;255;255;0m ============================
echo         PROCESS SEARCH
echo  ============================
echo.
set "processname="
set /p "processname=Enter process name: "

if not defined processname (
    echo.
    echo No process name entered.
    pause
    cls
    goto start
)

echo.
echo Searching for: !processname!
echo.

tasklist /FI "IMAGENAME eq !processname!" /FO TABLE /NH

if errorlevel 1 (
    set "errorcommand=Process Search"
    set "errormessage=Failed to search for the selected process."
    set "errorcode=!errorlevel!"
    goto errorhandler
)

echo.
pause
cls
goto start

:folder
cls
echo [38;2;255;255;0m ============================
echo     QUICK FOLDER LAUNCHER
echo  ============================
echo.
set "folderpath="
set /p "folderpath=Enter folder path or special folder: "

if not defined folderpath (
    echo.
    echo No folder path entered.
    pause
    cls
    goto start
)

rem ============================
rem   Windows Shell commands
rem ============================
if /I "!folderpath:~0,6!"=="shell:" (
    echo.
    echo Opening:
    echo !folderpath!
    start "" explorer.exe "!folderpath!"
    echo.
    echo Folder opened.
    pause
    cls
    goto start
)

rem =========================================
rem     Common Windows special folders
rem =========================================
if /I "!folderpath!"=="desktop" (
    set "folderpath=%USERPROFILE%\Desktop"
    goto folder_open
)

if /I "!folderpath!"=="documents" (
    set "folderpath=%USERPROFILE%\Documents"
    goto folder_open
)

if /I "!folderpath!"=="downloads" (
    set "folderpath=%USERPROFILE%\Downloads"
    goto folder_open
)

if /I "!folderpath!"=="pictures" (
    set "folderpath=%USERPROFILE%\Pictures"
    goto folder_open
)

if /I "!folderpath!"=="music" (
    set "folderpath=%USERPROFILE%\Music"
    goto folder_open
)

if /I "!folderpath!"=="videos" (
    set "folderpath=%USERPROFILE%\Videos"
    goto folder_open
)

rem ============================
rem     Normal folder path
rem ============================
if not exist "!folderpath!\." (
    set "errorcommand=Quick Folder Launcher"
    set "errormessage=The specified folder does not exist."
    set "errorcode=3"
    goto errorhandler
)

:folder_open
echo.
echo Opening:
echo !folderpath!
start "" explorer.exe "!folderpath!"

echo.
echo Folder opened.
pause
cls
goto start

:fileinfo
cls
echo [38;2;255;255;0m==============================
echo          FILE INFORMATION
echo ==============================
echo.

set "target="
set /p "target=Enter the file path: "

if not defined target (
    set "errorcommand=File Information"
    set "errormessage=No file path was entered."
    set "errorcode=1"
    goto :errorhandler
)

if not exist "!target!" (
    set "errorcommand=File Information"
    set "errormessage=The specified file was not found."
    set "errorcode=1"
    goto :errorhandler
)

for %%F in ("!target!") do (
    echo.
    echo Name       : %%~nxF
    echo Full Path  : %%~fF
    echo Extension  : %%~xF
    echo Size       : %%~zF bytes
)

echo.
echo Attributes :
attrib "!target!"

echo.
echo Created    :
for /f "tokens=1,2" %%A in ('dir /T:C /-C "!target!" ^| findstr /R "[0-9]"') do (
    echo %%A %%B
    goto :fileinfo_modified
)

:fileinfo_modified
echo.
echo Modified   :
for /f "tokens=1,2" %%A in ('dir /T:W /-C "!target!" ^| findstr /R "[0-9]"') do (
    echo %%A %%B
    goto :fileinfo_end
)

:fileinfo_end
echo.
pause
cls
goto :start

:optimize
cls
echo [38;2;255;255;0m========================================
echo       OPTIMIZE FOR PERFORMANCE
echo ========================================
echo.
echo Preparing optimization...
echo.

REM Check for Administrator privileges
net session >nul 2>&1
if errorlevel 1 (
    set "errorcommand=optimize-all"
    set "errormessage=[38;2;255;0;0mAdministrator privileges missing."
    set "errorcode=5"
    goto :errorhandler
)

echo [38;2;0;255;0m[1/4] Cleaning user temporary files...

for /f "delims=" %%F in ('dir /b /a-d "%TEMP%" 2^>nul') do (
    if /I not "%%F"=="%~nx0" (
        del /q /f "%TEMP%\%%F" >nul 2>&1
    )
)

echo Done.
echo.

echo [38;2;0;255;0m[2/4] Cleaning Windows temporary files...

del /f /s /q "%SystemRoot%\Temp\*" >nul 2>&1

echo Done.
echo.

echo [38;2;0;255;0m[3/4] Running Windows component cleanup...

DISM /Online /Cleanup-Image /StartComponentCleanup

if errorlevel 1 (
    set "errorcommand=optimize-all"
    set "errormessage=[38;2;255;0;0mComponent cleanup encountered an error."
    set "errorcode=5"
    goto :errorhandler
) else (
    echo.
    echo Component cleanup completed.
)

echo.

echo [38;2;0;255;0m[4/4] Optimizing system drive...

defrag C: /O /U /V

if errorlevel 1 (
    set "errorcommand=optimize-all"
    set "errormessage=[38;2;255;0;0mDrive optimization encountered an error."
    set "errorcode=5"
    goto :errorhandler
) else (
    echo.
    echo Drive optimization completed.
)

echo.
cls
echo [38;2;0;255;0m========================================
echo        OPTIMIZATION COMPLETE
echo ========================================
echo.
echo Temporary files cleaned.
echo Windows components cleaned.
echo System drive optimized.
echo.
pause
cls
goto :start

:errorhandler
cls
echo [38;2;255;0;0m========================================
echo            MULTITOOL ERROR
echo ========================================
echo.
echo Something went wrong.
echo.
echo Command:
echo   !errorcommand!
echo.
echo Error code:
echo   !errorcode!
echo.
echo Error:
echo   !errormessage!
echo.
echo The error has been saved to:
echo   %~dp0logs\error.log
echo.

(
    echo ========================================
    echo MultiTool Error
    echo ========================================
    echo Time: %date% %time%
    echo Command: !errorcommand!
    echo Error code: !errorcode!
    echo Error: !errormessage!
    echo Computer: %COMPUTERNAME%
    echo User: %USERNAME%
    echo ========================================
    echo.
) >> "%~dp0error.log"

pause
cls
goto start

:banner
echo.
echo.
echo                     [38;2;255;0;0m███╗   ███╗██╗   ██╗██╗  ████████╗██╗    ████████╗ ██████╗  ██████╗ ██╗[0m     
echo                     [38;2;255;51;0m████╗ ████║██║   ██║██║  ╚══██╔══╝██║    ╚══██╔══╝██╔═══██╗██╔═══██╗██║     [0m
echo                     [38;2;255;102;0m██╔████╔██║██║   ██║██║     ██║   ██║       ██║   ██║   ██║██║   ██║██║    [0m 
echo                     [38;2;255;153;0m██║╚██╔╝██║██║   ██║██║     ██║   ██║       ██║   ██║   ██║██║   ██║██║     [0m
echo                     [38;2;255;204;0m██║ ╚═╝ ██║╚██████╔╝███████╗██║   ██║       ██║   ╚██████╔╝╚██████╔╝███████╗[0m
echo                     [38;2;255;255;0m╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝   ╚═╝       ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝[0m
echo.
