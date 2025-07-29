# Define the output file path
$outputFile = "$env:USERPROFILE\Desktop\initial_network_tests.txt"

# Create or clear the output file
"" | Out-File -FilePath $outputFile

# Run ipconfig /all
"=== IPCONFIG /ALL ===" | Out-File -FilePath $outputFile -Append
ipconfig /all | Out-File -FilePath $outputFile -Append

# Run ping 8.8.8.8
"`n=== PING 8.8.8.8 ===" | Out-File -FilePath $outputFile -Append
ping 8.8.8.8 | Out-File -FilePath $outputFile -Append

# Run ping [ENTER INTERAL COMPANY URL]
"`n=== PING [ENTER INTERAL COMPANY URL] ===" | Out-File -FilePath $outputFile -Append
ping [ENTER INTERAL COMPANY URL] | Out-File -FilePath $outputFile -Append

# Run tracert google.com
"`n=== TRACERT google.com ===" | Out-File -FilePath $outputFile -Append
tracert google.com | Out-File -FilePath $outputFile -Append

# Run tracert [ENTER INTERAL COMPANY URL]
"`n=== TRACERT [ENTER INTERAL COMPANY URL] ===" | Out-File -FilePath $outputFile -Append
tracert [ENTER INTERAL COMPANY URL] | Out-File -FilePath $outputFile -Append

# Notify completion
Write-Host "`nAll initial network tests are complete. Results saved to $outputFile"
Write-Host "You can close out the PowerShell window when you're ready."

# Keep the window open
Read-Host -Prompt "Press Enter to exit"
