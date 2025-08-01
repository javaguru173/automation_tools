# Quick PC Repairs

# Run System File Checker
Write-Host "Running System File Checker (sfc /scannow)..."
Start-Process -FilePath "sfc.exe" -ArgumentList "/scannow" -Wait -NoNewWindow

# Run DISM to restore health
Write-Host "Running DISM Cleanup and RestoreHealth..."
Start-Process -FilePath "DISM.exe" -ArgumentList "/Online", "/Cleanup-Image", "/RestoreHealth" -Wait -NoNewWindow

# Prompt user before running chkdsk
$confirmation = Read-Host "Ready to run Check Disk (chkdsk /r). This may require a reboot. Type 'Y' to continue"

if ($confirmation -eq 'Y' -or $confirmation -eq 'y') {
    Write-Host "Running Check Disk..."
    Start-Process -FilePath "cmd.exe" -ArgumentList "/c chkdsk C: /r" -Wait -NoNewWindow
    Write-Host "`nScans and repairs are complete. Please make sure to restart your PC to finalize system checks."
} else {
    Write-Host "Check Disk was skipped. No changes were made."
}
