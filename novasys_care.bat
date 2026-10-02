@echo off
setlocal enabledelayedexpansion
title NovaSys_Care v1.0
color 8B

:MAIN_MENU
powershell -Command " +^
$choices = @('Deep Junk Cleaner', 'Flush Network Cache', 'System Diagnostic Audit', 'Exit Utility'); +^
$selection = 0; +^
while ($true) { +^
    Clear-Host; +^
    Write-Host '  +---------------------------------------+' -ForegroundColor Cyan; +^
    Write-Host '  |           NOVASYS_CARE UTILITY        |' -ForegroundColor Cyan; +^
    Write-Host '  +---------------------------------------+' -ForegroundColor Cyan; +^
    Write-Host ''; +^
    for ($i=0; $i -lt $choices.Count; $i++) { +^
        if ($i -eq $selection) { +^
            Write-Host ('   -> [ ' + $choices[$i] + ' ] ') -ForegroundColor Black -BackgroundColor Cyan; +^
        } else { +^
            Write-Host ('        ' + $choices[$i]); +^
        } +^
    }; +^
    Write-Host ''; +^
    Write-Host '  +---------------------------------------+' -ForegroundColor Gray; +^
    Write-Host '   Made with # by Nova Studios.' -ForegroundColor DarkGray; +^
    Write-Host '  +---------------------------------------+' -ForegroundColor Gray; +^
    $key = [System.Console]::ReadKey($true).Key; +^
    if ($key -eq 'UpArrow') { $selection = ($selection -1 + $choices.Count) %% $choices.Count }; +^
    if ($key -eq 'DownArrow') { $selection = ($selection + 1) %% $choices.Count }; +^
    if ($key -eq 'Enter') { exit $selection }; +^
}"
set "action_val=%errorlevel%"

if "%action_val%"=="0" goto JUNK_CLEANER
if "%action_val%"=="1" goto NETWORK_FLUSH
if "%action_val%"=="2" goto DIAGNOSTIC_AUDIT
if "%action_val%"=="3" exit

:JUNK_CLEANER
cls
echo  +---------------------------------------+
echo  ^|          DEEP JUNK CLEANER            ^|
echo  +---------------------------------------+
echo   [!] Cleaning temporary system deployment structures...
echo.
del /s /f /q %temp%\*.* >nul 2>&1
rd /s /q %temp% >nul 2>&1
mkdir %temp%
del /s /f /q C:\Windows\Temp\*.* >nul 2>&1
rd /s /q C:\Windows\Temp >nul 2>&1
mkdir C:\Windows\Temp
echo   [^+] Temporary files purged successfully.
echo.
echo   [!] Clearing system prefetch optimization cache...
del /s /f /q C:\Windows\Prefetch\*.* >nul 2>&1
echo   [^+] Prefetch logs successfully wiped.
echo  -----------------------------------------
echo   Optimization Complete!
echo  -----------------------------------------
echo   Made with # by Nova Studios.
echo -----------------------------------------
pause
goto MAIN_MENU

:NETWORK_FLUSH
cls
echo  +---------------------------------------+
echo  ^|         FLUSH NETWORK CACHE           ^|
echo  +---------------------------------------+
echo   [!] Tearing down active socket logs...
echo.
ipconfig /release >nul 2>&1
echo   [!] Purging local Domain Name System (DNS) resolver entries...
ipconfig /flushdns >nul 2>&1
echo   [!] Re-establishing dynamic network handshakes...
ipconfig /renew >nul 2>&1
echo.
echo   [^+] Network interface successfully reset and optimized!
echo  -----------------------------------------
echo   Made with # by Nova Studios.
echo -----------------------------------------
pause
goto MAIN_MENU

:DIAGNOSTIC_AUDIT
cls
echo  +---------------------------------------+
echo  ^|       SYSTEM DIAGNOSTIC AUDIT         ^|
echo  +---------------------------------------+
echo   Fetching system environment variables...
echo  -----------------------------------------
echo   Current Date/Time: %date% @ %time%
echo   Username Profile:  %username%
echo   Computer Asset ID: %computername%
echo   OS Architecture:   %PROCESSOR_ARCHITECTURE%
echo  -----------------------------------------
echo   Active Network Adaptor Handshake Configuration:
echo.
ipconfig | findstr /i "IPv4 Address Description Subnet Default"
echo  -----------------------------------------
echo   Made with # by Nova Studios.
echo -----------------------------------------
pause
goto MAIN_MENU

