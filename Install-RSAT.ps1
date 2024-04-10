# Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State

# Source: https://www.pdq.com/blog/how-to-install-remote-server-administration-tools-rsat/
# Install AD-Tools
Add-WindowsCapability -Online -Name "Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0"
# Install Grouppolicy-Tools
Add-WindowsCapability -Online -Name "Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0"
# Install Remote Desktop Services Tools
Add-WindowsCapability -Online -Name "Rsat.RemoteDesktop.Services.Tools~~~~0.0.1.0"
