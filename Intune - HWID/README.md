Windows OOBE Automation Scripts

These scripts are designed to streamline the Out-Of-Box Experience (OOBE) for Windows laptops, enabling quick remote access and efficient Hardware ID (HWID) collection for Microsoft AutoPilot.

Features

    Remote Access Setup: Automatically launches Microsoft Edge to LogMeIn123.com for quick remote connectivity by a technician.

    HWID Folder Creation: Creates a dedicated HWID folder at the root of the C: drive.

    AutoPilot HWID Collection: Utilizes the Get-WindowsAutoPilotInfo PowerShell script to collect the device's hardware hash and saves it as AutoPilotHWID.csv within the C:\HWID folder.

    Elevated Execution: All necessary PowerShell commands are run with elevated privileges to ensure smooth operation.

How it Works

The main script (either a .bat or .ps1 file, depending on your preference) performs the following actions:

    Launches Task Manager and File Explorer: start taskmgr.exe and start explorer.exe are included, though taskmgr.exe may not be strictly necessary for the core functionality described.

    Initiates Remote Access: start msedge logmein123.com opens the specified webpage, allowing a technician to establish a remote session.

    Elevated PowerShell: powershell Start-Process powershell -verb runas opens a new PowerShell window with administrator rights.

    Creates HWID Directory: cd\ changes to the root directory, and md c:\HWID creates the necessary folder.

    Sets Execution Policy: Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted temporarily sets the PowerShell execution policy to Unrestricted for the current process, allowing the Install-Script and Get-WindowsAutoPilotInfo.ps1 commands to run.

    Installs and Runs AutoPilot Script: Install-Script -Name Get-WindowsAutoPilotInfo downloads the AutoPilot script from the PowerShell Gallery, and Get-WindowsAutoPilotInfo.ps1 -OutputFile AutoPilotHWID.csv executes it, saving the output to AutoPilotHWID.csv.

    Changes Directory (Optional): d: appears to be an artifact or an incomplete command, likely intended to change to the D: drive. It's not directly related to the HWID collection on C:.

Getting Started

Prerequisites

    A Windows laptop in the Out-Of-Box Experience (OOBE) stage.

    Internet connectivity for downloading the Get-WindowsAutoPilotInfo script.