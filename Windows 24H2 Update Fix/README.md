# WindowsUpdateFix Script

This repository contains a batch file (`WindowsUpdateFix.bat`) that launches a PowerShell script (`WindowsUpdateFix.ps1`) to resolve issues with Windows 11 machines failing to download and install the 24H2 update.

## Prerequisites

- Windows 11 operating system
- Administrator privileges
- PowerShell installed (default on Windows 11)
- The `WindowsUpdateFix.ps1` script must be located in the same directory as the `.bat` file

## How to Use

1. **Download both files**: `WindowsUpdateFix.bat` and `WindowsUpdateFix.ps1`
2. **Place them in the same folder**
3. **Right-click** on `WindowsUpdateFix.bat` and select **"Run as administrator"**
4. The script will:
   - Mount the EFI system partition
   - Delete font files from the EFI boot folder
   - Display a message: `"Task Completed, starting Windows Update."`
   - Wait 60 seconds
   - Start Windows Update scan
   - Display a final message: `"Windows Update initiating, please check the status of the download in Windows Update via Settings. You may close this window."`

## Troubleshooting

- **Execution Policy Error**: If PowerShell blocks the script, the batch file uses `-ExecutionPolicy Bypass` to temporarily allow execution.
- **Admin Rights**: Ensure you run the `.bat` file as Administrator to allow access to system partitions.
- **Script Location**: The `.ps1` file must be in the same folder as the `.bat` file for the launcher to work correctly.

## Notes

- This script modifies EFI system partition files. Use with caution and only if you're experiencing update issues.
- Always back up important data before running system-level scripts.

