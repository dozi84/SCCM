Stop-Service wuauserv
Stop-Service cryptSvc -Force
Stop-Service bits
Stop-Service msiserver
if ( (Test-Path "C:\Windows\SoftwareDistribution.old") -eq $true)  {Remove-Item "C:\Windows\SoftwareDistribution.old" -Recurse -Force}
if ( (Test-Path "C:\Windows\SoftwareDistribution") -eq $true)      {Rename-Item -Path C:\Windows\SoftwareDistribution -NewName SoftwareDistribution.old}
if ( (Test-Path "C:\Windows\Catroot2.old") -eq $true )             {Remove-Item "C:\Windows\Catroot2.old" -Recurse -Force}
if ( (Test-Path "C:\Windows\Catroot2") -eq $true )                 {Rename-Item -Path C:\Windows\System32\catroot2 -NewName Catroot2.old}
Start-Service wuauserv
Start-Service cryptSvc
Start-Service bits
Start-Service msiserver
