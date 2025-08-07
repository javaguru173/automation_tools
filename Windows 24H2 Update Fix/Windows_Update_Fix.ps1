# For users experiencing Windows 11 24H2 update failing to install
# Mount the EFI system partition
mountvol Y: /s

# Navigate to the Fonts directory
Set-Location -Path Y:\EFI\Microsoft\Boot\Fonts

# Delete all files in the Fonts directory
Remove-Item * -Force

# Display messages
Write-Host "Task Completed, please start Windows Update"
Write-Host "You may close this window"

