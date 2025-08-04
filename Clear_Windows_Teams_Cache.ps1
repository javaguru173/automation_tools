# Prompt user for confirmation
$challenge = Read-Host "Are you sure you want to delete Teams Cache (Y/N)?"
$challenge = $challenge.ToUpper()

if ($challenge -eq "N") {
    Stop-Process -Id $PID
}
elseif ($challenge -eq "Y") {
    # Stop Teams process
    Write-Host "Stopping Teams Process..." -ForegroundColor Yellow
    try {
        Get-Process -ProcessName Teams | Stop-Process -Force
        Start-Sleep -Seconds 3
        Write-Host "Teams Process Successfully Stopped" -ForegroundColor Green
    } catch {
        Write-Host $_
    }

    # Clear Teams cache directories
    Write-Host "Clearing Teams Disk Cache..." -ForegroundColor Yellow
    try {
        $teamsPaths = @(
            "$env:APPDATA\Microsoft\teams\application cache\cache",
            "$env:APPDATA\Microsoft\teams\blob_storage",
            "$env:APPDATA\Microsoft\teams\databases",
            "$env:APPDATA\Microsoft\teams\cache",
            "$env:APPDATA\Microsoft\teams\gpucache",
            "$env:APPDATA\Microsoft\teams\Indexeddb",
            "$env:APPDATA\Microsoft\teams\Local Storage",
            "$env:APPDATA\Microsoft\teams\tmp"
        )

        foreach ($path in $teamsPaths) {
            Get-ChildItem -Path $path -ErrorAction SilentlyContinue | Remove-Item -Confirm:$false -Force
        }

        Write-Host "Teams Disk Cache Cleaned" -ForegroundColor Green
    } catch {
        Write-Host $_
    }

    # Stop Chrome process
    Write-Host "Stopping Chrome Process..." -ForegroundColor Yellow
    try {
        Get-Process -ProcessName Chrome | Stop-Process -Force
        Start-Sleep -Seconds 3
        Write-Host "Chrome Process Successfully Stopped" -ForegroundColor Green
    } catch {
        Write-Host $_
    }

    # Clear Chrome cache
    Write-Host "Clearing Chrome Cache..." -ForegroundColor Yellow
    try {
        $chromePaths = @(
            "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache",
            "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cookies",
            "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Web Data"
        )

        foreach ($path in $chromePaths) {
            Get-ChildItem -Path $path -File -ErrorAction SilentlyContinue | Remove-Item -Confirm:$false -Force
        }

        Write-Host "Chrome Cache Cleaned" -ForegroundColor Green
    } catch {
        Write-Host $_
    }

    # Stop IE and Edge processes
    Write-Host "Stopping IE and Edge Processes..." -ForegroundColor Yellow
    try {
        Get-Process -ProcessName MicrosoftEdge, IExplore -ErrorAction SilentlyContinue | Stop-Process -Force
        Write-Host "Internet Explorer and Edge Processes Successfully Stopped" -ForegroundColor Green
    } catch {
        Write-Host $_
    }

    # Clear IE cache
    Write-Host "Clearing IE Cache..." -ForegroundColor Yellow
    try {
        RunDll32.exe InetCpl.cpl, ClearMyTracksByProcess 8
        RunDll32.exe InetCpl.cpl, ClearMyTracksByProcess 2
        Write-Host "IE and Edge Cache Cleaned" -ForegroundColor Green
    } catch {
        Write-Host $_
    }

    # Relaunch Teams
    Write-Host "Cleanup Complete... Launching Teams" -ForegroundColor Green
    Start-Process -FilePath "$env:LOCALAPPDATA\Microsoft\Teams\current\Teams.exe"

    # Exit script
    Stop-Process -Id $PID
}
else {
    Stop-Process -Id $PID
}
