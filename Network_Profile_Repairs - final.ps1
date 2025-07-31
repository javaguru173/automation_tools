# This script will speed up the repair & rebuild process for devices that no longer have Cisco AnyConnect as the former wifi manager
# Removed wifi names for data privacy

# Step 1: Create the Profiles folder in the root of C:\
$profilesPath = "C:\Profiles"
if (-Not (Test-Path -Path $profilesPath)) {
    New-Item -Path $profilesPath -ItemType Directory
    Write-Host "Created folder: $profilesPath"
} else {
    Write-Host "Folder already exists: $profilesPath"
}

# Script will continue even if the folder exists or not

# Step 2: Copy XML files from the script's directory to C:\Profiles
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$xmlFiles = @("[SSID NAME1].xml", "[SSID NAME2].xml", "ETHERNET.xml")

foreach ($file in $xmlFiles) {
    $source = Join-Path -Path $scriptDir -ChildPath $file
    $destination = Join-Path -Path $profilesPath -ChildPath $file
    if (Test-Path -Path $source) {
        Copy-Item -Path $source -Destination $destination -Force
        Write-Host "Copied $file to $profilesPath"
    } else {
        Write-Host "File not found: $source"
    }
}

# Step 3: Run netsh commands to add the missing profiles
Write-Host "Adding network profiles..."
netsh lan add profile filename="C:\Profiles\ETHERNET.xml"
netsh wlan add profile filename="C:\Profiles\[SSID NAME1].xml"
netsh wlan add profile filename="C:\Profiles\[SSID NAME2].xml"

# Step 4: Notify user of completed tasks
Write-Host "`nAll tasks completed successfully."
Write-Host "Please restart your computer to apply the changes."
