@echo off
:: Launch PowerShell script with execution policy bypass and admin privileges
powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File "WindowsUpdateFix.ps1"' -Verb RunAs"
pause
