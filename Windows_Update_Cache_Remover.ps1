# Stop Windows Update services
Stop-Service -Name wuauserv -Force
Stop-Service -Name bits -Force
Stop-Service -Name cryptsvc -Force

# Remove the SoftwareDistribution folder
$env:systemroot
Remove-Item -Path "$env:systemroot\SoftwareDistribution" -Recurse -Force

# Remove the Catroot2 folder
Remove-Item -Path "$env:systemroot\System32\Catroot2" -Recurse -Force

# Remove the QMGR data file
Remove-Item -Path "$env:allusersprofile\Application Data\Microsoft\Network\Downloader\qmgr*.dat" -Force

# Restart Windows Update services
Start-Service -Name wuauserv
Start-Service -Name bits
Start-Service -Name cryptsvc

# Reset Windows Update client authorization
wuauclt /resetauthorization /detectnow
Write-Host "Windows Update reset completed. Please restart your computer."