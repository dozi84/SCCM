Stop-Service wuauserv | Out-Null
Stop-Service cryptSvc -Force | Out-Null
Stop-Service bits | Out-Null
Stop-Service msiserver | Out-Null
if ( (Test-Path "C:\Windows\SoftwareDistribution.old") -eq $true)  {Remove-Item "C:\Windows\SoftwareDistribution.old" -Recurse -Force}
if ( (Test-Path "C:\Windows\SoftwareDistribution") -eq $true)      {Rename-Item -Path C:\Windows\SoftwareDistribution -NewName SoftwareDistribution.old}
if ( (Test-Path "C:\Windows\Catroot2.old") -eq $true )             {Remove-Item "C:\Windows\Catroot2.old" -Recurse -Force}
if ( (Test-Path "C:\Windows\Catroot2") -eq $true )                 {Rename-Item -Path C:\Windows\System32\catroot2 -NewName Catroot2.old}
Start-Service wuauserv | Out-Null
Start-Service cryptSvc | Out-Null
Start-Service bits | Out-Null
Start-Service msiserver | Out-Null
